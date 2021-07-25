import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

// App bar title
const _appBarTitle = 'Criando Transferência';

// Account number constants
const _fieldLabelAccountNumber = 'Número da conta';
const _fieldTipAccountNumber = '0000';

// Value constants
const _fieldLabelValue = 'Valor';
const _fieldTipValue = '0.00';

// Confirm button text
const _confirmButtonText = 'Confirmar';

class TransferForm extends StatefulWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _accountNumberController,
              label: _fieldLabelAccountNumber,
              tip: _fieldTipAccountNumber,
            ),
            Editor(
              controller: _valueController,
              label: _fieldLabelValue,
              tip: _fieldTipValue,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _createTrasnfer(context),
              child: Text(_confirmButtonText),
            ),
          ],
        ),
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
