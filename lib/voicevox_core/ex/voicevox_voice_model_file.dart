// ignore_for_file: comment_references

part of '../core.dart';

extension VoicevoxVoiceModelFilePointerEx on Pointer<VoicevoxVoiceModelFile> {
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
  Uint8List getId() => voicevoxxVoiceModelFileId(this);

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
  String getMetasJson() => voicevoxxVoiceModelFileCreateMetasJson(this);

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
  void delete() => voicevoxVoiceModelFileDelete(this);
}
