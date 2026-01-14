import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/workout.dart';
import '../providers/workout_provider.dart';

class WorkoutFormScreen extends StatefulWidget {
  final Workout? workout;

  const WorkoutFormScreen({super.key, this.workout});

  @override
  State<WorkoutFormScreen> createState() => _WorkoutFormScreenState();
}

class _WorkoutFormScreenState extends State<WorkoutFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late int sets;
  late int duration;
  late String description;

  @override
  void initState() {
    title = widget.workout?.title ?? '';
    sets = widget.workout?.sets ?? 0;
    duration = widget.workout?.duration ?? 0;
    description = widget.workout?.description ?? '';
    super.initState();
  }

  void save() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final provider = context.read<WorkoutProvider>();

    if (widget.workout == null) {
      provider.addWorkout(
        Workout(
          id: DateTime.now().toString(),
          title: title,
          sets: sets,
          duration: duration,
          description: description,
        ),
      );
    } else {
      provider.updateWorkout(
        widget.workout!.id,
        Workout(
          id: widget.workout!.id,
          title: title,
          sets: sets,
          duration: duration,
          description: description,
        ),
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout == null
            ? 'Добавить тренировку'
            : 'Редактировать'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: title,
                decoration: const InputDecoration(labelText: 'Название'),
                onSaved: (v) => title = v!,
              ),
              TextFormField(
                initialValue: sets.toString(),
                decoration: const InputDecoration(labelText: 'Подходы'),
                keyboardType: TextInputType.number,
                onSaved: (v) => sets = int.parse(v!),
              ),
              TextFormField(
                initialValue: duration.toString(),
                decoration: const InputDecoration(labelText: 'Длительность'),
                keyboardType: TextInputType.number,
                onSaved: (v) => duration = int.parse(v!),
              ),
              TextFormField(
                initialValue: description,
                decoration:
                    const InputDecoration(labelText: 'Описание'),
                onSaved: (v) => description = v!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: save,
                child: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
