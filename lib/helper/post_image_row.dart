import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/models/player_model.dart';
import 'package:nbatrade/models/post_model.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/player_profile_screen.dart';

List<Color>? list = [Colors.white,Colors.purple,Colors.green,Colors.yellow];

class PostImagesRow extends StatelessWidget {
  final double? length;
 // final List<String>? profilePictures;
  final List<PlayerModel>? profilePictures;
  final PostModel post;
  const PostImagesRow({Key? key,this.profilePictures, required this.post,this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("print $profilePictures");

    return profilePictures != null
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: profilePictures!.map((profilePictures) => InkWell(
        onTap: (){
        //  Get.to(()=> PlayerProfile());
        },
        child: GestureDetector(
          onTap: (){
            Get.to(PlayerProfileScreen());
          },
          child: Container(
            // width: 30, // Set the width as needed
             width: post.expended==true? context.width*0.22:context.width*0.1,// Set the height as needed
            //color: color,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(profilePictures.profileImage!,),fit: BoxFit.fitHeight,
                )
              ),
            // margin: EdgeInsets.symmetric(horizontal: 2),
            // Set margin as needed
          ),
        ),
      )).toList(),
    )
        : Container();
        // ? Row(
        //     children: profilePictures!
        //         .map((e) => Expanded(child: Image.network(fit: BoxFit.cover,e)))
        //         .toList())
        // : const SizedBox.shrink();
    // ();
    // return profilePictures != null
    //     ? ListView.builder(
    //   itemCount: profilePictures!.length,
    //   shrinkWrap: true,
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (BuildContext context, int index) {
    //     print(profilePictures);
    //     return Container(
    //       width: Get.width,
    //       decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: NetworkImage(profilePictures![index]),
    //             fit: BoxFit.fitHeight,
    //           ),
    //           color: Colors.yellow
    //       ),
    //     );
    //   },
    // )
    //     : const SizedBox();
  }
}

// import 'package:flutter/material.dart';
// import 'package:nbatrade/models/player_model.dart';
// import 'package:nbatrade/models/post_model.dart';
//
// class PostImagesRow extends StatelessWidget {
//   final List<PlayerModel>? profilePictures;
//   final PostModel post;
//   const PostImagesRow({Key? key, this.profilePictures, required this.post})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("print $profilePictures");
//     return profilePictures != null
//         ? Row(
//       children: [
//         for (final profilePicture in profilePictures!)
//           Expanded(
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(profilePicture.profileImage!),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     )
//         : Container();
//   }
// }
