part of '../core.dart';

class VoicevoxxLoadOnnxruntimeOptions {
  VoicevoxxLoadOnnxruntimeOptions({this.filename = ''});

  final String filename;

  static VoicevoxxLoadOnnxruntimeOptions fromEntity(
    VoicevoxLoadOnnxruntimeOptions entity,
  ) =>
      VoicevoxxLoadOnnxruntimeOptions(filename: entity.filename.toDartString());

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
      ffi.calloc.free(ref.filename);
    }
    ffi.calloc.free(this);
  }
}
