class CategoryModel {

  final String catid;
  final String title;
  final String description;
  final String thumbnail;
  final String banner;
  final String color;
  final String theme;

  CategoryModel({
      this.catid,
      this.title,
      this.description,
      this.thumbnail,
      this.banner,
      this.color,
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