Voicevox Core for Dart
====

https://pub.dev/packages/voicevox_core

# Requirement

* ffi ^2.2.0

This library is limited to 64bit.  

```dart
import 'package:voicevox_core/voicevox_core.dart';
```

## Windows requires dll file.

voicevox_core.dll  
voicevox_onnxruntime.dll  

## Linux requires so.0 file.

voicevox_core.so.0  
voicevox_onnxruntime.so.0  

## Android, Fuchsia requires so file.

voicevox_core.so  
voicevox_onnxruntime.so  

## MacOS (or iOS) requires dylib file.

voicevox_core.dylib  
voicevox_onnxruntime.lib  

## And more.

If you want to set a library under special circumstances (example: dylib), do the following:  

```dart
VoicevoxCoreDynamicLibraryService().set('core', 'YOUR_core_ENVIONMENT.dylib');
VoicevoxCoreDynamicLibraryService().set('onnxruntime', 'YOUR_onnxruntime_ENVIONMENT.dylib');
```

The settings for the ONNX Runtime library are effective only when options are not used with `voicevoxxOnnxruntimeLoadOnce`.

# Note

Download Dart from here:

https://dart.dev/

Download VOICEVOX Core from here:

https://github.com/VOICEVOX/voicevox_core


This package has been tested and verified to work on Windows.

# Author

yamahara  
