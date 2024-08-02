import 'reservation.dart';

class User {
  int id;
  String email;
  String password;
  String fullName;
  DateTime birthDay;
  String gender;
  String picURL;
  bool emailVerified;
  String phoneNumber;
  String nationality;
  String address;
  int postalCode;
  bool isAdmin;
  int fidelityPoints;
  List<AuthProvider> authProviders;
  List<Reservation> reservations;

  User({
    this.id = 0,
    this.email = "",
    this.password = "",
    this.fullName = "",
    required this.birthDay,
    this.gender = "",
    this.picURL = "",
    this.emailVerified = false,
    this.phoneNumber = "",
    this.nationality = "",
    this.address = "",
    this.postalCode = 0,
    this.isAdmin = false,
    this.fidelityPoints = 0,
    this.authProviders = const [],
    this.reservations = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      fullName: json['fullName'] ?? "",
      birthDay: DateTime.parse(json['birthDay']),
      gender: json['gender'] ?? "",
      picURL: json['picURL'] ?? "",
      emailVerified: json['emailVerified'] ?? false,
      phoneNumber: json['phoneNumber'] ?? "",
      nationality: json['nationality'] ?? "",
      address: json['address'] ?? "",
      postalCode: json['postalCode'] ?? 0,
      isAdmin: json['isAdmin'] ?? false,
      fidelityPoints: json['fidelityPoints'] ?? 0,
      authProviders: (json['authProviders'] as List<dynamic>?)
              ?.map((e) => AuthProvider.fromJson(e as Map<String, dynamic>))
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
      'email': email,
      'password': password,
      'fullName': fullName,
      'birthDay': birthDay.toIso8601String(),
      'gender': gender,
      'picURL': picURL,
      'emailVerified': emailVerified,
      'phoneNumber': phoneNumber,
      'nationality': nationality,
      'address': address,
      'postalCode': postalCode,
      'isAdmin': isAdmin,
      'fidelityPoints': fidelityPoints,
      'authProviders': authProviders.map((e) => e.toJson()).toList(),
      'reservations': reservations.map((e) => e.toJson()).toList(),
    };
  }
}

class AuthProvider {
  int id;
  String provider;
  List<User> users;

  AuthProvider({
    this.id = 0,
    this.provider = "",
    this.users = const [],
  });

  factory AuthProvider.fromJson(Map<String, dynamic> json) {
    return AuthProvider(
      id: json['id'] ?? 0,
      provider: json['provider'] ?? "",
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'provider': provider,
      'users': users.map((e) => e.toJson()).toList(),
    };
  }
}