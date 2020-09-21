class StoreModel {
  final String storeId;
  final String storeGroupId;

  final String name;
  final String description;
  final String customLogo;
  final String customBanner;

  final String addrStreet;
  final String addrBarangay;
  final String addrCity;
  final String addrProvince;

  StoreModel({
    this.storeId,
    this.storeGroupId,

    this.name,
    this.description,
    this.customLogo,
    this.customBanner,

    this.addrStreet,
    this.addrBarangay,
    this.addrCity,
    this.addrProvince,
  });
}