// ignore_for_file: comment_references

part of '../core.dart';

///
/// ONNX Runtimeをロードして初期化する。
///
/// 一度成功したら、以後は引数を無視して同じ参照を返す。
///
/// @param [in] options オプション
/// @param [out] out_onnxruntime ::VoicevoxOnnxruntime のインスタンス
///
/// @returns 結果コード
///
/// \availability{
/// [リリース](https://github.com/voicevox/voicevox_core/releases)されているライブラリではiOSを除くプラットフォームで利用可能。詳細は<a href="#voicevox-core-availability">ファイルレベルの"Availability"の節</a>を参照。
/// }
///
/// \safety{
/// - `options.filename`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `out_onnxruntime`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_onnxruntime_load_once}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_onnxruntime_load_once(struct VoicevoxLoadOnnxruntimeOptions options, const struct VoicevoxOnnxruntime **out_onnxruntime)
/// ```
({Pointer<VoicevoxOnnxruntime> onnxruntime, int result})
voicevoxxOnnxruntimeLoadOnce(VoicevoxLoadOnnxruntimeOptions options) {
  Pointer<VoicevoxOnnxruntime> onnxruntime = nullptr;
  final onnxruntimePointer = calloc<Pointer<VoicevoxOnnxruntime>>();
  final result = voicevoxOnnxruntimeLoadOnce(options, onnxruntimePointer);
  if (result == VOICEVOX_RESULT_OK) {
    onnxruntime = onnxruntimePointer.value;
  }
  calloc.free(onnxruntimePointer);
  return (result: result, onnxruntime: onnxruntime);
}

///
/// ONNX Runtimeを初期化する。
///
/// 一度成功したら以後は同じ参照を返す。
///
/// @param [out] out_onnxruntime ::VoicevoxOnnxruntime のインスタンス
///
/// @returns 結果コード
///
/// \availability{
/// [リリース](https://github.com/voicevox/voicevox_core/releases)されているライブラリではiOSでのみ利用可能。詳細は<a href="#voicevox-core-availability">ファイルレベルの"Availability"の節</a>を参照。
/// }
///
/// \safety{
/// - `out_onnxruntime`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_onnxruntime_init_once}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_onnxruntime_init_once(const struct VoicevoxOnnxruntime **out_onnxruntime)
/// ```
({Pointer<VoicevoxOnnxruntime> onnxruntime, int result})
voicevoxxOnnxruntimeInitOnce() {
  Pointer<VoicevoxOnnxruntime> onnxruntime = nullptr;
  final onnxruntimePointer = calloc<Pointer<VoicevoxOnnxruntime>>();
  final result = voicevoxOnnxruntimeInitOnce(onnxruntimePointer);
  if (result == VOICEVOX_RESULT_OK) {
    onnxruntime = onnxruntimePointer.value;
  }
  calloc.free(onnxruntimePointer);
  return (result: result, onnxruntime: onnxruntime);
}

///
/// ::OpenJtalkRc を<b>構築</b>(_construct_)する。
///
/// 解放は ::voicevox_open_jtalk_rc_delete で行う。
///
/// @param [in] open_jtalk_dic_dir 辞書ディレクトリを指すUTF-8のパス
/// @param [out] out_open_jtalk 構築先
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// OpenJtalkRc *open_jtalk;
/// voicevox_open_jtalk_rc_new("./open_jtalk_dic_utf_8-1.11", &open_jtalk);
/// ```
/// }
///
/// \safety{
/// - `open_jtalk_dic_dir`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `out_open_jtalk`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_open_jtalk_rc_new}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_open_jtalk_rc_new(const char *open_jtalk_dic_dir, struct OpenJtalkRc **out_open_jtalk)
/// ```
({Pointer<OpenJtalkRc> openJtalk, int result}) voicevoxxOpenJtalkRcNew(
  String openJtalkDicDir,
) {
  Pointer<OpenJtalkRc> openJtalk = nullptr;
  final openJtalkPointer = calloc<Pointer<OpenJtalkRc>>();
  final result = voicevoxOpenJtalkRcNew(openJtalkDicDir, openJtalkPointer);
  if (result == VOICEVOX_RESULT_OK) {
    openJtalk = openJtalkPointer.value;
  }
  calloc.free(openJtalkPointer);
  return (result: result, openJtalk: openJtalk);
}

///
/// 日本語のテキストを解析する。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] open_jtalk Open JTalkのオブジェクト
/// @param [in] text UTF-8の日本語テキスト
/// @param [out] output_accent_phrases_json 生成先
///
/// \orig-impl{voicevox_open_jtalk_rc_use_user_dict}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_open_jtalk_rc_analyze(const struct OpenJtalkRc *open_jtalk, const char *text, char **output_accent_phrases_json)
/// ```
({String accentPhrasesJson, int result}) voicevoxxOpenJtalkRcAnalyze(
  Pointer<OpenJtalkRc> openJtalk,
  String text,
) {
  var accentPhrasesJson = '';
  final accentPhrasesJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxOpenJtalkRcAnalyze(
    openJtalk,
    text,
    accentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    accentPhrasesJson = accentPhrasesJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(accentPhrasesJsonPointer.value);
  }
  calloc.free(accentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: accentPhrasesJson);
}

///
/// AccentPhraseの配列からAudioQueryを作る。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] accent_phrases_json AccentPhraseの配列のJSON文字列
/// @param [out] output_accent_phrases_json 生成先
///
/// \safety{
/// - `accent_phrases_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_query_create_from_accent_phrases}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_query_create_from_accent_phrases(const char *accent_phrases_json, char **output_audio_query_json)
/// ```
({String audioQueryJson, int result})
voicevoxxAudioQueryCreateFromAccentPhrases(String accentPhrasesJson) {
  var audioQueryJson = '';
  final autioQueryJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxAudioQueryCreateFromAccentPhrases(
    accentPhrasesJson,
    autioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    audioQueryJson = autioQueryJsonPointer.value.cast<Utf8>().toDartString();
    voicevoxJsonFree(autioQueryJsonPointer.value);
  }
  calloc.free(autioQueryJsonPointer);
  return (audioQueryJson: audioQueryJson, result: result);
}

///
/// VVMファイルを開く。
///
/// @param [in] path vvmファイルへのUTF-8のファイルパス
/// @param [out] out_model 構築先
///
/// @returns 結果コード
///
/// \safety{
/// - `path`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `out_model`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_voice_model_file_open}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_voice_model_file_open(const char *path, struct VoicevoxVoiceModelFile **out_model)
/// ```
({Pointer<VoicevoxVoiceModelFile> model, int result})
voicevoxxVoiceModelFileOpen(String path) {
  Pointer<VoicevoxVoiceModelFile> model = nullptr;
  final modelPointer = calloc<Pointer<VoicevoxVoiceModelFile>>();
  final result = voicevoxVoiceModelFileOpen(path, modelPointer);
  if (result == VOICEVOX_RESULT_OK) {
    model = modelPointer.value;
  }
  calloc.free(modelPointer);
  return (result: result, model: model);
}

///
/// ::VoicevoxVoiceModelFile からIDを取得する。
///
/// @param [in] model 音声モデル
/// @param [out] output_voice_model_id 音声モデルID。詳細は ::VoicevoxVoiceModelId
///
/// \safety{
/// - `output_voice_model_id`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_voice_model_file_id}
///
/// ```c
/// __declspec(dllimport) void voicevox_voice_model_file_id(const struct VoicevoxVoiceModelFile *model, uint8_t (*output_voice_model_id)[16])
/// ```
Pointer<Uint8> voicevoxxVoiceModelFileId(
  Pointer<VoicevoxVoiceModelFile> model,
) {
  Pointer<Uint8> voiceModelId = nullptr;
  final voideModelIdPointer = calloc<Pointer<Uint8>>();
  voicevoxVoiceModelFileId(model, voideModelIdPointer);
  voiceModelId = voideModelIdPointer.value;
  calloc.free(voideModelIdPointer);
  return voiceModelId;
}

///
/// ::VoicevoxVoiceModelFile からメタ情報を取得する。
///
/// JSONの解放は ::voicevox_json_free で行う。
///
/// @param [in] model 音声モデル
///
/// @returns メタ情報のJSON文字列
///
/// \orig-impl{voicevox_voice_model_file_create_metas_json}
///
/// ```c
/// __declspec(dllimport) char *voicevox_voice_model_file_create_metas_json(const struct VoicevoxVoiceModelFile *model)
/// ```
String voicevoxxVoiceModelFileCreateMetasJson(
  Pointer<VoicevoxVoiceModelFile> model,
) {
  final json = voicevoxVoiceModelFileCreateMetasJson(model);
  final result = json.cast<Utf8>().toDartString();
  voicevoxJsonFree(json);
  return result;
}

///
/// ::VoicevoxSynthesizer を<b>構築</b>(_construct_)する。
///
/// @param [in] onnxruntime
/// @param [in] open_jtalk Open JTalkのオブジェクト
/// @param [in] options オプション
/// @param [out] out_synthesizer 構築先
///
/// @returns 結果コード
///
/// \safety{
/// - `onnxruntime`は ::voicevox_onnxruntime_load_once または ::voicevox_onnxruntime_init_once で得たものでなければならない。
/// - `out_synthesizer`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_new}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_new(const struct VoicevoxOnnxruntime *onnxruntime, const struct OpenJtalkRc *open_jtalk, struct VoicevoxInitializeOptions options, struct VoicevoxSynthesizer **out_synthesizer)
/// ```
({int result, Pointer<VoicevoxSynthesizer> synthesizer})
voicevoxxSynthesizerNew(
  Pointer<VoicevoxOnnxruntime> onnxruntime,
  Pointer<OpenJtalkRc> openJtalk,
  VoicevoxInitializeOptions options,
) {
  Pointer<VoicevoxSynthesizer> synthesizer = nullptr;
  final synthesizerPointer = calloc<Pointer<VoicevoxSynthesizer>>();
  final result = voicevoxSynthesizerNew(
    onnxruntime,
    openJtalk,
    options,
    synthesizerPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    synthesizer = synthesizerPointer.value;
  }
  calloc.free(synthesizerPointer);
  return (result: result, synthesizer: synthesizer);
}

///
/// 今読み込んでいる音声モデルのメタ情報を、JSONで取得する。
///
/// JSONの解放は ::voicevox_json_free で行う。
///
/// @param [in] synthesizer 音声シンセサイザ
///
/// @return メタ情報のJSON文字列
///
/// \orig-impl{voicevox_synthesizer_create_metas_json}
///
/// ```c
/// __declspec(dllimport) char *voicevox_synthesizer_create_metas_json(const struct VoicevoxSynthesizer *synthesizer)
/// ```
String voicevoxxSynthesizerCreateMetasJson(
  Pointer<VoicevoxSynthesizer> synthesizer,
) {
  final json = voicevoxSynthesizerCreateMetasJson(synthesizer);
  final result = json.cast<Utf8>().toDartString();
  voicevoxJsonFree(json);
  return result;
}

///
/// AquesTalk風記法から、AudioQueryをJSONとして生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] kana AquesTalk風記法
/// @param [in] style_id スタイルID
/// @param [out] output_audio_query_json 生成先
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// char *audio_query;
/// voicevox_synthesizer_create_audio_query_from_kana(synthesizer, "コンニチワ'",
/// 2, // "四国めたん (ノーマル)"
/// &audio_query);
/// ```
/// }
///
/// \safety{
/// - `kana`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_audio_query_from_kana}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_audio_query_from_kana(const struct VoicevoxSynthesizer *synthesizer, const char *kana, VoicevoxStyleId style_id, char **output_audio_query_json)
/// ```
({String audioQueryJson, int result})
voicevoxxSynthesizerCreateAudioQueryFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String kana,
  int styleId,
) {
  var audioQueryJson = '';
  final autioQueryJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAudioQueryFromKana(
    synthesizer,
    kana,
    styleId,
    autioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    audioQueryJson = autioQueryJsonPointer.value.cast<Utf8>().toDartString();
    voicevoxJsonFree(autioQueryJsonPointer.value);
  }
  calloc.free(autioQueryJsonPointer);
  return (audioQueryJson: audioQueryJson, result: result);
}

///
/// AquesTalk風記法から、AccentPhrase (アクセント句)の配列をJSON形式で生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] kana AquesTalk風記法
/// @param [in] style_id スタイルID
/// @param [out] output_accent_phrases_json 生成先
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// char *accent_phrases;
/// voicevox_synthesizer_create_accent_phrases_from_kana(
/// synthesizer, "コンニチワ'",
/// 2, // "四国めたん (ノーマル)"
/// &accent_phrases);
/// ```
/// }
///
/// \safety{
/// - `kana`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_accent_phrases_from_kana}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_accent_phrases_from_kana(const struct VoicevoxSynthesizer *synthesizer, const char *kana, VoicevoxStyleId style_id, char **output_accent_phrases_json)
/// ```
({String accentPhrasesJson, int result})
voicevoxxSynthesizerCreateAccentPhrasesFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String kana,
  int styleId,
) {
  var accentPhrasesJson = '';
  final accentPhrasesJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAccentPhrasesFromKana(
    synthesizer,
    kana,
    styleId,
    accentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    accentPhrasesJson = accentPhrasesJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(accentPhrasesJsonPointer.value);
  }
  calloc.free(accentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: accentPhrasesJson);
}

///
/// 日本語テキストから、AccentPhrase (アクセント句)の配列をJSON形式で生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// ::voicevox_open_jtalk_rc_analyze と ::voicevox_synthesizer_replace_mora_data
/// が一体になったショートハンド。詳細は[テキスト音声合成の流れ]を参照。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] text UTF-8の日本語テキスト
/// @param [in] style_id スタイルID
/// @param [out] output_accent_phrases_json 生成先
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// char *accent_phrases;
/// voicevox_synthesizer_create_accent_phrases(synthesizer, "こんにちは",
/// 2, // "四国めたん (ノーマル)"
/// &accent_phrases);
/// ```
/// }
///
/// \safety{
/// - `text`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_accent_phrases}
///
/// [テキスト音声合成の流れ]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/tts-process.md
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_accent_phrases(const struct VoicevoxSynthesizer *synthesizer, const char *text, VoicevoxStyleId style_id, char **output_accent_phrases_json)
/// ```
({String accentPhrasesJson, int result})
voicevoxxSynthesizerCreateAccentPhrases(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String text,
  int styleId,
) {
  var accentPhrasesJson = '';
  final accentPhrasesJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAccentPhrases(
    synthesizer,
    text,
    styleId,
    accentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    accentPhrasesJson = accentPhrasesJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(accentPhrasesJsonPointer.value);
  }
  calloc.free(accentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: accentPhrasesJson);
}

///
/// AccentPhraseの配列の音高・音素長を、特定の声で生成しなおす。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// ::voicevox_synthesizer_replace_phoneme_length と ::voicevox_synthesizer_replace_mora_pitch
/// が一体になったショートハンド。詳細は[テキスト音声合成の流れ]を参照。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] accent_phrases_json AccentPhraseの配列のJSON文字列
/// @param [in] style_id スタイルID
/// @param [out] output_accent_phrases_json 生成先
///
/// @returns 結果コード
///
/// \safety{
/// - `accent_phrases_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_replace_mora_data}
///
/// [テキスト音声合成の流れ]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/tts-process.md
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_replace_mora_data(const struct VoicevoxSynthesizer *synthesizer, const char *accent_phrases_json, VoicevoxStyleId style_id, char **output_accent_phrases_json)
/// ```
({String accentPhrasesJson, int result}) voicevoxxSynthesizerReplaceMoraData(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String accentPhrasesJson,
  int styleId,
) {
  var outputAccentPhrasesJson = '';
  final outputAccentPhrasesJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerReplaceMoraData(
    synthesizer,
    accentPhrasesJson,
    styleId,
    outputAccentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    outputAccentPhrasesJson = outputAccentPhrasesJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(outputAccentPhrasesJsonPointer.value);
  }
  calloc.free(outputAccentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: outputAccentPhrasesJson);
}

///
/// AccentPhraseの配列の音素長を、特定の声で生成しなおす。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] accent_phrases_json AccentPhraseの配列のJSON文字列
/// @param [in] style_id スタイルID
/// @param [out] output_accent_phrases_json 生成先
///
/// @returns 結果コード
///
/// \safety{
/// - `accent_phrases_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_replace_phoneme_length}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_replace_phoneme_length(const struct VoicevoxSynthesizer *synthesizer, const char *accent_phrases_json, VoicevoxStyleId style_id, char **output_accent_phrases_json)
/// ```
({String accentPhrasesJson, int result})
voicevoxxSynthesizerReplacePhonemeLength(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String accentPhrasesJson,
  int styleId,
) {
  var outputAccentPhrasesJson = '';
  final outputAccentPhrasesJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerReplacePhonemeLength(
    synthesizer,
    accentPhrasesJson,
    styleId,
    outputAccentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    outputAccentPhrasesJson = outputAccentPhrasesJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(outputAccentPhrasesJsonPointer.value);
  }
  calloc.free(outputAccentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: outputAccentPhrasesJson);
}

///
/// AccentPhraseの配列の音高を、特定の声で生成しなおす。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] accent_phrases_json AccentPhraseの配列のJSON文字列
/// @param [in] style_id スタイルID
/// @param [out] output_accent_phrases_json 生成先
///
/// @returns 結果コード
///
/// \safety{
/// - `accent_phrases_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_replace_mora_pitch}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_replace_mora_pitch(const struct VoicevoxSynthesizer *synthesizer, const char *accent_phrases_json, VoicevoxStyleId style_id, char **output_accent_phrases_json)
/// ```
({String accentPhrasesJson, int result}) voicevoxxSynthesizerReplaceMoraPitch(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String accentPhrasesJson,
  int styleId,
) {
  var outputAccentPhrasesJson = '';
  final outputAccentPhrasesJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerReplaceMoraPitch(
    synthesizer,
    accentPhrasesJson,
    styleId,
    outputAccentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    outputAccentPhrasesJson = outputAccentPhrasesJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(outputAccentPhrasesJsonPointer.value);
  }
  calloc.free(outputAccentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: outputAccentPhrasesJson);
}

///
/// AquesTalk風記法から音声合成を行う。
///
/// 生成したWAVデータを解放するには ::voicevox_wav_free を使う。
///
/// @param [in] synthesizer
/// @param [in] kana AquesTalk風記法
/// @param [in] style_id スタイルID
/// @param [in] options オプション
/// @param [out] output_wav_length 出力のバイト長
/// @param [out] output_wav 出力先
///
/// @returns 結果コード
///
/// \safety{
/// - `kana`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_wav_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// - `output_wav`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_tts_from_kana}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_tts_from_kana(const struct VoicevoxSynthesizer *synthesizer, const char *kana, VoicevoxStyleId style_id, struct VoicevoxTtsOptions options, uintptr_t *output_wav_length, uint8_t **output_wav)
/// ```
({int result, Pointer<Uint8> wav, int wavLength})
voicevoxxSynthesizerTtsFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String kana,
  int styleId,
  VoicevoxTtsOptions options,
) {
  Pointer<Uint8> wav = nullptr;
  var wavLength = 0;
  final wavLengthPointer = calloc<UintPtr>();
  final wavPointer = calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerTtsFromKana(
    synthesizer,
    kana,
    styleId,
    options,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = wavPointer.value;
    wavLength = wavLengthPointer.value;
  }
  calloc
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav, wavLength: wavLength);
}

///
/// 日本語テキストから音声合成を行う。
///
/// 生成したWAVデータを解放するには ::voicevox_wav_free を使う。
///
/// ::voicevox_synthesizer_create_audio_query と ::voicevox_synthesizer_synthesis
/// が一体になったショートハンド。詳細は[テキスト音声合成の流れ]を参照。
///
/// @param [in] synthesizer
/// @param [in] text UTF-8の日本語テキスト
/// @param [in] style_id スタイルID
/// @param [in] options オプション
/// @param [out] output_wav_length 出力のバイト長
/// @param [out] output_wav 出力先
///
/// @returns 結果コード
///
/// \safety{
/// - `text`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_wav_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// - `output_wav`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_tts}
///
/// [テキスト音声合成の流れ]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/tts-process.md
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_tts(const struct VoicevoxSynthesizer *synthesizer, const char *text, VoicevoxStyleId style_id, struct VoicevoxTtsOptions options, uintptr_t *output_wav_length, uint8_t **output_wav)
/// ```
({int result, Pointer<Uint8> wav, int wavLength}) voicevoxxSynthesizerTts(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String text,
  int styleId,
  VoicevoxTtsOptions options,
) {
  Pointer<Uint8> wav = nullptr;
  var wavLength = 0;
  final wavLengthPointer = calloc<UintPtr>();
  final wavPointer = calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerTts(
    synthesizer,
    text,
    styleId,
    options,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = wavPointer.value;
    wavLength = wavLengthPointer.value;
  }
  calloc
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav, wavLength: wavLength);
}

///
/// 楽譜から歌唱音声合成用のクエリを作成する。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したJSONを解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] score_json [`Score`型]を表すJSON
/// @param [in] style_id スタイルID
/// @param [out] output_frame_audio_query_json 生成先
///
/// [`Score`型]: ../rust_api/voicevox_core/struct.Score.html
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// const char *kScore =
/// "{"
/// "  \"notes\": [ "
/// "    { \"key\": null, \"frame_length\": 15, \"lyric\": \"\" },"
/// "    { \"key\": 60, \"frame_length\": 45, \"lyric\": \"ド\" },"
/// "    { \"key\": 62, \"frame_length\": 45, \"lyric\": \"レ\" },"
/// "    { \"key\": 64, \"frame_length\": 45, \"lyric\": \"ミ\" },"
/// "    { \"key\": null, \"frame_length\": 15, \"lyric\": \"\" }"
/// "  ]"
/// "}";
/// const VoicevoxStyleId kSingingTeacher = 6000;
///
/// char *frame_audio_query;
/// const VoicevoxResultCode result =
/// voicevox_synthesizer_create_sing_frame_audio_query(
/// synthesizer, kScore, kSingingTeacher, &frame_audio_query);
/// ```
/// }
///
/// \safety{
/// - `score_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_frame_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_sing_frame_audio_query}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_sing_frame_audio_query(const struct VoicevoxSynthesizer *synthesizer, const char *score_json, VoicevoxStyleId style_id, char **output_frame_audio_query_json)
/// ```
({String frameAudioQueryJson, int result})
voicevoxxSynthesizerCreateSingFrameAudioQuery(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String scoreJson,
  int styleId,
) {
  var frameAudioQueryJson = '';
  final frameAudioQueryJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateSingFrameAudioQuery(
    synthesizer,
    scoreJson,
    styleId,
    frameAudioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    frameAudioQueryJson = frameAudioQueryJsonPointer.value
        .cast<Utf8>()
        .toDartString();
    voicevoxJsonFree(frameAudioQueryJsonPointer.value);
  }
  calloc.free(frameAudioQueryJsonPointer);
  return (result: result, frameAudioQueryJson: frameAudioQueryJson);
}

///
/// 楽譜と歌唱音声合成用のクエリから、フレームごとの基本周波数を生成する。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したJSONを解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] score_json [`Score`型]を表すJSON
/// @param [in] frame_audio_query_json [`FrameAudioQuery`型]を表すJSON
/// @param [in] style_id スタイルID
/// @param [out] output_f0_json 生成先
///
/// [`Score`型]: ../rust_api/voicevox_core/struct.Score.html
/// [`FrameAudioQuery`型]: ../rust_api/voicevox_core/struct.FrameAudioQuery.html
///
/// @returns 結果コード
///
/// \safety{
/// - `score_json`と`frame_audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_f0_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_sing_frame_f0}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_sing_frame_f0(const struct VoicevoxSynthesizer *synthesizer, const char *score_json, const char *frame_audio_query_json, VoicevoxStyleId style_id, char **output_f0_json)
/// ```
({String f0Json, int result}) voicevoxxSynthesizerCreateSingFrameF0(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String scoreJson,
  String frameAudioQueryJson,
  int styleId,
) {
  var f0Json = '';
  final f0JsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateSingFrameF0(
    synthesizer,
    scoreJson,
    frameAudioQueryJson,
    styleId,
    f0JsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    f0Json = f0JsonPointer.value.cast<Utf8>().toDartString();
    voicevoxJsonFree(f0JsonPointer.value);
  }
  calloc.free(f0JsonPointer);
  return (result: result, f0Json: f0Json);
}

///
/// 楽譜と歌唱音声合成用のクエリから、フレームごとの音量を生成する。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したJSONを解放するには ::voicevox_json_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] score_json [`Score`型]を表すJSON
/// @param [in] frame_audio_query_json [`FrameAudioQuery`型]を表すJSON
/// @param [in] style_id スタイルID
/// @param [out] output_volume_json 生成先
///
/// [`Score`型]: ../rust_api/voicevox_core/struct.Score.html
/// [`FrameAudioQuery`型]: ../rust_api/voicevox_core/struct.FrameAudioQuery.html
///
/// @returns 結果コード
///
/// \safety{
/// - `score_json`と`frame_audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_volume_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_sing_frame_volume}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_sing_frame_volume(const struct VoicevoxSynthesizer *synthesizer, const char *score_json, const char *frame_audio_query_json, VoicevoxStyleId style_id, char **output_volume_json)
/// ```
({String volumeJson, int result}) voicevoxxSynthesizerCreateSingFrameVolume(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? scoreJson,
  String? frameAudioQueryJson,
  int styleId,
) {
  var volumeJson = '';
  final volumeJsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateSingFrameVolume(
    synthesizer,
    scoreJson,
    frameAudioQueryJson,
    styleId,
    volumeJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    volumeJson = volumeJsonPointer.value.cast<Utf8>().toDartString();
    voicevoxJsonFree(volumeJsonPointer.value);
  }
  calloc.free(volumeJsonPointer);
  return (result: result, volumeJson: volumeJson);
}

///
/// 歌唱音声合成を行う。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したWAVデータを解放するには ::voicevox_wav_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] frame_audio_query_json [`FrameAudioQuery`型]を表すJSON
/// @param [in] style_id スタイルID
/// @param [out] output_wav_length 出力のバイト長
/// @param [out] output_wav 出力先
///
/// [`FrameAudioQuery`型]: ../rust_api/voicevox_core/struct.FrameAudioQuery.html
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// const VoicevoxStyleId kSinger = 3000;
///
/// uint8_t *wav;
/// size_t wav_length;
/// const VoicevoxResultCode result = voicevox_synthesizer_frame_synthesis(
/// synthesizer, frame_audio_query, kSinger, &wav_length, &wav);
/// ```
/// }
///
/// \safety{
/// - `frame_audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_wav_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// - `output_wav`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_frame_synthesis}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_frame_synthesis(const struct VoicevoxSynthesizer *synthesizer, const char *frame_audio_query_json, VoicevoxStyleId style_id, uintptr_t *output_wav_length, uint8_t **output_wav)
/// ```
({int result, Pointer<Uint8> wav, int wavLength})
voicevoxxSynthesizerFrameSynthesis(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String frameAudioQueryJson,
  int styleId,
) {
  Pointer<Uint8> wav = nullptr;
  var wavLength = 0;
  final wavLengthPointer = calloc<UintPtr>();
  final wavPointer = calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerFrameSynthesis(
    synthesizer,
    frameAudioQueryJson,
    styleId,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = wavPointer.value;
    wavLength = wavLengthPointer.value;
  }
  calloc
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav, wavLength: wavLength);
}

///
/// ユーザー辞書の単語をJSON形式で出力する。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// @param [in] user_dict ユーザー辞書
/// @param [out] output_json 出力先
/// @returns 結果コード
///
/// \safety{
/// - `output_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_user_dict_to_json}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_to_json(const struct VoicevoxUserDict *user_dict, char **output_json)
/// ```
({String json, int result}) voicevoxxUserDictToJson(
  Pointer<VoicevoxUserDict> userDict,
) {
  var json = '';
  final jsonPointer = calloc<Pointer<Int8>>();
  final result = voicevoxUserDictToJson(userDict, jsonPointer);
  if (result == VOICEVOX_RESULT_OK) {
    json = jsonPointer.value.cast<Utf8>().toDartString();
    voicevoxJsonFree(jsonPointer.value);
  }
  calloc.free(jsonPointer);
  return (result: result, json: json);
}
