import 'package:get/get.dart';

import '../models/post_model.dart';

class PostController extends GetxController{

  RxList<PostModel> posts = [
     PostModel(
      profilePictures: [
        "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
        "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
        // ... more profile pictures
      ],
      // playerModel: PlayerModel(
      //   // PlayerModel data here
      // ),
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description: "Check out this amazing trade proposal!",
      likeCount: 25,

      commentCount: 10,
      shareCount: 5,
      flamCount: 2,
      comments: [
        // Comments(
        //   imgUrl: "https://example.com/user3.png",
        //   username: "Jane Smith",
        //   comment: "Great idea!",
        //   time: "10 minutes ago",
        // ),
        // ... more comments
      ],
    ),
     PostModel(
      profilePictures: [
        // "https://example.com/user1.png",
        // "https://example.com/user2.png",
        // ... more profile pictures
      ],
      // playerModel: PlayerModel(
      //   // PlayerModel data here
      // ),
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description: "Check out this amazing trade proposal!",
      likeCount: 25,
      commentCount: 10,
      shareCount: 5,
      flamCount: 2,
      comments: [
        // Comments(
        //   imgUrl: "https://example.com/user3.png",
        //   username: "Jane Smith",
        //   comment: "Great idea!",
        //   time: "10 minutes ago",
        // ),
        // ... more comments
      ],
    ),
     PostModel(
      profilePictures: [
        "https://example.com/user1.png",
        "https://example.com/user2.png",
        // ... more profile pictures
      ],
      // playerModel: PlayerModel(
      //   // PlayerModel data here
      // ),
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description: "Check out this amazing trade proposal!",
      likeCount: 25,
      commentCount: 10,
      shareCount: 5,
      flamCount: 2,
      comments: [
        // Comments(
        //   imgUrl: "https://example.com/user3.png",
        //   username: "Jane Smith",
        //   comment: "Great idea!",
        //   time: "10 minutes ago",
        // ),
        // ... more comments
      ],
    ),
    // ... more PostModel objects
  ].obs;
}