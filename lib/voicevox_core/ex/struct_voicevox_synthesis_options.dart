part of '../core.dart';

class VoicevoxxSynthesisOptions {
  VoicevoxxSynthesisOptions({this.enableInterrogativeUpspeak = false});

  bool enableInterrogativeUpspeak;

  void loadFromEntity(VoicevoxSynthesisOptions entity) {
    enableInterrogativeUpspeak = entity.enableInterrogativeUpspeak;
  }

  void loadFromPointer(Pointer<VoicevoxSynthesisOptions> pointer) {
    loadFromEntity(pointer.ref);
  }

  Pointer<VoicevoxSynthesisOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxSynthesisOptions>();
    pointer.ref.enableInterrogativeUpspeak = enableInterrogativeUpspeak;
    return pointer;
  }
}
