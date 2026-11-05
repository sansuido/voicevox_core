part of '../core.dart';

class VoicevoxxSynthesisOptions {
  VoicevoxxSynthesisOptions({this.enableInterrogativeUpspeak = false});

  final bool enableInterrogativeUpspeak;

  static VoicevoxxSynthesisOptions fromEntity(
    VoicevoxSynthesisOptions entity,
  ) => VoicevoxxSynthesisOptions(
    enableInterrogativeUpspeak: entity.enableInterrogativeUpspeak,
  );

  Pointer<VoicevoxSynthesisOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxSynthesisOptions>();
    pointer.ref.enableInterrogativeUpspeak = enableInterrogativeUpspeak;
    return pointer;
  }
}
