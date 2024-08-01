class EventModel {
  final String url;
  final DateTime date;
  final String title;
  final String description;

  EventModel({
    required this.date,
    required this.title,
    required this.description,
    required this.url
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['name'] as String,
      url: map['Poster'],
      description: map['Description'] as String,
      date: DateTime.parse(map['start_date'] as String)
    );
  }
}