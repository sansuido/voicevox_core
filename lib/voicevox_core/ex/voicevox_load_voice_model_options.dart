part of '../core.dart';

class VoicevoxxLoadVoiceModelOptions {
  VoicevoxxLoadVoiceModelOptions({this.onExisting = 0});

  int onExisting;

  void loadFromEntity(VoicevoxLoadVoiceModelOptions entity) {
    onExisting = entity.onExisting;
  }

  void loadFromPointer(Pointer<VoicevoxLoadVoiceModelOptions> pointer) {
    loadFromEntity(pointer.ref);
  }

  Pointer<VoicevoxLoadVoiceModelOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxLoadVoiceModelOptions>();
    pointer.ref.onExisting = onExisting;
    return pointer;
  }
}

/*
final class VoicevoxLoadVoiceModelOptions extends Struct {
  @Int32()
  external int onExisting;
}
*/
