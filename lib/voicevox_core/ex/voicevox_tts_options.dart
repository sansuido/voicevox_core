part of '../core.dart';

class VoicevoxxTtsOptions {
  VoicevoxxTtsOptions({this.enableInterrogativeUpspeak = false});

  bool enableInterrogativeUpspeak;

  void loadFromEntity(VoicevoxTtsOptions entity) {
    enableInterrogativeUpspeak = entity.enableInterrogativeUpspeak;
  }

  void loadFromPointer(Pointer<VoicevoxTtsOptions> pointer) {
    loadFromEntity(pointer.ref);
  }

  Pointer<VoicevoxTtsOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxTtsOptions>();
    pointer.ref.enableInterrogativeUpspeak = enableInterrogativeUpspeak;
    return pointer;
  }
}
