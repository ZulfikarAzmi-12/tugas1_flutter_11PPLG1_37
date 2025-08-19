import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/controllers_football.dart';
import 'package:latihan1/models/football_models.dart';
import 'package:latihan1/routes/routes.dart';

class FootballPages extends StatelessWidget {
  FootballPages({super.key});
  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("List Player"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      player.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    player.nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  subtitle: Text(
                    "${player.posisi}, ${player.nomorpunggung}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.blueAccent),
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.editPage,
                      arguments: {"index": index, "player": player},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
