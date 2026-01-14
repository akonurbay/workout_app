import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/screens/workout_list_screen.dart';
import 'providers/workout_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkoutProvider(),
      child: MaterialApp(
        title: 'Fitness Tracker',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const WorkoutListScreen(),
      ),
    );
  }
}
