import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import 'workout_form_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String workoutId;

  const WorkoutDetailScreen({super.key, required this.workoutId});

  @override
  Widget build(BuildContext context) {
    final workout =
        context.read<WorkoutProvider>().findById(workoutId);

    return Scaffold(
      appBar: AppBar(
        title: Text(workout.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<WorkoutProvider>().deleteWorkout(workoutId);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Подходы: ${workout.sets}',
                style: Theme.of(context).textTheme.titleLarge),
            Text('Длительность: ${workout.duration} минут'),
            const SizedBox(height: 16),
            Text(workout.description),
            const Spacer(),
            ElevatedButton(
              child: const Text('Редактировать'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        WorkoutFormScreen(workout: workout),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
