import 'package:flutter/material.dart';
import '../qr_scanner/qr_scanner_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
