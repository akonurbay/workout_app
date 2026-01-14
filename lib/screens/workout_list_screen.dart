import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import 'workout_detail_screen.dart';
import 'workout_form_screen.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = context.watch<WorkoutProvider>().workouts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои тренировки'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const WorkoutFormScreen(),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (ctx, i) {
          final workout = workouts[i];
          return Card(
            child: ListTile(
              title: Text(workout.title),
              subtitle: Text(
                  'Подходы: ${workout.sets} | ${workout.duration} мин'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        WorkoutDetailScreen(workoutId: workout.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
