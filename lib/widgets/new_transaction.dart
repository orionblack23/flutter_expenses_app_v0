import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }

    _addTransaction(
      enterTitle,
      enterAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              /*onChanged: (val) {
                      titleInput = val;
                    },*/
              controller:
                  titleController, //Helps you save input data through controller
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(), //ep22 sec4
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
