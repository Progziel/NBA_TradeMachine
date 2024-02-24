import 'package:get/get.dart';
import 'package:nbatrade/models/teams_model.dart';

import '../Api/api_service.dart';

class TradeController extends GetxController{
  Rx<TeamsModel?> selectedTeam = Rx<TeamsModel?>(null);
  RxList<TeamsModel> teamsInTabBar = <TeamsModel>[].obs;


  Future<void> addTeamToTabBar(TeamsModel team) async {
    team.players = await ApiService.fetchPlayerApi(team.key!);
    teamsInTabBar.add(team);
    update();
  }

  void removeTeamFromTabBar(TeamsModel team) {
    teamsInTabBar.remove(team);
    update();
  }


  TeamsModel getSelectedTeam(int i) => teamsInTabBar[i];

}
