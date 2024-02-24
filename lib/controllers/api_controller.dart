import 'dart:convert';

import 'package:dio/dio.dart' as dioPackage;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nbatrade/Api/api.dart';
import 'package:nbatrade/Api/api_service.dart';
import 'package:nbatrade/models/player_model.dart';
import 'package:nbatrade/models/player_model_api.dart';
import 'package:nbatrade/models/player_season_stats.dart';
import 'package:nbatrade/models/team_selection_players.dart';
import 'package:nbatrade/models/teams_model.dart';

class APIController extends GetxController {
  RxList<PlayerModelApi?> listPlayer = <PlayerModelApi?>[].obs;
  RxList<TeamsModel> listTeam = <TeamsModel>[].obs;
  // RxList<TeamsModel> selectedTeams=<TeamsModel>[].obs;
  RxList<TeamsModel> availableTeams =
      <TeamsModel>[].obs; // New list for available teams

  RxList<TeamSelectionPlayers?> listTeamsPlayerSelection =
      <TeamSelectionPlayers?>[].obs;
  RxList<PlayerSeasonStates?> listPlayerSeasonStats =
      <PlayerSeasonStates?>[].obs;

  @override
  void onReady() {
    getTeamsApi();
    //  getPlayerApi(key);
    super.onReady();
  }

  void getTeamsApi() async {
    try {
      listTeam.value = await ApiService.fetchTeams();
      availableTeams.value = List.from(
          listTeam); // Initialize availableTeams with the fetched teams
    } catch (e) {
      debugPrint("errror" + e.toString());
    }
  }

  void getPlayerApi(String key) async {
    try {
      listPlayer.value = await ApiService.fetchPlayerApi(key);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTeamSelectionPlayer() async {
    try {
      listTeamsPlayerSelection.value =
          await ApiService.fetchTeamsSelectionPlayer();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void selectTeam(tradeController, TeamsModel team) async {
    await tradeController.addTeamToTabBar(team);
    availableTeams.remove(team);
    update();
  }

  void deselectTeam(tradeController, TeamsModel team) {
    tradeController.tabBarTeams.remove(team); // Remove the team from the TabBar
    availableTeams.add(team);
    update();
  }
  // void selectTeam(TeamsModel team) {
  //   selectedTeams.add(team);
  //   listTeam.remove(team);
  //   update();
  // }
  //
  // void deselectTeam(TeamsModel team) {
  //   selectedTeams.remove(team);
  //   listTeam.add(team);
  //   update();
  // }

  void getPlayerSeasonStats(String seasonYear) async {
    try {
      listPlayerSeasonStats.value =
          await ApiService.fetchPlayerSeasonStats(seasonYear);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // String k_m_b_generator(num) {
  //   if (num > 999 && num < 99999) {
  //     return "${(num / 1000).toStringAsFixed(1)} K";
  //   } else if (num > 99999 && num < 999999) {
  //     return "${(num / 1000).toStringAsFixed(0)} K";
  //   } else if (num > 999999 && num < 999999999) {
  //     return "${(num / 1000000).toStringAsFixed(1)} M";
  //   } else if (num > 999999999) {
  //     return "${(num / 1000000000).toStringAsFixed(1)} B";
  //   } else {
  //     return num.toString();
  //   }
  // }
}
