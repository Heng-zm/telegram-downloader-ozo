import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('km'),
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Telegram Media Downloader',
      'credentials_frame': 'Login & Target',
      'api_id_label': 'API ID:',
      'api_hash_label': 'API Hash:',
      'phone_label': 'Phone (+...):',
      'login_button': 'Login / Connect',
      'login_qr_button': 'Login via QR',
      'logout_button': 'Logout',
      'change_language_button': 'Change Language',
      'status_label_prefix': 'Status:',
      'status_not_connected': 'Not Connected',
      'status_connecting': 'Connecting...',
      'status_logged_in': 'Logged In',
      'status_login_failed': 'Login Failed',
      'download_target_frame': 'Download Target & Options',
      'chat_label': 'Chat (@user, link, ID):',
      'save_to_label': 'Save to:',
      'browse_button': 'Browse...',
      'skip_existing_cb': 'Skip existing files (check name & size)',
      'media_types_frame': 'Media Types to Download',
      'filter_photos': 'Photos',
      'filter_videos': 'Videos',
      'filter_audio': 'Audio',
      'filter_docs': 'Docs',
      'filter_voice': 'Voice',
      'filter_stickers': 'Stickers',
      'filter_gifs': 'GIFs',
      'filter_video_notes': 'Video Notes',
      'start_button': 'Start Download',
      'stop_button': 'Stop Download',
      'logs_frame': 'Logs',
      'support_donate': 'Pay Coffee',
      'progress_label_starting': 'Starting download...',
      'progress_label_stopping': 'Stopping download...',
      'download_complete': 'Download complete.',
      'not_logged_in_title': 'Not Logged In',
      'not_logged_in_msg':
          'Please log in successfully before starting a download.',
      'missing_target_title': 'Missing Target',
      'missing_target_msg': 'Please enter a target chat username, link, or ID.',
      'missing_path_title': 'Missing Path',
      'missing_path_msg': 'Please select a valid download directory.',
      'busy_title': 'Busy',
      'busy_msg': 'Another operation (login/download) is already in progress.',
      'no_media_types_title': 'No Media Types',
      'no_media_types_msg':
          'Please select at least one media type to download.',
      'quit_confirmation_title': 'Quit Confirmation',
      'quit_confirmation_msg':
          'A download is currently in progress. Are you sure you want to stop?',
      'howto_api_button': 'How to get API ID & API Hash',
    },
    'km': {
      'app_title': 'កម្មវិធីទាញយកមេឌៀ Telegram',
      'credentials_frame': 'ការចូល និងគោលដៅ',
      'api_id_label': 'API ID:',
      'api_hash_label': 'API Hash:',
      'phone_label': 'លេខទូរស័ព្ទ (+...):',
      'login_button': 'ចូល / តភ្ជាប់',
      'login_qr_button': 'ចូលដោយ QR',
      'logout_button': 'ចាកចេញ',
      'change_language_button': 'ប្ដូរភាសា',
      'status_label_prefix': 'ស្ថានភាព៖',
      'status_not_connected': 'មិនបានតភ្ជាប់',
      'status_connecting': 'កំពុងតភ្ជាប់...',
      'status_logged_in': 'បានចូល',
      'status_login_failed': 'ការចូលបរាជ័យ',
      'download_target_frame': 'គោលដៅទាញយក និងជម្រើស',
      'chat_label': 'Chat (@អ្នកប្រើ, តំណ, ID):',
      'save_to_label': 'រក្សាទុកទៅ៖',
      'browse_button': 'រកមើល...',
      'skip_existing_cb': 'រំលងឯកសារដែលមាន (ពិនិត្យឈ្មោះ & ទំហំ)',
      'media_types_frame': 'ប្រភេទមេឌៀត្រូវទាញយក',
      'filter_photos': 'រូបថត',
      'filter_videos': 'វីដេអូ',
      'filter_audio': 'សំឡេង',
      'filter_docs': 'ឯកសារ',
      'filter_voice': 'សារសំឡេង',
      'filter_stickers': 'ស្ទីកគ័រ',
      'filter_gifs': 'GIFs',
      'filter_video_notes': 'Video Notes',
      'start_button': 'ចាប់ផ្តើមទាញយក',
      'stop_button': 'បញ្ឈប់ការទាញយក',
      'logs_frame': 'កំណត់ហេតុ',
      'support_donate': 'ឧបត្ថម្ភ កាហ្វេ',
      'progress_label_starting': 'កំពុងចាប់ផ្តើមទាញយក...',
      'progress_label_stopping': 'កំពុងបញ្ឈប់ការទាញយក...',
      'download_complete': 'ការទាញយកបានបញ្ចប់។',
      'not_logged_in_title': 'មិនទាន់បានចូល',
      'not_logged_in_msg': 'សូមចូលដោយជោគជ័យជាមុនសិន មុននឹងចាប់ផ្តើមទាញយក។',
      'missing_target_title': 'ខ្វះគោលដៅ',
      'missing_target_msg': 'សូមបញ្ចូលឈ្មោះអ្នកប្រើ តំណ ឬ ID របស់ Chat។',
      'missing_path_title': 'ខ្វះទីតាំងរក្សាទុក',
      'missing_path_msg': 'សូមជ្រើសរើសថតឯកសារសម្រាប់ទាញយក។',
      'busy_title': 'កំពុងដំណើរការ',
      'busy_msg': 'ប្រតិបត្តិការផ្សេងទៀត (ចូល/ទាញយក) កំពុងដំណើរការ។',
      'no_media_types_title': 'គ្មានប្រភេទមេឌៀ',
      'no_media_types_msg': 'សូមជ្រើសរើសប្រភេទមេឌៀយ៉ាងហោចណាស់មួយដើម្បីទាញយក។',
      'quit_confirmation_title': 'បញ្ជាក់ការចាកចេញ',
      'quit_confirmation_msg':
          'ការទាញយកកំពុងដំណើរការ។ តើអ្នកពិតជាចង់បញ្ឈប់ទេ?',
      'howto_api_button': 'របៀបទទួល API ID & API Hash',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'km'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
