import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'adaptive_flat_button1.dart';
import 'adaptive_flat_button2.dart';

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

  void _submitData()

  {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      //stops the function execution
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,

    );
    setState(() {
      _titleController.clear();
      _amountController.clear();

    });

  }

  void _presentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
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
    return SingleChildScrollView(
      child: Card(
        elevation: 1,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.only(left: 10, top: 0, right: 20, bottom: 0),
          width: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                style: Theme.of(context).textTheme.title,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                  icon: Icon(
                    Icons.title,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(150, 150, 210, 5),
                      width: 2,
                    ),
                  ),

                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                style: Theme.of(context).textTheme.title,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                  icon: Icon(
                    Icons.attach_money,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(150, 150, 210, 5),
                      width: 2,
                    ),
                  ),
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.038,
                margin: EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    _selectedDate == null
                        ? 'The date not chosen!'
                        : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: AdaptiveFlatButton1(
                            'Choose Date', _presentDataPicker),),
                    Expanded(
                      child: AdaptiveFlatButton2(
                            'Add Expens', _submitData,

                      ),
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
