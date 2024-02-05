import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';

import '../models/player_model.dart';

class ProfileScreenController extends GetxController{

  RxInt listColorChange=0.obs;

  void changeListItemColor(int index){
    listColorChange.value=index;

}
  Rx<PlayerModel?> selectedPlayer1 = Rx<PlayerModel?>(null);
  Rx<PlayerModel?> selectedPlayer2 = Rx<PlayerModel?>(null);



  void setSelectedPlayer1(PlayerModel value) {
    selectedPlayer1.value = value;
  }
  void setSelectedPlayer2(PlayerModel value) {
    selectedPlayer2.value = value;
  }

void addPlayerModel(PlayerModel player){



}

  List<PlayerModel> players = [
    PlayerModel(
      name: 'Gaurez Del',
      rank:25,
      profileImage: MyAssetHelper.player1,
      type: 'FD',
      age: 25,
      debut: "19/05/2023",
      backgroundImage:  MyAssetHelper.player5,
      college: 'ABC University',
      weight: 75,
        height: 12

    ),
    PlayerModel(
      name: 'Jane Smith',
      profileImage: MyAssetHelper.player2,
      type: 'AD',
      debut: "4/27/2023",

      age: 28,
      rank:16,
      backgroundImage:  MyAssetHelper.player5,
      college: 'XYZ College',
      weight: 68,
        height: 12

    ),
    PlayerModel(
      name: 'Mike Johnson',
      profileImage: MyAssetHelper.player3,
      type: 'MF',
      age: 22,
      debut: "19/05/2023",
      rank:15,
      backgroundImage:  MyAssetHelper.player5,
      college: 'PQR Institute',
      weight: 70,
        height: 12

    ),
    PlayerModel(
      name: 'Williams',
      profileImage: MyAssetHelper.player4,
      type: 'Jr',
      age: 30,
      debut: "19/09/2023",

      rank:20,
      backgroundImage:  MyAssetHelper.player5,
      college: 'LMN College',
      weight: 80,
        height: 12

    ),
    PlayerModel(
      name: 'David Hell',
      profileImage: MyAssetHelper.player5,
      type: 'JK',
      age: 27,
      debut: "07/12/2023",
        height: 12,


        rank:32,
      backgroundImage:  MyAssetHelper.player5,
      college: 'QRS College',
      weight: 72,

    ),
    PlayerModel(
      name: 'David Brown',
      profileImage: MyAssetHelper.player6,
      type: 'Sr',
      age: 27,
      debut: "19/11/2022",

      rank:40,
      backgroundImage:  MyAssetHelper.player5,
      college: 'QRS College',
      weight: 72,
      height: 12
    ),  ];







}