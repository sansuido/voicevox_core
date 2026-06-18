import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;

part 'ex/functions.dart';
part 'generated/constants.dart';
part 'generated/functions.dart';
part 'generated/structs.dart';

final class OpenJtalkRc extends Opaque {}

final class VoicevoxOnnxruntime extends Opaque {}

final class VoicevoxSynthesizer extends Opaque {}

final class VoicevoxUserDict extends Opaque {}

final class VoicevoxVoiceModelFile extends Opaque {}

final class VoicevoxVoiceModelId extends Struct {
  @Array(16)
  external Array<Uint8> value;
}

final DynamicLibrary _libCore = dylib.VoicevoxCoreDynamicLibraryService().open(
  'core',
);
