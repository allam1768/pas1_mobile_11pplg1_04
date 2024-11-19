import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bola_model.dart';

class BolaService {
  final String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  Future<BolaModel> fetchTeams() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return BolaModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load teams');
    }
  }
}


