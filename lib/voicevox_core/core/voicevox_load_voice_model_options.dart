part of '../core.dart';

class VoicevoxxLoadVoiceModelOptions {
  VoicevoxxLoadVoiceModelOptions({this.onExisting = 0});

  final int onExisting;

  static VoicevoxxLoadVoiceModelOptions fromEntity(
    VoicevoxLoadVoiceModelOptions entity,
  ) => VoicevoxxLoadVoiceModelOptions(onExisting: entity.onExisting);

  Pointer<VoicevoxLoadVoiceModelOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxLoadVoiceModelOptions>();
    pointer.ref.onExisting = onExisting;
    return pointer;
  }
}
