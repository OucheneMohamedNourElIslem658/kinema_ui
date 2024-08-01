import 'package:get/get.dart';

class CastScrollController extends GetxController {
  late int currentActor;
  final cast = [
    {
      'name' : 'Dwayne Johnson',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    },
    {
      'name' : 'Jason Statham',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    },
    {
      'name' : 'Idris Elba',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    },
    {
      'name' : 'Vanessa Kirby',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    },
    {
      'name' : 'Eiza González',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    },
    {
      'name' : 'Eddie Marsan',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    },
    {
      'name' : 'Helen Mirren',
      'imageURL': 'https://www.themoviedb.org/t/p/w235_and_h235_face/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg'
    }
  ];
  @override
  void onInit() {
    currentActor = (cast.length / 2).round()-1;
    super.onInit();
  }
  void changeActor(int index) {
    currentActor = index;
    update();
  }
}