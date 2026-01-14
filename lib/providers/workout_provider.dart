import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider extends ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: '1',
      title: 'Отжимания',
      sets: 4,
      duration: 15,
      description: 'Классические отжимания',
    ),
    Workout(
      id: '2',
      title: 'Турник',
      sets: 5,
      duration: 20,
      description: 'Подтягивания широким хватом',
    ),
  ];

  List<Workout> get workouts => _workouts;

  Workout findById(String id) {
    return _workouts.firstWhere((w) => w.id == id);
  }

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void updateWorkout(String id, Workout newWorkout) {
    final index = _workouts.indexWhere((w) => w.id == id);
    _workouts[index] = newWorkout;
    notifyListeners();
  }

  void deleteWorkout(String id) {
    _workouts.removeWhere((w) => w.id == id);
    notifyListeners();
  }
}
