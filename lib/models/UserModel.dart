class UserModel {
  final String email;
  final String passowrd;

  UserModel({
    required this.email,
    required this.passowrd,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'],
      passowrd: data['passowrd'],
    );
  }
}

class UserAddressModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  UserAddressModel({this.name, this.email, this.address, this.phone});

  factory UserAddressModel.fromMap(Map<String, dynamic> data) {
    return UserAddressModel(
      name: data['name'],
      email: data['email'],
      address: data['address'],
      phone: data['phone'],
    );
  }
}
