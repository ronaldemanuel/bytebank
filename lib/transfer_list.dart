import 'package:bytebank/transfer_form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  @override
  _TransferListState createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  final List<Transfer> _transfers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
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
          final Future<Transfer?> future =
              Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TransferForm();
            },
          ));
          future.then((transferRecived) {
            if (transferRecived != null) {
              setState(() {
                _transfers.add(transferRecived);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
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
