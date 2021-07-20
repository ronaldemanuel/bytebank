import 'package:flutter/material.dart';
import 'transfer_list.dart';
import 'transfer_form.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
