// ignore_for_file: comment_references

part of '../core.dart';

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
VoicevoxxLoadOnnxruntimeOptions voicevoxxMakeDefaultLoadOnnxruntimeOptions() =>
    VoicevoxxLoadOnnxruntimeOptions.fromEntity(
      voicevoxMakeDefaultLoadOnnxruntimeOptions(),
    );

///
/// ONNX Runtimeをロードして初期化する。
///
/// 対象のONNX Runtimeのマイナーバージョンは ::voicevox_get_onnxruntime_lib_min_required_minor_version 以上でなければならない。 ::voicevox_get_onnxruntime_lib_max_supported_minor_version よりも大きい場合は警告を出す。
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
voicevoxxOnnxruntimeLoadOnce({VoicevoxxLoadOnnxruntimeOptions? options}) {
  var options0 = options;
  if (options0 == null) {
    final onnxruntimeFilename = dylib.VoicevoxCoreDynamicLibraryService().get(
      'onnxruntime',
    );
    if (onnxruntimeFilename != null) {
      options0 = VoicevoxxLoadOnnxruntimeOptions(filename: onnxruntimeFilename);
    }
  }
  options0 ??= voicevoxxMakeDefaultLoadOnnxruntimeOptions();
  Pointer<VoicevoxOnnxruntime> onnxruntime = nullptr;
  final optionsPointer = options0.calloc();
  final onnxruntimePointer = ffi.calloc<Pointer<VoicevoxOnnxruntime>>();
  final result = voicevoxOnnxruntimeLoadOnce(
    optionsPointer.ref,
    onnxruntimePointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    onnxruntime = onnxruntimePointer.value;
  }
  ffi.calloc.free(onnxruntimePointer);
  optionsPointer.callocAllFree();
  return (result: result, onnxruntime: onnxruntime);
}

///
/// ONNX Runtimeを初期化する。
///
/// リンクされているONNX Runtimeのマイナーバージョンが ::voicevox_get_onnxruntime_lib_min_required_minor_version よりも小さい場合失敗する。 ::voicevox_get_onnxruntime_lib_max_supported_minor_version よりも大きい場合は警告を出す。
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
  final onnxruntimePointer = ffi.calloc<Pointer<VoicevoxOnnxruntime>>();
  final result = voicevoxOnnxruntimeInitOnce(onnxruntimePointer);
  if (result == VOICEVOX_RESULT_OK) {
    onnxruntime = onnxruntimePointer.value;
  }
  ffi.calloc.free(onnxruntimePointer);
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
  final openJtalkPointer = ffi.calloc<Pointer<OpenJtalkRc>>();
  final result = voicevoxOpenJtalkRcNew(openJtalkDicDir, openJtalkPointer);
  if (result == VOICEVOX_RESULT_OK) {
    openJtalk = openJtalkPointer.value;
  }
  ffi.calloc.free(openJtalkPointer);
  return (result: result, openJtalk: openJtalk);
}

///
/// 日本語のテキストを解析する。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final accentPhrasesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxOpenJtalkRcAnalyze(
    openJtalk,
    text,
    accentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    accentPhrasesJson = accentPhrasesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(accentPhrasesJsonPointer.value);
  }
  ffi.calloc.free(accentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: accentPhrasesJson);
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
VoicevoxxInitializeOptions voicevoxxMakeDefaultInitializeOptions() =>
    VoicevoxxInitializeOptions.fromEntity(
      voicevoxMakeDefaultInitializeOptions(),
    );

///
/// AccentPhraseの配列からAudioQueryを作る。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final autioQueryJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxAudioQueryCreateFromAccentPhrases(
    accentPhrasesJson,
    autioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    audioQueryJson = autioQueryJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(autioQueryJsonPointer.value);
  }
  ffi.calloc.free(autioQueryJsonPointer);
  return (audioQueryJson: audioQueryJson, result: result);
}

///
/// デフォルトの `voicevox_audio_query_frame_length` のオプションを生成する。
///
/// @return デフォルト値が設定された `voicevox_audio_query_frame_length` のオプション
///
/// \no-orig-impl{voicevox_make_default_audio_query_frame_length_options}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxAudioQueryFrameLengthOptions voicevox_make_default_audio_query_frame_length_options(void)
/// ```
VoicevoxxAudioQueryFrameLengthOptions
voicevoxxMakeDefaultAudioQueryFrameLengthOptions() =>
    VoicevoxxAudioQueryFrameLengthOptions.fromEntity(
      voicevoxMakeDefaultAudioQueryFrameLengthOptions(),
    );

///
/// 音声の総フレーム数を算出する。
///
/// 音声の秒数は、フレーム数を ::VOICEVOX_FRAME_RATE で割った値で表せる。
///
/// 算出した値は[`SIZE_MAX`]で飽和する。算出方法は以下の通り。
///
/// 1. 以下の秒数を32-bit浮動小数点数として解釈して集める。
/// - [`AudioQuery::pre_phoneme_length`]
/// - [`AudioQuery::accent_phrases`]の要素ごとに
/// - [`AccentPhrase::moras`]の要素ごとに
/// - [`Mora::consonant_length`]
/// - [`Mora::vowel_length`]
/// - ::VoicevoxAudioQueryFrameLengthOptions::enable_interrogative_upspeak
/// かつ[`AccentPhrase::is_interrogative`]かつ`moras`の最後の[`Mora::pitch`]が`0.0`以外のとき、`0.15`秒
/// - [`AccentPhrase::pause_mora`]の`Mora::consonant_length`（通常はない）
/// - `AccentPhrase::pause_mora`の`Mora::vowel_length`
/// - [`AudioQuery::post_phoneme_length`]
/// 2. それぞれの秒数を`secs`として、対応するフレーム長を`round_ties_even(round_ties_even(secs * (float)VOICEVOX_FRAME_RATE) / speed_scale)`として算出する。ここで`round_ties_even`は[Rustの`f32::round_ties_even`]であり、libmの[`roundevenf(3)`]と同様IEEE 754の`roundToIntegralTiesToEven`演算を行う。[`AudioQuery::speed_scale`]も32-bit浮動小数点数として解釈し、乗算と除算も32-bit浮動小数点数上で行う。
/// 3. 各フレーム長を足し合わせる。
///
/// `AudioQuery`に対応する音声の長さは将来的に変わる可能性がある。例えば、秒数を64-bit浮動小数点数として解釈しているVOICEVOX
/// ENGINEと挙動を揃える可能性がある。
///
/// [`SIZE_MAX`]: https://en.cppreference.com/c/types/limits
/// [`AudioQuery::pre_phoneme_length`]: ../rust_api/voicevox_core/struct.AudioQuery.html#structfield.pre_phoneme_length
/// [`AudioQuery::accent_phrases`]: ../rust_api/voicevox_core/struct.AudioQuery.html#structfield.accent_phrases
/// [`AccentPhrase::moras`]: ../rust_api/voicevox_core/struct.AccentPhrase.html#structfield.moras
/// [`Mora::consonant_length`]: ../rust_api/voicevox_core/struct.Mora.html#structfield.consonant_length
/// [`Mora::vowel_length`]: ../rust_api/voicevox_core/struct.Mora.html#structfield.vowel_length
/// [`AccentPhrase::is_interrogative`]: ../rust_api/voicevox_core/struct.AccentPhrase.html#structfield.is_interrogative
/// [`Mora::pitch`]: ../rust_api/voicevox_core/struct.Mora.html#structfield.pitch
/// [`AccentPhrase::pause_mora`]: ../rust_api/voicevox_core/struct.AccentPhrase.html#structfield.pause_mora
/// [`AudioQuery::post_phoneme_length`]: ../rust_api/voicevox_core/struct.AudioQuery.html#structfield.post_phoneme_length
/// [Rustの`f32::round_ties_even`]: https://doc.rust-lang.org/stable/std/primitive.f32.html#method.round_ties_even
/// [`roundevenf(3)`]: https://en.cppreference.com/w/c/numeric/math/roundeven
/// [`AudioQuery::speed_scale`]: ../rust_api/voicevox_core/struct.AudioQuery.html#structfield.speed_scale
///
/// @param [in] audio_query_json `AudioQuery`型のJSON
/// @param [in] options オプション
/// @param [out] output_frame_length 算出した総フレーム数の出力先
///
/// @returns 成功時には ::VOICEVOX_RESULT_OK 、失敗時には ::VOICEVOX_RESULT_INVALID_UTF8_INPUT_ERROR または ::VOICEVOX_RESULT_INVALID_AUDIO_QUERY_ERROR
///
/// \examples{
/// ```c
/// char *query = NULL;
/// VoicevoxAudioFeature *audio = NULL;
///
/// VoicevoxResultCode voicevox_result = VOICEVOX_RESULT_OK;
///
/// #define TRY(result)                                                            \
/// do {                                                                         \
/// voicevox_result = result;                                                  \
/// if (voicevox_result != VOICEVOX_RESULT_OK) {                               \
/// goto cleanup;                                                            \
/// }                                                                          \
/// } while (0)
/// ```
///
/// ```c
/// TRY(voicevox_synthesizer_create_audio_query(
/// synth, "こんにちは、音声合成の世界へようこそ？", WHATEVER_STYLE1,
/// &query));
///
/// TRY(voicevox_synthesizer_create_audio_feature(
/// synth, query, WHATEVER_STYLE2, voicevox_make_default_synthesis_options(),
/// &audio));
///
/// size_t frame_length_of_audio_query;
/// TRY(voicevox_audio_query_frame_length(
/// query, voicevox_make_default_audio_query_frame_length_options(),
/// &frame_length_of_audio_query));
///
/// const size_t frame_length_of_audio_feature = voicevox_audio_feature_len(audio);
///
/// assert(frame_length_of_audio_query == frame_length_of_audio_feature);
/// ```
///
/// ```c
/// size_t to_frame_length(float secs, float speed_scale) {
/// const float kFrameRate = (float)VOICEVOX_FRAME_RATE;
/// return roundevenf(roundevenf(secs * kFrameRate) / speed_scale);
/// }
///
/// int main(void) {
/// // …
///
/// // speed_scale         = 1.2f
/// // pre_phoneme_length  = 3.3f
/// // post_phoneme_length = 4.4f
/// const char *kQuery = "{\n"
/// "  \"accent_phrases\": [],\n"
/// "  \"speedScale\": 1.2,\n"
/// "  \"pitchScale\": 0.0,\n"
/// "  \"intonationScale\": 1.0,\n"
/// "  \"volumeScale\": 1.0,\n"
/// "  \"prePhonemeLength\": 3.3,\n"
/// "  \"postPhonemeLength\": 4.4,\n"
/// "  \"outputSamplingRate\": 24000,\n"
/// "  \"outputStereo\": false\n"
/// "}\n";
///
/// size_t frame_length;
/// TRY(voicevox_audio_query_frame_length(
/// kQuery, voicevox_make_default_audio_query_frame_length_options(),
/// &frame_length));
///
/// assert(frame_length ==
/// // `speed_scale`, `pre_phoneme_length`
/// to_frame_length(3.3f, 1.2f)
/// // `speed_scale`, `consonant_length`, `vowel_length`,
/// // `is_interrogative`
/// + 0
/// // `speed_scale`, `post_phoneme_length`
/// + to_frame_length(4.4f, 1.2f));
///
/// // …
/// }
/// ```
///
/// ```c
/// // speed_scale = FLT_MIN
/// const char *kQuery = "{\n"
/// "  \"accent_phrases\": [],\n"
/// "  \"speedScale\": 1.1754943508222875e-38,\n"
/// "  \"pitchScale\": 0.0,\n"
/// "  \"intonationScale\": 1.0,\n"
/// "  \"volumeScale\": 1.0,\n"
/// "  \"prePhonemeLength\": 0.1,\n"
/// "  \"postPhonemeLength\": 0.1,\n"
/// "  \"outputSamplingRate\": 24000,\n"
/// "  \"outputStereo\": false\n"
/// "}\n";
///
/// size_t frame_length;
/// TRY(voicevox_audio_query_frame_length(
/// kQuery, voicevox_make_default_audio_query_frame_length_options(),
/// &frame_length));
///
/// assert(frame_length == SIZE_MAX);
/// ```
/// }
///
/// \safety{
/// - `audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_frame_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_query_frame_length}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_query_frame_length(const char *audio_query_json, struct VoicevoxAudioQueryFrameLengthOptions options, uintptr_t *output_frame_length)
/// ```
({int frameLength, int result}) voicevoxxAudioQueryFrameLength(
  String audioQueryJson, {
  VoicevoxxAudioQueryFrameLengthOptions? options,
}) {
  options ??= voicevoxxMakeDefaultAudioQueryFrameLengthOptions();
  var frameLength = 0;
  final optionsPointer = options.calloc();
  final frameLengthPointer = ffi.calloc<UintPtr>();
  final result = voicevoxAudioQueryFrameLength(
    audioQueryJson,
    optionsPointer.ref,
    frameLengthPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    frameLength = frameLengthPointer.value;
  }
  ffi.calloc
    ..free(optionsPointer)
    ..free(frameLengthPointer);
  return (result: result, frameLength: frameLength);
}

///
/// signed 16-bit little endianのPCMデータからWAV形式のバイナリを生成する。
///
/// `pcm`がヌルならクラッシュする。
///
/// @param [in] pcm_length PCMデータのバイト長
/// @param [in] pcm PCMデータ。非ヌル
/// @param [in] sampling_rate サンプリングレート
/// @param [in] is_stereo ステレオかどうか
/// @param [out] output_wav_length 出力のバイト長
/// @param [out] output_wav 出力先
///
/// \safety{
/// - `pcm_length > 0`のとき、`pcm`は長さ`pcm_length`にわたって<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `output_wav_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// - `output_wav`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_wav_from_s16le}
///
/// ```c
/// __declspec(dllimport) void voicevox_wav_from_s16le(uintptr_t pcm_length, const uint8_t *pcm, uint32_t sampling_rate, bool is_stereo, uintptr_t *output_wav_length, uint8_t **output_wav)
/// ```
Uint8List voicevoxxWavFromS16le(
  Uint8List pcm,
  int samplingRate, {
  bool isStereo = true,
}) {
  Uint8List wav;
  final pcmPointer = ffi.calloc<Uint8>(pcm.length);
  pcmPointer.asTypedList(pcm.length).setAll(0, pcm);
  final wavLengthPointer = ffi.calloc<UintPtr>();
  final wavPointer = ffi.calloc<Pointer<Uint8>>();
  voicevoxWavFromS16le(
    pcm.length,
    pcmPointer,
    samplingRate,
    isStereo,
    wavLengthPointer,
    wavPointer,
  );
  wav = Uint8List.fromList(
    wavPointer.value.asTypedList(wavLengthPointer.value),
  );
  voicevoxBytesFree(wavPointer.value.cast<Uint8>());
  ffi.calloc
    ..free(pcmPointer)
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return wav;
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
  final modelPointer = ffi.calloc<Pointer<VoicevoxVoiceModelFile>>();
  final result = voicevoxVoiceModelFileOpen(path, modelPointer);
  if (result == VOICEVOX_RESULT_OK) {
    model = modelPointer.value;
  }
  ffi.calloc.free(modelPointer);
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
Uint8List voicevoxxVoiceModelFileId(Pointer<VoicevoxVoiceModelFile> model) {
  final fileIdPointer = ffi.calloc<Uint8>(16);
  voicevoxVoiceModelFileId(model, fileIdPointer);
  final result = Uint8List.fromList(fileIdPointer.asTypedList(16));
  ffi.calloc.free(fileIdPointer);
  return result;
}

///
/// ::VoicevoxVoiceModelFile からメタ情報を取得する。
///
/// JSONの解放は ::voicevox_string_free で行う。
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
  final result = json.cast<ffi.Utf8>().toDartString();
  voicevoxStringFree(json);
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
  Pointer<OpenJtalkRc> openJtalk, {
  VoicevoxxInitializeOptions? options,
}) {
  options ??= voicevoxxMakeDefaultInitializeOptions();
  Pointer<VoicevoxSynthesizer> synthesizer = nullptr;
  final optionsPointer = options.calloc();
  final synthesizerPointer = ffi.calloc<Pointer<VoicevoxSynthesizer>>();
  final result = voicevoxSynthesizerNew(
    onnxruntime,
    openJtalk,
    optionsPointer.ref,
    synthesizerPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    synthesizer = synthesizerPointer.value;
  }
  ffi.calloc
    ..free(optionsPointer)
    ..free(synthesizerPointer);
  return (result: result, synthesizer: synthesizer);
}

///
/// デフォルトの `voicevox_synthesizer_load_voice_model` のオプションを生成する
/// @return デフォルト値が設定された `voicevox_synthesizer_load_voice_model` のオプション
///
/// \no-orig-impl{voicevox_make_default_load_voice_model_options}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxLoadVoiceModelOptions voicevox_make_default_load_voice_model_options(void)
/// ```
VoicevoxxLoadVoiceModelOptions voicevoxxMakeDefaultLoadVoiceModelOptions() =>
    VoicevoxxLoadVoiceModelOptions.fromEntity(
      voicevoxMakeDefaultLoadVoiceModelOptions(),
    );

///
/// 音声モデルを読み込む。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] model 音声モデル
/// @param [in] options オプション
///
/// @returns 結果コード
///
/// \orig-impl{voicevox_synthesizer_load_voice_model}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_load_voice_model(const struct VoicevoxSynthesizer *synthesizer, const struct VoicevoxVoiceModelFile *model, struct VoicevoxLoadVoiceModelOptions options)
/// ```
int voicevoxxSynthesizerLoadVoiceModel(
  Pointer<VoicevoxSynthesizer> synthesizer,
  Pointer<VoicevoxVoiceModelFile> model, {
  VoicevoxxLoadVoiceModelOptions? options,
}) {
  options ??= VoicevoxxLoadVoiceModelOptions();
  final optionsPointer = options.calloc();
  final result = voicevoxSynthesizerLoadVoiceModel(
    synthesizer,
    model,
    optionsPointer.ref,
  );
  ffi.calloc.free(optionsPointer);
  return result;
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
int voicevoxxSynthesizerUnloadVoiceModel(
  Pointer<VoicevoxSynthesizer> synthesizer,
  Uint8List modelId,
) {
  final modelIdPointer = ffi.calloc<Uint8>(16);
  modelIdPointer.asTypedList(16).setAll(0, modelId);
  final result = voicevoxSynthesizerUnloadVoiceModel(
    synthesizer,
    modelIdPointer,
  );
  ffi.calloc.free(modelIdPointer);
  return result;
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
bool voicevoxxSynthesizerIsLoadedVoiceModel(
  Pointer<VoicevoxSynthesizer> synthesizer,
  Uint8List modelId,
) {
  final modelIdPointer = ffi.calloc<Uint8>(16);
  modelIdPointer.asTypedList(16).setAll(0, modelId);
  final result = voicevoxSynthesizerIsLoadedVoiceModel(
    synthesizer,
    modelIdPointer,
  );
  ffi.calloc.free(modelIdPointer);
  return result;
}

///
/// 今読み込んでいる音声モデルのメタ情報を、JSONで取得する。
///
/// JSONの解放は ::voicevox_string_free で行う。
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
  final result = json.cast<ffi.Utf8>().toDartString();
  voicevoxStringFree(json);
  return result;
}

///
/// ONNX Runtimeとして利用可能なデバイスの情報を、JSONで取得する。
///
/// JSONの解放は ::voicevox_string_free で行う。
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
({int result, String supportedDeficesJson})
voicevoxxOnnxruntimeCreateSupportedDevicesJson(
  Pointer<VoicevoxOnnxruntime> onnxruntime,
) {
  var supportedDeficesJson = '';
  final supportedDevicesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxOnnxruntimeCreateSupportedDevicesJson(
    onnxruntime,
    supportedDevicesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    supportedDeficesJson = supportedDevicesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(supportedDevicesJsonPointer.value);
  }
  ffi.calloc.free(supportedDevicesJsonPointer);
  return (result: result, supportedDeficesJson: supportedDeficesJson);
}

///
/// AquesTalk風記法から、AudioQueryをJSONとして生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final autioQueryJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAudioQueryFromKana(
    synthesizer,
    kana,
    styleId,
    autioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    audioQueryJson = autioQueryJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(autioQueryJsonPointer.value);
  }
  ffi.calloc.free(autioQueryJsonPointer);
  return (audioQueryJson: audioQueryJson, result: result);
}

///
/// 日本語テキストから、AudioQueryをJSONとして生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
({String audioQueryJson, int result}) voicevoxxSynthesizerCreateAudioQuery(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String text,
  int styleId,
) {
  var audioQueryJson = '';
  final autioQueryJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAudioQuery(
    synthesizer,
    text,
    styleId,
    autioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    audioQueryJson = autioQueryJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(autioQueryJsonPointer.value);
  }
  ffi.calloc.free(autioQueryJsonPointer);
  return (audioQueryJson: audioQueryJson, result: result);
}

///
/// AquesTalk風記法から、AccentPhrase (アクセント句)の配列をJSON形式で生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final accentPhrasesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAccentPhrasesFromKana(
    synthesizer,
    kana,
    styleId,
    accentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    accentPhrasesJson = accentPhrasesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(accentPhrasesJsonPointer.value);
  }
  ffi.calloc.free(accentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: accentPhrasesJson);
}

///
/// 日本語テキストから、AccentPhrase (アクセント句)の配列をJSON形式で生成する。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final accentPhrasesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateAccentPhrases(
    synthesizer,
    text,
    styleId,
    accentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    accentPhrasesJson = accentPhrasesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(accentPhrasesJsonPointer.value);
  }
  ffi.calloc.free(accentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: accentPhrasesJson);
}

///
/// AccentPhraseの配列の音高・音素長を、特定の声で生成しなおす。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final outputAccentPhrasesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerReplaceMoraData(
    synthesizer,
    accentPhrasesJson,
    styleId,
    outputAccentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    outputAccentPhrasesJson = outputAccentPhrasesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(outputAccentPhrasesJsonPointer.value);
  }
  ffi.calloc.free(outputAccentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: outputAccentPhrasesJson);
}

///
/// AccentPhraseの配列の音素長を、特定の声で生成しなおす。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final outputAccentPhrasesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerReplacePhonemeLength(
    synthesizer,
    accentPhrasesJson,
    styleId,
    outputAccentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    outputAccentPhrasesJson = outputAccentPhrasesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(outputAccentPhrasesJsonPointer.value);
  }
  ffi.calloc.free(outputAccentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: outputAccentPhrasesJson);
}

///
/// AccentPhraseの配列の音高を、特定の声で生成しなおす。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final outputAccentPhrasesJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerReplaceMoraPitch(
    synthesizer,
    accentPhrasesJson,
    styleId,
    outputAccentPhrasesJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    outputAccentPhrasesJson = outputAccentPhrasesJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(outputAccentPhrasesJsonPointer.value);
  }
  ffi.calloc.free(outputAccentPhrasesJsonPointer);
  return (result: result, accentPhrasesJson: outputAccentPhrasesJson);
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
VoicevoxxSynthesisOptions voicevoxxMakeDefaultSynthesisOptions() =>
    VoicevoxxSynthesisOptions.fromEntity(voicevoxMakeDefaultSynthesisOptions());

///
/// AudioQueryから音声合成を行う。
///
/// 生成したWAVデータを解放するには ::voicevox_bytes_free を使う。
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
({int result, Uint8List wav}) voicevoxxSynthesizerSynthesis(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String audioQueryJson,
  int styleId, {
  VoicevoxxSynthesisOptions? options,
}) {
  options ??= voicevoxxMakeDefaultSynthesisOptions();
  Uint8List wav;
  final optionsPointer = options.calloc();
  final wavLengthPointer = ffi.calloc<UintPtr>();
  final wavPointer = ffi.calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerSynthesis(
    synthesizer,
    audioQueryJson,
    styleId,
    optionsPointer.ref,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = Uint8List.fromList(
      wavPointer.value.asTypedList(wavLengthPointer.value),
    );
    voicevoxBytesFree(wavPointer.value.cast<Uint8>());
  } else {
    wav = Uint8List(0);
  }
  ffi.calloc
    ..free(optionsPointer)
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav);
}

///
/// AudioQueryから音声合成用の中間表現を<b>構築</b>(_construct_)する。
///
/// 生成した中間表現を解放するには ::voicevox_audio_feature_delete を使う。
///
/// > [!WARNING]
/// > ストリーミング音声合成にはいくつか注意事項がある。ユーザーガイドの[ストリーミング音声合成]を参照。
///
/// [ストリーミング音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/usage.md#ストリーミング音声合成
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] audio_query_json AudioQueryのJSON文字列
/// @param [in] style_id スタイルID
/// @param [in] options オプション
/// @param [out] out_audio_feature 構築先
///
/// @returns 結果コード
///
/// \safety{
/// - `audio_query_json`はヌル終端文字列を指し、かつ<a href="#voicevox-core-safety">読み込みについて有効</a>でなければならない。
/// - `out_audio_feature`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_create_audio_feature}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_create_audio_feature(const struct VoicevoxSynthesizer *synthesizer, const char *audio_query_json, VoicevoxStyleId style_id, struct VoicevoxSynthesisOptions options, struct VoicevoxAudioFeature **out_audio_feature)
/// ```
({int result, Pointer<VoicevoxAudioFeature> audioFeature})
voicevoxxSynthesizerCreateAudioFeature(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String audioQueryJson,
  int styleId, {
  VoicevoxxSynthesisOptions? options,
}) {
  options ??= voicevoxxMakeDefaultSynthesisOptions();
  final optionsPointer = options.calloc();
  Pointer<VoicevoxAudioFeature> audioFeature = nullptr;
  final audioFeaturePointer = ffi.calloc<Pointer<VoicevoxAudioFeature>>();
  final result = voicevoxSynthesizerCreateAudioFeature(
    synthesizer,
    audioQueryJson,
    styleId,
    optionsPointer.ref,
    audioFeaturePointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    audioFeature = audioFeaturePointer.value;
  }
  ffi.calloc.free(optionsPointer);
  ffi.calloc.free(audioFeaturePointer);
  return (result: result, audioFeature: audioFeature);
}

///
/// 指定された範囲に対応した ::VoicevoxAudioFeatureSlice を返す。
///
/// `audio_feature`は複製されずにそのまま構造体に入る。解放は不要。
///
/// @param [in] audio_feature
/// @param [in] start_inclusive 開始フレーム番号
/// @param [in] end 終了フレーム番号
/// @param [in] end_is_inclusive `end`を含むかどうか
/// @param [in] clamp
/// @param [in] allow_start_exceeds_end
/// @param [out] output スライスの出力先
///
/// @returns 結果コード。エラーは
/// \ref VOICEVOX_RESULT_START_OUT_OF_BOUNDS_ERROR
/// 、\ref VOICEVOX_RESULT_END_OUT_OF_BOUNDS_ERROR
/// 、または \ref VOICEVOX_RESULT_START_EXCEEDS_END_ERROR
///
/// \safety{
/// - `output`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_feature_slice}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_feature_slice(const struct VoicevoxAudioFeature *audio_feature, uintptr_t start_inclusive, uintptr_t end, bool end_is_inclusive, bool clamp, bool allow_start_exceeds_end, struct VoicevoxAudioFeatureSlice *output)
/// ```
({int result, VoicevoxxAudioFeatureSlice slice}) voicevoxxAudioFeatureSlice(
  Pointer<VoicevoxAudioFeature> audioFeature,
  int startInclusive,
  int end, {
  bool endIsInclusive = false,
  bool clamp = false,
  bool allowStartExceedsEnd = false,
}) {
  VoicevoxxAudioFeatureSlice slice;
  final slicePointer = ffi.calloc<VoicevoxAudioFeatureSlice>();
  final result = voicevoxAudioFeatureSlice(
    audioFeature,
    startInclusive,
    end,
    endIsInclusive,
    clamp,
    allowStartExceedsEnd,
    slicePointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    slice = VoicevoxxAudioFeatureSlice.fromPointer(slicePointer);
  } else {
    slice = VoicevoxxAudioFeatureSlice();
  }
  ffi.calloc.free(slicePointer);
  return (result: result, slice: slice);
}

///
/// 与えられた ::VoicevoxAudioFeature の全体を表す ::VoicevoxAudioFeatureSlice を返す。
///
/// `audio_feature`は複製されずにそのまま構造体に入る。解放は不要。
///
/// \orig-impl{voicevox_audio_feature_slice_new}
///
/// ```c
/// __declspec(dllimport) struct VoicevoxAudioFeatureSlice voicevox_audio_feature_slice_new(const struct VoicevoxAudioFeature *audio_feature, bool clamp, bool allow_start_exceeds_end)
/// ```
VoicevoxxAudioFeatureSlice voicevoxxAudioFeatureSliceNew(
  Pointer<VoicevoxAudioFeature> audioFeature, {
  bool clamp = false,
  bool allowStartExceedsEnd = false,
}) {
  final entity = voicevoxAudioFeatureSliceNew(
    audioFeature,
    clamp,
    allowStartExceedsEnd,
  );
  return VoicevoxxAudioFeatureSlice.fromEntity(entity);
}

///
/// ::VoicevoxAudioFeatureSlice が持つフレーム数を返す。
///
/// @param [in] audio_feature_slice
/// @param [out] output フレーム数の出力先
///
/// @returns 結果コード。エラーは
/// \ref VOICEVOX_RESULT_START_OUT_OF_BOUNDS_ERROR
/// 、\ref VOICEVOX_RESULT_END_OUT_OF_BOUNDS_ERROR
/// 、または \ref VOICEVOX_RESULT_START_EXCEEDS_END_ERROR
///
/// \safety{
/// - `output`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_feature_slice_len}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_feature_slice_len(struct VoicevoxAudioFeatureSlice audio_feature_slice, uintptr_t *output)
/// ```
({int result, int len}) voicevoxxAudioFeatureSliceLen(
  VoicevoxxAudioFeatureSlice audioFeatureSlice,
) {
  var len = 0;
  final audioFutureSlicePointer = audioFeatureSlice.calloc();
  final lenPointer = ffi.calloc<UintPtr>();
  final result = voicevoxAudioFeatureSliceLen(
    audioFutureSlicePointer.ref,
    lenPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    len = lenPointer.value;
  }
  ffi.calloc.free(audioFutureSlicePointer);
  ffi.calloc.free(lenPointer);
  return (result: result, len: len);
}

///
/// ::voicevox_audio_feature_slice_len で取得する長さが`0`かどうかを返す。
///
/// @param [in] audio_feature_slice
/// @param [out] output 長さが`0`かどうかの出力先
///
/// @returns 結果コード。エラーは
/// \ref VOICEVOX_RESULT_START_OUT_OF_BOUNDS_ERROR
/// 、\ref VOICEVOX_RESULT_END_OUT_OF_BOUNDS_ERROR
/// 、または \ref VOICEVOX_RESULT_START_EXCEEDS_END_ERROR
///
/// \safety{
/// - `output`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_feature_slice_is_empty}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_feature_slice_is_empty(struct VoicevoxAudioFeatureSlice audio_feature_slice, bool *output)
/// ```
({int result, bool isEmpty}) voicevoxxAudioFeatureSliceIsEmpty(
  VoicevoxxAudioFeatureSlice audioFeatureSlice,
) {
  var isEmpty = false;
  final audioFutureSlicePointer = audioFeatureSlice.calloc();
  final isEmptyPointer = ffi.calloc<Bool>();
  final result = voicevoxAudioFeatureSliceIsEmpty(
    audioFutureSlicePointer.ref,
    isEmptyPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    isEmpty = isEmptyPointer.value;
  }
  ffi.calloc.free(audioFutureSlicePointer);
  ffi.calloc.free(isEmptyPointer);
  return (result: result, isEmpty: isEmpty);
}

///
/// 与えられた ::VoicevoxAudioFeatureSlice のサブスライスを返す。
///
/// `audio_feature_slice.audio_feature`は複製されずにそのまま構造体に入る。解放は不要。
///
/// @param [in] audio_feature_slice
/// @param [in] start_inclusive 開始フレーム番号
/// @param [in] end 終了フレーム番号
/// @param [in] end_is_inclusive `end`を含むかどうか
/// @param [in] clamp
/// @param [in] allow_start_exceeds_end
/// @param [out] output サブスライスの出力先
///
/// @returns 結果コード。エラーは
/// \ref VOICEVOX_RESULT_START_OUT_OF_BOUNDS_ERROR
/// 、\ref VOICEVOX_RESULT_END_OUT_OF_BOUNDS_ERROR
/// 、または \ref VOICEVOX_RESULT_START_EXCEEDS_END_ERROR
///
/// \safety{
/// - `output`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_audio_feature_slice_slice}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_audio_feature_slice_slice(struct VoicevoxAudioFeatureSlice audio_feature_slice, uintptr_t start_inclusive, uintptr_t end, bool end_is_inclusive, bool clamp, bool allow_start_exceeds_end, struct VoicevoxAudioFeatureSlice *output)
/// ```
({int result, VoicevoxxAudioFeatureSlice slice})
voicevoxxAudioFeatureSliceSlice(
  VoicevoxxAudioFeatureSlice audioFeatureSlice,
  int startInclusive,
  int end, {
  bool endIsInclusive = false,
  bool clamp = false,
  bool allowStartExceedsEnd = false,
}) {
  VoicevoxxAudioFeatureSlice slice;
  final audioFeatureSlicePointer = audioFeatureSlice.calloc();
  final slicePointer = ffi.calloc<VoicevoxAudioFeatureSlice>();
  final result = voicevoxAudioFeatureSliceSlice(
    audioFeatureSlicePointer.ref,
    startInclusive,
    end,
    endIsInclusive,
    clamp,
    allowStartExceedsEnd,
    slicePointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    slice = VoicevoxxAudioFeatureSlice.fromPointer(slicePointer);
  } else {
    slice = VoicevoxxAudioFeatureSlice();
  }
  ffi.calloc.free(audioFeatureSlicePointer);
  ffi.calloc.free(slicePointer);
  return (result: result, slice: slice);
}

///
/// ::VoicevoxAudioFeatureSlice から、16bit PCMで音声波形を生成する。
///
/// 生成されたPCMデータが`0`バイトのとき、`output_pcm_length`には`0`が、`output_pcm`には ::voicevox_empty_bytes が書き込まれる。
///
/// 生成した`1`バイト以上のPCMデータを解放するには ::voicevox_bytes_free を使う。
///
/// @param [in] synthesizer 音声シンセサイザ
/// @param [in] audio_feature_slice 音声合成用の中間表現
/// @param [out] output_pcm_length 出力のバイト長
/// @param [out] output_pcm 出力先
///
/// @returns 結果コード
///
/// \safety{
/// - `output_pcm_length`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// - `output_pcm`は<a href="#voicevox-core-safety">書き込みについて有効</a>でなければならない。
/// }
///
/// \orig-impl{voicevox_synthesizer_render}
///
/// ```c
/// __declspec(dllimport) VoicevoxResultCode voicevox_synthesizer_render(const struct VoicevoxSynthesizer *synthesizer, struct VoicevoxAudioFeatureSlice audio_feature_slice, uintptr_t *output_pcm_length, uint8_t **output_pcm)
/// ```
({int result, Uint8List pcm}) voicevoxxSynthesizerRender(
  Pointer<VoicevoxSynthesizer> synthesizer,
  VoicevoxxAudioFeatureSlice audioFeatureSlice,
) {
  Uint8List pcm;
  final audioFeatureSlicePointer = audioFeatureSlice.calloc();
  final pcmLengthPointer = ffi.calloc<UintPtr>();
  final pcmPointer = ffi.calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerRender(
    synthesizer,
    audioFeatureSlicePointer.ref,
    pcmLengthPointer,
    pcmPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    pcm = Uint8List.fromList(
      pcmPointer.value.asTypedList(pcmLengthPointer.value),
    );
    voicevoxBytesFree(pcmPointer.value.cast<Uint8>());
  } else {
    pcm = Uint8List(0);
  }
  ffi.calloc
    ..free(audioFeatureSlicePointer)
    ..free(pcmLengthPointer)
    ..free(pcmPointer);
  return (result: result, pcm: pcm);
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
VoicevoxxTtsOptions voicevoxxMakeDefaultTtsOptions() =>
    VoicevoxxTtsOptions.fromEntity(voicevoxMakeDefaultTtsOptions());

///
/// AquesTalk風記法から音声合成を行う。
///
/// 生成したWAVデータを解放するには ::voicevox_bytes_free を使う。
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
({int result, Uint8List wav}) voicevoxxSynthesizerTtsFromKana(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String kana,
  int styleId, {
  VoicevoxxTtsOptions? options,
}) {
  options ??= voicevoxxMakeDefaultTtsOptions();
  Uint8List wav;
  final optionsPointer = options.calloc();
  final wavLengthPointer = ffi.calloc<UintPtr>();
  final wavPointer = ffi.calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerTtsFromKana(
    synthesizer,
    kana,
    styleId,
    optionsPointer.ref,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = Uint8List.fromList(
      wavPointer.value.asTypedList(wavLengthPointer.value),
    );
    voicevoxBytesFree(wavPointer.value.cast<Uint8>());
  } else {
    wav = Uint8List(0);
  }
  ffi.calloc
    ..free(optionsPointer)
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav);
}

///
/// 日本語テキストから音声合成を行う。
///
/// 生成したWAVデータを解放するには ::voicevox_bytes_free を使う。
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
({int result, Uint8List wav}) voicevoxxSynthesizerTts(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String text,
  int styleId, {
  VoicevoxxTtsOptions? options,
}) {
  options ??= voicevoxxMakeDefaultTtsOptions();
  Uint8List wav;
  final optionsPointer = options.calloc();
  final wavLengthPointer = ffi.calloc<UintPtr>();
  final wavPointer = ffi.calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerTts(
    synthesizer,
    text,
    styleId,
    optionsPointer.ref,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = Uint8List.fromList(
      wavPointer.value.asTypedList(wavLengthPointer.value),
    );
    voicevoxBytesFree(wavPointer.value.cast<Uint8>());
  } else {
    wav = Uint8List(0);
  }
  ffi.calloc
    ..free(optionsPointer)
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav);
}

///
/// 楽譜から歌唱音声合成用のクエリを作成する。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したJSONを解放するには ::voicevox_string_free を使う。
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
  final frameAudioQueryJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateSingFrameAudioQuery(
    synthesizer,
    scoreJson,
    styleId,
    frameAudioQueryJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    frameAudioQueryJson = frameAudioQueryJsonPointer.value
        .cast<ffi.Utf8>()
        .toDartString();
    voicevoxStringFree(frameAudioQueryJsonPointer.value);
  }
  ffi.calloc.free(frameAudioQueryJsonPointer);
  return (result: result, frameAudioQueryJson: frameAudioQueryJson);
}

///
/// 楽譜と歌唱音声合成用のクエリから、フレームごとの基本周波数を生成する。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したJSONを解放するには ::voicevox_string_free を使う。
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
  final f0JsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateSingFrameF0(
    synthesizer,
    scoreJson,
    frameAudioQueryJson,
    styleId,
    f0JsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    f0Json = f0JsonPointer.value.cast<ffi.Utf8>().toDartString();
    voicevoxStringFree(f0JsonPointer.value);
  }
  ffi.calloc.free(f0JsonPointer);
  return (result: result, f0Json: f0Json);
}

///
/// 楽譜と歌唱音声合成用のクエリから、フレームごとの音量を生成する。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したJSONを解放するには ::voicevox_string_free を使う。
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
  final volumeJsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxSynthesizerCreateSingFrameVolume(
    synthesizer,
    scoreJson,
    frameAudioQueryJson,
    styleId,
    volumeJsonPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    volumeJson = volumeJsonPointer.value.cast<ffi.Utf8>().toDartString();
    voicevoxStringFree(volumeJsonPointer.value);
  }
  ffi.calloc.free(volumeJsonPointer);
  return (result: result, volumeJson: volumeJson);
}

///
/// 歌唱音声合成を行う。
///
/// 詳細はユーザーガイド[歌唱音声合成]を参照。
///
/// [歌唱音声合成]: https://github.com/VOICEVOX/voicevox_core/blob/main/docs/guide/user/song.md
///
/// 生成したWAVデータを解放するには ::voicevox_bytes_free を使う。
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
({int result, Uint8List wav}) voicevoxxSynthesizerFrameSynthesis(
  Pointer<VoicevoxSynthesizer> synthesizer,
  String frameAudioQueryJson,
  int styleId,
) {
  Uint8List wav;
  final wavLengthPointer = ffi.calloc<UintPtr>();
  final wavPointer = ffi.calloc<Pointer<Uint8>>();
  final result = voicevoxSynthesizerFrameSynthesis(
    synthesizer,
    frameAudioQueryJson,
    styleId,
    wavLengthPointer,
    wavPointer,
  );
  if (result == VOICEVOX_RESULT_OK) {
    wav = Uint8List.fromList(
      wavPointer.value.asTypedList(wavLengthPointer.value),
    );
    voicevoxBytesFree(wavPointer.value.cast<Uint8>());
  } else {
    wav = Uint8List(0);
  }
  ffi.calloc
    ..free(wavLengthPointer)
    ..free(wavPointer);
  return (result: result, wav: wav);
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
({int result, Uint8List wordUuid}) voicevoxxUserDictAddWord(
  Pointer<VoicevoxUserDict> userDict,
  VoicevoxxUserDictWord word,
) {
  final wordPointer = word.calloc();
  final wordUuidPointer = ffi.calloc<Uint8>(16);
  final result = voicevoxUserDictAddWord(
    userDict,
    wordPointer,
    wordUuidPointer,
  );
  final wordUuid = Uint8List.fromList(wordUuidPointer.asTypedList(16));
  ffi.calloc.free(wordUuidPointer);
  wordPointer.callocAllFree();
  return (result: result, wordUuid: wordUuid);
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
int voicevoxxUserDictUpdateWord(
  Pointer<VoicevoxUserDict> userDict,
  Uint8List wordUuid,
  VoicevoxxUserDictWord word,
) {
  final wordUuidPointer = ffi.calloc<Uint8>(16);
  final wordPointer = word.calloc();
  wordUuidPointer.asTypedList(16).setAll(0, wordUuid);
  final result = voicevoxUserDictUpdateWord(
    userDict,
    wordUuidPointer,
    wordPointer,
  );
  ffi.calloc.free(wordUuidPointer);
  wordPointer.callocAllFree();
  return result;
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
int voicevoxxUserDictRemoveWord(
  Pointer<VoicevoxUserDict> userDict,
  Uint8List wordUuid,
) {
  final wordUuidPointer = ffi.calloc<Uint8>(16);
  wordUuidPointer.asTypedList(16).setAll(0, wordUuid);
  final result = voicevoxUserDictRemoveWord(userDict, wordUuidPointer);
  ffi.calloc.free(wordUuidPointer);
  return result;
}

///
/// ユーザー辞書の単語をJSON形式で出力する。
///
/// 生成したJSON文字列を解放するには ::voicevox_string_free を使う。
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
  final jsonPointer = ffi.calloc<Pointer<Int8>>();
  final result = voicevoxUserDictToJson(userDict, jsonPointer);
  if (result == VOICEVOX_RESULT_OK) {
    json = jsonPointer.value.cast<ffi.Utf8>().toDartString();
    voicevoxStringFree(jsonPointer.value);
  }
  ffi.calloc.free(jsonPointer);
  return (result: result, json: json);
}
