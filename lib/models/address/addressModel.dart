class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  static AddressModel empty() => AddressModel(
    id: '',
    name: '',
    phoneNumber: '',
    street: '',
    postalCode: '',
    city: '',
    state: '',
    country: '',
  );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'PostalCode': postalCode,
      'City': city,
      'State': state,
      'Country': country,
      'DateTime': dateTime?.toIso8601String(),
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      country: data['Country'] ?? '',
      dateTime: data['DateTime'] != null
          ? DateTime.parse(data['DateTime'])
          : null,
      selectedAddress: data['SelectedAddress'] ?? true,
    );
  }

  @override
  String toString() {
    return '$street, $city, $state $postalCode, $country';
  }
}
