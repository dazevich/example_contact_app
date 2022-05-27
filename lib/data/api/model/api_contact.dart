class ApiContact {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Map<String, dynamic> geo;
  final String companyName;
  final String catchPhrase;
  final String bs;

  ApiContact.fromJson(dynamic jsonData)
      : id = jsonData['id'].toString(),
        name = jsonData['name'],
        username = jsonData['username'],
        email = jsonData['email'],
        phone = jsonData['phone'],
        website = jsonData['website'],
        street = jsonData['address']['street'],
        suite = jsonData['address']['suite'],
        city = jsonData['address']['city'],
        zipCode = jsonData['address']['zipcode'],
        geo = jsonData['address']['geo'],
        companyName = jsonData['company']['name'],
        catchPhrase = jsonData['company']['catchPhrase'],
        bs = jsonData['company']['bs'];
}
