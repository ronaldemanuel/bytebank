import 'package:flutter/material.dart';
import 'transfer_list.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      home: TransferList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
