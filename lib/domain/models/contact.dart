class Contact {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  Contact({required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company});
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Map<String, dynamic> geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  }) : assert(geo['lat'] != null && geo['lng'] != null);

  @override
  String toString() {
    return '$zipCode $city, $street $suite';
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
}
