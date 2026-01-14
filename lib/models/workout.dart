class Workout {
  final String id;
  String title;
  int sets;
  int duration; // minutes
  String description;

  Workout({
    required this.id,
    required this.title,
    required this.sets,
    required this.duration,
    required this.description,
  });
}
