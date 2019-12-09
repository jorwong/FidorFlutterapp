class HomeListData {
  HomeListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HomeListData> hotelList = <HomeListData>[
    HomeListData(
      imagePath: 'lib/asset/Phone.png',
      titleTxt: 'Phone',
      subTxt: 'MicroInsurance',
      // dist: 2.0,
      reviews: 80,
      rating: 4.4,
      // perNight: 180,
    ),
    HomeListData(
      imagePath: 'lib/asset/Furniture.png',
      titleTxt: 'Furniture',
      subTxt: 'MicroInsurance',
      // dist: 4.0,
      reviews: 74,
      rating: 4.5,
      // perNight: 200,
    ),
    HomeListData(
      imagePath: 'lib/asset/Pet.png',
      titleTxt: 'Pet',
      subTxt: 'MicroInsurance',
      // dist: 3.0,
      reviews: 62,
      rating: 4.0,
      // perNight: 60,
    ),
    HomeListData(
      imagePath: 'lib/asset/Clothes.jpg',
      titleTxt: 'Clothes',
      subTxt: 'MicroInsurance',
      // dist: 7.0,
      reviews: 90,
      rating: 4.4,
      // perNight: 170,
    ),
    HomeListData(
      imagePath: 'lib/assets/Insurance.jpg',
      titleTxt: 'Laptop',
      subTxt: 'MicorInsurance',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
