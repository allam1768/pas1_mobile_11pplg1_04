import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/bola_list.dart';
import 'bola_controller.dart';

class BolaView extends StatelessWidget {
  final BolaController footballController = Get.put(BolaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team'),
      ),
      body: Obx(() {
        if (footballController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        final teams = footballController.teamList.isNotEmpty 
            ? footballController.teamList[0].teams 
            : [];
            
        return GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: teams.length,
          itemBuilder: (context, index) {
            return BolaListItem(bola: teams[index]);
          },
        );
      }),
    );
  }
}
