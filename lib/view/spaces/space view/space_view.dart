import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class SpaceScreen extends StatelessWidget {
  const SpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                  height: Get.height * 0.18,
                  decoration: const BoxDecoration(
                    color: ColorAssets.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_outlined,
                                color: ColorAssets.grey,
                              ),
                            ),
                            CircleAvatar(
                                backgroundImage: AssetImage(
                                    MyAssetHelper.profileScreenImage))
                          ],
                        ),
                      ),
                      const CustomTextWidget(
                        text: 'Trade Machine',
                        textColor: ColorAssets.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const CustomSpaceCard();
              },
            )
          ],
        ),
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
        height: context.height * 0.3,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                "https://img.freepik.com/free-photo/football-background-with-frame_23-2147832085.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
              ),
              fit: BoxFit.cover),
          border: Border.all(color: Colors.black45),
        ),
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
              color: Colors.white,
              child: Column(
                children: [
                  const CustomTextWidget(
                    text: 'Trade Community',
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
