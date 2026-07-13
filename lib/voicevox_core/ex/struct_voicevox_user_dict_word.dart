part of '../core.dart';

class VoicevoxxUserDictWord {
  VoicevoxxUserDictWord({
    this.surface = '',
    this.pronunciation = '',
    this.accentType = 0,
    this.wordType = 1,
    this.priority = 5,
  });
  String surface;
  String pronunciation;
  int accentType;
  int wordType;
  int priority;

  Pointer<VoicevoxUserDictWord> calloc() {
    final pointer = ffi.calloc<VoicevoxUserDictWord>();
    pointer.ref.surface = surface.toNativeUtf8();
    pointer.ref.pronunciation = pronunciation.toNativeUtf8();
    pointer.ref.accentType = accentType;
    pointer.ref.wordType = wordType;
    pointer.ref.priority = priority;
    return pointer;
  }

  void loadFromEntity(VoicevoxUserDictWord entity) {
    surface = entity.surface.toDartString();
    pronunciation = entity.pronunciation.toDartString();
    accentType = entity.accentType;
    wordType = entity.wordType;
    priority = entity.priority;
  }

  void loadFromPointer(Pointer<VoicevoxUserDictWord> pointer) {
    loadFromEntity(pointer.ref);
  }
}

extension VoicevoxUserDictWordAllFreeExtension
    on Pointer<VoicevoxUserDictWord> {
  void callocAllFree() {
    if (ref.surface != nullptr) {
      calloc.free(ref.surface);
    }
    if (ref.pronunciation != nullptr) {
      calloc.free(ref.pronunciation);
    }
    calloc.free(this);
  }
}
