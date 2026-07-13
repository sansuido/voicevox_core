part of '../core.dart';

class VoicevoxxInitializeOptions {
  VoicevoxxInitializeOptions({
    this.accelerationMode = 0,
    this.cpuNumThreads = 0,
  });
  int accelerationMode;
  int cpuNumThreads;

  void loadFromEntity(VoicevoxInitializeOptions entity) {
    accelerationMode = entity.accelerationMode;
    cpuNumThreads = entity.cpuNumThreads;
  }

  void loadFromPointer(Pointer<VoicevoxInitializeOptions> pointer) {
    loadFromEntity(pointer.ref);
  }

  Pointer<VoicevoxInitializeOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxInitializeOptions>();
    pointer.ref.accelerationMode = accelerationMode;
    pointer.ref.cpuNumThreads = cpuNumThreads;
    return pointer;
  }
}
