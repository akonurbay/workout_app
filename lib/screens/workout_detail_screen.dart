import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../widgets/accent_button.dart';
import '../models/workout.dart';
import 'workout_form_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String workoutId;

  const WorkoutDetailScreen({super.key, required this.workoutId});

  @override
  Widget build(BuildContext context) {
    final workout = context.read<WorkoutProvider>().findById(workoutId);

    return Scaffold(
      appBar: AppBar(
        title: Text(workout.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              context.read<WorkoutProvider>().deleteWorkout(workoutId);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 420),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workout.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _StatCard(label: 'Подходы', value: '${workout.sets}'),
                    const SizedBox(width: 12),
                    _StatCard(label: 'Длительность', value: '${workout.duration} мин'),
                  ],
                ),
                const SizedBox(height: 18),
                Text('Описание', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(workout.description, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: AccentButton(
                        label: 'Начать',
                        onPressed: () {
                          // start workout flow
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Workout started')));
                        },
                        filled: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AccentButton(
                        label: 'Повторить',
                        onPressed: () {
                          // repeat quick action
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Repeat scheduled')));
                        },
                        filled: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WorkoutFormScreen(workout: workout)),
                      );
                    },
                    child: const Text('Редактировать тренировку'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
        ]),
      ),
    );
  }
}
