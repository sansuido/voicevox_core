// ignore_for_file: comment_references

part of '../core.dart';

extension VoicevoxOnnxruntimePointerEx on Pointer<VoicevoxOnnxruntime> {
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
  ({int result, Pointer<VoicevoxSynthesizer> synthesizer}) createSynthesizer(
    Pointer<OpenJtalkRc> openJtalk, {
    VoicevoxxInitializeOptions? options,
  }) => voicevoxxSynthesizerNew(this, openJtalk, options: options);

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
  ({int result, String supportedDeficesJson}) getSupportedDevicesJson() =>
      voicevoxxOnnxruntimeCreateSupportedDevicesJson(this);
}
