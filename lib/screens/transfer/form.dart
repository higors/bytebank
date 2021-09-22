import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTittle = 'Creating Transfer';
const _labelFieldValue = 'Value';
const _hintFieldValue = '0.00';
const _labelFieldAccountNumber = 'Account Number';
const _hintFieldAccountNumber = '0000';
const _textButtonConfirm = 'Confirm';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberFieldControl = TextEditingController();
  final TextEditingController _valueFieldControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTittle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              control: _accountNumberFieldControl,
              label: _labelFieldAccountNumber,
              hint: _hintFieldAccountNumber,
            ),
            Editor(
              control: _valueFieldControl,
              label: _labelFieldValue,
              hint: _hintFieldValue,
              icon: Icon(Icons.monetization_on, color: Colors.green),
            ),
            ElevatedButton(
              child: Text(_textButtonConfirm),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? numeroConta = int.tryParse(_accountNumberFieldControl.text);
    final double? valor = double.tryParse(_valueFieldControl.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transfer(numeroConta, valor);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
