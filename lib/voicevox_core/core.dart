import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dylib.dart' as dylib;

part 'ex/functions.dart';
part 'ex/open_jtalk_rc.dart';
part 'ex/struct_voicevox_initialize_options.dart';
part 'ex/struct_voicevox_load_onnxruntime_options.dart';
part 'ex/struct_voicevox_synthesis_options.dart';
part 'ex/struct_voicevox_tts_options.dart';
part 'ex/struct_voicevox_user_dict_word.dart';
part 'ex/voicevox_onnxruntime.dart';
part 'ex/voicevox_synthesizer.dart';
part 'ex/voicevox_user_dict.dart';
part 'ex/voicevox_voice_model_file.dart';
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
