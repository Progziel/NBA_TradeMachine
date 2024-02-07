import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class SpaceScreen extends StatelessWidget {
  const SpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          CustomSpaceCard(),
          CustomSpaceCard(),
          CustomSpaceCard(),
          CustomSpaceCard(),
        ],
      ),
    );
  }
}

class CustomSpaceCard extends StatelessWidget {
  const CustomSpaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.25,
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                "https://img.freepik.com/free-photo/football-background-with-frame_23-2147832085.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
              ),
            ),
            boxShadow: [],
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.transparent,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(CupertinoIcons.share, color: Colors.transparent),
                    CircleAvatar(radius: 40),
                    Icon(CupertinoIcons.share, color: Colors.white),
                  ],
                ),
              ),
            )),
            Expanded(
                child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  const CustomTextWidget(
                    text: 'College Basketball community',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const CustomTextWidget(
                    text: 's/general',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const CustomTextWidget(
                          text: 's/general',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black54,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const CustomTextWidget(
                          text: 'Joined',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const CustomTextWidget(
                          text: '167k Members',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black54,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
