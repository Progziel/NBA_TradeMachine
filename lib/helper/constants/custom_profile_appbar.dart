import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'colors.dart';

class CustomProfileAppBar extends StatelessWidget {
  final void Function()? prefixIconOnTap;
  final void Function()? sufixWidgetOnTap;
  final IconData? prefixIcon;
  final Widget? sufixWidget;
  final String title;

  const CustomProfileAppBar({
    Key? key,
    this.prefixIcon,
    required this.title,
    this.prefixIconOnTap,
    this.sufixWidget,
    this.sufixWidgetOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.8,
      decoration: const BoxDecoration(
        color: ColorAssets.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: prefixIconOnTap, child: Icon(prefixIcon,color: ColorAssets.white,)),
                if (sufixWidget != null)
                  InkWell(onTap: sufixWidgetOnTap, child: sufixWidget!),
              ],
            ),
            SizedBox(height: Get.height*0.02),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                //left text
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Column(
                        children: [
                          RichTextWidget(primaryText: "HT/WT ",secondaryText: "6'0 196 lbs" ,),
                          RichTextWidget(primaryText: "DOB ",secondaryText: "3/25/1986(37)" ,),
                          RichTextWidget(primaryText: "COLLEGE ",secondaryText: "Villanova" ,),
                          RichTextWidget(primaryText: "COLLEGE ",secondaryText: "Villanova" ,),
                          RichTextWidget(primaryText: "COLLEGE ",secondaryText: "Villanova" ,),

                        ]
                        ,
                      ),
                    ),
                  ),

                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Container(
                    width: 100.0,
                    height: Get.height*0.13,
                    decoration: BoxDecoration(

                      color:Colors.transparent,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(MyAssetHelper.profileScreenImage),
                        fit: BoxFit.fitWidth,
                      ),
                      border: Border.all(
                        color: ColorAssets.white,
                        width: 4.0,
                      ),
                    ),),



                    ],
                  ),
                ),

                //right text
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Column(
                      children: [
                       CustomTextWidget(text: "2023_2024 SEASON STATS",fontWeight: FontWeight.bold,fontSize: 9,textColor: ColorAssets.white,),
                        SizedBox(height: Get.height*0.01,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CustomTextWidget(text: "PTS",fontSize: 10,textColor: ColorAssets.white,),
                                CustomTextWidget(text: "8.2",fontWeight: FontWeight.bold,fontSize: 10,textColor: ColorAssets.white,),
                                CustomTextWidget(text: "14.4",fontSize: 10,textColor: ColorAssets.white,),



                              ],
                            ),
                            Column(
                              children: [
                                CustomTextWidget(text: "PTS",fontSize: 10,textColor: ColorAssets.white,),
                                CustomTextWidget(text: "8.2",fontWeight: FontWeight.bold,fontSize: 10,textColor: ColorAssets.white,),
                                CustomTextWidget(text: "14.4",fontSize: 10,textColor: ColorAssets.white,),



                              ],
                            ),
                            Column(
                              children: [
                                CustomTextWidget(text: "PTS",fontSize: 10,textColor: ColorAssets.white,),
                                CustomTextWidget(text: "8.2",fontWeight: FontWeight.bold,fontSize: 10,textColor: ColorAssets.white,),
                                CustomTextWidget(text: "14.4",fontSize: 10,textColor: ColorAssets.white,),



                              ],
                            )


                          ],
                        ),
                        SizedBox(height: Get.height*0.01,),
                        CustomTextWidget(text: "CAREER",fontWeight: FontWeight.bold,fontSize: 12,textColor: ColorAssets.white,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CustomTextWidget(text: "KELLY LOWRY",fontWeight: FontWeight.bold,fontSize: 17,textColor: ColorAssets.white,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(MyAssetHelper.subtitleImage,height: 30,),
                    CustomTextWidget(text: "charlotte Homlets. # 1. Point Guard",fontWeight: FontWeight.w500,fontSize: 12,textColor: ColorAssets.white,),
                  ],
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  const RichTextWidget({
    super.key, required this.primaryText, required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWidget(text: primaryText,fontSize: 12,textColor: ColorAssets.white,fontWeight: FontWeight.bold,),
        CustomTextWidget(text: secondaryText,fontSize: 10,textColor: ColorAssets.white,fontWeight: FontWeight.w500,)



      ],


      );
  }
}


