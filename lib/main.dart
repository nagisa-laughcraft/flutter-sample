import 'package:flutter/material.dart';
import 'screens/qr_scanner_screen.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットはアプリケーションのホームページです。
  // これはStatefulです。つまり、見た目に影響を与えるフィールドを含む
  // Stateオブジェクト（以下で定義）を持っているということです。

  // このクラスは状態の設定を行います。親（この場合はAppウィジェット）から
  // 提供された値（この場合はtitle）を保持し、それはStateのbuildメソッドで
  // 使用されます。Widgetサブクラスのフィールドは常に"final"とマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _incrementCounter() {
    setState(() {
      // setStateを呼び出すことで、このStateで何かが変更されたことを
      // Flutterフレームワークに伝えます。これにより、下のbuildメソッドが
      // 再実行され、表示が更新された値を反映します。もしsetState()を
      // 呼び出さずに_counterを変更した場合、buildメソッドは再度呼び出されず、
      // 何も変化が起きないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼び出されるたびに再実行されます。
    // 例えば、上記の_incrementCounterメソッドによって呼び出されます。
    //
    // Flutterフレームワークは、buildメソッドの再実行を最適化するように設計されています。
    // そのため、個々のウィジェットのインスタンスを個別に変更する必要はなく、
    // 更新が必要なものを再構築するだけで済みます。
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'メニュー',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('ホーム'),
              onTap: () {
                Navigator.pop(context); // Drawerを閉じる
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('QRコード'),
              onTap: () {
                // 一旦ドロワーを閉じる
                Navigator.pop(context);
                // QRスキャナー画面に遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QRScannerScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        // Centerはレイアウトウィジェットです。単一の子要素を受け取り、
        // 親の中央に配置します。
        child: Column(
          // Columnもレイアウトウィジェットです。子要素のリストを受け取り、
          // それらを垂直に配置します。デフォルトでは、水平方向に子要素に
          // フィットするようにサイズを調整し、親の高さいっぱいに広がろうとします。
          //
          // Columnには、サイズ調整方法や子要素の配置方法を制御するための
          // さまざまなプロパティがあります。ここではmainAxisAlignmentを使用して
          // 子要素を垂直方向に中央揃えにしています。Columnは垂直なので、
          // メイン軸は垂直軸です（クロス軸は水平軸になります）。
          //
          // 試してみましょう：「デバッグペイント」を有効にしてみてください
          //（IDEで「Toggle Debug Paint」アクションを選択するか、
          // コンソールで「p」を押します）。各ウィジェットのワイヤーフレームが
          // 表示されます。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // この末尾のカンマは、buildメソッドの自動フォーマットを見やすくします。
    );
  }
}
