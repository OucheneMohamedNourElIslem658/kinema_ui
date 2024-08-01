import 'dart:convert';

class Movie {
  final String name;
  final String picUrl;
  final String trailerUrl;
  final double rate;
  final String type;
  final int time;
  final int views;
  final List<String> cast;
  final String description;
  final List<DateTime> showTime;
  final int price;

  Movie({
    required this.name,
    required this.picUrl,
    required this.trailerUrl,
    required this.rate,
    required this.type,
    required this.time,
    required this.views,
    required this.cast,
    required this.description,
    required this.showTime,
    required this.price,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['title'] as String,
      picUrl: map['Poster'] as String,
      trailerUrl: '',
      rate: 7.5,
      type: _convertStringToCharacterList(map['Genre']).first,
      time: int.parse(map['Duration'] as String),
      views: 500000,
      cast: _convertStringToCharacterList(map['Movie_Cast']),
      description: map['Description'] as String,
      showTime: [DateTime.now(), DateTime.now().add(const Duration(days: 2))],
      price: 50,
    );
  }
}

List<String> _convertStringToCharacterList(String inputString) {
  // Remove the first and last characters (square brackets and single quotes)
  String trimmedString = inputString.substring(1, inputString.length - 1);

  // Split the string into a list of strings based on comma and single quote delimiters
  List<String> characterList = trimmedString.split(", '");

  // Remove any empty strings from the list
  characterList.removeWhere((String element) => element.isEmpty);
  for (var i = 0; i < characterList.length; i++) {
    characterList[i] = characterList[i].replaceAll('\'', '');
  }
  return characterList;
}

Movie movieFromJson(String source) {
  return Movie.fromMap(json.decode(source));
}