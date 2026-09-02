part of '../core.dart';

class VoicevoxxLoadOnnxruntimeOptions {
  VoicevoxxLoadOnnxruntimeOptions({this.filename = ''});

  String filename;

  void loadFromEntity(VoicevoxLoadOnnxruntimeOptions entity) {
    filename = entity.filename.toDartString();
  }

  void loadFromPointer(Pointer<VoicevoxLoadOnnxruntimeOptions> pointer) {
    loadFromEntity(pointer.ref);
  }

  Pointer<VoicevoxLoadOnnxruntimeOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxLoadOnnxruntimeOptions>();
    pointer.ref.filename = filename.toNativeUtf8();
    return pointer;
  }
}

extension VoicevoxLoadOnnxruntimeOptionsCallocAllFreeExtension
    on Pointer<VoicevoxLoadOnnxruntimeOptions> {
  void callocAllFree() {
    if (ref.filename != nullptr) {
      calloc.free(ref.filename);
    }
    calloc.free(this);
  }
}
