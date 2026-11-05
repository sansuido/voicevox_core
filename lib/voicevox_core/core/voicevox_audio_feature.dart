// ignore_for_file: comment_references

part of '../core.dart';

extension VoicevoxAudioFeaturePointerEx on Pointer<VoicevoxAudioFeature> {
  ///
  /// ::VoicevoxAudioFeature の総フレーム数を取得する。
  ///
  /// この ::VoicevoxAudioFeature
  /// を生成するときに用いた`AudioQuery`について、生成時と同じ疑問文の語尾上昇設定で
  /// ::voicevox_audio_query_frame_length により算出した値に等しい。
  ///
  /// @param [in] audio_feature 音声合成用の中間表現
  ///
  /// @returns 総フレーム数
  ///
  /// \orig-impl{voicevox_audio_feature_len}
  ///
  /// ```c
  /// __declspec(dllimport) uintptr_t voicevox_audio_feature_len(const struct VoicevoxAudioFeature *audio_feature)
  /// ```
  int len() => voicevoxAudioFeatureLen(this);

  ///
  /// ::voicevox_audio_feature_len で取得する長さが`0`かどうか。
  ///
  /// @param [in] audio_feature 音声合成用の中間表現
  ///
  /// @returns 長さが`0`なら`true`、それ以外は`false`
  ///
  /// \orig-impl{voicevox_audio_feature_is_empty}
  ///
  /// ```c
  /// __declspec(dllimport) bool voicevox_audio_feature_is_empty(const struct VoicevoxAudioFeature *audio_feature)
  /// ```
  bool isEmpty() => voicevoxAudioFeatureIsEmpty(this);

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
  ({int result, VoicevoxxAudioFeatureSlice slice}) slice(
    int startInclusive,
    int end, {
    bool endIsInclusive = false,
    bool clamp = false,
    bool allowStartExceedsEnd = false,
  }) => voicevoxxAudioFeatureSlice(
    this,
    startInclusive,
    end,
    endIsInclusive: endIsInclusive,
    clamp: clamp,
    allowStartExceedsEnd: allowStartExceedsEnd,
  );

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
  VoicevoxxAudioFeatureSlice sliceNew({
    bool clamp = false,
    bool allowStartExceedsEnd = false,
  }) => voicevoxxAudioFeatureSliceNew(
    this,
    clamp: clamp,
    allowStartExceedsEnd: allowStartExceedsEnd,
  );

  ///
  /// ::VoicevoxAudioFeature を<b>破棄</b>(_destruct_)する。
  ///
  /// 破棄対象への他スレッドでのアクセスが存在する場合、それらがすべて終わるのを待ってから破棄する。
  ///
  /// この関数の呼び出し後に破棄し終えた対象にアクセスすると、プロセスを異常終了する。
  ///
  /// @param [in] audio_feature 破棄対象。nullable
  ///
  /// \no-orig-impl{voicevox_audio_feature_delete}
  ///
  /// ```c
  /// __declspec(dllimport) void voicevox_audio_feature_delete(struct VoicevoxAudioFeature *audio_feature)
  /// ```
  void delete() => voicevoxAudioFeatureDelete(this);
}
