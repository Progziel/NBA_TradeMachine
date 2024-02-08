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
        backgroundColor: ColorAssets.primaryBackground,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                  height: Get.height * 0.15,
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
      child: Card(
        color: Colors.grey.shade200,
        elevation: 2.0,
        child: Container(
          height: context.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(
                image: AssetImage(
                  "assets/images/newsplayers2.png",
                ),
                fit: BoxFit.cover),
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
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/newsplayers.png'),
                        radius: 50,
                      ),
                      Icon(CupertinoIcons.share, color: Colors.white),
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomTextWidget(
                      text: 'Trade Community',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const CustomTextWidget(
                      text: 's/trade_community',
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
                            textColor: ColorAssets.primary,
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
      ),
    );
  }
}
