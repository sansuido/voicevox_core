import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;

part 'generated/constants.dart';
part 'generated/functions.dart';
part 'generated/structs.dart';

final class OpenJtalkRc extends Opaque {}

final class VoicevoxOnnxruntime extends Opaque {}

final class VoicevoxSynthesizer extends Opaque {}

final class VoicevoxUserDict extends Opaque {}

final class VoicevoxVoiceModelFile extends Opaque {}

final DynamicLibrary _libCore = dylib.VoicevoxCoreDynamicLibraryService().open(
  'core',
);
