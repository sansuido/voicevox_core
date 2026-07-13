import 'dart:ffi';
import 'dart:io';

class VoicevoxCoreDynamicLibraryService {
  factory VoicevoxCoreDynamicLibraryService() => _instance;

  VoicevoxCoreDynamicLibraryService._internal() {
    String getDefaultVoicevoxCoreFilename(String key) {
      var header = '';
      var extension = '';
      switch (Platform.operatingSystem) {
        case 'linux':
          header = '';
          extension = '.so.0';
        case 'android':
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
    // and 'onnxruntime' LOOK AT voicevoxxOnnxruntimeLoadOnce
  }
  late Map<String, String> entries;

  static final _instance = VoicevoxCoreDynamicLibraryService._internal();

  void set(String key, String filename) {
    entries[key] = filename;
  }

  String? get(String key) {
    if (entries.containsKey(key)) {
      return entries[key];
    }
    return null;
  }

  DynamicLibrary open(String key) => DynamicLibrary.open(entries[key]!);
}
