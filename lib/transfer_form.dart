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
          Editor(
            controller: _accountNumberController,
            label: 'Número da conta',
            tip: '0000',
          ),
          Editor(
            controller: _valueController,
            label: 'Valor',
            tip: '0.00',
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () => _createTrasnfer(context),
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _createTrasnfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    final double? value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? tip;
  final IconData? icon;

  Editor({this.controller, this.label, this.tip, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: tip,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
