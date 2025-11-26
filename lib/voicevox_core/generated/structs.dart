// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../core.dart';

final class VoicevoxLoadOnnxruntimeOptions extends Struct {
  external Pointer<Utf8> filename;
}

final class VoicevoxInitializeOptions extends Struct {
  @Int32()
  external int accelerationMode;
  @Uint16()
  external int cpuNumThreads;
}

final class VoicevoxSynthesisOptions extends Struct {
  @Uint8()
  external int enableInterrogativeUpspeak;
}

final class VoicevoxTtsOptions extends Struct {
  @Uint8()
  external int enableInterrogativeUpspeak;
}

final class VoicevoxUserDictWord extends Struct {
  external Pointer<Utf8> surface;
  external Pointer<Utf8> pronunciation;
  @Uint64()
  external int accentType;
  @Int32()
  external int wordType;
  @Uint32()
  external int priority;
}
