class TravelPlace {
  final String imageUrl;
  final String name;
  final String place;
  TravelPlace(
      {required this.name, required this.imageUrl, required this.place});
}
List<TravelPlace>travelPlaceList=[
  TravelPlace(name: "Sunstone Ridge", imageUrl: 'assets/image4.jpg', place: "Sahara"),
  TravelPlace(name: "Hillcrest Haven", imageUrl: 'assets/image1.jpeg', place: "Chile"),
  TravelPlace(name: "Everest Lake", imageUrl: 'assets/image3.jpeg', place: "India"),
  TravelPlace(name: "Taj Mahal", imageUrl: 'assets/image6.jpg', place: "India"),
  TravelPlace(name: "Odyssey", imageUrl: 'assets/image5.jpg', place: "Japan")
];
List<TravelPlace>newtravelPlaceList=travelPlaceList.reversed.toList();