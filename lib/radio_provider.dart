import 'package:flutter/foundation.dart';

class Radio {
  final String? id;
  final String? name;
  final String? radioUrl;
  final String? radioImage;
  bool? isFavorite;

  Radio(
      {this.id,
      this.name,
      this.radioUrl,
      this.radioImage,
      this.isFavorite = false});
}

class RadioProvider with ChangeNotifier {
  List<Radio> _radios = [
    Radio(
        id: "1",
        name: "Egypt Quran Kareem",
        radioUrl: "https://stream.radiojar.com/8s5u5tpdtwzuv",
        isFavorite: false,
        radioImage:
            "https://i.pinimg.com/564x/5e/92/4d/5e924dbe9f53f8611cb9d15828205ff9.jpg"),
    Radio(
        id: "2",
        name: "Saudi Quran Kareem",
        radioUrl: "http://stream.radiojar.com/0tpy1h0kxtzuv",
        isFavorite: false,
        radioImage:
            "https://i.pinimg.com/564x/3a/a1/a1/3aa1a107c9434ca52b42b2dd0ffc896f.jpg"),
    Radio(
        id: "3",
        name: "Almagd",
        isFavorite: false,
        radioUrl: "http://r1.tarat.com:8196/",
        radioImage:
            "https://upload.wikimedia.org/wikipedia/commons/2/2a/%D9%82%D9%86%D8%A7%D8%A9-%D8%A7%D9%84%D9%85%D8%AC%D8%AF-%D9%84%D9%84%D9%82%D8%B1%D8%A2%D9%86-%D8%A7%D9%84%D9%83%D8%B1%D9%8A%D9%85.png"),
    Radio(
        id: "4",
        name: "Abdulbaset Abdulsamad",
        isFavorite: false,
        radioUrl: "https://qurango.net/radio/abdulbasit_abdulsamad_mojawwad",
        radioImage:
            "https://quran.com.kw/wp-content/uploads/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE-%D8%B9%D8%A8%D8%AF%D8%A7%D9%84%D8%A8%D8%A7%D8%B3%D8%B7-%D8%B9%D8%A8%D8%AF%D8%A7%D9%84%D8%B5%D9%85%D8%AF.jpg"),
    Radio(
        id: "5",
        isFavorite: false,
        name: "Al menshawy",
        radioUrl: "https://qurango.net/radio/mohammed_siddiq_alminshawi",
        radioImage:
            "https://i1.sndcdn.com/artworks-000160297914-7w50zo-t500x500.jpg"),
    Radio(
        id: "6",
        isFavorite: false,
        name: "Mohamed Refaat",
        radioUrl: "http://3vh.liveradiu.com:8000/mohamed-refaat.mp3",
        radioImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlpI2Mz-8RDcmjaOx08fdnX4X_uMWB0BNsoA&usqp=CAU"),
  ];
  List<Radio> get radios => _radios;

  toggleFavorite(Radio radio) {
    radio.isFavorite = !radio.isFavorite!;
    notifyListeners();
  }
}
