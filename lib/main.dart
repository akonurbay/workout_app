import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/screens/workout_list_screen.dart';
import 'providers/workout_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color kPrimaryGreen = Color(0xFF0EA55F);
  static const Color kAccentBlue = Color(0xFF2AB7F4);
  static const Color kAccentOrange = Color(0xFFFF9F43);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark();
    final textTheme = base.textTheme.copyWith(
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.white,
      ),
      bodyLarge: base.textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        color: Colors.white70,
      ),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.white60,
      ),
    );

    return ChangeNotifierProvider(
      create: (_) => WorkoutProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitness Tracker',
        theme: base.copyWith(
          colorScheme: base.colorScheme.copyWith(
            primary: kPrimaryGreen,
            secondary: kAccentBlue,
          ),
          scaffoldBackgroundColor: const Color(0xFF0B0F12),
          primaryColor: kPrimaryGreen,
          textTheme: textTheme,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              elevation: 6,
            ),
          ),
        ),
        home: const WorkoutListScreen(),
      ),
    );
  }
}
