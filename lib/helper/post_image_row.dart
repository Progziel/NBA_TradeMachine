import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/models/player_model.dart';

List<Color>? list = [Colors.white,Colors.purple,Colors.green,Colors.yellow];

class PostImagesRow extends StatelessWidget {
 // final List<String>? profilePictures;
  final List<PlayerModel>? profilePictures;
  const PostImagesRow({Key? key,this.profilePictures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("print $profilePictures");
    return profilePictures != null
        ? Row(
      children: profilePictures!.map((profilePictures) => InkWell(
        onTap: (){
        //  Get.to(()=> PlayerProfile());
        },
        child: Container(
          // width: 30, // Set the width as needed
           width: 30, // Set the height as needed
          //color: color,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(profilePictures.profileImage!,),fit: BoxFit.fitHeight,
              )
            ),
          margin: EdgeInsets.all(4),
          // Set margin as needed
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
