Voicevox Core for Dart
====

このパッケージのメインページは以下なのだ。  

https://pub.dev/packages/voicevox_core

# Requirement

このライブラリは、64bit専用で、ffiを利用しているのだ。  

* ffi ^2.1.4

以下のようにインポートするのだ。  

```dart
import 'package:voicevox_core/voicevox_core.dart';
```

それぞれの環境で要求するライブラリは、以下の通りなのだ。  

## Windows requires dll files.

voicevox_core.dll  

## Linux (or Android, Fuchsia) requires so files.

voicevox_core.so  

## MacOS (or iOS) requires dylib files.

voicevox_core.dylib  

## And more.

もし、自分でライブラリを指定したいなら、以下のように設定するのだ。  

```dart
VoicevoxCoreDynamicLibraryService().set('core', 'YOUR_core_ENVIONMENT.dylib');
```

# Note

Dartは以下からダウンロードするのだ。  

https://www.libsdl.org/

Voicevox Coreは以下からダウンロードするのだ。  

https://github.com/VOICEVOX/voicevox_core




ウィンドウズで動作確認をしているけど、他の環境でも動く気がするのだ。  
動かなかったらごめんなさいなのだ。  


# Author

作者は、yamaharaなのだ。  
