// lib/models/habit.dart
class Habit {
  String title;
  bool isCompleted;

  Habit({
    required this.title,
    this.isCompleted = false,
  });
}
