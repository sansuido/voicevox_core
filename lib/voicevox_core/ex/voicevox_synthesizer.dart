// ignore_for_file: comment_references

part of '../core.dart';

extension VoicevoxSynthesizerPointerEx on Pointer<VoicevoxSynthesizer> {
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
  void delete() => voicevoxSynthesizerDelete(this);

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
  int loadModel(Pointer<VoicevoxVoiceModelFile> model) =>
      voicevoxSynthesizerLoadVoiceModel(this, model);

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
  int unloadModel(Pointer<VoicevoxVoiceModelFile> model) =>
      voicevoxxSynthesizerUnloadVoiceModel(this, model.getId());

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
  int unloadModelId(Uint8List modelId) =>
      voicevoxxSynthesizerUnloadVoiceModel(this, modelId);

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
  Pointer<VoicevoxOnnxruntime> getOnnxruntime() =>
      voicevoxSynthesizerGetOnnxruntime(this);

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
  bool isGpuMode() => voicevoxSynthesizerIsGpuMode(this);

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
  bool isLoadedModel(Pointer<VoicevoxVoiceModelFile> model) =>
      voicevoxxSynthesizerIsLoadedVoiceModel(this, model.getId());

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
  bool isLoadedModelId(Uint8List modelId) =>
      voicevoxxSynthesizerIsLoadedVoiceModel(this, modelId);

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
  String getMetasJson() => voicevoxxSynthesizerCreateMetasJson(this);

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
  ({String audioQueryJson, int result}) createAudioQueryFromKana(
    String kana,
    int styleId,
  ) => voicevoxxSynthesizerCreateAudioQueryFromKana(this, kana, styleId);

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
  ({String audioQueryJson, int result}) createAudioQuery(
    String text,
    int styleId,
  ) => voicevoxxSynthesizerCreateAudioQuery(this, text, styleId);

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
  ({String accentPhrasesJson, int result}) createAccentPhrasesFromKana(
    String kana,
    int styleId,
  ) => voicevoxxSynthesizerCreateAccentPhrasesFromKana(this, kana, styleId);

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
  ({String accentPhrasesJson, int result}) createAccentPhrases(
    String text,
    int styleId,
  ) => voicevoxxSynthesizerCreateAccentPhrases(this, text, styleId);

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
  ({String accentPhrasesJson, int result}) replaceMoraData(
    String accentPhrasesJson,
    int styleId,
  ) => voicevoxxSynthesizerReplaceMoraData(this, accentPhrasesJson, styleId);

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
  ({String accentPhrasesJson, int result}) replacePhonemeLength(
    String accentPhrasesJson,
    int styleId,
  ) => voicevoxxSynthesizerReplacePhonemeLength(
    this,
    accentPhrasesJson,
    styleId,
  );

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
  ({String accentPhrasesJson, int result}) replaceMoraPitch(
    String accentPhrasesJson,
    int styleId,
  ) => voicevoxxSynthesizerReplaceMoraPitch(this, accentPhrasesJson, styleId);

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
  ({int result, Uint8List wav}) synthesis(
    String audioQueryJson,
    int styleId, {
    VoicevoxxSynthesisOptions? options,
  }) => voicevoxxSynthesizerSynthesis(
    this,
    audioQueryJson,
    styleId,
    options: options,
  );

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
  ({int result, Uint8List wav}) ttsFromKana(
    String kana,
    int styleId, {
    VoicevoxxTtsOptions? options,
  }) => voicevoxxSynthesizerTtsFromKana(this, kana, styleId, options: options);

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
  ({int result, Uint8List wav}) tts(
    String text,
    int styleId, {
    VoicevoxxTtsOptions? options,
  }) => voicevoxxSynthesizerTts(this, text, styleId, options: options);

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
  ({String frameAudioQueryJson, int result}) createSingFrameAudioQuery(
    String scoreJson,
    int styleId,
  ) => voicevoxxSynthesizerCreateSingFrameAudioQuery(this, scoreJson, styleId);

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
  ({String f0Json, int result}) createSingFrameF0(
    String scoreJson,
    String frameAudioQueryJson,
    int styleId,
  ) => voicevoxxSynthesizerCreateSingFrameF0(
    this,
    scoreJson,
    frameAudioQueryJson,
    styleId,
  );

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
  ({String volumeJson, int result}) createSingFrameVolume(
    String? scoreJson,
    String? frameAudioQueryJson,
    int styleId,
  ) => voicevoxxSynthesizerCreateSingFrameVolume(
    this,
    scoreJson,
    frameAudioQueryJson,
    styleId,
  );

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
  ({int result, Uint8List wav}) frameSynthesis(
    String frameAudioQueryJson,
    int styleId,
  ) => voicevoxxSynthesizerFrameSynthesis(this, frameAudioQueryJson, styleId);
}
