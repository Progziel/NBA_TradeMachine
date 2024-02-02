


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_blue_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});



  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> teamHistoryMap = [
      {
        "teamName": "Charlotte Hornets ",
        "range": "2021-2024(#20)",
        "image":MyAssetHelper.teamHistory1,
      },
      {
        "teamName": "Charlotte Hornets ",
        "range": "2018-2020(#20)",
        "image":MyAssetHelper.teamHistory2,
      },
      {
        "teamName": "Charlotte Hornets ",
        "range": "2021-2024(#20)",
        "image":MyAssetHelper.teamHistory3,
      },
      {
        "teamName": "Charlotte Hornets ",
        "range": "2011-2017(#20)",
        "image":MyAssetHelper.teamHistory4,
      },

    ];

    List<Map<String, dynamic>> awardsMap = [
      {
        "type": "6x All Star ",
        "range": "",
      },
      {
        "type": "NIBA Champ ",
        "range": "2019",
      },
      {
        "type": "All-NIBA ",
        "range": "2015-2016",
      },

    ];
    double titleFont=13;
    double subtitleFont=12;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CustomBlueButton(text: "General Information"),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorAssets.primaryBackground,

                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          DetailSection(
                            titleFont: titleFont,
                            subtitleFont: subtitleFont,
                            title1: "Name",
                            subtitle1: 'Kyle Terell Lowry',
                            title2: 'Age',
                            subtitle2: '37 year old',
                            title3: 'College',
                            subtitle3: 'Villanova',
                            title4: 'Nicknames',
                            subtitle4: 'Mr.Roptar \n Klow\n G.R.O.A.T',),
                          VerticalDivider(
                            color: ColorAssets.grey,
                            thickness: 2,
                          ),
                          DetailSection(
                            titleFont: titleFont,
                            subtitleFont: subtitleFont,
                            title1: "Positions",
                            subtitle1: 'Point Guard',
                            title2: 'NBA Debut',
                            subtitle2: 'November 01, 2006',
                            title3: 'Born',
                            subtitle3: 'March 25 1986 in Philasaodipa Pynselivia',
                          ),
                          VerticalDivider(
                            color: ColorAssets.grey,
                            thickness: 2,
                          ),
                          DetailSection(
                            titleFont: titleFont,
                            subtitleFont: subtitleFont,
                            title1: "Shooting hand",
                            subtitle1: 'Right',
                            title2: 'Age',
                            subtitle2: '37 years old',
                            title3: 'College',
                            subtitle3: 'Villonava',
                          ),



                        ],
                      ),
                    ),
                  )

                ],
              ),
              SizedBox(height: Get.height*0.01,),

              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBlueButton(text: "Contract"),


                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      padding: EdgeInsets.all(20  ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorAssets.primaryBackground,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContractRowDetails(titleFont: titleFont, subtitleFont: subtitleFont),
                          SizedBox(height: Get.height*0.02,),
                          ContractRowDetails(titleFont: titleFont, subtitleFont: subtitleFont),
                          SizedBox(height: Get.height*0.02,),
                          ContractRowDetails(titleFont: titleFont, subtitleFont: subtitleFont),
                          SizedBox(height: Get.height*0.02,),
                          ContractRowDetails(titleFont: titleFont, subtitleFont: subtitleFont),
                          SizedBox(height: Get.height*0.02,),
                          ContractRowDetails(titleFont: titleFont, subtitleFont: subtitleFont),






                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.01,),


              //Agents
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBlueButton(text: "Agents",),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                      padding: EdgeInsets.all(20  ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorAssets.primaryBackground,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(text: "Marks Besltein (#4) 62 Contacts worth \$ 2.2B 22 teams Priority Sports & Entertainment ",
                            textColor: ColorAssets.black,fontSize: 15,align: TextAlign.center,)







                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.01,),



              //NBA Draft
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomBlueButton(text: "NBA DRAFT 2010",),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                      padding: EdgeInsets.all(20  ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorAssets.primaryBackground,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Symbols.sports_basketball),
                              CustomTextWidget(text: "Round 1 Pick #9  ",textColor: ColorAssets.black,fontSize: 15,

                                align: TextAlign.center,),
                            ],
                          )







                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.01,),


              //Team History
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBlueButton(text: "Team History ",),


                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                      padding: EdgeInsets.all(20  ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorAssets.primaryBackground,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),

                            itemCount: teamHistoryMap.length,
                            itemBuilder: (BuildContext context, int index)

                            => Container(
                                width: Get.width*0.28,
                                decoration: BoxDecoration(
                                    color: ColorAssets.buttonSecondary,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child:Column(
                                  children: [
                                    ListTile(
                                      leading: Image.asset(teamHistoryMap[index]["image"]),
                                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),

                                      title:CustomTextWidget(text: teamHistoryMap[index]["teamName"],fontSize: 16,fontWeight: FontWeight.bold,),
                                      subtitle:CustomTextWidget(text:teamHistoryMap[index]["range"]),

                                    ),
                                    Divider()
                                  ],
                                )
                            ),

                          ),







                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.01,),



              //Awards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBlueButton(text: "Awards ",),



                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                      padding: EdgeInsets.all(20  ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorAssets.primaryBackground,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: awardsMap.length,
                            itemBuilder: (BuildContext context, int index)

                            => Container(
                                width: Get.width*0.28,
                                decoration: BoxDecoration(
                                    color: ColorAssets.buttonSecondary,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child:Column(
                                  children: [
                                    ListTile(
                                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),

                                      title:CustomTextWidget(text: awardsMap[index]["type"],fontSize: 16,fontWeight: FontWeight.bold,),
                                      subtitle:CustomTextWidget(text:awardsMap[index]["range"]),

                                    ),
                                    Divider()
                                  ],
                                )
                            ),

                          ),







                        ],
                      ),
                    )

                  ],
                ),
              ),



            ],
          ),
        ),
      ) ,
    );
  }
}


class ContractRowDetails extends StatelessWidget {
  const ContractRowDetails({
    super.key,
    required this.titleFont,
    required this.subtitleFont,
  });

  final double titleFont;
  final double subtitleFont;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(text:"2024",textColor: ColorAssets.black,fontWeight: FontWeight.bold,fontSize: titleFont),
            CustomTextWidget(text: "\$26.9M",textColor: ColorAssets.black,fontWeight: FontWeight.w500,fontSize: subtitleFont,),
          ],
        ),
        Divider(endIndent: 5,indent: 5,),

      ],
    );
  }
}

class DetailSection extends StatelessWidget {
  const DetailSection({
    super.key,
    required this.titleFont,
    required this.subtitleFont, required this.title1, required this.subtitle1, required this.title2,
    required this.subtitle2, required this.title3, required this.subtitle3,  this.title4="",  this.subtitle4="",
  });

  final double titleFont;
  final double subtitleFont;
  final String title1;
  final String subtitle1;
  final String title2;
  final String subtitle2;
  final String title3;
  final String subtitle3;
  final String title4;
  final String subtitle4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CustomTextWidget(text:title1,textColor: ColorAssets.black,fontWeight: FontWeight.bold,fontSize: titleFont),
            CustomTextWidget(text: subtitle1,textColor: ColorAssets.black,fontWeight: FontWeight.w500,fontSize: subtitleFont,),
            SizedBox(height: Get.height*0.022,),
            CustomTextWidget(text: title2,textColor: ColorAssets.black,fontWeight: FontWeight.bold,fontSize: titleFont),
            CustomTextWidget(text:subtitle2,textColor: ColorAssets.black,fontWeight: FontWeight.w500,fontSize: subtitleFont,),
            SizedBox(height: Get.height*0.022,),
            CustomTextWidget(text: title3,textColor: ColorAssets.black,fontWeight: FontWeight.bold,fontSize: titleFont),
            CustomTextWidget(text: subtitle3,textColor: ColorAssets.black,fontWeight: FontWeight.w500,fontSize: subtitleFont,),
            SizedBox(height: Get.height*0.022,),

            CustomTextWidget(text:title4,textColor: ColorAssets.black,fontWeight: FontWeight.bold,fontSize: titleFont),
            CustomTextWidget(text: subtitle4,textColor: ColorAssets.black,fontWeight: FontWeight.w500,fontSize: subtitleFont,),
            SizedBox(height: Get.height*0.022,),


          ],

        ),
      ),
    );
  }
}
