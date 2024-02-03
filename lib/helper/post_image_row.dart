import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostImagesRow extends StatelessWidget {
  final List<String>? profilePictures;
  const PostImagesRow( {Key? key,this.profilePictures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return profilePictures != null
        ? ListView.builder(
      itemCount: profilePictures!.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        print(profilePictures);
        return Container(
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(profilePictures![index]),
                fit: BoxFit.cover,
              ),
              color: Colors.yellow
          ),
        );
      },
    )
        : const SizedBox();
  }
}