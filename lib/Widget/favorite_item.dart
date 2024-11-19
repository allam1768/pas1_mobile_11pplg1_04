import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/Favorite/favorite_model.dart';
import '../screens/Favorite/database_helper.dart';

class BolaFavoriteItem extends StatelessWidget {
  final FavoriteBola bola;
  final VoidCallback? onDelete;

  const BolaFavoriteItem({
    Key? key,
    required this.bola,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            bola.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 50,
                height: 50,
                color: Colors.grey[300],
                child: Icon(Icons.error),
              );
            },
          ),
        ),
        title: Text(
          bola.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('${bola.type} \n ${bola.aired}'),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            bool? confirm = await Get.dialog<bool>(
              AlertDialog(
                title: Text('Konfirmasi'),
                content: Text('Apakah Anda yakin ingin menghapus tim ini dari favorit?'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(result: false),
                    child: Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () => Get.back(result: true),
                    child: Text('Hapus'),
                  ),
                ],
              ),
            );

            if (confirm == true) {
              await DatabaseHelper.instance.removeFavorite(bola.malId);
              Get.snackbar('Sukses', 'Dihapus dari favorit');
              onDelete?.call();
            }
          },
        ),
      ),
    );
  }
} 