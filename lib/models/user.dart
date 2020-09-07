class User {

  final String uid;
  final String email;
  final String role;

  User({
    this.uid,
    this.email,
    this.role,
  });
}

class Profile {
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String birthday;

  Profile({
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.birthday,
  });
}

class Address {
  final String building;
  final String street;
  final String barangay;
  final String city;
  final String province;
  final String country;
  final String zip;

  Address({
    this.building,
    this.street,
    this.barangay,
    this.city,
    this.province,
    this.country,
    this.zip,
  });
}

class Contact {
  final String type;
  final String value;

  Contact({
    this.type,
    this.value
  });
}

class Location {
  final String lat;
  final String lng;
  final String ip;
  final String provider;
  final String wifi;

  Location({
    this.lat,
    this.lng,
    this.ip,
    this.provider,
    this.wifi,
  });
}
