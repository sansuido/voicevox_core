part of '../core.dart';

class VoicevoxxAudioQueryFrameLengthOptions {
  VoicevoxxAudioQueryFrameLengthOptions({
    this.enableInterrogativeUpspeak = false,
  });
  final bool enableInterrogativeUpspeak;

  static VoicevoxxAudioQueryFrameLengthOptions fromEntity(
    VoicevoxAudioQueryFrameLengthOptions entity,
  ) => VoicevoxxAudioQueryFrameLengthOptions(
    enableInterrogativeUpspeak: entity.enableInterrogativeUpspeak,
  );

  Pointer<VoicevoxAudioQueryFrameLengthOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxAudioQueryFrameLengthOptions>();
    pointer.ref.enableInterrogativeUpspeak = enableInterrogativeUpspeak;
    return pointer;
  }
}
