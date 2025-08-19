import 'package:get/get.dart';
import 'package:latihan1/models/football_models.dart';

class FootballController extends GetxController {
  var players = <Players>[
    Players(
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg/500px-Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg",
      nama: "Cristiano Ronaldo",
      posisi: "ST",
      nomorpunggung: 7
    ),
    Players(
    imageUrl: "https://i.pinimg.com/1200x/ed/06/94/ed0694106712a4ab6236c9316f3c9ef3.jpg",
    nama: "Lionel Messi",
    posisi: "ST",
    nomorpunggung: 10)
    
  ].obs;

  void editPlayer(int index, Players updatedPlayer) {
  players[index] = updatedPlayer;
  }
}