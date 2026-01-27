import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../widgets/workout_card.dart';
import 'workout_form_screen.dart';
import 'workout_detail_screen.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = context.watch<WorkoutProvider>().workouts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои тренировки'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 6, right: 6),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WorkoutFormScreen()),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 8,
          child: const Icon(Icons.add, size: 28),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          itemCount: workouts.length,
          separatorBuilder: (_, __) => const SizedBox(height: 0),
          itemBuilder: (ctx, i) {
            final workout = workouts[i];
            return WorkoutCard(
              workout: workout,
              index: i,
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => WorkoutDetailScreen(workoutId: workout.id),
                    transitionsBuilder: (_, a, __, c) {
                      return FadeTransition(opacity: a, child: c);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
