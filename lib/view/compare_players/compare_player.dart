


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/profile_screen_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_blue_button.dart';
import 'package:nbatrade/helper/constants/custom_reusable_appbar.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class ComparePlayerScreen extends StatelessWidget {
  const ComparePlayerScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.3), // Adjust the preferred height
          child: const CustomReusableAppBar(text: "Compare NBA Players",)
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
          
                    Row(
                      children: [
                        TopSection(imagePath: MyAssetHelper.player1, type: "SF", rank: 30,),
                        TopSection(imagePath: MyAssetHelper.player2, type: "SF", rank: 30,),
                      ],
                    ),
                SizedBox(height: Get.height*0.02,),
          
                PlayerDetailSection(heading: "Information",),
                SizedBox(height: Get.height*0.02,),
                PlayerDetailSection(heading:"Contract"),
                SizedBox(height: Get.height*0.02,),

                PlayerDetailSection(heading:"Season Stats"),
                SizedBox(height: Get.height*0.02,),

                PlayerDetailSection(heading:"Career Stats"),
                SizedBox(height: Get.height*0.02,),

                PlayerDetailSection(heading:"Lebron Stats"),





              ],
            ),
          ),
        ),
      
      
      ),
    );
  }
}

class PlayerDetailSection extends StatelessWidget {
  final String heading;
  const PlayerDetailSection({
    super.key, required this.heading,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: Get.width,

      decoration: BoxDecoration(
        color: ColorAssets.primaryBackground,
      ),
        child: Stack(
          children: [
            Column(
              children: [
                CustomBlueButton(text: heading),
                SizedBox(height: Get.height*0.02,),


                ReusableRow(leftInfo: '19/20/2002', rightInfo: '19/20/2020', centerInfo: 'Debut',),
                ReusableRow(leftInfo: '19/20/2002', rightInfo: '19/20/2020', centerInfo: 'Debut',),

                ReusableRow(leftInfo: '19/20/2002', rightInfo: '19/20/2020', centerInfo: 'Debut',),




              ],
            ),

          ],
        ));
  }
}

class ReusableRow extends StatelessWidget {
  final String leftInfo;
  final String rightInfo;
  final String centerInfo;

  const ReusableRow({
    super.key, required this.leftInfo, required this.rightInfo, required this.centerInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 5),

      decoration: BoxDecoration(
        border:Border.all(
            color: ColorAssets.black

        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),


          child: CustomTextWidget( text: leftInfo,textColor: ColorAssets.black,fontSize: 15,align: TextAlign.center,),

        ),
          Container(

            padding: EdgeInsets.all(8),

            decoration: BoxDecoration(
              color: ColorAssets.infoCardColor,
              border:Border.all(
                  color: ColorAssets.black

              ),
            ),
            child:CustomTextWidget(text: centerInfo, textColor: ColorAssets.white,fontSize: 15,align: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),


            child: CustomTextWidget( text: rightInfo,textColor: ColorAssets.black,fontSize: 15,align: TextAlign.center,),

          ),

        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final String imagePath;
  final String type;
  final int rank;
  const TopSection({
    super.key, required this.imagePath, required this.type, required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
          width: Get.width,
            height: Get.height*0.2,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorAssets.white
              ),
              gradient:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[ColorAssets.buttonPrimary, ColorAssets.error]),
      
              image: DecorationImage(
                fit: BoxFit.fitWidth,

                image:AssetImage(imagePath

                ),

              )
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextWidget(text: type, textColor: ColorAssets.white,fontSize: 15,align: TextAlign.center,),
                CustomTextWidget(text: "#"+rank.toString(),textColor: ColorAssets.white,fontSize: 15,align: TextAlign.center,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropDown(dropDownText: "Select a player",width: Get.width, playerNames: ["Rakesh ","rakesh","Atta"],
            ),
          )
        ],
      
      ),
    );
  }
}







class CustomDropDown extends StatefulWidget {
  final List<String> playerNames;
  final String dropDownText;
  final double? width;
  const CustomDropDown({super.key, required this.dropDownText, this.width, required this.playerNames});
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}
class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(

      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: CustomTextWidget(
            text: widget.dropDownText,
            textColor: ColorAssets.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        items: widget.playerNames
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: CustomTextWidget(
              text: item,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ))
            .toList(),
        value: selectedValue,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(


          height: 50,
          width: context.width,

          padding: const EdgeInsets.all(4),

          decoration:  BoxDecoration(

            color: ColorAssets.white,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),



        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 18,
          iconEnabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}