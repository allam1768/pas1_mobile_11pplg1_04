import 'package:get/get.dart';
import 'bola_service.dart';
import 'bola_model.dart';

class BolaController extends GetxController {
  var isLoading = true.obs;
  var teamList = <BolaModel>[].obs;

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  void fetchTeams() async {
    try {
      isLoading(true);
      var teams = await BolaService().fetchTeams();
      teamList.assignAll([teams]);
    } catch (e) {
      print('Error fetching teams: $e');
    } finally {
      isLoading(false);
    }
  }
}