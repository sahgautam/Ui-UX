enum TripType { Activities, Exploration, Recovery }

enum Season { Summer, Winter, Spring, Autumn, SummerAndWinter }

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final TripType tripType;
  final Season season;
  final String imageUrl;
  final int duration;
  final List<String> activities;
  final List<String> program;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.tripType,
    required this.season,
    required this.imageUrl,
    required this.duration,
    required this.activities,
    required this.program,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}
