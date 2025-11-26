import 'dart:ffi';
import 'dart:io';

class VoicevoxCoreDynamicLibraryService {
  factory VoicevoxCoreDynamicLibraryService() => _instance;

  VoicevoxCoreDynamicLibraryService._internal() {
    String getDefaultVoicevoxCoreFilename(String key) {
      var header = '';
      var extension = '';
      switch (Platform.operatingSystem) {
        case 'android':
        case 'linux':
        case 'fuchsia':
          header = '';
          extension = '.so';
        case 'ios':
        case 'macos':
          header = '';
          extension = '.dylib';
        case 'windows':
          header = '';
          extension = '.dll';
      }
      return header + key + extension;
    }

    entries = {};
    entries['core'] = getDefaultVoicevoxCoreFilename('voicevox_core');
  }
  late Map<String, String> entries;

  static final _instance = VoicevoxCoreDynamicLibraryService._internal();

  void set(String key, String filename) {
    entries[key] = filename;
  }

  DynamicLibrary open(String key) => DynamicLibrary.open(entries[key]!);
}
