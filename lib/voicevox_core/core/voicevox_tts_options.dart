part of '../core.dart';

class VoicevoxxTtsOptions {
  VoicevoxxTtsOptions({this.enableInterrogativeUpspeak = false});

  final bool enableInterrogativeUpspeak;

  static VoicevoxxTtsOptions fromEntity(VoicevoxTtsOptions entity) =>
      VoicevoxxTtsOptions(
        enableInterrogativeUpspeak: entity.enableInterrogativeUpspeak,
      );

  Pointer<VoicevoxTtsOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxTtsOptions>();
    pointer.ref.enableInterrogativeUpspeak = enableInterrogativeUpspeak;
    return pointer;
  }
}
