import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_04/screens/liga%20Inggris/bola_model.dart';
import '../screens/Favorite/database_helper.dart';
import '../screens/Favorite/favorite_model.dart';

class BolaListItem extends StatelessWidget {
  final Team bola;
  final bool showBookmark;

  const BolaListItem({
    Key? key,
    required this.bola,
    this.showBookmark = true,
  }) : super(key: key);

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      bola.strBadge,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  bola.strTeam,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DetailText(
                  label: 'Liga',
                  value: bola.strLeague
                      .toString()
                      .split('.')
                      .last
                      .replaceAll('_', ' '),
                ),
                DetailText(label: 'Stadium', value: bola.strStadium),
                SizedBox(height: 16),
                Center(
                  child: FavoriteButton(bola: bola),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showDetailDialog(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            bola.strBadge,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                color: Colors.grey[300],
                child: Icon(Icons.error),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final String label;
  final String value;

  const DetailText({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '$label: $value',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final Team bola;

  const FavoriteButton({Key? key, required this.bola}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final status =
        await DatabaseHelper.instance.isFavorite(int.parse(widget.bola.idTeam));
    setState(() {
      isFavorite = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
        size: 30,
      ),
      onPressed: () async {
        if (isFavorite) {
          await DatabaseHelper.instance
              .removeFavorite(int.parse(widget.bola.idTeam));
          Get.snackbar('Sukses', 'Dihapus dari favorit');
        } else {
          final favoriteBola = FavoriteBola(
            malId: int.parse(widget.bola.idTeam),
            title: widget.bola.strTeam,
            type: widget.bola.strLeague.toString(),
            aired: widget.bola.strStadium,
            genres: widget.bola.strDescriptionEn,
            popularity: 0,
            imageUrl: widget.bola.strBadge,
          );
          await DatabaseHelper.instance.addFavorite(favoriteBola);
          Get.snackbar('Sukses', 'Ditambahkan ke favorit');
        }
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
