import 'dart:ffi';
import 'dart:typed_data';

//import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;

part 'core/functions.dart';
part 'core/open_jtalk_rc.dart';
part 'core/voicevox_audio_feature_slice.dart';
part 'core/voicevox_audio_feature.dart';
part 'core/voicevox_audio_query_frame_length_options.dart';
part 'core/voicevox_initialize_options.dart';
part 'core/voicevox_load_onnxruntime_options.dart';
part 'core/voicevox_load_voice_model_options.dart';
part 'core/voicevox_onnxruntime.dart';
part 'core/voicevox_synthesis_options.dart';
part 'core/voicevox_synthesizer.dart';
part 'core/voicevox_tts_options.dart';
part 'core/voicevox_user_dict_word.dart';
part 'core/voicevox_user_dict.dart';
part 'core/voicevox_voice_model_file.dart';
part 'generated/constants.dart';
part 'generated/functions.dart';
part 'generated/structs.dart';

final class OpenJtalkRc extends Opaque {}

final class VoicevoxOnnxruntime extends Opaque {}

final class VoicevoxSynthesizer extends Opaque {}

final class VoicevoxUserDict extends Opaque {}

final class VoicevoxVoiceModelFile extends Opaque {}

final class VoicevoxAudioFeature extends Opaque {}

final DynamicLibrary _libCore = dylib.VoicevoxCoreDynamicLibraryService().open(
  'core',
);
