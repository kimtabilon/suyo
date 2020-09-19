class UserModel {

  final String uid;
  final String email;
  final String role;

  UserModel({
    this.uid,
    this.email,
    this.role,
  });
}

class ProfileModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String birthday;

  ProfileModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.birthday,
  });
}

class AddressModel {
  final String building;
  final String street;
  final String barangay;
  final String city;
  final String province;
  final String country;
  final String zip;

  AddressModel({
    this.building,
    this.street,
    this.barangay,
    this.city,
    this.province,
    this.country,
    this.zip,
  });
}

class ContactModel {
  final String type;
  final String value;

  ContactModel({
    this.type,
    this.value
  });
}

class LocationModel {
  final String lat;
  final String lng;
  final String ip;
  final String provider;
  final String wifi;

  LocationModel({
    this.lat,
    this.lng,
    this.ip,
    this.provider,
    this.wifi,
  });
}
