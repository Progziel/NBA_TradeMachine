import 'package:nbatrade/models/player_model_api.dart';

class TeamsModel {
  int? teamID;
  String? key;
  bool? active;
  String? city;
  String? name;
  int? leagueID;
  int? stadiumID;
  String? conference;
  String? division;
  String? primaryColor;
  String? secondaryColor;
  String? tertiaryColor;
  String? quaternaryColor;
  String? wikipediaLogoUrl;
  int? globalTeamID;
  int? nbaDotComTeamID;
  String? headCoach;
  List<PlayerModelApi>? players;

  TeamsModel(
      {this.teamID,
        this.key,
        this.active,
        this.city,
        this.name,
        this.leagueID,
        this.stadiumID,
        this.conference,
        this.division,
        this.primaryColor,
        this.secondaryColor,
        this.tertiaryColor,
        this.quaternaryColor,
        this.wikipediaLogoUrl,
        this.globalTeamID,
        this.nbaDotComTeamID,
        this.headCoach,this.players,});

  TeamsModel.fromJson(Map<String, dynamic> json) {
    teamID = json['TeamID'];
    key = json['Key'];
    active = json['Active'];
    city = json['City'];
    name = json['Name'];
    leagueID = json['LeagueID'];
    stadiumID = json['StadiumID'];
    conference = json['Conference'];
    division = json['Division'];
    primaryColor = json['PrimaryColor'];
    secondaryColor = json['SecondaryColor'];
    tertiaryColor = json['TertiaryColor'];
    quaternaryColor = json['QuaternaryColor'];
    wikipediaLogoUrl = json['WikipediaLogoUrl'];
    globalTeamID = json['GlobalTeamID'];
    nbaDotComTeamID = json['NbaDotComTeamID'];
    headCoach = json['HeadCoach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TeamID'] = this.teamID;
    data['Key'] = this.key;
    data['Active'] = this.active;
    data['City'] = this.city;
    data['Name'] = this.name;
    data['LeagueID'] = this.leagueID;
    data['StadiumID'] = this.stadiumID;
    data['Conference'] = this.conference;
    data['Division'] = this.division;
    data['PrimaryColor'] = this.primaryColor;
    data['SecondaryColor'] = this.secondaryColor;
    data['TertiaryColor'] = this.tertiaryColor;
    data['QuaternaryColor'] = this.quaternaryColor;
    data['WikipediaLogoUrl'] = this.wikipediaLogoUrl;
    data['GlobalTeamID'] = this.globalTeamID;
    data['NbaDotComTeamID'] = this.nbaDotComTeamID;
    data['HeadCoach'] = this.headCoach;
    return data;
  }
}