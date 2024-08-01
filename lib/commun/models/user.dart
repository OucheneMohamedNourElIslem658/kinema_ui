class UserModel {
  int? id;
  String? fullName;
  String? username;
  String? email;
  String? phoneNumber;
  String? address;
  String? dateOfBirth;
  String? profilePicture;
  bool? isAdmin;
  bool? isCustomer;
  bool? isStaff;
  bool? isSuperuser;
  int? fidelityPoints;

  UserModel({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.profilePicture,
    this.isAdmin,
    this.isCustomer,
    this.isStaff,
    this.isSuperuser,
    this.fidelityPoints,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['Full_Name'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['Phone_Number'],
      address: json['Address'],
      dateOfBirth: json['Date_of_Birth'],
      profilePicture: json['Profile_Picture'],
      isAdmin: json['is_admin'],
      isCustomer: json['is_customer'],
      isStaff: json['is_staff'],
      isSuperuser: json['is_superuser'],
      fidelityPoints: json['Fidelity_Points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Full_Name': fullName,
      'username': username,
      'email': email,
      'Phone_Number': phoneNumber,
      'Address': address,
      'Date_of_Birth': dateOfBirth,
      'Profile_Picture': profilePicture,
      'is_admin': isAdmin,
      'is_customer': isCustomer,
      'is_staff': isStaff,
      'is_superuser': isSuperuser,
      'Fidelity_Points': fidelityPoints,
    };
  }
}
