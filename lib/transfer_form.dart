import 'package:bytebank/transfer_list.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _accountNumberController,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _valueController,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? accountNumber =
                  int.tryParse(_accountNumberController.text);
              final double? value = double.tryParse(_valueController.text);

              if (accountNumber != null && value != null) {
                final createdTransfer = Transfer(value, accountNumber);
                debugPrint(createdTransfer.toString());
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
