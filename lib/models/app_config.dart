import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  String apiId;
  String apiHash;
  String phone;
  String downloadPath;
  bool skipExisting;
  bool filterPhoto;
  bool filterVideo;
  bool filterAudio;
  bool filterDocument;
  bool filterVoice;
  bool filterSticker;
  bool filterGif;
  bool filterVideoNote;
  String language;

  AppConfig({
    this.apiId = '',
    this.apiHash = '',
    this.phone = '',
    this.downloadPath = '',
    this.skipExisting = true,
    this.filterPhoto = true,
    this.filterVideo = true,
    this.filterAudio = true,
    this.filterDocument = true,
    this.filterVoice = true,
    this.filterSticker = false,
    this.filterGif = true,
    this.filterVideoNote = true,
    this.language = 'en',
  });

  Map<String, dynamic> toJson() {
    return {
      'api_id': apiId,
      'api_hash': apiHash,
      'phone': phone,
      'download_path': downloadPath,
      'skip_existing': skipExisting,
      'filter_photo': filterPhoto,
      'filter_video': filterVideo,
      'filter_audio': filterAudio,
      'filter_document': filterDocument,
      'filter_voice': filterVoice,
      'filter_sticker': filterSticker,
      'filter_gif': filterGif,
      'filter_video_note': filterVideoNote,
      'language': language,
    };
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      apiId: json['api_id'] ?? '',
      apiHash: json['api_hash'] ?? '',
      phone: json['phone'] ?? '',
      downloadPath: json['download_path'] ?? '',
      skipExisting: json['skip_existing'] ?? true,
      filterPhoto: json['filter_photo'] ?? true,
      filterVideo: json['filter_video'] ?? true,
      filterAudio: json['filter_audio'] ?? true,
      filterDocument: json['filter_document'] ?? true,
      filterVoice: json['filter_voice'] ?? true,
      filterSticker: json['filter_sticker'] ?? false,
      filterGif: json['filter_gif'] ?? true,
      filterVideoNote: json['filter_video_note'] ?? true,
      language: json['language'] ?? 'en',
    );
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_config', jsonEncode(toJson()));
  }

  static Future<AppConfig> load() async {
    final prefs = await SharedPreferences.getInstance();
    final configString = prefs.getString('app_config');
    if (configString != null) {
      return AppConfig.fromJson(jsonDecode(configString));
    }
    return AppConfig();
  }

  bool hasAnyMediaTypeSelected() {
    return filterPhoto ||
        filterVideo ||
        filterAudio ||
        filterDocument ||
        filterVoice ||
        filterSticker ||
        filterGif ||
        filterVideoNote;
  }
}
