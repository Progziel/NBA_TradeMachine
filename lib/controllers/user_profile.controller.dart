import 'package:get/get.dart';

import '../models/player_model.dart';
import '../models/post_model.dart';

class UserProfileController extends GetxController{

  RxList<PostModel> myPosts = [
    PostModel(
      playerModel: [
        PlayerModel(
          name: "Player 1",
          profileImage: "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
        ),
        PlayerModel(
          name: "Player 2",
          profileImage: "https://storage.googleapis.com/nbarankings-theringer-com-cms/public/media/ringerbasketballhub/players/DonovanMitchellM-small.png",
        ),
        PlayerModel(
          name: "Player 3",
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIbHtVscP83DXbGIPDyt4bkO_w0rNN_b3gA&usqp=CAU",
        ),
        PlayerModel(
          name: "Player 4",
          profileImage: "https://images.wsj.net/im-261194/square",
        ),
        // Add more players as needed
      ],
      // playerModel: PlayerModel(
      //   // PlayerModel data here
      // ),
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description: "Warriors: PG. Steph SG. Klay SF. Grant  PF. Dray C. Looney CP3 Kuminga Podz Saric GPII Seth Jackson-Davis Despite their issues, the Warriors are STILL 4th in 3-pointers made. But only 14th in 3%. Grant is shooting 40% from 3 on 5 attempts and he will take them off "
          "the dribble or contested. We all know Seth can shoot, 37% this year but 43% for his career. "
          "This would be a MASSIVE upgrade over Wiggins 29% from 3 and Moody's 36%. Does anyone REALLY want to face the Warriors "
          "in the playoffs with a healthy Steph and Dray shooting more 3s than anyone on 38-40% as a team? Hell no! "
          "That's why this trade is worth the FRP. They will live and die by the 3 but they get hot they can torch anyone."
          " Twolves... Nuggets... Lakers... So watch out Celtics... Curry could do something historical this year.",
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
      playerModel: [
        PlayerModel(
          name: "Player 1",
          profileImage: "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
        ),
        PlayerModel(
          name: "Player 2",
          profileImage: "https://storage.googleapis.com/nbarankings-theringer-com-cms/public/media/ringerbasketballhub/players/DonovanMitchellM-small.png",
        ),
        PlayerModel(
          name: "Player 3",
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIbHtVscP83DXbGIPDyt4bkO_w0rNN_b3gA&usqp=CAU",
        ),
        PlayerModel(
          name: "Player 4",
          profileImage: "https://images.wsj.net/im-261194/square",
        ),
        // Add more players as needed
      ],
      // playerModel: PlayerModel(
      //   // PlayerModel data here
      // ),
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description:  "Warriors: PG. Steph SG. Klay SF. Grant PF. Dray C. Looney CP3 Kuminga Podz Saric GPII Seth Jackson-Davis Despite their issues, the Warriors are STILL 4th in 3-pointers made. But only 14th in 3%. Grant is shooting 40% from 3 on 5 attempts and he will take them off "
          "the dribble or contested. We all know Seth can shoot, 37% this year but 43% for his career. "
          "This would be a MASSIVE upgrade over Wiggins 29% from 3 and Moody's 36%. Does anyone REALLY want to face the Warriors "
          "in the playoffs with a healthy Steph and Dray shooting more 3s than anyone on 38-40% as a team? Hell no! "
          "That's why this trade is worth the FRP. They will live and die by the 3 but they get hot they can torch anyone."
          " Twolves... Nuggets... Lakers... So watch out Celtics... Curry could do something historical this year.",
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
      playerModel: [
        PlayerModel(
          name: "Player 1",
          profileImage: "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
        ),
        PlayerModel(
          name: "Player 2",
          profileImage: "https://storage.googleapis.com/nbarankings-theringer-com-cms/public/media/ringerbasketballhub/players/DonovanMitchellM-small.png",
        ),
        PlayerModel(
          name: "Player 3",
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIbHtVscP83DXbGIPDyt4bkO_w0rNN_b3gA&usqp=CAU",
        ),
        PlayerModel(
          name: "Player 4",
          profileImage: "https://images.wsj.net/im-261194/square",
        ),
        // Add more players as needed
      ],
      // playerModel: PlayerModel(
      //   // PlayerModel data here
      // ),
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description: " Warriors: PG. Steph SG. Klay SF. Grant PF. Dray C. Looney CP3 Kuminga Podz Saric GPII Seth Jackson-Davis Despite their issues, the Warriors are STILL 4th in 3-pointers made. But only 14th in 3%. Grant is shooting 40% from 3 on 5 attempts and he will take them off "
    "the dribble or contested. We all know Seth can shoot, 37% this year but 43% for his career. "
    "This would be a MASSIVE upgrade over Wiggins 29% from 3 and Moody's 36%. Does anyone REALLY want to face the Warriors "
    "in the playoffs with a healthy Steph and Dray shooting more 3s than anyone on 38-40% as a team? Hell no! "
    "That's why this trade is worth the FRP. They will live and die by the 3 but they get hot they can torch anyone."
    " Twolves... Nuggets... Lakers... So watch out Celtics... Curry could do something historical this year.",
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
      playerModel: [
        PlayerModel(
          name: "Player 1",
          profileImage: "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
        ),
        PlayerModel(
          name: "Player 2",
          profileImage: "https://storage.googleapis.com/nbarankings-theringer-com-cms/public/media/ringerbasketballhub/players/DonovanMitchellM-small.png",
        ),
      ],
      channelName: "NBATrade Channel",
      postedBy: "John Doe",
      time: "15 minutes ago",
      description: "Warriors: PG. Steph SG. Klay SF. Grant PF. Dray C. Looney CP3 Kuminga Podz Saric GPII Seth Jackson-Davis Despite their issues, the Warriors are STILL 4th in 3-pointers made. But only 14th in 3%. Grant is shooting 40% from 3 on 5 attempts and he will take them off "
          "the dribble or contested. We all know Seth can shoot, 37% this year but 43% for his career. "
          "This would be a MASSIVE upgrade over Wiggins 29% from 3 and Moody's 36%. Does anyone REALLY want to face the Warriors "
          "in the playoffs with a healthy Steph and Dray shooting more 3s than anyone on 38-40% as a team? Hell no! "
          "That's why this trade is worth the FRP. They will live and die by the 3 but they get hot they can torch anyone."
          " Twolves... Nuggets... Lakers... So watch out Celtics... Curry could do something historical this year.",
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
  ].obs;




  void myFeedTogglePostExpansion(PostModel post) {
    post.expended = !post.expended!;
  }

  void togglePostExpansion(PostModel post) {
    post.expended = !post.expended!;
  }
}