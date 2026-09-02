import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:voicevox_core/voicevox_core.dart';

const gOpenJtalkDicPath = 'assets/open_jtalk_dic_utf_8-1.11';
const gModelFilePath = 'assets/model/0.vvm';
const gText = 'こんにちは、ヴォイスヴォックスのダートバインディングを使っています。';
const gStyleId = 0;
const gOutputWavFilePath = 'talk.wav';

int main() {
  var voicevoxResult = VOICEVOX_RESULT_OK;
  Pointer<VoicevoxOnnxruntime> onnxruntime = nullptr;
  Pointer<OpenJtalkRc> openJtalk = nullptr;
  Pointer<VoicevoxSynthesizer> synthesizer = nullptr;
  Pointer<VoicevoxVoiceModelFile> model = nullptr;
  late Uint8List wav;
  Pointer<VoicevoxUserDict> userDict = nullptr;
  late Uint8List wordUuid;
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxOnnxruntimeLoadOnce();
    voicevoxResult = rec.result;
    onnxruntime = rec.onnxruntime;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxOpenJtalkRcNew(gOpenJtalkDicPath);
    voicevoxResult = rec.result;
    openJtalk = rec.openJtalk;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = onnxruntime.createSynthesizer(openJtalk);
    voicevoxResult = rec.result;
    synthesizer = rec.synthesizer;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxVoiceModelFileOpen(gModelFilePath);
    voicevoxResult = rec.result;
    model = rec.model;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    voicevoxResult = synthesizer.loadModel(model);
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    userDict = voicevoxUserDictNew();
    voicevoxResult = openJtalk.useUserDict(userDict);
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = userDict.addWord(
      VoicevoxxUserDictWord()
        ..surface = 'ヴォイスボックス'
        ..pronunciation = 'ヴォヴォヴォボックス',
    );
    voicevoxResult = rec.result;
    wordUuid = rec.wordUuid;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    print(userDict.getJson());
    voicevoxResult = userDict.updateWord(
      wordUuid,
      VoicevoxxUserDictWord()
        ..surface = 'ヴォイスボックス'
        ..pronunciation = 'ボックスボックス',
    );
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    print(userDict.getJson());
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = synthesizer.tts(gText, gStyleId);
    voicevoxResult = rec.result;
    wav = rec.wav;
  }
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final _ = File(gOutputWavFilePath)..writeAsBytesSync(wav);
  }
  userDict.delete();
  model.delete();
  synthesizer.delete();
  openJtalk.delete();
  return 0;
}
