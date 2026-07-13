// ignore_for_file: comment_references

part of '../core.dart';

extension VoicevoxUserDictPointerEx on Pointer<VoicevoxUserDict> {
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
  int load(String dictPath) => voicevoxUserDictLoad(this, dictPath);

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
  ({int result, Uint8List wordUuid}) addWord(VoicevoxxUserDictWord word) =>
      voicevoxxUserDictAddWord(this, word);

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
  int updateWord(Uint8List wordUuid, VoicevoxxUserDictWord word) =>
      voicevoxxUserDictUpdateWord(this, wordUuid, word);

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
  int removeWord(Uint8List wordUuid) =>
      voicevoxxUserDictRemoveWord(this, wordUuid);

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
  ({String json, int result}) getJson() => voicevoxxUserDictToJson(this);

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
  int import(Pointer<VoicevoxUserDict> otherDict) =>
      voicevoxUserDictImport(this, otherDict);

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
  int save(String path) => voicevoxUserDictSave(this, path);

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
  void delete() => voicevoxUserDictDelete(this);
}
