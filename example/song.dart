// https://github.com/VOICEVOX/voicevox_core/blob/main/example/cpp/unix/song.cpp
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:voicevox_core/voicevox_core.dart';

const gOpenJtalkDicPath = 'assets/open_jtalk_dic_utf_8-1.11';
const gModelFilePath = 'assets/model/s0.vvm';
const gSingingTeacher = 6000;
const gSinger = 3000;
const gOutputWavFilePath = 'song.wav';
const gScore = '''
{
  "notes": [ 
    { "key": null, "frame_length": 15, "lyric": "" },
    { "key": 60, "frame_length": 45, "lyric": "ド" },
    { "key": 62, "frame_length": 45, "lyric": "レ" },
    { "key": 64, "frame_length": 45, "lyric": "ミ" },
    { "key": null, "frame_length": 15, "lyric": "" }
  ]
}
''';

int main() {
  var voicevoxResult = VOICEVOX_RESULT_OK;
  Pointer<VoicevoxOnnxruntime> onnxruntime = nullptr;
  Pointer<OpenJtalkRc> openJtalk = nullptr;
  Pointer<VoicevoxSynthesizer> synthesizer = nullptr;
  Pointer<VoicevoxVoiceModelFile> model = nullptr;
  var frameAudioQueryJson = '';
  late Uint8List wav;
  // 1. Load ONNX Runtime
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxOnnxruntimeLoadOnce();
    voicevoxResult = rec.result;
    onnxruntime = rec.onnxruntime;
  }
  // 2. Initialize OpenJtalk with dictionary path
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxOpenJtalkRcNew(gOpenJtalkDicPath);
    voicevoxResult = rec.result;
    openJtalk = rec.openJtalk;
  }
  // 3. Create Synthesizer
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = onnxruntime.createSynthesizer(openJtalk);
    voicevoxResult = rec.result;
    synthesizer = rec.synthesizer;
  }
  // 4. Open voice model file (.vvm)
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxVoiceModelFileOpen(gModelFilePath);
    voicevoxResult = rec.result;
    model = rec.model;
  }
  // 5. Load the model into the Synthesizer
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    voicevoxResult = synthesizer.loadModel(model);
  }
  // 6. Create Sing Frame Audio Query from score
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = synthesizer.createSingFrameAudioQuery(gScore, gSingingTeacher);
    voicevoxResult = rec.result;
    frameAudioQueryJson = rec.frameAudioQueryJson;
  }
  // 7. Render WAV data via frame synthesis
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = synthesizer.frameSynthesis(frameAudioQueryJson, gSinger);
    voicevoxResult = rec.result;
    wav = rec.wav;
  }
  // 8. Save WAV data to a file
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final _ = File(gOutputWavFilePath)..writeAsBytesSync(wav);
  }
  // 9. Free allocated memory
  model.delete();
  synthesizer.delete();
  openJtalk.delete();
  return 0;
}
