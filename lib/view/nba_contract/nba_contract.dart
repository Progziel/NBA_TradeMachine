import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class NbaCotractScreen extends StatelessWidget {
  const NbaCotractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.28),
        child: CustomAppBar2(
            title: 'NBA Contracts',
            prefixIcon: Icons.arrow_back_ios,
            prefixIconOnTap: () {
              // Handle back button tap
            },
            sufixWidget: CircleAvatar()),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Spacer(),
                CustomTextWidget(
                  text: 'SORT',
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  Symbols.swap_vert,
                  weight: 400,
                ),
                SizedBox(width: 5),
                CustomTextWidget(
                  text: 'FILTER',
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  Symbols.filter_list,
                  weight: 400,
                ),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 10),
            PlayerTable(),
          ],
        ),
      ),
    );
  }
}

class PlayerTable extends StatelessWidget {
  const PlayerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        dataRowHeight: 70,
        dataRowColor: MaterialStateColor.resolveWith(
            (states) => ColorAssets.primaryBackground),
        columnSpacing: 20.0,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => ColorAssets.primary),
        columns: [
          DataColumn(label: SizedBox(child: Text('Player'))),
          DataColumn(label: SizedBox(child: Text('Position'))),
          DataColumn(label: SizedBox(child: Text('Total'))),
          DataColumn(label: SizedBox(child: Text('Avg.'))),
          DataColumn(label: SizedBox(child: Text('Years'))),
          DataColumn(label: SizedBox(child: Text('FA'))),
          DataColumn(label: SizedBox(child: Text('Signed Using'))),
          DataColumn(
            label: SizedBox(
                child: Text('PER', style: TextStyle(color: Colors.white))),
            onSort: (columnIndex, ascending) {
              // Handle sorting logic for PER column
            },
          ),
          DataColumn(
            label: SizedBox(
                child: Text('EXP', style: TextStyle(color: Colors.white))),
            onSort: (columnIndex, ascending) {
              // Handle sorting logic for EXP column
            },
          ),
          DataColumn(
            label: SizedBox(
                child: Text('AGE', style: TextStyle(color: Colors.white))),
            onSort: (columnIndex, ascending) {
              // Handle sorting logic for AGE column
            },
          ),
        ],
        rows: List.generate(
          100,
          (index) => DataRow(
            cells: [
              const DataCell(
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/images/a.jpg'),
                  ),
                ),
              ),
              DataCell(SizedBox(child: Text('C $index'))),
              DataCell(SizedBox(child: Text('\$667m $index'))),
              DataCell(SizedBox(child: Text('\$69m. $index'))),
              DataCell(SizedBox(child: Text('5 yrs $index'))),
              DataCell(SizedBox(child: Text('2023 $index'))),
              DataCell(SizedBox(child: Text('Bird $index'))),
              DataCell(SizedBox(child: Text('31.2 $index'))),
              DataCell(SizedBox(child: Text('8 $index'))),
              DataCell(SizedBox(child: Text('28 $index'))),
            ],
          ),
        ),
      ),
    );
  }
}

//   app bar

class CustomAppBar2 extends StatelessWidget {
  final void Function()? prefixIconOnTap;
  final void Function()? sufixWidgetOnTap;
  final IconData? prefixIcon;
  final Widget? sufixWidget;
  final String title;

  const CustomAppBar2({
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
      height: Get.height * 0.2,
      decoration: const BoxDecoration(
        color: ColorAssets.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: prefixIconOnTap,
                  child: Icon(
                    prefixIcon,
                    color: ColorAssets.white,
                  ),
                ),
                const Spacer(),
                if (sufixWidget != null)
                  InkWell(onTap: sufixWidgetOnTap, child: sufixWidget!),
                if (sufixWidget == null) const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40),
            child: CustomTextWidget(
                text: title,
                textColor: ColorAssets.white,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
