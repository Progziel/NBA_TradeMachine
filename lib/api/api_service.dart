import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:nbatrade/Api/api.dart';
import 'package:nbatrade/models/player_model_api.dart';
import 'package:nbatrade/models/player_season_stats.dart';
import 'package:nbatrade/models/team_selection_players.dart';
import 'package:nbatrade/models/teams_model.dart';

class ApiService{





  static Future<List<PlayerModelApi>> fetchPlayerApi(String teamCode) async{
     var response= await http.get(Uri.parse(APIData.baseUrl+"Players/"+teamCode+"?key="+APIData.key));

    try{
      if(response.statusCode==200){
        print("success");
      }
      else{
        print("network error");
        throw Exception("network error");
      }
    }catch(e){
      print("Something went wrong $e");

    }
     return List<PlayerModelApi>.from(json.decode(response.body).map((x) => PlayerModelApi.fromJson(x)));


  }



  static Future<List<TeamsModel>>  fetchTeams() async{
    var response= await http.get(Uri.parse(APIData.baseUrl+"AllTeams?key="+APIData.key));

    if(response.statusCode==200){
      return List<TeamsModel>.from(json.decode(response.body).map((x) => TeamsModel.fromJson(x)));
    }
    else{
      throw Exception("network error");
    }



  }




  static Future<List<TeamSelectionPlayers>>  fetchTeamsSelectionPlayer() async{
    var response= await http.get(Uri.parse(APIData.baseUrl+"PlayersActiveBasic?key="+APIData.key));

    if(response.statusCode==200){
      return List<TeamSelectionPlayers>.from(json.decode(response.body).map((x) => TeamSelectionPlayers.fromJson(x)));
    }
    else{
      throw Exception("network error");
    }
  }

  static Future<List<PlayerSeasonStates>>  fetchPlayerSeasonStats(String seasonYear) async{
    var response= await http.get(Uri.parse("https://api.sportsdata.io/v3/nba/stats/json/PlayerSeasonStats/2023?key=057828c791a0454da956d2f683a51301"));

    if(response.statusCode==200){
      print(response.body);

      return List<PlayerSeasonStates>.from(json.decode(response.body).map((x) => PlayerSeasonStates.fromJson(x)));
    }
    else{
      throw Exception("network error:"+response.statusCode.toString());
    }



  }

}