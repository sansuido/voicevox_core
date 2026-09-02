## 1.1.0

- Supported `voicevox_core` v0.17.0.
- Added functions (`voicevoxGetOnnxruntimeLibMinRequiredMinorVersion`, `voicevoxGetOnnxruntimeLibMaxSupportedMinorVersion`, `voicevoxGetOnnxruntimeLibRecommendedUnversionedFilename`, `voicevoxMakeDefaultLoadVoiceModelOptions`).
- Changed function (`voicevoxSynthesizerLoadVoiceModel`).
- Updated environment/dependencies:
  - sdk: '>=3.13.2 <4.0.0'

## 1.0.0

- Added all glue functions.
- Added `example/user_dict.dart`.
- **[Breaking Change]** Changed `VoicevoxVoiceModelId` type from `Pointer<Uint8>` to `Uint8List` for safety and better memory management.
- Updated environment/dependencies:
  - sdk: '>=3.12.2 <4.0.0'

## 0.3.0

- Supported `voicevox_core` v0.16.4.
- Added validation-related functions (`voicevoxScoreValidate`, `voicevoxNoteValidate`, `voicevoxFrameAudioQueryValidate`, `voicevoxFramePhonemeValidate`, and `voicevoxEnsureCompatible`).
- Added synthesizer-related functions (`voicevoxSynthesizerCreateSingFrameAudioQuery`, `voicevoxSynthesizerCreateSingFrameF0`, `voicevoxSynthesizerCreateSingFrameVolume`, and `voicevoxSynthesizerFrameSynthesis`).
- Added glue functions.
- Simplified `example/main.dart` using the new glue functions.
- Added `example/song.dart`.
- Updated environment/dependencies:
  - sdk: '>=3.12.1 <4.0.0'
  - ffi: ^2.2.0
  - halildurmus_lints: ^2.0.0

## 0.2.0

- Supported `voicevox_core` v0.16.3 and added corresponding functions (`voicevoxAudioQueryValidate`, `voicevoxAccentPhraseValidate`, and `voicevoxMoraValidate`).
- Supported Dart 3.10.4.

## 0.1.0

- Initial version.