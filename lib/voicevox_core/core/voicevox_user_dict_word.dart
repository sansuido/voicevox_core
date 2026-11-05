part of '../core.dart';

class VoicevoxxUserDictWord {
  VoicevoxxUserDictWord({
    this.surface = '',
    this.pronunciation = '',
    this.accentType = 0,
    this.wordType = 1,
    this.priority = 5,
  });
  final String surface;
  final String pronunciation;
  final int accentType;
  final int wordType;
  final int priority;

  Pointer<VoicevoxUserDictWord> calloc() {
    final pointer = ffi.calloc<VoicevoxUserDictWord>();
    pointer.ref.surface = surface.toNativeUtf8();
    pointer.ref.pronunciation = pronunciation.toNativeUtf8();
    pointer.ref.accentType = accentType;
    pointer.ref.wordType = wordType;
    pointer.ref.priority = priority;
    return pointer;
  }

  static VoicevoxxUserDictWord fromEntity(VoicevoxUserDictWord entity) =>
      VoicevoxxUserDictWord(
        surface: entity.surface.toDartString(),
        pronunciation: entity.pronunciation.toDartString(),
        accentType: entity.accentType,
        wordType: entity.wordType,
        priority: entity.priority,
      );
}

extension VoicevoxUserDictWordAllFreeExtension
    on Pointer<VoicevoxUserDictWord> {
  void callocAllFree() {
    if (ref.surface != nullptr) {
      ffi.calloc.free(ref.surface);
    }
    if (ref.pronunciation != nullptr) {
      ffi.calloc.free(ref.pronunciation);
    }
    ffi.calloc.free(this);
  }
}
