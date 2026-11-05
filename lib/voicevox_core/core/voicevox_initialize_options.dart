part of '../core.dart';

class VoicevoxxInitializeOptions {
  VoicevoxxInitializeOptions({
    this.accelerationMode = 0,
    this.cpuNumThreads = 0,
  });
  final int accelerationMode;
  final int cpuNumThreads;

  static VoicevoxxInitializeOptions fromEntity(
    VoicevoxInitializeOptions entity,
  ) => VoicevoxxInitializeOptions(
    accelerationMode: entity.accelerationMode,
    cpuNumThreads: entity.cpuNumThreads,
  );

  Pointer<VoicevoxInitializeOptions> calloc() {
    final pointer = ffi.calloc<VoicevoxInitializeOptions>();
    pointer.ref.accelerationMode = accelerationMode;
    pointer.ref.cpuNumThreads = cpuNumThreads;
    return pointer;
  }
}
