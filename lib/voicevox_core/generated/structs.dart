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

final class VoicevoxLoadVoiceModelOptions extends Struct {
  @Int32()
  external int onExisting;
}

final class VoicevoxSynthesisOptions extends Struct {
  @Bool()
  external bool enableInterrogativeUpspeak;
}

final class VoicevoxTtsOptions extends Struct {
  @Bool()
  external bool enableInterrogativeUpspeak;
}

final class VoicevoxUserDictWord extends Struct {
  external Pointer<Utf8> surface;
  external Pointer<Utf8> pronunciation;
  @UintPtr()
  external int accentType;
  @Int32()
  external int wordType;
  @Uint8()
  external int priority;
}
