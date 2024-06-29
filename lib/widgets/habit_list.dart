import 'package:flutter/material.dart';

class Habit {
  final String title;
  bool isCompleted;

  Habit({required this.title, this.isCompleted = false});
}

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final Function(int) onToggleCompletion;
  final Function(int) onDelete;

  HabitList({
    required this.habits,
    required this.onToggleCompletion,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return ListTile(
          title: Text(
            habit.title,
            style: TextStyle(
              decoration: habit.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          leading: Checkbox(
            value: habit.isCompleted,
            onChanged: (_) {
              onToggleCompletion(index);
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete(index);
            },
          ),
        );
      },
    );
  }
}
