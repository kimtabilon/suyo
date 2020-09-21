class CategoryModel {

  final String categoryId;
  final String title;
  final String description;
  final String banner;
  final String bannerOverlay;
  final String theme;

  CategoryModel({
      this.categoryId,
      this.title,
      this.description,
      this.banner,
      this.bannerOverlay,
      this.theme,
  });


  List<Map<String, dynamic>> list() {
  return [
      {
      'title':'EATS',
      'description':'Satisfy your cravings. Find the food you love with SuyoEats.',
      'image':'assets/services/suyo-eats.png',
      'color':0xffffcc3a
      },
      {
      'title':'GO',
      'description':'Send gifts, documents, and parcels on demand. Book your delivery whenever and wherever you need with SuyoGo.',
      'image':'assets/services/suyo-go.png',
      'color':0xff32a5ee
      },
      {
      'title':'MART',
      'description':'Save time and energy. Shop your grocery needs and have it delivered at your doorsteps with SuyoMart.',
      'image':'assets/services/suyo-mart.png',
      'color':0xff85d86d
      },
      {
      'title':'MEDS',
      'description':'Experience care right at your fingertips. Satisfy your medical needs with SuyoMeds.',
      'image':'assets/services/suyo-meds.png',
      'color':0xffff7140
      },
    ];
  }

}