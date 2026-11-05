// ignore_for_file: comment_references

part of '../core.dart';

class VoicevoxxAudioFeatureSlice {
  VoicevoxxAudioFeatureSlice({
    Pointer<VoicevoxAudioFeature>? audioFeature,
    this.startOffset = 0,
    this.end = 0,
    this.endIsInclusive = false,
    this.clamp = false,
    this.allowStartExceedsEnd = false,
  }) : audioFeature = audioFeature ?? nullptr;

  final Pointer<VoicevoxAudioFeature> audioFeature;
  final int startOffset;
  final int end;
  final bool endIsInclusive;
  final bool clamp;
  final bool allowStartExceedsEnd;

  static VoicevoxxAudioFeatureSlice fromEntity(
    VoicevoxAudioFeatureSlice entity,
  ) => VoicevoxxAudioFeatureSlice(
    audioFeature: entity.audioFeature,
    startOffset: entity.startOffset,
    end: entity.end,
    endIsInclusive: entity.endIsInclusive,
    clamp: entity.clamp,
    allowStartExceedsEnd: entity.allowStartExceedsEnd,
  );

  static VoicevoxxAudioFeatureSlice fromPointer(
    Pointer<VoicevoxAudioFeatureSlice> pointer,
  ) => VoicevoxxAudioFeatureSlice(
    audioFeature: pointer.ref.audioFeature,
    startOffset: pointer.ref.startOffset,
    end: pointer.ref.end,
    endIsInclusive: pointer.ref.endIsInclusive,
    clamp: pointer.ref.clamp,
    allowStartExceedsEnd: pointer.ref.allowStartExceedsEnd,
  );

  Pointer<VoicevoxAudioFeatureSlice> calloc() {
    final pointer = ffi.calloc<VoicevoxAudioFeatureSlice>();
    pointer.ref.audioFeature = audioFeature;
    pointer.ref.startOffset = startOffset;
    pointer.ref.end = end;
    pointer.ref.endIsInclusive = endIsInclusive;
    pointer.ref.clamp = clamp;
    pointer.ref.allowStartExceedsEnd = allowStartExceedsEnd;
    return pointer;
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
  ({int result, int len}) len() => voicevoxxAudioFeatureSliceLen(this);

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
  ({int result, bool isEmpty}) isEmpty() =>
      voicevoxxAudioFeatureSliceIsEmpty(this);
}
