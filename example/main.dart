// 以下のurlを参考にしているのだ。
// https://github.com/VOICEVOX/voicevox_core/tree/main/example/cpp/windows
// 外部ファイルは、assetsフォルダに配置しているのだ。
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:voicevox_core/voicevox_core.dart';

const gOpenJtalkDicPath = 'assets/open_jtalk_dic_utf_8-1.11';
const gModelFilePath = 'assets/model/0.vvm';
const gText = 'こんにちは、ヴォイスボックスのダートバインディングを使っています。';
const gStyleId = 0;
const gOutputWavFilePath = 'output.wav';

void main() {
  print('coreの初期化中...');
  final initializeOptions = voicevoxMakeDefaultInitializeOptions();
  final onnxruntime = calloc<Pointer<VoicevoxOnnxruntime>>();
  final loadOnnxruntimeOptions = voicevoxMakeDefaultLoadOnnxruntimeOptions();
  var result = voicevoxOnnxruntimeLoadOnce(loadOnnxruntimeOptions, onnxruntime);
  if (result != VOICEVOX_RESULT_OK) {
    print(voicevoxErrorResultToMessage(result));
    calloc.free(onnxruntime);
    return;
  }
  final openJtalk = calloc<Pointer<OpenJtalkRc>>();
  voicevoxOpenJtalkRcNew(gOpenJtalkDicPath, openJtalk);
  final synthesizer = calloc<Pointer<VoicevoxSynthesizer>>();
  result = voicevoxSynthesizerNew(
    onnxruntime.value,
    openJtalk.value,
    initializeOptions,
    synthesizer,
  );
  voicevoxOpenJtalkRcDelete(openJtalk.value);
  calloc
    ..free(openJtalk)
    ..free(onnxruntime);
  if (result != VOICEVOX_RESULT_OK) {
    print(voicevoxErrorResultToMessage(result));
    calloc.free(synthesizer);
    return;
  }
  final model = calloc<Pointer<VoicevoxVoiceModelFile>>();
  result = voicevoxVoiceModelFileOpen(gModelFilePath, model);
  if (result != VOICEVOX_RESULT_OK) {
    print(voicevoxErrorResultToMessage(result));
    voicevoxSynthesizerDelete(synthesizer.value);
    calloc
      ..free(model)
      ..free(synthesizer);
    return;
  }
  result = voicevoxSynthesizerLoadVoiceModel(synthesizer.value, model.value);
  if (result != VOICEVOX_RESULT_OK) {
    print(voicevoxErrorResultToMessage(result));
    voicevoxVoiceModelFileDelete(model.value);
    voicevoxSynthesizerDelete(synthesizer.value);
    calloc
      ..free(model)
      ..free(synthesizer);
    return;
  }
  voicevoxVoiceModelFileDelete(model.value);
  calloc.free(model);
  print('音声生成中...');
  final outputWavSize = calloc<Uint64>();
  final outputWav = calloc<Pointer<Uint8>>();
  result = voicevoxSynthesizerTts(
    synthesizer.value,
    gText,
    gStyleId,
    voicevoxMakeDefaultTtsOptions(),
    outputWavSize,
    outputWav,
  );
  voicevoxSynthesizerDelete(synthesizer.value);
  calloc.free(synthesizer);
  if (result != VOICEVOX_RESULT_OK) {
    print(voicevoxErrorResultToMessage(result));
    calloc
      ..free(outputWav)
      ..free(outputWavSize);
    return;
  }
  print('音声ファイル保存中...');
  final _ = File(gOutputWavFilePath)
    ..writeAsBytesSync(outputWav.value.asTypedList(outputWavSize.value));
  calloc
    ..free(outputWav)
    ..free(outputWavSize);
}
