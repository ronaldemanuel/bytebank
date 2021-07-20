import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
          backgroundColor: Colors.green,
        ),
        body: TransferList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TransferItem(Transfer(100.0, 1000)),
        TransferItem(Transfer(200.0, 1340)),
        TransferItem(Transfer(250.5, 1000)),
        TransferItem(Transfer(300.0, 2000)),
      ],
    );
  } // O conteúdo do widget é imutável
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
