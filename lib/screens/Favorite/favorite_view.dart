import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/favorite_item.dart';
import 'favorite_model.dart';
import 'database_helper.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
      ),
      body: FutureBuilder<List<FavoriteBola>>(
        future: DatabaseHelper.instance.getAllFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          }
          
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Belum ada tim favorit'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final bola = snapshot.data![index];
              return BolaFavoriteItem(
                bola: bola,
                onDelete: () {
                  Get.forceAppUpdate();
                },
              );
            },
          );
        },
      ),
    );
  }
} 