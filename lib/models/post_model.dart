import 'package:nbatrade/models/player_model.dart';

class PostModel {
  List<PlayerModel>? playerModel;
 // final PlayerModel playerModel;
  final String channelName;
  final String postedBy;
  final String time;
  final String? postTitle;
  final String description;
  final int? likeCount;
  final int? commentCount;
  final int? shareCount;
  final int? flamCount;
  final List<Comments>? comments;
     bool? expended;
  final String? mediaPosted;
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
      this.shareCount,this.playerModel,
        this.mediaPosted,
        this.postTitle,

      });
}

class Comments {
  final String? imgUrl;
  final String? username;
  final String? comment;
  final String? time;
  const Comments({this.time, this.username, this.imgUrl, this.comment});
}
