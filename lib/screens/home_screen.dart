import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_state_provider.dart';
import '../models/app_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _apiIdController = TextEditingController();
  final _apiHashController = TextEditingController();
  final _phoneController = TextEditingController();
  final _targetController = TextEditingController();
  final _pathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = context.read<AppStateProvider>();
      _apiIdController.text = appState.config.apiId;
      _apiHashController.text = appState.config.apiHash;
      _phoneController.text = appState.config.phone;
      _pathController.text = appState.config.downloadPath;
    });
  }

  @override
  void dispose() {
    _apiIdController.dispose();
    _apiHashController.dispose();
    _phoneController.dispose();
    _targetController.dispose();
    _pathController.dispose();
    super.dispose();
  }

  String _t(BuildContext context, String key) {
    return AppLocalizations.of(context).translate(key);
  }

  void _saveConfig(AppStateProvider appState) {
    appState.config.apiId = _apiIdController.text.trim();
    appState.config.apiHash = _apiHashController.text.trim();
    appState.config.phone = _phoneController.text.trim();
    appState.config.downloadPath = _pathController.text.trim();
    appState.saveConfig();
  }

  void _switchLanguage(AppStateProvider appState) {
    appState.config.language = appState.config.language == 'en' ? 'km' : 'en';
    appState.saveConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_t(context, 'app_title')),
            actions: [
              IconButton(
                icon: const Icon(Icons.language),
                onPressed: () => _switchLanguage(appState),
                tooltip: _t(context, 'change_language_button'),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Login Section
                _buildSection(
                  _t(context, 'credentials_frame'),
                  [
                    TextField(
                      controller: _apiIdController,
                      decoration: InputDecoration(
                        labelText: _t(context, 'api_id_label'),
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (_) => _saveConfig(appState),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _apiHashController,
                      decoration: InputDecoration(
                        labelText: _t(context, 'api_hash_label'),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (_) => _saveConfig(appState),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: _t(context, 'phone_label'),
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (_) => _saveConfig(appState),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: appState.isDownloading
                                ? null
                                : () => _showNotImplemented(context),
                            icon: const Icon(Icons.login),
                            label: Text(_t(context, 'login_button')),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: appState.isDownloading
                                ? null
                                : () => _showNotImplemented(context),
                            icon: const Icon(Icons.qr_code),
                            label: Text(_t(context, 'login_qr_button')),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: appState.isLoggedIn
                          ? () => appState.logout()
                          : null,
                      child: Text(_t(context, 'logout_button')),
                    ),
                    const SizedBox(height: 12),
                    _buildStatusIndicator(context, appState),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Download Target Section
                _buildSection(
                  _t(context, 'download_target_frame'),
                  [
                    TextField(
                      controller: _targetController,
                      decoration: InputDecoration(
                        labelText: _t(context, 'chat_label'),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _pathController,
                      decoration: InputDecoration(
                        labelText: _t(context, 'save_to_label'),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.folder_open),
                          onPressed: () => _showNotImplemented(context),
                        ),
                      ),
                      onChanged: (_) => _saveConfig(appState),
                    ),
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      title: Text(_t(context, 'skip_existing_cb')),
                      value: appState.config.skipExisting,
                      onChanged: (value) {
                        appState.config.skipExisting = value ?? true;
                        appState.saveConfig();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Media Types Section
                _buildSection(
                  _t(context, 'media_types_frame'),
                  [
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_photos',
                      (val) => appState.config.filterPhoto = val,
                      appState.config.filterPhoto,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_videos',
                      (val) => appState.config.filterVideo = val,
                      appState.config.filterVideo,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_audio',
                      (val) => appState.config.filterAudio = val,
                      appState.config.filterAudio,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_docs',
                      (val) => appState.config.filterDocument = val,
                      appState.config.filterDocument,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_voice',
                      (val) => appState.config.filterVoice = val,
                      appState.config.filterVoice,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_stickers',
                      (val) => appState.config.filterSticker = val,
                      appState.config.filterSticker,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_gifs',
                      (val) => appState.config.filterGif = val,
                      appState.config.filterGif,
                    ),
                    _buildMediaTypeCheckbox(
                      context,
                      appState,
                      'filter_video_notes',
                      (val) => appState.config.filterVideoNote = val,
                      appState.config.filterVideoNote,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Download Buttons
                ElevatedButton.icon(
                  onPressed: appState.isDownloading
                      ? null
                      : () => _showNotImplemented(context),
                  icon: const Icon(Icons.download),
                  label: Text(_t(context, 'start_button')),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: appState.isDownloading
                      ? () => _showNotImplemented(context)
                      : null,
                  icon: const Icon(Icons.stop),
                  label: Text(_t(context, 'stop_button')),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Progress
                if (appState.isDownloading) ...[
                  LinearProgressIndicator(value: appState.downloadProgress),
                  const SizedBox(height: 8),
                  Text(
                    appState.statusMessage,
                    textAlign: TextAlign.center,
                  ),
                ],
                
                // Logs
                const SizedBox(height: 16),
                _buildSection(
                  _t(context, 'logs_frame'),
                  [
                    Container(
                      height: 200,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListView.builder(
                        itemCount: appState.logs.length,
                        itemBuilder: (context, index) {
                          return Text(
                            appState.logs[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Copyright and Donate
                Text(
                  '© Ozo.Designer 2025',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => _showNotImplemented(context),
                  child: Text(_t(context, 'support_donate')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(
      BuildContext context, AppStateProvider appState) {
    Color statusColor;
    String statusText;

    switch (appState.connectionStatus) {
      case ConnectionStatus.loggedIn:
        statusColor = Colors.green;
        statusText = _t(context, 'status_logged_in');
        if (appState.loggedInUsername != null) {
          statusText += ' (${appState.loggedInUsername})';
        }
        break;
      case ConnectionStatus.connecting:
        statusColor = Colors.orange;
        statusText = _t(context, 'status_connecting');
        break;
      case ConnectionStatus.loginFailed:
        statusColor = Colors.red;
        statusText = _t(context, 'status_login_failed');
        break;
      default:
        statusColor = Colors.grey;
        statusText = _t(context, 'status_not_connected');
    }

    return Row(
      children: [
        Text(
          _t(context, 'status_label_prefix'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            statusText,
            style: TextStyle(color: statusColor),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaTypeCheckbox(
    BuildContext context,
    AppStateProvider appState,
    String labelKey,
    Function(bool) onChanged,
    bool value,
  ) {
    return CheckboxListTile(
      title: Text(_t(context, labelKey)),
      value: value,
      dense: true,
      onChanged: (val) {
        onChanged(val ?? false);
        appState.saveConfig();
      },
    );
  }

  void _showNotImplemented(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'This feature requires Telegram API integration (tdlib). '
          'The UI framework is ready - Telegram client integration is pending.',
        ),
        duration: Duration(seconds: 4),
      ),
    );
  }
}
