import 'package:nbatrade/models/player_model.dart';

class PostModel {
  final List<String>? profilePictures;
 // final PlayerModel playerModel;
  final String channelName;
  final String postedBy;
  final String time;
  final String description;
  final int? likeCount;
  final int? commentCount;
  final int? shareCount;
  final int? flamCount;
  final List<Comments>? comments;
     bool? expended;
   PostModel(
      {
       // required this.playerModel,
        required this.description,
      required this.postedBy,
      required this.time,
      this.comments,
      required this.channelName,
      this.commentCount,
      this.flamCount,
      this.likeCount,
        this.expended = false,
      this.shareCount,this.profilePictures});
}

class Comments {
  final String? imgUrl;
  final String? username;
  final String? comment;
  final String? time;
  const Comments({this.time, this.username, this.imgUrl, this.comment});
}