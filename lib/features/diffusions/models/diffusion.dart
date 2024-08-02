import 'movie.dart';
import 'reservation.dart';

class Hall {
  int id;
  List<Diffusion> diffusions;
  String name;
  int rowsCount;
  int columnsCount;

  Hall({
    this.id = 0,
    this.diffusions = const [],
    this.name = "",
    this.rowsCount = 0,
    this.columnsCount = 0,
  });

  factory Hall.fromJson(Map<String, dynamic> json) {
    return Hall(
      id: json['id'] ?? 0,
      diffusions: (json['diffussions'] as List<dynamic>?)
              ?.map((e) => Diffusion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      name: json['name'] ?? "",
      rowsCount: json['rowsCount'] ?? 0,
      columnsCount: json['columnsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diffussions': diffusions.map((e) => e.toJson()).toList(),
      'name': name,
      'rowsCount': rowsCount,
      'columnsCount': columnsCount,
    };
  }
}

class Diffusion {
  int id;
  int movieID;
  Movie movie;
  DateTime showTime;
  Duration showDuration;
  int hallID;
  Hall hall;
  double seatPrice;
  List<Seat> seatsStatus;
  List<Reservation> reservations;

  Diffusion({
    this.id = 0,
    this.movieID = 0,
    required this.movie,
    required this.showTime,
    this.showDuration = Duration.zero,
    this.hallID = 0,
    required this.hall,
    this.seatPrice = 0.0,
    this.seatsStatus = const [],
    this.reservations = const [],
  });

  factory Diffusion.fromJson(Map<String, dynamic> json) {
    return Diffusion(
      id: json['id'] ?? 0,
      movieID: json['movieID'] ?? 0,
      movie: Movie.fromJson(json['movie']),
      showTime: DateTime.parse(json['showTime']),
      showDuration: Duration(microseconds: json['showDuration'] ?? 0),
      hallID: json['hallID'] ?? 0,
      hall: Hall.fromJson(json['type']),
      seatPrice: (json['seatPrice'] ?? 0.0).toDouble(),
      seatsStatus: (json['status'] as List<dynamic>?)
              ?.map((e) => Seat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reservations: (json['reservations'] as List<dynamic>?)
              ?.map((e) => Reservation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'movieID': movieID,
      'movie': movie.toJson(),
      'showTime': showTime.toIso8601String(),
      'showDuration': showDuration.inMicroseconds,
      'hallID': hallID,
      'type': hall.toJson(),
      'seatPrice': seatPrice,
      'status': seatsStatus.map((e) => e.toJson()).toList(),
      'reservations': reservations.map((e) => e.toJson()).toList(),
    };
  }
}

class Seat {
  int id;
  int? userId;
  int diffusionId;
  int? reservationId;
  String status;
  String seatRow;
  int seatColumn;

  Seat({
    this.id = 0,
    this.userId,
    this.diffusionId = 0,
    this.reservationId,
    this.status = "",
    this.seatRow = "",
    this.seatColumn = 0,
  });

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      id: json['id'] ?? 0,
      userId: json['userId'],
      diffusionId: json['diffusionId'] ?? 0,
      reservationId: json['reservationId'],
      status: json['status'] ?? "",
      seatRow: json['row'] ?? "",
      seatColumn: json['column'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'diffusionId': diffusionId,
      'reservationId': reservationId,
      'status': status,
      'row': seatRow,
      'column': seatColumn,
    };
  }
}