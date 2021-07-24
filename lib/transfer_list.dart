import 'package:bytebank/transfer_form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatelessWidget {
  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    _transfers.add(Transfer(200, 1000));
    _transfers.add(Transfer(200, 1000));
    _transfers.add(Transfer(200, 1000));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          final Transfer transfer = _transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TransferForm();
            },
          ));
          future.then((transferRecived) {
            debugPrint('$transferRecived');
            _transfers.add(transferRecived);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
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

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
