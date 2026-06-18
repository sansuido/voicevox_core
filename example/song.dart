// https://github.com/VOICEVOX/voicevox_core/blob/main/example/cpp/unix/song.cpp
import 'dart:ffi';
import 'dart:io';
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
  Pointer<Uint8> wav = nullptr;
  var wavLength = 0;
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxOnnxruntimeLoadOnce(
      voicevoxMakeDefaultLoadOnnxruntimeOptions(),
    );
    voicevoxResult = rec.result;
    onnxruntime = rec.onnxruntime;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxOpenJtalkRcNew(gOpenJtalkDicPath);
    voicevoxResult = rec.result;
    openJtalk = rec.openJtalk;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxSynthesizerNew(
      onnxruntime,
      openJtalk,
      voicevoxMakeDefaultInitializeOptions(),
    );
    voicevoxResult = rec.result;
    synthesizer = rec.synthesizer;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxVoiceModelFileOpen(gModelFilePath);
    voicevoxResult = rec.result;
    model = rec.model;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    voicevoxResult = voicevoxSynthesizerLoadVoiceModel(synthesizer, model);
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxSynthesizerCreateSingFrameAudioQuery(
      synthesizer,
      gScore,
      gSingingTeacher,
    );
    voicevoxResult = rec.result;
    frameAudioQueryJson = rec.frameAudioQueryJson;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxSynthesizerFrameSynthesis(
      synthesizer,
      frameAudioQueryJson,
      gSinger,
    );
    voicevoxResult = rec.result;
    wav = rec.wav;
    wavLength = rec.wavLength;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final _ = File(gOutputWavFilePath)
      ..writeAsBytesSync(wav.asTypedList(wavLength));
  }
  voicevoxWavFree(wav);
  voicevoxVoiceModelFileDelete(model);
  voicevoxSynthesizerDelete(synthesizer);
  voicevoxOpenJtalkRcDelete(openJtalk);
  return 0;
}
