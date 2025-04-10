import 'package:flutter/material.dart';
import 'features/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットはアプリケーションのルートとなります
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これはあなたのアプリケーションのテーマです
        //
        // 試してみましょう：アプリケーションを "flutter run" で実行してみてください。
        // アプリケーションの上部バーが紫色になっているのが確認できます。
        // アプリを終了せずに、以下のcolorSchemeのseedColorをColors.greenに
        // 変更して、"ホットリロード"を実行してみてください
        //（Flutter対応のIDEで変更を保存するか"ホットリロード"ボタンを押すか、
        // コマンドラインでアプリを起動した場合は"r"を押してください）。
        //
        // カウンターが0にリセットされないことに注目してください。
        // アプリケーションの状態はリロード中も失われません。
        // 状態をリセットするには、代わりにホットリスタートを使用してください。
        //
        // これは値だけでなく、コードの変更にも適用されます：
        // ほとんどのコードの変更はホットリロードだけでテストできます。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CounterScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
