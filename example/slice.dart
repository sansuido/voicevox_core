// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:voicevox_core/voicevox_core.dart';

const gOpenJtalkDicPath = 'assets/open_jtalk_dic_utf_8-1.11';
const gModelFilePath = 'assets/model/0.vvm';
const gText = 'こんにちは、ヴォイスヴォックスのダートバインディングで、スライスしています。';
const gStyleId = 0;

List<Map<String, dynamic>> sliceAudioFeatureByMora(String audioQueryJson) {
  final moraRanges = <Map<String, dynamic>>[];
  final data = jsonDecode(audioQueryJson);
  final fps = voicevoxGetFrameRate();
  //final int samplingRate = data['outputSamplingRate'] ?? 24000;
  //final fps = samplingRate / 256.0;
  double currentTime = data['prePhonemeLength'] ?? 0.1;
  for (final phrase in data['accent_phrases']) {
    for (final mora in phrase['moras']) {
      final consonantLength = mora['consonant_length'] ?? 0.0;
      final vowelLength = mora['vowel_length'] ?? 0.0;
      final duration = consonantLength + vowelLength;
      final startTime = currentTime;
      final endTime = currentTime + duration;
      final startFrame = (startTime * fps).round();
      final endFrame = (endTime * fps).round();
      moraRanges.add({
        'text': mora['text'],
        'startFrame': startFrame,
        'endFrame': endFrame,
      });
      currentTime = endTime;
    }
    if (phrase['pause_mora'] != null) {
      final vowelLength = phrase['pause_mora']['vowel_length'] ?? 0.0;
      final startTime = currentTime;
      final endTime = currentTime + vowelLength;
      final startFrame = (startTime * fps).round();
      final endFrame = (endTime * fps).round();
      moraRanges.add({
        'text': phrase['pause_mora']['text'],
        'startFrame': startFrame,
        'endFrame': endFrame,
      });
      currentTime = endTime;
    }
  }
  return moraRanges;
}

int main() {
  var voicevoxResult = VOICEVOX_RESULT_OK;
  Pointer<VoicevoxOnnxruntime> onnxruntime = nullptr;
  Pointer<OpenJtalkRc> openJtalk = nullptr;
  Pointer<VoicevoxSynthesizer> synthesizer = nullptr;
  Pointer<VoicevoxVoiceModelFile> model = nullptr;
  Pointer<VoicevoxAudioFeature> audioFeature = nullptr;
  var audioQueryJson = '';
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
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxSynthesizerCreateAudioQuery(
      synthesizer,
      gText,
      gStyleId,
    );
    voicevoxResult = rec.result;
    audioQueryJson = rec.audioQueryJson;
  }
  // 6. Create AudioFeature from AudioQuery
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final rec = voicevoxxSynthesizerCreateAudioFeature(
      synthesizer,
      audioQueryJson,
      gStyleId,
    );
    voicevoxResult = rec.result;
    audioFeature = rec.audioFeature;
  }
  // 7. Slice AudioFeature by mora and render each slice
  if (voicevoxResult == VOICEVOX_RESULT_OK) {
    final moraRanges = sliceAudioFeatureByMora(audioQueryJson);
    for (var index = 0; index < moraRanges.length; index++) {
      final mora = moraRanges[index];
      //print("文字: ${mora['text']} -> フレーム ${mora['startFrame']} 〜 ${mora['endFrame']}");
      final rec = audioFeature.slice(
        mora['startFrame'],
        mora['endFrame'],
        endIsInclusive: true,
      );
      var result = rec.result;
      final slice = rec.slice;
      if (result == VOICEVOX_RESULT_OK) {
        final rec = synthesizer.render(slice);
        result = rec.result;
        final pcm = rec.pcm;
        if (result == VOICEVOX_RESULT_OK) {
          final fileName =
              'slice_${index.toString().padLeft(2, '0')}_${mora['text']}.wav';
          final wav = voicevoxxWavFromS16le(pcm, 24000);
          if (wav.isNotEmpty) {
            final _ = File(fileName)..writeAsBytesSync(wav);
          }
        } else {
          print('Error rendering audio for mora: ${mora['text']}');
        }
      } else {
        print('Error slicing audio feature for mora: ${mora['text']}');
      }
    }
  }
  // 8. Free allocated memory
  audioFeature.delete();
  model.delete();
  synthesizer.delete();
  openJtalk.delete();
  return 0;
}
