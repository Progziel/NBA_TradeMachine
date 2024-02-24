class PlayerSeasonStates {

  String? name;
  String? team;
  String? position;

  String? updated;


  bool? isClosed;
  String? lineupConfirmed;
  String? lineupStatus;

  PlayerSeasonStates(
      {
        this.name,
        this.team,
        this.position,

        this.updated,



        this.isClosed,
        this.lineupConfirmed,
        this.lineupStatus});

  PlayerSeasonStates.fromJson(Map<String, dynamic> json) {

    name = json['Name'];
    team = json['Team'];
    position = json['Position'];

    updated = json['Updated'];



    isClosed = json['IsClosed'];
    lineupConfirmed = json['LineupConfirmed'];
    lineupStatus = json['LineupStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Name'] = this.name;
    data['Team'] = this.team;
    data['Position'] = this.position;

    data['Updated'] = this.updated;



    data['IsClosed'] = this.isClosed;
    data['LineupConfirmed'] = this.lineupConfirmed;
    data['LineupStatus'] = this.lineupStatus;
    return data;
  }
}