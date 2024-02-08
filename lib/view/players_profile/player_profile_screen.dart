import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nbatrade/controllers/profile_screen_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import '../../helper/constants/custom_profile_appbar.dart';
import '../../helper/constants/profile_detail_widget.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProfileScreenController profileScreenController=Get.put(ProfileScreenController());

    List<Map<String, dynamic>> map = [
      {
        "text": "Bio",
        "icon": Symbols.add,
      },
      {
        "text": "Earnings",
        "icon": Symbols.paid,
      },
      {
        "text": "Stats",
        "icon":  Symbols.history,
      },
      {
        "text": "Contract",
        "icon": Symbols.handshake,
      },
      {
        "text": "Social",
        "icon":Symbols.south_america
      }
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.3), // Adjust the preferred height
        child: const CustomProfileAppBar(title: 'NBA  Machine',prefixIcon: Icons.arrow_back_ios_new_outlined,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.08,
        
              child:
               ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: map.length,
                  itemBuilder: (BuildContext context, int index)
                    => GestureDetector(
                      onTap: (){
                        profileScreenController.changeListItemColor(index);
                      },
                      child: Obx(()
                        => Container(
                        width: Get.width*0.28,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:profileScreenController.listColorChange.value==index? ColorAssets.buttonPrimary:ColorAssets.buttonSecondary,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(map[index]["icon"],color: profileScreenController.listColorChange.value==index? ColorAssets.white:ColorAssets.black,) ,
                               SizedBox(width: Get.width*0.01,),
                               CustomTextWidget(text:  map[index]["text"],textColor:profileScreenController.listColorChange.value==index? ColorAssets.white:ColorAssets.black,),
        
        
        
                              ],
                            ),
                                      ),
                      ),
                    ),
                ),
        
              ),
            ProfileDetails(),
        
        
        
          ],
        ),
      ),
    );
  }
}