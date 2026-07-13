// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: comment_references
part of '../core.dart';

///
/// ONNX Runtimeの動的ライブラリの、バージョン付きのファイル名。
///
/// WindowsとAndroidでは ::voicevox_get_onnxruntime_lib_unversioned_filename と同じ。
///
/// \availability{
/// [リリース](https://github.com/voicevox/voicevox_core/releases)されているライブラリではiOSを除くプラットフォームで利用可能。詳細は<a href="#voicevox-core-availability">ファイルレベルの"Availability"の節</a>を参照。
/// }
///
/// \orig-impl{voicevox_get_onnxruntime_lib_versioned_filename}
///
/// ```c
/// __declspec(dllimport) const char *voicevox_get_onnxruntime_lib_versioned_filename(void)
/// ```
String? voicevoxGetOnnxruntimeLibVersionedFilename() {
  final voicevoxGetOnnxruntimeLibVersionedFilenameLookupFunction = _libCore
      .lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'voicevox_get_onnxruntime_lib_versioned_filename',
      );

  return voicevoxGetOnnxruntimeLibVersionedFilenameLookupFunction()
      .toDartString();
}

///
/// ONNX Runtimeの動的ライブラリの、バージョン無しのファイル名。
///
/// \availability{
/// [リリース](https://github.com/voicevox/voicevox_core/releases)されているライブラリではiOSを除くプラットフォームで利用可能。詳細は<a href="#voicevox-core-availability">ファイルレベルの"Availability"の節</a>を参照。
/// }
///
/// \orig-impl{voicevox_get_onnxruntime_lib_unversioned_filename}
///
/// ```c
/// __declspec(dllimport) const char *voicevox_get_onnxruntime_lib_unversioned_filename(void)
/// ```
String? voicevoxGetOnnxruntimeLibUnversionedFilename() {
  final voicevoxGetOnnxruntimeLibUnversionedFilenameLookupFunction = _libCore
      .lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'voicevox_get_onnxruntime_lib_unversioned_filename',
      );

  return voicevoxGetOnnxruntimeLibUnversionedFilenameLookupFunction()
      .toDartString();
}

///
/// デフォルトの ::voicevox_onnxruntime_load_once のオプションを生成する。
///
/// @return デフォルトの ::voicevox_onnxruntime_load_once のオプション
///
/// \availability{
/// [リリース](https://github.com/voicevox/voicevox_core/releases)されているライブラリではiOSを除くプラットフォームで利用可能。詳細は<a href="#voicevox-core-availability">ファイルレベルの"Availability"の節</a>を参照。
/// }
///
/// \no-orig-impl{voicevox_make_default_load_onnxruntime_options}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxLoadOnnxruntimeOptions voicevox_make_default_load_onnxruntime_options(void)
/// ```
VoicevoxLoadOnnxruntimeOptions voicevoxMakeDefaultLoadOnnxruntimeOptions() {
  final voicevoxMakeDefaultLoadOnnxruntimeOptionsLookupFunction = _libCore
      .lookupFunction<
        VoicevoxLoadOnnxruntimeOptions Function(),
        VoicevoxLoadOnnxruntimeOptions Function()
      >('voicevox_make_default_load_onnxruntime_options');

  return voicevoxMakeDefaultLoadOnnxruntimeOptionsLookupFunction();
}

///
/// ::VoicevoxOnnxruntime のインスタンスが既に作られているならそれを得る。
///
/// 作られていなければ`NULL`を返す。
///
/// @returns ::VoicevoxOnnxruntime のインスタンス
///
/// \orig-impl{voicevox_onnxruntime_get}
///
/// ```c
/// __declspec(dllimport) const struct VoicevoxOnnxruntime *voicevox_onnxruntime_get(void)
/// ```
Pointer<VoicevoxOnnxruntime> voicevoxOnnxruntimeGet() {
  final voicevoxOnnxruntimeGetLookupFunction = _libCore
      .lookupFunction<
        Pointer<VoicevoxOnnxruntime> Function(),
        Pointer<VoicevoxOnnxruntime> Function()
      >('voicevox_onnxruntime_get');

  return voicevoxOnnxruntimeGetLookupFunction();
}

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
int voicevoxOnnxruntimeLoadOnce(
  VoicevoxLoadOnnxruntimeOptions options,
  Pointer<Pointer<VoicevoxOnnxruntime>> outOnnxruntime,
) {
  final voicevoxOnnxruntimeLoadOnceLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          VoicevoxLoadOnnxruntimeOptions,
          Pointer<Pointer<VoicevoxOnnxruntime>>,
        ),
        int Function(
          VoicevoxLoadOnnxruntimeOptions,
          Pointer<Pointer<VoicevoxOnnxruntime>>,
        )
      >('voicevox_onnxruntime_load_once');

  return voicevoxOnnxruntimeLoadOnceLookupFunction(options, outOnnxruntime);
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
int voicevoxOnnxruntimeInitOnce(
  Pointer<Pointer<VoicevoxOnnxruntime>> outOnnxruntime,
) {
  final voicevoxOnnxruntimeInitOnceLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Pointer<VoicevoxOnnxruntime>>),
        int Function(Pointer<Pointer<VoicevoxOnnxruntime>>)
      >('voicevox_onnxruntime_init_once');

  return voicevoxOnnxruntimeInitOnceLookupFunction(outOnnxruntime);
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
int voicevoxOpenJtalkRcNew(
  String? openJtalkDicDir,
  Pointer<Pointer<OpenJtalkRc>> outOpenJtalk,
) {
  final voicevoxOpenJtalkRcNewLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>, Pointer<Pointer<OpenJtalkRc>>),
        int Function(Pointer<Utf8>, Pointer<Pointer<OpenJtalkRc>>)
      >('voicevox_open_jtalk_rc_new');

  final openJtalkDicDirPointer = openJtalkDicDir != null
      ? openJtalkDicDir.toNativeUtf8()
      : nullptr;
  final result = voicevoxOpenJtalkRcNewLookupFunction(
    openJtalkDicDirPointer,
    outOpenJtalk,
  );
  calloc.free(openJtalkDicDirPointer);
  return result;
}

///
/// OpenJtalkの使うユーザー辞書を設定する。
///
/// この関数を呼び出した後にユーザー辞書を変更した場合、再度この関数を呼び出す必要がある。
///
/// @param [in] open_jtalk Open JTalkのオブジェクト
/// @param [in] user_dict ユーザー辞書
///
/// \orig-impl{voicevox_open_jtalk_rc_use_user_dict}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_open_jtalk_rc_use_user_dict(const struct OpenJtalkRc *open_jtalk, const struct VoicevoxUserDict *user_dict)
/// ```
int voicevoxOpenJtalkRcUseUserDict(
  Pointer<OpenJtalkRc> openJtalk,
  Pointer<VoicevoxUserDict> userDict,
) {
  final voicevoxOpenJtalkRcUseUserDictLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<OpenJtalkRc>, Pointer<VoicevoxUserDict>),
        int Function(Pointer<OpenJtalkRc>, Pointer<VoicevoxUserDict>)
      >('voicevox_open_jtalk_rc_use_user_dict');

  return voicevoxOpenJtalkRcUseUserDictLookupFunction(openJtalk, userDict);
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
int voicevoxOpenJtalkRcAnalyze(
  Pointer<OpenJtalkRc> openJtalk,
  String? text,
  Pointer<Pointer<Int8>> outputAccentPhrasesJson,
) {
  final voicevoxOpenJtalkRcAnalyzeLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<OpenJtalkRc>,
          Pointer<Utf8>,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<OpenJtalkRc>,
          Pointer<Utf8>,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_open_jtalk_rc_analyze');

  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = voicevoxOpenJtalkRcAnalyzeLookupFunction(
    openJtalk,
    textPointer,
    outputAccentPhrasesJson,
  );
  calloc.free(textPointer);
  return result;
}

///
/// ::OpenJtalkRc を<b>破棄</b>(_destruct_)する。
///
/// 破棄対象への他スレッドでのアクセスが存在する場合、それらがすべて終わるのを待ってから破棄する。
///
/// この関数の呼び出し後に破棄し終えた対象にアクセスすると、プロセスを異常終了する。
///
/// @param [in] open_jtalk 破棄対象。nullable
///
/// \example{
/// ```c
/// voicevox_open_jtalk_rc_delete(open_jtalk);
/// ```
/// }
///
/// \no-orig-impl{voicevox_open_jtalk_rc_delete}
///
/// ```c
/// __declspec(dllimport) void voicevox_open_jtalk_rc_delete(struct OpenJtalkRc *open_jtalk)
/// ```
void voicevoxOpenJtalkRcDelete(Pointer<OpenJtalkRc> openJtalk) {
  final voicevoxOpenJtalkRcDeleteLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<OpenJtalkRc>),
        void Function(Pointer<OpenJtalkRc>)
      >('voicevox_open_jtalk_rc_delete');

  voicevoxOpenJtalkRcDeleteLookupFunction(openJtalk);
}

///
/// デフォルトの初期化オプションを生成する
/// @return デフォルト値が設定された初期化オプション
///
/// \no-orig-impl{voicevox_make_default_initialize_options}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxInitializeOptions voicevox_make_default_initialize_options(void)
/// ```
VoicevoxInitializeOptions voicevoxMakeDefaultInitializeOptions() {
  final voicevoxMakeDefaultInitializeOptionsLookupFunction = _libCore
      .lookupFunction<
        VoicevoxInitializeOptions Function(),
        VoicevoxInitializeOptions Function()
      >('voicevox_make_default_initialize_options');

  return voicevoxMakeDefaultInitializeOptionsLookupFunction();
}

///
/// voicevoxのバージョンを取得する。
/// @return SemVerでフォーマットされたバージョン。
///
/// \orig-impl{voicevox_get_version}
///
/// ```c
/// __declspec(dllimport) const char *voicevox_get_version(void)
/// ```
String? voicevoxGetVersion() {
  final voicevoxGetVersionLookupFunction = _libCore
      .lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'voicevox_get_version',
      );

  return voicevoxGetVersionLookupFunction().toDartString();
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
int voicevoxAudioQueryCreateFromAccentPhrases(
  String? accentPhrasesJson,
  Pointer<Pointer<Int8>> outputAudioQueryJson,
) {
  final voicevoxAudioQueryCreateFromAccentPhrasesLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>, Pointer<Pointer<Int8>>),
        int Function(Pointer<Utf8>, Pointer<Pointer<Int8>>)
      >('voicevox_audio_query_create_from_accent_phrases');

  final accentPhrasesJsonPointer = accentPhrasesJson != null
      ? accentPhrasesJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxAudioQueryCreateFromAccentPhrasesLookupFunction(
    accentPhrasesJsonPointer,
    outputAudioQueryJson,
  );
  calloc.free(accentPhrasesJsonPointer);
  return result;
}

///
/// 与えられたJSONが`AudioQuery`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下のいずれかの条件を満たすことである。
///
/// - [Rust APIの`AudioQuery`型]としてデシリアライズ不可、もしくはJSONとして不正。
/// - `accent_phrases`の要素のうちいずれかが、 ::voicevox_accent_phrase_validate でエラーになる。
/// - `outputSamplingRate`が`24000`の倍数ではない、もしくは`0` (将来的に解消予定。cf. [#762])。
///
/// [Rust APIの`AudioQuery`型]: ../rust_api/voicevox_core/struct.AudioQuery.html
/// [#762]: https://github.com/VOICEVOX/voicevox_core/issues/762
///
/// 次の状態に対しては警告のログを出す。将来的にはエラーになる予定。
///
/// - `accent_phrases`の要素のうちいずれかが警告が出る状態。
/// - `speedScale`が負。
/// - `volumeScale`が負。
/// - `prePhonemeLength`が負。
/// - `postPhonemeLength`が負。
/// - `outputSamplingRate`が`24000`以外の値（エラーと同様将来的に解消予定）。
///
/// @param [in] audio_query_json `AudioQuery`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_AUDIO_QUERY_ERROR
///
/// \safety{
/// - `audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_query_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_query_validate(const char *audio_query_json)
/// ```
int voicevoxAudioQueryValidate(String? audioQueryJson) {
  final voicevoxAudioQueryValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_audio_query_validate');

  final audioQueryJsonPointer = audioQueryJson != null
      ? audioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxAudioQueryValidateLookupFunction(
    audioQueryJsonPointer,
  );
  calloc.free(audioQueryJsonPointer);
  return result;
}

///
/// 与えられたJSONが`AccentPhrase`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下のいずれかの条件を満たすことである。
///
/// - [Rust APIの`AccentPhrase`型]としてデシリアライズ不可、もしくはJSONとして不正。
/// - `moras`もしくは`pause_mora`の要素のうちいずれかが、 ::voicevox_mora_validate でエラーになる。
/// - `accent`が`0`。
///
/// [Rust APIの`AccentPhrase`型]: ../rust_api/voicevox_core/struct.AccentPhrase.html
///
/// 次の状態に対しては警告のログを出す。将来的にはエラーになる予定。
///
/// - `moras`もしくは`pause_mora`の要素のうちいずれかが、警告が出る状態。
/// - `accent`が`moras`の数を超過している。
///
/// @param [in] accent_phrase_json `AccentPhrase`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_ACCENT_PHRASE_ERROR
///
/// \safety{
/// - `accent_phrase_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_accent_phrase_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_accent_phrase_validate(const char *accent_phrase_json)
/// ```
int voicevoxAccentPhraseValidate(String? accentPhraseJson) {
  final voicevoxAccentPhraseValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_accent_phrase_validate');

  final accentPhraseJsonPointer = accentPhraseJson != null
      ? accentPhraseJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxAccentPhraseValidateLookupFunction(
    accentPhraseJsonPointer,
  );
  calloc.free(accentPhraseJsonPointer);
  return result;
}

///
/// 与えられたJSONが`Mora`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下のいずれかの条件を満たすことである。
///
/// - [Rust APIの`Mora`型]としてデシリアライズ不可、もしくはJSONとして不正。
/// - `consonant`と`consonant_length`の有無が不一致。
/// - `consonant`が子音以外の音素であるか、もしくは音素として不正。
/// - `vowel`が子音であるか、もしくは音素として不正。
///
/// [Rust APIの`Mora`型]: ../rust_api/voicevox_core/struct.Mora.html
///
/// 次の状態に対しては警告のログを出す。将来的にはエラーになる予定。
///
/// - `consonant_length`が負。
/// - `vowel_length`が負。
///
/// @param [in] mora_json `Mora`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_MORA_ERROR
///
/// \safety{
/// - `mora_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_mora_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_mora_validate(const char *mora_json)
/// ```
int voicevoxMoraValidate(String? moraJson) {
  final voicevoxMoraValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_mora_validate');

  final moraJsonPointer = moraJson != null ? moraJson.toNativeUtf8() : nullptr;
  final result = voicevoxMoraValidateLookupFunction(moraJsonPointer);
  calloc.free(moraJsonPointer);
  return result;
}

///
/// 与えられたJSONが`Score`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下のいずれかの条件を満たすことである。
///
/// - [Rust APIの`Score`型]としてデシリアライズ不可、もしくはJSONとして不正。
/// - `notes`の要素のうちいずれかが、 ::voicevox_note_validate でエラーになる。
/// - `notes`が空であるか、もしくは先頭が音符。
///
/// [Rust APIの`Score`型]: ../rust_api/voicevox_core/struct.Score.html
///
/// @param [in] score_json `Score`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_SCORE_ERROR
///
/// \safety{
/// - `score_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_score_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_score_validate(const char *score_json)
/// ```
int voicevoxScoreValidate(String? scoreJson) {
  final voicevoxScoreValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_score_validate');

  final scoreJsonPointer = scoreJson != null
      ? scoreJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxScoreValidateLookupFunction(scoreJsonPointer);
  calloc.free(scoreJsonPointer);
  return result;
}

///
/// 与えられたJSONが`Note`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下のいずれかの条件を満たすことである。
///
/// - [Rust APIの`Note`型]としてデシリアライズ不可、もしくはJSONとして不正。
/// - `key`が`null`かつ`lyric`が`""`以外。
/// - `key`が非`null`かつ`lyric`が`""`。
///
/// [Rust APIの`Note`型]: ../rust_api/voicevox_core/struct.Note.html
///
/// @param [in] note_json `Note`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_NOTE_ERROR
///
/// \safety{
/// - `note_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_note_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_note_validate(const char *note_json)
/// ```
int voicevoxNoteValidate(String? noteJson) {
  final voicevoxNoteValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_note_validate');

  final noteJsonPointer = noteJson != null ? noteJson.toNativeUtf8() : nullptr;
  final result = voicevoxNoteValidateLookupFunction(noteJsonPointer);
  calloc.free(noteJsonPointer);
  return result;
}

///
/// 与えられたJSONが`FrameAudioQuery`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下の条件を満たすことである。
///
/// - [Rust APIの`FrameAudioQuery`型]としてデシリアライズ不可、もしくはJSONとして不正。
///
/// [Rust APIの`FrameAudioQuery`型]: ../rust_api/voicevox_core/struct.FrameAudioQuery.html
///
/// 次の状態に対しては警告のログを出す。将来的にはエラーになる予定。
///
/// - `outputSamplingRate`が`24000`以外の値（将来的に解消予定）。
///
/// @param [in] frame_audio_query_json `FrameAudioQuery`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_FRAME_AUDIO_QUERY_ERROR
///
/// \safety{
/// - `frame_audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_frame_audio_query_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_frame_audio_query_validate(const char *frame_audio_query_json)
/// ```
int voicevoxFrameAudioQueryValidate(String? frameAudioQueryJson) {
  final voicevoxFrameAudioQueryValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_frame_audio_query_validate');

  final frameAudioQueryJsonPointer = frameAudioQueryJson != null
      ? frameAudioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxFrameAudioQueryValidateLookupFunction(
    frameAudioQueryJsonPointer,
  );
  calloc.free(frameAudioQueryJsonPointer);
  return result;
}

///
/// 与えられたJSONが`FramePhoneme`型として不正であるときエラーを返す。
///
/// 不正であるとは、以下の条件を満たすことである。
///
/// - [Rust APIの`FramePhoneme`型]としてデシリアライズ不可、もしくはJSONとして不正。
///
/// [Rust APIの`FramePhoneme`型]: ../rust_api/voicevox_core/struct.FramePhoneme.html
///
/// @param [in] frame_phoneme_json `FramePhoneme`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_FRAME_PHONEME_ERROR
///
/// \safety{
/// - `frame_phoneme_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \no-orig-impl{voicevox_frame_phoneme_validate}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_frame_phoneme_validate(const char *frame_phoneme_json)
/// ```
int voicevoxFramePhonemeValidate(String? framePhonemeJson) {
  final voicevoxFramePhonemeValidateLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)
      >('voicevox_frame_phoneme_validate');

  final framePhonemeJsonPointer = framePhonemeJson != null
      ? framePhonemeJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxFramePhonemeValidateLookupFunction(
    framePhonemeJsonPointer,
  );
  calloc.free(framePhonemeJsonPointer);
  return result;
}

///
/// 与えられた楽譜と歌唱合成用のクエリの組み合わせが、基本周波数と音量の生成に利用できるかどうかを確認する。
///
/// 次のうちどれかを満たすならエラーを返す。
///
/// - `score_json`が ::voicevox_score_validate でエラーになる。
/// - `frame_audio_query_json`が ::voicevox_frame_audio_query_validate でエラーになる。
/// - `notes`が表す音素ID列と、`phonemes`が表す音素ID列が等しくない。ただし異なる音素の表現が同一のIDを表すことがある。
///
/// @param [in] score_json `Score`型のJSON
/// @param [in] frame_audio_query_json `FrameAudioQuery`型のJSON
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_SCORE_ERROR, ::VOICEVOX_RESULT_INVALID_FRAME_AUDIO_QUERY_ERROR, ::VOICEVOX_RESULT_INCOMPATIBLE_QUERIES_ERROR
///
/// \safety{
/// - `score_json`と`frame_audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
/// \orig-impl{voicevox_ensure_compatible}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_ensure_compatible(const char *score_json, const char *frame_audio_query_json)
/// ```
int voicevoxEnsureCompatible(String? scoreJson, String? frameAudioQueryJson) {
  final voicevoxEnsureCompatibleLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>, Pointer<Utf8>),
        int Function(Pointer<Utf8>, Pointer<Utf8>)
      >('voicevox_ensure_compatible');

  final scoreJsonPointer = scoreJson != null
      ? scoreJson.toNativeUtf8()
      : nullptr;
  final frameAudioQueryJsonPointer = frameAudioQueryJson != null
      ? frameAudioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxEnsureCompatibleLookupFunction(
    scoreJsonPointer,
    frameAudioQueryJsonPointer,
  );
  calloc
    ..free(scoreJsonPointer)
    ..free(frameAudioQueryJsonPointer);
  return result;
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
int voicevoxVoiceModelFileOpen(
  String? path,
  Pointer<Pointer<VoicevoxVoiceModelFile>> outModel,
) {
  final voicevoxVoiceModelFileOpenLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<Utf8>, Pointer<Pointer<VoicevoxVoiceModelFile>>),
        int Function(Pointer<Utf8>, Pointer<Pointer<VoicevoxVoiceModelFile>>)
      >('voicevox_voice_model_file_open');

  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = voicevoxVoiceModelFileOpenLookupFunction(
    pathPointer,
    outModel,
  );
  calloc.free(pathPointer);
  return result;
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
void voicevoxVoiceModelFileId(
  Pointer<VoicevoxVoiceModelFile> model,
  Pointer<Uint8> outputVoiceModelId,
) {
  final voicevoxVoiceModelFileIdLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<VoicevoxVoiceModelFile>, Pointer<Uint8>),
        void Function(Pointer<VoicevoxVoiceModelFile>, Pointer<Uint8>)
      >('voicevox_voice_model_file_id');

  voicevoxVoiceModelFileIdLookupFunction(model, outputVoiceModelId);
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
Pointer<Int8> voicevoxVoiceModelFileCreateMetasJson(
  Pointer<VoicevoxVoiceModelFile> model,
) {
  final voicevoxVoiceModelFileCreateMetasJsonLookupFunction = _libCore
      .lookupFunction<
        Pointer<Int8> Function(Pointer<VoicevoxVoiceModelFile>),
        Pointer<Int8> Function(Pointer<VoicevoxVoiceModelFile>)
      >('voicevox_voice_model_file_create_metas_json');

  return voicevoxVoiceModelFileCreateMetasJsonLookupFunction(model);
}

///
/// ::VoicevoxVoiceModelFile を、所有しているファイルディスクリプタを閉じた上で<b>破棄</b>(_destruct_)する。ファイルの削除(_delete_)<b>ではない</b>。
///
/// 破棄対象への他スレッドでのアクセスが存在する場合、それらがすべて終わるのを待ってから破棄する。
///
/// この関数の呼び出し後に破棄し終えた対象にアクセスすると、プロセスを異常終了する。
///
/// @param [in] model 破棄対象。nullable
///
/// \no-orig-impl{voicevox_voice_model_file_delete}
///
/// ```c
/// __declspec(dllimport) void voicevox_voice_model_file_delete(struct VoicevoxVoiceModelFile *model)
/// ```
void voicevoxVoiceModelFileDelete(Pointer<VoicevoxVoiceModelFile> model) {
  final voicevoxVoiceModelFileDeleteLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<VoicevoxVoiceModelFile>),
        void Function(Pointer<VoicevoxVoiceModelFile>)
      >('voicevox_voice_model_file_delete');

  voicevoxVoiceModelFileDeleteLookupFunction(model);
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
int voicevoxSynthesizerNew(
  Pointer<VoicevoxOnnxruntime> onnxruntime,
  Pointer<OpenJtalkRc> openJtalk,
  VoicevoxInitializeOptions options,
  Pointer<Pointer<VoicevoxSynthesizer>> outSynthesizer,
) {
  final voicevoxSynthesizerNewLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxOnnxruntime>,
          Pointer<OpenJtalkRc>,
          VoicevoxInitializeOptions,
          Pointer<Pointer<VoicevoxSynthesizer>>,
        ),
        int Function(
          Pointer<VoicevoxOnnxruntime>,
          Pointer<OpenJtalkRc>,
          VoicevoxInitializeOptions,
          Pointer<Pointer<VoicevoxSynthesizer>>,
        )
      >('voicevox_synthesizer_new');

  return voicevoxSynthesizerNewLookupFunction(
    onnxruntime,
    openJtalk,
    options,
    outSynthesizer,
  );
}

///
/// ::VoicevoxSynthesizer を<b>破棄</b>(_destruct_)する。
///
/// 破棄対象への他スレッドでのアクセスが存在する場合、それらがすべて終わるのを待ってから破棄する。
///
/// この関数の呼び出し後に破棄し終えた対象にアクセスすると、プロセスを異常終了する。
///
/// @param [in] synthesizer 破棄対象。nullable
///
/// \no-orig-impl{voicevox_synthesizer_delete}
///
/// ```c
/// __declspec(dllimport) void voicevox_synthesizer_delete(struct VoicevoxSynthesizer *synthesizer)
/// ```
void voicevoxSynthesizerDelete(Pointer<VoicevoxSynthesizer> synthesizer) {
  final voicevoxSynthesizerDeleteLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<VoicevoxSynthesizer>),
        void Function(Pointer<VoicevoxSynthesizer>)
      >('voicevox_synthesizer_delete');

  voicevoxSynthesizerDeleteLookupFunction(synthesizer);
}

///
/// 音声モデルを読み込む。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] model 音声モデル
///
/// @returns 結果コード
///
/// \orig-impl{voicevox_synthesizer_load_voice_model}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_load_voice_model(const struct VoicevoxSynthesizer *synthesizer, const struct VoicevoxVoiceModelFile *model)
/// ```
int voicevoxSynthesizerLoadVoiceModel(
  Pointer<VoicevoxSynthesizer> synthesizer,
  Pointer<VoicevoxVoiceModelFile> model,
) {
  final voicevoxSynthesizerLoadVoiceModelLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<VoicevoxVoiceModelFile>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<VoicevoxVoiceModelFile>,
        )
      >('voicevox_synthesizer_load_voice_model');

  return voicevoxSynthesizerLoadVoiceModelLookupFunction(synthesizer, model);
}

///
/// 音声モデルの読み込みを解除する。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] model_id 音声モデルID
///
/// @returns 結果コード
///
/// \safety{
/// - `model_id`は<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_unload_voice_model}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_unload_voice_model(const struct VoicevoxSynthesizer *synthesizer, VoicevoxVoiceModelId model_id)
/// ```
int voicevoxSynthesizerUnloadVoiceModel(
  Pointer<VoicevoxSynthesizer> synthesizer,
  Pointer<Uint8> modelId,
) {
  final voicevoxSynthesizerUnloadVoiceModelLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxSynthesizer>, Pointer<Uint8>),
        int Function(Pointer<VoicevoxSynthesizer>, Pointer<Uint8>)
      >('voicevox_synthesizer_unload_voice_model');

  return voicevoxSynthesizerUnloadVoiceModelLookupFunction(
    synthesizer,
    modelId,
  );
}

///
/// ::VoicevoxOnnxruntime のインスタンスを得る。
///
/// @param [in] synthesizer 音声シンセサイザ
///
/// @returns ::VoicevoxOnnxruntime のインスタンス
///
/// \orig-impl{voicevox_synthesizer_get_onnxruntime}
///
/// ```c
/// __declspec(dllimport) const struct VoicevoxOnnxruntime *voicevox_synthesizer_get_onnxruntime(const struct VoicevoxSynthesizer *synthesizer)
/// ```
Pointer<VoicevoxOnnxruntime> voicevoxSynthesizerGetOnnxruntime(
  Pointer<VoicevoxSynthesizer> synthesizer,
) {
  final voicevoxSynthesizerGetOnnxruntimeLookupFunction = _libCore
      .lookupFunction<
        Pointer<VoicevoxOnnxruntime> Function(Pointer<VoicevoxSynthesizer>),
        Pointer<VoicevoxOnnxruntime> Function(Pointer<VoicevoxSynthesizer>)
      >('voicevox_synthesizer_get_onnxruntime');

  return voicevoxSynthesizerGetOnnxruntimeLookupFunction(synthesizer);
}

///
/// ハードウェアアクセラレーションがGPUモードか判定する。
///
/// @param [in] synthesizer 音声シンセサイザ
///
/// @returns GPUモードかどうか
///
/// \orig-impl{voicevox_synthesizer_is_gpu_mode}
///
/// ```c
/// __declspec(dllimport) bool voicevox_synthesizer_is_gpu_mode(const struct VoicevoxSynthesizer *synthesizer)
/// ```
bool voicevoxSynthesizerIsGpuMode(Pointer<VoicevoxSynthesizer> synthesizer) {
  final voicevoxSynthesizerIsGpuModeLookupFunction = _libCore
      .lookupFunction<
        Bool Function(Pointer<VoicevoxSynthesizer>),
        bool Function(Pointer<VoicevoxSynthesizer>)
      >('voicevox_synthesizer_is_gpu_mode');

  return voicevoxSynthesizerIsGpuModeLookupFunction(synthesizer);
}

///
/// 指定したIDの音声モデルが読み込まれているか判定する。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] model_id 音声モデルID
///
/// @returns モデルが読み込まれているかどうか
///
/// \safety{
/// - `model_id`は<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_is_loaded_voice_model}
///
/// ```c
/// __declspec(dllimport) bool voicevox_synthesizer_is_loaded_voice_model(const struct VoicevoxSynthesizer *synthesizer, VoicevoxVoiceModelId model_id)
/// ```
bool voicevoxSynthesizerIsLoadedVoiceModel(
  Pointer<VoicevoxSynthesizer> synthesizer,
  Pointer<Uint8> modelId,
) {
  final voicevoxSynthesizerIsLoadedVoiceModelLookupFunction = _libCore
      .lookupFunction<
        Bool Function(Pointer<VoicevoxSynthesizer>, Pointer<Uint8>),
        bool Function(Pointer<VoicevoxSynthesizer>, Pointer<Uint8>)
      >('voicevox_synthesizer_is_loaded_voice_model');

  return voicevoxSynthesizerIsLoadedVoiceModelLookupFunction(
    synthesizer,
    modelId,
  );
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
Pointer<Int8> voicevoxSynthesizerCreateMetasJson(
  Pointer<VoicevoxSynthesizer> synthesizer,
) {
  final voicevoxSynthesizerCreateMetasJsonLookupFunction = _libCore
      .lookupFunction<
        Pointer<Int8> Function(Pointer<VoicevoxSynthesizer>),
        Pointer<Int8> Function(Pointer<VoicevoxSynthesizer>)
      >('voicevox_synthesizer_create_metas_json');

  return voicevoxSynthesizerCreateMetasJsonLookupFunction(synthesizer);
}

///
/// ONNX Runtimeとして利用可能なデバイスの情報を、JSONで取得する。
///
/// JSONの解放は ::voicevox_json_free で行う。
///
/// あくまでONNX Runtimeが対応しているデバイスの情報であることに注意。GPUが使える環境ではなかったとしても`cuda`や`dml`は`true`を示しうる。
///
/// @param [in] onnxruntime
/// @param [out] output_supported_devices_json サポートデバイス情報のJSON文字列
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// char *supported_devices;
/// VoicevoxResultCode result = voicevox_onnxruntime_create_supported_devices_json(onnxruntime, &supported_devices);
/// ```
/// }
///
/// \safety{
/// - `onnxruntime`は ::voicevox_onnxruntime_load_once または ::voicevox_onnxruntime_init_once で得たものでなければならない。
/// - `output_supported_devices_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_onnxruntime_create_supported_devices_json}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_onnxruntime_create_supported_devices_json(const struct VoicevoxOnnxruntime *onnxruntime, char **output_supported_devices_json)
/// ```
int voicevoxOnnxruntimeCreateSupportedDevicesJson(
  Pointer<VoicevoxOnnxruntime> onnxruntime,
  Pointer<Pointer<Int8>> outputSupportedDevicesJson,
) {
  final voicevoxOnnxruntimeCreateSupportedDevicesJsonLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxOnnxruntime>, Pointer<Pointer<Int8>>),
        int Function(Pointer<VoicevoxOnnxruntime>, Pointer<Pointer<Int8>>)
      >('voicevox_onnxruntime_create_supported_devices_json');

  return voicevoxOnnxruntimeCreateSupportedDevicesJsonLookupFunction(
    onnxruntime,
    outputSupportedDevicesJson,
  );
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
int voicevoxSynthesizerCreateAudioQueryFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? kana,
  int styleId,
  Pointer<Pointer<Int8>> outputAudioQueryJson,
) {
  final voicevoxSynthesizerCreateAudioQueryFromKanaLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_audio_query_from_kana');

  final kanaPointer = kana != null ? kana.toNativeUtf8() : nullptr;
  final result = voicevoxSynthesizerCreateAudioQueryFromKanaLookupFunction(
    synthesizer,
    kanaPointer,
    styleId,
    outputAudioQueryJson,
  );
  calloc.free(kanaPointer);
  return result;
}

///
/// 日本語テキストから、AudioQueryをJSONとして生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_json_free を使う。
///
/// ::voicevox_synthesizer_create_accent_phrases と ::voicevox_audio_query_create_from_accent_phrases
/// が一体になったショートハンド。詳細は[テキスト音声合成の流れ]を参照。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] text UTF-8の日本語テキスト
/// @param [in] style_id スタイルID
/// @param [out] output_audio_query_json 生成先
///
/// @returns 結果コード
///
/// \example{
/// ```c
/// char *audio_query;
/// voicevox_synthesizer_create_audio_query(synthesizer, "こんにちは",
/// 2, // "四国めたん (ノーマル)"
/// &audio_query);
/// ```
/// }
///
/// \safety{
/// - `text`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_audio_query_json`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_audio_query}
///
/// [テキスト音声合成の流れ]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/tts-process.md
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_audio_query(const struct VoicevoxSynthesizer *synthesizer, const char *text, VoicevoxStyleId style_id, char **output_audio_query_json)
/// ```
int voicevoxSynthesizerCreateAudioQuery(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? text,
  int styleId,
  Pointer<Pointer<Int8>> outputAudioQueryJson,
) {
  final voicevoxSynthesizerCreateAudioQueryLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_audio_query');

  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = voicevoxSynthesizerCreateAudioQueryLookupFunction(
    synthesizer,
    textPointer,
    styleId,
    outputAudioQueryJson,
  );
  calloc.free(textPointer);
  return result;
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
int voicevoxSynthesizerCreateAccentPhrasesFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? kana,
  int styleId,
  Pointer<Pointer<Int8>> outputAccentPhrasesJson,
) {
  final voicevoxSynthesizerCreateAccentPhrasesFromKanaLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_accent_phrases_from_kana');

  final kanaPointer = kana != null ? kana.toNativeUtf8() : nullptr;
  final result = voicevoxSynthesizerCreateAccentPhrasesFromKanaLookupFunction(
    synthesizer,
    kanaPointer,
    styleId,
    outputAccentPhrasesJson,
  );
  calloc.free(kanaPointer);
  return result;
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
int voicevoxSynthesizerCreateAccentPhrases(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? text,
  int styleId,
  Pointer<Pointer<Int8>> outputAccentPhrasesJson,
) {
  final voicevoxSynthesizerCreateAccentPhrasesLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_accent_phrases');

  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = voicevoxSynthesizerCreateAccentPhrasesLookupFunction(
    synthesizer,
    textPointer,
    styleId,
    outputAccentPhrasesJson,
  );
  calloc.free(textPointer);
  return result;
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
int voicevoxSynthesizerReplaceMoraData(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? accentPhrasesJson,
  int styleId,
  Pointer<Pointer<Int8>> outputAccentPhrasesJson,
) {
  final voicevoxSynthesizerReplaceMoraDataLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_replace_mora_data');

  final accentPhrasesJsonPointer = accentPhrasesJson != null
      ? accentPhrasesJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerReplaceMoraDataLookupFunction(
    synthesizer,
    accentPhrasesJsonPointer,
    styleId,
    outputAccentPhrasesJson,
  );
  calloc.free(accentPhrasesJsonPointer);
  return result;
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
int voicevoxSynthesizerReplacePhonemeLength(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? accentPhrasesJson,
  int styleId,
  Pointer<Pointer<Int8>> outputAccentPhrasesJson,
) {
  final voicevoxSynthesizerReplacePhonemeLengthLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_replace_phoneme_length');

  final accentPhrasesJsonPointer = accentPhrasesJson != null
      ? accentPhrasesJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerReplacePhonemeLengthLookupFunction(
    synthesizer,
    accentPhrasesJsonPointer,
    styleId,
    outputAccentPhrasesJson,
  );
  calloc.free(accentPhrasesJsonPointer);
  return result;
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
int voicevoxSynthesizerReplaceMoraPitch(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? accentPhrasesJson,
  int styleId,
  Pointer<Pointer<Int8>> outputAccentPhrasesJson,
) {
  final voicevoxSynthesizerReplaceMoraPitchLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_replace_mora_pitch');

  final accentPhrasesJsonPointer = accentPhrasesJson != null
      ? accentPhrasesJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerReplaceMoraPitchLookupFunction(
    synthesizer,
    accentPhrasesJsonPointer,
    styleId,
    outputAccentPhrasesJson,
  );
  calloc.free(accentPhrasesJsonPointer);
  return result;
}

///
/// デフォルトの `voicevox_synthesizer_synthesis` のオプションを生成する
/// @return デフォルト値が設定された `voicevox_synthesizer_synthesis` のオプション
///
/// \no-orig-impl{voicevox_make_default_synthesis_options}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxSynthesisOptions voicevox_make_default_synthesis_options(void)
/// ```
VoicevoxSynthesisOptions voicevoxMakeDefaultSynthesisOptions() {
  final voicevoxMakeDefaultSynthesisOptionsLookupFunction = _libCore
      .lookupFunction<
        VoicevoxSynthesisOptions Function(),
        VoicevoxSynthesisOptions Function()
      >('voicevox_make_default_synthesis_options');

  return voicevoxMakeDefaultSynthesisOptionsLookupFunction();
}

///
/// AudioQueryから音声合成を行う。
///
/// 生成したWAVデータを解放するには ::voicevox_wav_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] audio_query_json AudioQueryのJSON文字列
/// @param [in] style_id スタイルID
/// @param [in] options オプション
/// @param [out] output_wav_length 出力のバイト長
/// @param [out] output_wav 出力先
///
/// @returns 結果コード
///
/// \safety{
/// - `audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_wav_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// - `output_wav`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_synthesis}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_synthesis(const struct VoicevoxSynthesizer *synthesizer, const char *audio_query_json, VoicevoxStyleId style_id, struct VoicevoxSynthesisOptions options, uintptr_t *output_wav_length, uint8_t **output_wav)
/// ```
int voicevoxSynthesizerSynthesis(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? audioQueryJson,
  int styleId,
  VoicevoxSynthesisOptions options,
  Pointer<UintPtr> outputWavLength,
  Pointer<Pointer<Uint8>> outputWav,
) {
  final voicevoxSynthesizerSynthesisLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          VoicevoxSynthesisOptions,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          VoicevoxSynthesisOptions,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        )
      >('voicevox_synthesizer_synthesis');

  final audioQueryJsonPointer = audioQueryJson != null
      ? audioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerSynthesisLookupFunction(
    synthesizer,
    audioQueryJsonPointer,
    styleId,
    options,
    outputWavLength,
    outputWav,
  );
  calloc.free(audioQueryJsonPointer);
  return result;
}

///
/// デフォルトのテキスト音声合成オプションを生成する
/// @return テキスト音声合成オプション
///
/// \no-orig-impl{voicevox_make_default_tts_options}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxTtsOptions voicevox_make_default_tts_options(void)
/// ```
VoicevoxTtsOptions voicevoxMakeDefaultTtsOptions() {
  final voicevoxMakeDefaultTtsOptionsLookupFunction = _libCore
      .lookupFunction<
        VoicevoxTtsOptions Function(),
        VoicevoxTtsOptions Function()
      >('voicevox_make_default_tts_options');

  return voicevoxMakeDefaultTtsOptionsLookupFunction();
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
int voicevoxSynthesizerTtsFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? kana,
  int styleId,
  VoicevoxTtsOptions options,
  Pointer<UintPtr> outputWavLength,
  Pointer<Pointer<Uint8>> outputWav,
) {
  final voicevoxSynthesizerTtsFromKanaLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          VoicevoxTtsOptions,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          VoicevoxTtsOptions,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        )
      >('voicevox_synthesizer_tts_from_kana');

  final kanaPointer = kana != null ? kana.toNativeUtf8() : nullptr;
  final result = voicevoxSynthesizerTtsFromKanaLookupFunction(
    synthesizer,
    kanaPointer,
    styleId,
    options,
    outputWavLength,
    outputWav,
  );
  calloc.free(kanaPointer);
  return result;
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
int voicevoxSynthesizerTts(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? text,
  int styleId,
  VoicevoxTtsOptions options,
  Pointer<UintPtr> outputWavLength,
  Pointer<Pointer<Uint8>> outputWav,
) {
  final voicevoxSynthesizerTtsLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          VoicevoxTtsOptions,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          VoicevoxTtsOptions,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        )
      >('voicevox_synthesizer_tts');

  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = voicevoxSynthesizerTtsLookupFunction(
    synthesizer,
    textPointer,
    styleId,
    options,
    outputWavLength,
    outputWav,
  );
  calloc.free(textPointer);
  return result;
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
int voicevoxSynthesizerCreateSingFrameAudioQuery(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? scoreJson,
  int styleId,
  Pointer<Pointer<Int8>> outputFrameAudioQueryJson,
) {
  final voicevoxSynthesizerCreateSingFrameAudioQueryLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_sing_frame_audio_query');

  final scoreJsonPointer = scoreJson != null
      ? scoreJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerCreateSingFrameAudioQueryLookupFunction(
    synthesizer,
    scoreJsonPointer,
    styleId,
    outputFrameAudioQueryJson,
  );
  calloc.free(scoreJsonPointer);
  return result;
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
int voicevoxSynthesizerCreateSingFrameF0(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? scoreJson,
  String? frameAudioQueryJson,
  int styleId,
  Pointer<Pointer<Int8>> outputF0Json,
) {
  final voicevoxSynthesizerCreateSingFrameF0LookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_sing_frame_f0');

  final scoreJsonPointer = scoreJson != null
      ? scoreJson.toNativeUtf8()
      : nullptr;
  final frameAudioQueryJsonPointer = frameAudioQueryJson != null
      ? frameAudioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerCreateSingFrameF0LookupFunction(
    synthesizer,
    scoreJsonPointer,
    frameAudioQueryJsonPointer,
    styleId,
    outputF0Json,
  );
  calloc
    ..free(scoreJsonPointer)
    ..free(frameAudioQueryJsonPointer);
  return result;
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
int voicevoxSynthesizerCreateSingFrameVolume(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? scoreJson,
  String? frameAudioQueryJson,
  int styleId,
  Pointer<Pointer<Int8>> outputVolumeJson,
) {
  final voicevoxSynthesizerCreateSingFrameVolumeLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          Uint32,
          Pointer<Pointer<Int8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Pointer<Utf8>,
          int,
          Pointer<Pointer<Int8>>,
        )
      >('voicevox_synthesizer_create_sing_frame_volume');

  final scoreJsonPointer = scoreJson != null
      ? scoreJson.toNativeUtf8()
      : nullptr;
  final frameAudioQueryJsonPointer = frameAudioQueryJson != null
      ? frameAudioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerCreateSingFrameVolumeLookupFunction(
    synthesizer,
    scoreJsonPointer,
    frameAudioQueryJsonPointer,
    styleId,
    outputVolumeJson,
  );
  calloc
    ..free(scoreJsonPointer)
    ..free(frameAudioQueryJsonPointer);
  return result;
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
int voicevoxSynthesizerFrameSynthesis(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String? frameAudioQueryJson,
  int styleId,
  Pointer<UintPtr> outputWavLength,
  Pointer<Pointer<Uint8>> outputWav,
) {
  final voicevoxSynthesizerFrameSynthesisLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          Uint32,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        ),
        int Function(
          Pointer<VoicevoxSynthesizer>,
          Pointer<Utf8>,
          int,
          Pointer<UintPtr>,
          Pointer<Pointer<Uint8>>,
        )
      >('voicevox_synthesizer_frame_synthesis');

  final frameAudioQueryJsonPointer = frameAudioQueryJson != null
      ? frameAudioQueryJson.toNativeUtf8()
      : nullptr;
  final result = voicevoxSynthesizerFrameSynthesisLookupFunction(
    synthesizer,
    frameAudioQueryJsonPointer,
    styleId,
    outputWavLength,
    outputWav,
  );
  calloc.free(frameAudioQueryJsonPointer);
  return result;
}

///
/// JSON文字列を解放する。
///
/// @param [in] json 解放するJSON文字列。nullable
///
/// \safety{
/// - `json`がヌルポインタでないならば、以下のAPIで得られたポインタでなくてはいけない。
/// - ::voicevox_audio_query_create_from_accent_phrases
/// - ::voicevox_onnxruntime_create_supported_devices_json
/// - ::voicevox_voice_model_file_create_metas_json
/// - ::voicevox_open_jtalk_rc_analyze
/// - ::voicevox_synthesizer_create_metas_json
/// - ::voicevox_synthesizer_create_audio_query
/// - ::voicevox_synthesizer_create_audio_query_from_kana
/// - ::voicevox_synthesizer_create_accent_phrases
/// - ::voicevox_synthesizer_create_accent_phrases_from_kana
/// - ::voicevox_synthesizer_replace_mora_data
/// - ::voicevox_synthesizer_replace_phoneme_length
/// - ::voicevox_synthesizer_replace_mora_pitch
/// - ::voicevox_synthesizer_create_sing_frame_audio_query
/// - ::voicevox_synthesizer_create_sing_frame_f0
/// - ::voicevox_synthesizer_create_sing_frame_volume
/// - ::voicevox_user_dict_to_json
/// - 文字列の長さは生成時より変更されていてはならない。
/// - `json`がヌルポインタでないならば、<a href="#voicevox-core-safety">読み込みと書き込みについて有効</a>でなければならない。
/// - `json`がヌルポインタでないならば、以後<b>ダングリングポインタ</b>(_dangling pointer_)として扱われなくてはならない。
/// }
///
/// \no-orig-impl{voicevox_json_free}
///
/// ```c
/// __declspec(dllimport) void voicevox_json_free(char *json)
/// ```
void voicevoxJsonFree(Pointer<Int8> json) {
  final voicevoxJsonFreeLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<Int8>),
        void Function(Pointer<Int8>)
      >('voicevox_json_free');

  voicevoxJsonFreeLookupFunction(json);
}

///
/// WAVデータを解放する。
///
/// @param [in] wav 解放するWAVデータ。nullable
///
/// \safety{
/// - `wav`がヌルポインタでないならば、以下のAPIで得られたポインタでなくてはいけない。
/// - ::voicevox_synthesizer_synthesis
/// - ::voicevox_synthesizer_tts
/// - ::voicevox_synthesizer_tts_from_kana
/// - ::voicevox_synthesizer_frame_synthesis
/// - `wav`がヌルポインタでないならば、<a href="#voicevox-core-safety">読み込みと書き込みについて有効</a>でなければならない。
/// - `wav`がヌルポインタでないならば、以後<b>ダングリングポインタ</b>(_dangling pointer_)として扱われなくてはならない。
/// }
///
/// \no-orig-impl{voicevox_wav_free}
///
/// ```c
/// __declspec(dllimport) void voicevox_wav_free(uint8_t *wav)
/// ```
void voicevoxWavFree(Pointer<Uint8> wav) {
  final voicevoxWavFreeLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<Uint8>),
        void Function(Pointer<Uint8>)
      >('voicevox_wav_free');

  voicevoxWavFreeLookupFunction(wav);
}

///
/// 結果コードに対応したメッセージ文字列を取得する。
///
/// @param [in] result_code 結果コード
///
/// @returns 結果コードに対応したメッセージ文字列
///
/// \examples{
/// ```c
/// const char *actual = voicevox_error_result_to_message(VOICEVOX_RESULT_OK);
/// const char *EXPECTED = "エラーが発生しませんでした";
/// assert(strcmp(actual, EXPECTED) == 0);
/// ```
///
/// ```c
/// const char *actual =
/// voicevox_error_result_to_message(VOICEVOX_RESULT_LOAD_MODEL_ERROR);
/// const char *EXPECTED = "modelデータ読み込みに失敗しました";
/// assert(strcmp(actual, EXPECTED) == 0);
/// ```
/// }
///
/// \no-orig-impl{voicevox_error_result_to_message}
///
/// ```c
/// __declspec(dllimport) const char *voicevox_error_result_to_message(VoicevoxResultCode result_code)
/// ```
String? voicevoxErrorResultToMessage(int resultCode) {
  final voicevoxErrorResultToMessageLookupFunction = _libCore
      .lookupFunction<
        Pointer<Utf8> Function(Int32),
        Pointer<Utf8> Function(int)
      >('voicevox_error_result_to_message');

  return voicevoxErrorResultToMessageLookupFunction(resultCode).toDartString();
}

///
/// ::VoicevoxUserDictWord を最低限のパラメータで作成する。
///
/// @param [in] surface 表記
/// @param [in] pronunciation 読み
/// @param [in] accent_type アクセント型
/// @returns ::VoicevoxUserDictWord
///
/// \orig-impl{voicevox_user_dict_word_make}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxUserDictWord voicevox_user_dict_word_make(const char *surface, const char *pronunciation, uintptr_t accent_type)
/// ```
VoicevoxUserDictWord voicevoxUserDictWordMake(
  String? surface,
  String? pronunciation,
  int accentType,
) {
  final voicevoxUserDictWordMakeLookupFunction = _libCore
      .lookupFunction<
        VoicevoxUserDictWord Function(Pointer<Utf8>, Pointer<Utf8>, UintPtr),
        VoicevoxUserDictWord Function(Pointer<Utf8>, Pointer<Utf8>, int)
      >('voicevox_user_dict_word_make');

  final surfacePointer = surface != null ? surface.toNativeUtf8() : nullptr;
  final pronunciationPointer = pronunciation != null
      ? pronunciation.toNativeUtf8()
      : nullptr;
  final result = voicevoxUserDictWordMakeLookupFunction(
    surfacePointer,
    pronunciationPointer,
    accentType,
  );
  calloc
    ..free(surfacePointer)
    ..free(pronunciationPointer);
  return result;
}

///
/// ユーザー辞書をb>構築</b>(_construct_)する。
///
/// @returns ::VoicevoxUserDict
///
/// \orig-impl{voicevox_user_dict_new}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxUserDict *voicevox_user_dict_new(void)
/// ```
Pointer<VoicevoxUserDict> voicevoxUserDictNew() {
  final voicevoxUserDictNewLookupFunction = _libCore
      .lookupFunction<
        Pointer<VoicevoxUserDict> Function(),
        Pointer<VoicevoxUserDict> Function()
      >('voicevox_user_dict_new');

  return voicevoxUserDictNewLookupFunction();
}

///
/// ユーザー辞書にファイルを読み込ませる。
///
/// @param [in] user_dict ユーザー辞書
/// @param [in] dict_path 読み込む辞書ファイルのパス
/// @returns 結果コード
///
/// \safety{
/// - `dict_path`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_user_dict_load}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_load(const struct VoicevoxUserDict *user_dict, const char *dict_path)
/// ```
int voicevoxUserDictLoad(Pointer<VoicevoxUserDict> userDict, String? dictPath) {
  final voicevoxUserDictLoadLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxUserDict>, Pointer<Utf8>),
        int Function(Pointer<VoicevoxUserDict>, Pointer<Utf8>)
      >('voicevox_user_dict_load');

  final dictPathPointer = dictPath != null ? dictPath.toNativeUtf8() : nullptr;
  final result = voicevoxUserDictLoadLookupFunction(userDict, dictPathPointer);
  calloc.free(dictPathPointer);
  return result;
}

///
/// ユーザー辞書に単語を追加する。
///
/// @param [in] ユーザー辞書
/// @param [in] word 追加する単語
/// @param [out] output_word_uuid 追加した単語のUUID
/// @returns 結果コード
///
/// # Safety
/// @param user_dict は有効な :VoicevoxUserDict のポインタであること
///
/// \safety{
/// - `word->surface`と`word->pronunciation`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_word_uuid`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_user_dict_add_word}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_add_word(const struct VoicevoxUserDict *user_dict, const struct VoicevoxUserDictWord *word, uint8_t (*output_word_uuid)[16])
/// ```
int voicevoxUserDictAddWord(
  Pointer<VoicevoxUserDict> userDict,
  Pointer<VoicevoxUserDictWord> word,
  Pointer<Uint8> outputWordUuid,
) {
  final voicevoxUserDictAddWordLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxUserDict>,
          Pointer<VoicevoxUserDictWord>,
          Pointer<Uint8>,
        ),
        int Function(
          Pointer<VoicevoxUserDict>,
          Pointer<VoicevoxUserDictWord>,
          Pointer<Uint8>,
        )
      >('voicevox_user_dict_add_word');

  return voicevoxUserDictAddWordLookupFunction(userDict, word, outputWordUuid);
}

///
/// ユーザー辞書の単語を更新する。
///
/// @param [in] user_dict ユーザー辞書
/// @param [in] word_uuid 更新する単語のUUID
/// @param [in] word 新しい単語のデータ
/// @returns 結果コード
///
/// \safety{
/// - `word_uuid`は<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `word->surface`と`word->pronunciation`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_user_dict_update_word}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_update_word(const struct VoicevoxUserDict *user_dict, const uint8_t (*word_uuid)[16], const struct VoicevoxUserDictWord *word)
/// ```
int voicevoxUserDictUpdateWord(
  Pointer<VoicevoxUserDict> userDict,
  Pointer<Uint8> wordUuid,
  Pointer<VoicevoxUserDictWord> word,
) {
  final voicevoxUserDictUpdateWordLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(
          Pointer<VoicevoxUserDict>,
          Pointer<Uint8>,
          Pointer<VoicevoxUserDictWord>,
        ),
        int Function(
          Pointer<VoicevoxUserDict>,
          Pointer<Uint8>,
          Pointer<VoicevoxUserDictWord>,
        )
      >('voicevox_user_dict_update_word');

  return voicevoxUserDictUpdateWordLookupFunction(userDict, wordUuid, word);
}

///
/// ユーザー辞書から単語を削除する。
///
/// @param [in] user_dict ユーザー辞書
/// @param [in] word_uuid 削除する単語のUUID
/// @returns 結果コード
///
/// \safety{
/// - `word_uuid`は<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_user_dict_remove_word}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_remove_word(const struct VoicevoxUserDict *user_dict, const uint8_t (*word_uuid)[16])
/// ```
int voicevoxUserDictRemoveWord(
  Pointer<VoicevoxUserDict> userDict,
  Pointer<Uint8> wordUuid,
) {
  final voicevoxUserDictRemoveWordLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxUserDict>, Pointer<Uint8>),
        int Function(Pointer<VoicevoxUserDict>, Pointer<Uint8>)
      >('voicevox_user_dict_remove_word');

  return voicevoxUserDictRemoveWordLookupFunction(userDict, wordUuid);
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
int voicevoxUserDictToJson(
  Pointer<VoicevoxUserDict> userDict,
  Pointer<Pointer<Int8>> outputJson,
) {
  final voicevoxUserDictToJsonLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxUserDict>, Pointer<Pointer<Int8>>),
        int Function(Pointer<VoicevoxUserDict>, Pointer<Pointer<Int8>>)
      >('voicevox_user_dict_to_json');

  return voicevoxUserDictToJsonLookupFunction(userDict, outputJson);
}

///
/// 他のユーザー辞書をインポートする。
///
/// @param [in] user_dict ユーザー辞書
/// @param [in] other_dict インポートするユーザー辞書
/// @returns 結果コード
///
/// \orig-impl{voicevox_user_dict_import}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_import(const struct VoicevoxUserDict *user_dict, const struct VoicevoxUserDict *other_dict)
/// ```
int voicevoxUserDictImport(
  Pointer<VoicevoxUserDict> userDict,
  Pointer<VoicevoxUserDict> otherDict,
) {
  final voicevoxUserDictImportLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxUserDict>, Pointer<VoicevoxUserDict>),
        int Function(Pointer<VoicevoxUserDict>, Pointer<VoicevoxUserDict>)
      >('voicevox_user_dict_import');

  return voicevoxUserDictImportLookupFunction(userDict, otherDict);
}

///
/// ユーザー辞書をファイルに保存する。
///
/// @param [in] user_dict ユーザー辞書
/// @param [in] path 保存先のファイルパス
///
/// \safety{
/// - `path`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_user_dict_save}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_user_dict_save(const struct VoicevoxUserDict *user_dict, const char *path)
/// ```
int voicevoxUserDictSave(Pointer<VoicevoxUserDict> userDict, String? path) {
  final voicevoxUserDictSaveLookupFunction = _libCore
      .lookupFunction<
        Int32 Function(Pointer<VoicevoxUserDict>, Pointer<Utf8>),
        int Function(Pointer<VoicevoxUserDict>, Pointer<Utf8>)
      >('voicevox_user_dict_save');

  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = voicevoxUserDictSaveLookupFunction(userDict, pathPointer);
  calloc.free(pathPointer);
  return result;
}

///
/// ユーザー辞書を<b>破棄</b>(_destruct_)する。
///
/// 破棄対象への他スレッドでのアクセスが存在する場合、それらがすべて終わるのを待ってから破棄する。
///
/// この関数の呼び出し後に破棄し終えた対象にアクセスすると、プロセスを異常終了する。
///
/// @param [in] user_dict 破棄対象。nullable
///
/// \no-orig-impl{voicevox_user_dict_delete}
///
/// ```c
/// __declspec(dllimport) void voicevox_user_dict_delete(struct VoicevoxUserDict *user_dict)
/// ```
void voicevoxUserDictDelete(Pointer<VoicevoxUserDict> userDict) {
  final voicevoxUserDictDeleteLookupFunction = _libCore
      .lookupFunction<
        Void Function(Pointer<VoicevoxUserDict>),
        void Function(Pointer<VoicevoxUserDict>)
      >('voicevox_user_dict_delete');

  voicevoxUserDictDeleteLookupFunction(userDict);
}
