// ignore_for_file: comment_references

part of '../core.dart';

extension OpenJtalkRcPointerEx on Pointer<OpenJtalkRc> {
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
  int useUserDict(Pointer<VoicevoxUserDict> userDict) =>
      voicevoxOpenJtalkRcUseUserDict(this, userDict);

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
  ({String accentPhrasesJson, int result}) analyze(String text) =>
      voicevoxxOpenJtalkRcAnalyze(this, text);

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
  void delete() => voicevoxOpenJtalkRcDelete(this);
}
