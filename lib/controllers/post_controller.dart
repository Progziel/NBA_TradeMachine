import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/player_model.dart';
import '../models/post_model.dart';

class PostController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }



  TextEditingController postNameController = TextEditingController();
  TextEditingController postDescriptionController = TextEditingController();






  void myFeedTogglePostExpansion(PostModel post) {
      post.expended = !post.expended!;
    }
    void togglePostExpansion(PostModel post) {
      post.expended = !post.expended!;
    }

    createPost(){}



    RxList<PostModel> myFeedPosts = [
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
        channelName: "NBATrade Channel",
        postedBy: "John Doe",
        time: "15 minutes ago",
        description: "Check out this amazing trade proposal!",
        likeCount: 25,

        commentCount: 10,
        shareCount: 5,
        flamCount: 2,
        comments: [
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet. Keep up the good work!",
            time: "6 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "15 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet  Keep up the good work!",
            time: "20 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "17 minutes ago",
          ),
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
        description: "Check out this amazing trade proposal!",
        likeCount: 25,

        commentCount: 10,
        shareCount: 5,
        flamCount: 2,
        comments: [
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet. Keep up the good work!",
            time: "6 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "15 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet  Keep up the good work!",
            time: "20 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "17 minutes ago",
          ),
        ],
      ),
    ].obs;
    RxList<PostModel> trendingPosts = [
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
        channelName: "NBATrade Channel",
        postedBy: "John Doe",
        time: "15 minutes ago",
        description: "Check out this amazing trade proposal!",
        likeCount: 25,

        commentCount: 10,
        shareCount: 5,
        flamCount: 2,
        comments: [
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet. Keep up the good work!",
            time: "6 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "15 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet  Keep up the good work!",
            time: "20 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "17 minutes ago",
          ),
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
        description: "Check out this amazing trade proposal!",
        likeCount: 25,

        commentCount: 10,
        shareCount: 5,
        flamCount: 2,
        comments: [
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet. Keep up the good work!",
            time: "6 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "15 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Nice post! First post. Lorem ipsum dolor sit amet.First post. Lorem ipsum dolor sit amet  Keep up the good work!",
            time: "20 minutes ago",
          ),
          const Comments(
            imgUrl: "https://example.com/user3.png",
            username: "Jane Smith",
            comment: "Great idea!",
            time: "17 minutes ago",
          ),
        ],
      ),
    ].obs;




  List<RxBool> fireEffects = List.generate(
             20,
          (index) => true.obs
  );


  // RxBool fireEffect=true.obs;
  void changeFire(int index){
    fireEffects[index].value=!fireEffects[index].value;

  }

  List<RxBool> heartEffects = List.generate(
      20,
          (index) => true.obs
  );


  // RxBool fireEffect=true.obs;
  void changeHeart(int index){
    heartEffects[index].value=!heartEffects[index].value;

  }




}