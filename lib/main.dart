import 'package:flutter/material.dart';
import 'package:partiel_f/widgets/add_habit_dialog.dart.dart';
import 'widgets/habit_list.dart';

void main() {
  runApp(HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HabitListScreen(),
    );
  }
}
 
class HabitListScreen extends StatefulWidget {
  @override
  _HabitListScreenState createState() => _HabitListScreenState();
}

class _HabitListScreenState extends State<HabitListScreen> {
  final List<Habit> _habits = [];

  void _addHabit(String title) {
    setState(() {
      _habits.add(Habit(title: title));
    });
  }

  void _toggleHabitCompletion(int index) {
    setState(() {
      _habits[index].isCompleted = !_habits[index].isCompleted;
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      _habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi d\'Habitudes'),
      ),
      body: HabitList(
        habits: _habits,
        onToggleCompletion: _toggleHabitCompletion,
        onDelete: _deleteHabit,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddHabitDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddHabitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddHabitDialog(
          onAdd: (title) {
            _addHabit(title);
            Navigator.of(context).pop();
          },
        );
      }, 
    );
  }
}
