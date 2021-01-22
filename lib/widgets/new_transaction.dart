import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  void _submitDate() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _persentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.grey,
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => _submitDate(),
              // autofocus: true,
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onSubmitted: (_) => _submitDate(),
            ),
            Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : ('Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Chooe Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _persentDatePicker,
                ),
              ],
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitDate,
              child: Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
