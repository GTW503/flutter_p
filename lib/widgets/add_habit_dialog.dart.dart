import 'package:flutter/material.dart';

class AddHabitDialog extends StatefulWidget {
  final Function(String) onAdd;

  AddHabitDialog({required this.onAdd});

  @override
  _AddHabitDialogState createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter une Habitude'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Nom de l\'habitude'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            final title = _controller.text;
            if (title.isNotEmpty) {
              widget.onAdd(title);
            }
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
