import 'diffusion.dart';
import 'user.dart';

class Reservation {
  int id;
  int diffusionId;
  Diffusion diffusion;
  int userId;
  User user;
  List<Seat> seats;
  bool hasCome;
  String paymentMethod;
  int amount;
  String currency;
  String paymentIntent;

  Reservation({
    this.id = 0,
    this.diffusionId = 0,
    required this.diffusion,
    this.userId = 0,
    required this.user,
    this.seats = const [],
    this.hasCome = false,
    this.paymentMethod = "",
    this.amount = 0,
    this.currency = "",
    this.paymentIntent = "",
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] ?? 0,
      diffusionId: json['diffusionId'] ?? 0,
      diffusion: Diffusion.fromJson(json['diffusion']),
      userId: json['userId'] ?? 0,
      user: User.fromJson(json['user']),
      seats: (json['seats'] as List<dynamic>?)
              ?.map((e) => Seat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hasCome: json['hasCome'] ?? false,
      paymentMethod: json['paymentMethod'] ?? "",
      amount: json['amount'] ?? 0,
      currency: json['currency'] ?? "",
      paymentIntent: json['paymentIntent'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diffusionId': diffusionId,
      'diffusion': diffusion.toJson(),
      'userId': userId,
      'user': user.toJson(),
      'seats': seats.map((e) => e.toJson()).toList(),
      'hasCome': hasCome,
      'paymentMethod': paymentMethod,
      'amount': amount,
      'currency': currency,
      'paymentIntent': paymentIntent,
    };
  }
}
