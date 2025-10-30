import 'package:flutter/material.dart';
import '../models/app_config.dart';

enum ConnectionStatus {
  notConnected,
  connecting,
  loggedIn,
  loginFailed,
}

class AppStateProvider with ChangeNotifier {
  AppConfig _config = AppConfig();
  ConnectionStatus _connectionStatus = ConnectionStatus.notConnected;
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  String _statusMessage = '';
  String? _loggedInUsername;
  List<String> _logs = [];

  AppConfig get config => _config;
  ConnectionStatus get connectionStatus => _connectionStatus;
  bool get isDownloading => _isDownloading;
  double get downloadProgress => _downloadProgress;
  String get statusMessage => _statusMessage;
  String? get loggedInUsername => _loggedInUsername;
  List<String> get logs => _logs;

  bool get isLoggedIn => _connectionStatus == ConnectionStatus.loggedIn;

  Future<void> loadConfig() async {
    _config = await AppConfig.load();
    notifyListeners();
  }

  Future<void> saveConfig() async {
    await _config.save();
    notifyListeners();
  }

  void updateConfig(AppConfig newConfig) {
    _config = newConfig;
    notifyListeners();
  }

  void setConnectionStatus(ConnectionStatus status, {String? username}) {
    _connectionStatus = status;
    if (username != null) {
      _loggedInUsername = username;
    }
    notifyListeners();
  }

  void setDownloading(bool downloading) {
    _isDownloading = downloading;
    notifyListeners();
  }

  void updateDownloadProgress(double progress, String message) {
    _downloadProgress = progress;
    _statusMessage = message;
    notifyListeners();
  }

  void addLog(String message) {
    _logs.add('[${DateTime.now().toString().substring(11, 19)}] $message');
    notifyListeners();
  }

  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }

  void logout() {
    _connectionStatus = ConnectionStatus.notConnected;
    _loggedInUsername = null;
    _isDownloading = false;
    _downloadProgress = 0.0;
    _statusMessage = '';
    notifyListeners();
  }
}
