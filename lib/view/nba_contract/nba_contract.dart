import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/player_model.dart';

import '../approval/approval.dart';

class NbaContractScreen extends StatelessWidget {
  const NbaContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: Get.height * 0.19,
            flexibleSpace: FlexibleSpaceBar(
              background: PreferredSize(
                preferredSize: Size.fromHeight(Get.height * 0.28),
                child: CustomAppBar2(
                  title: 'NBA Contracts',
                  prefixIcon: Icons.arrow_back_ios,
                  prefixIconOnTap: () {
                    Get.back();
                    // Handle back button tap
                  },
                  sufixWidget: const CircleAvatar(),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
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
          )
        ],
      ),
    );
  }
}

class PlayerTable extends StatelessWidget {
  const PlayerTable({super.key});

  @override
  Widget build(BuildContext context) {
    // this is dummy user data Start
    List<PlayerModel> players = [
      PlayerModel(
        name: 'Player1',
        position: 'C',
        total: '\$667m',
        avg: '\$69m.',
        years: '5 yrs',
        fa: '2023',
        signedUsing: 'Bird',
        per: '31.2',
        exp: '8',
        age: 33,
      ),
      PlayerModel(
        name: 'Player2',
        position: 'PF',
        total: '\$550m',
        avg: '\$60m.',
        years: '4 yrs',
        fa: '2024',
        signedUsing: 'Cap Space',
        per: '28.5',
        exp: '7',
        age: 25,
      ),
      // Add more players
      PlayerModel(
        name: 'Player3',
        position: 'SG',
        total: '\$480m',
        avg: '\$55m.',
        years: '3 yrs',
        fa: '2025',
        signedUsing: 'Mid-Level Exception',
        per: '25.0',
        exp: '6',
        age: 24,
      ),
      PlayerModel(
        name: 'Player1',
        position: 'C',
        total: '\$667m',
        avg: '\$69m.',
        years: '5 yrs',
        fa: '2023',
        signedUsing: 'Bird',
        per: '31.2',
        exp: '8',
        age: 23,
      ),
      PlayerModel(
        name: 'Player2',
        position: 'PF',
        total: '\$550m',
        avg: '\$60m.',
        years: '4 yrs',
        fa: '2024',
        signedUsing: 'Cap Space',
        per: '28.5',
        exp: '7',
        age: 23,
      ),
      // Add more players
      PlayerModel(
        name: 'Player3',
        position: 'SG',
        total: '\$480m',
        avg: '\$55m.',
        years: '3 yrs',
        fa: '2025',
        signedUsing: 'Mid-Level Exception',
        per: '25.0',
        exp: '6',
        age: 23,
      ),
      PlayerModel(
        name: 'Player1',
        position: 'C',
        total: '\$667m',
        avg: '\$69m.',
        years: '5 yrs',
        fa: '2023',
        signedUsing: 'Bird',
        per: '31.2',
        exp: '8',
        age: 25,
      ),
      PlayerModel(
        name: 'Player2',
        position: 'PF',
        total: '\$550m',
        avg: '\$60m.',
        years: '4 yrs',
        fa: '2024',
        signedUsing: 'Cap Space',
        per: '28.5',
        exp: '7',
        age: 25,
      ),
      // Add more players
      PlayerModel(
        name: 'Player3',
        position: 'SG',
        total: '\$480m',
        avg: '\$55m.',
        years: '3 yrs',
        fa: '2025',
        signedUsing: 'Mid-Level Exception',
        per: '25.0',
        exp: '6',
        age: 25,
      ),
      PlayerModel(
        name: 'Player1',
        position: 'C',
        total: '\$667m',
        avg: '\$69m.',
        years: '5 yrs',
        fa: '2023',
        signedUsing: 'Bird',
        per: '31.2',
        exp: '8',
        age: 28,
      ),
      PlayerModel(
        name: 'Player2',
        position: 'PF',
        total: '\$550m',
        avg: '\$60m.',
        years: '4 yrs',
        fa: '2024',
        signedUsing: 'Cap Space',
        per: '28.5',
        exp: '7',
        age: 25,
      ),
      // Add more players
      PlayerModel(
        name: 'Player3',
        position: 'SG',
        total: '\$480m',
        avg: '\$55m.',
        years: '3 yrs',
        fa: '2025',
        signedUsing: 'Mid-Level Exception',
        per: '25.0',
        exp: '6',
        age: 25,
      ), // Add more players as needed
    ];
    // Close dummy user data
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        // ignore: deprecated_member_use
        dataRowHeight: 70,
        dataRowColor: MaterialStateColor.resolveWith(
            (states) => ColorAssets.primaryBackground),
        columnSpacing: 20.0,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => ColorAssets.primary),
        columns: [
          const DataColumn(label: SizedBox(width: 100, child: Text('Player'))),
          const DataColumn(label: SizedBox(child: Text('Position'))),
          const DataColumn(label: SizedBox(child: Text('Total'))),
          const DataColumn(label: SizedBox(child: Text('Avg.'))),
          const DataColumn(label: SizedBox(child: Text('Years'))),
          const DataColumn(label: SizedBox(child: Text('FA'))),
          const DataColumn(label: SizedBox(child: Text('Signed Using'))),
          DataColumn(
            label: const SizedBox(
                child: Text('PER', style: TextStyle(color: Colors.white))),
            onSort: (columnIndex, ascending) {
              // Handle sorting logic for PER column
            },
          ),
          DataColumn(
            label: const SizedBox(
                child: Text('EXP', style: TextStyle(color: Colors.white))),
            onSort: (columnIndex, ascending) {
              // Handle sorting logic for EXP column
            },
          ),
          DataColumn(
            label: const SizedBox(
                child: Text('AGE', style: TextStyle(color: Colors.white))),
            onSort: (columnIndex, ascending) {
              // Handle sorting logic for AGE column
            },
          ),
        ],
        rows: players.map((player) {
          return DataRow(cells: [
            DataCell(SizedBox(
              width: 110,
              height: 50,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/images/a.jpg'),
                  ),
                  const SizedBox(width: 5),
                  Text(player.name ?? "")
                ],
              ),
            )),
            DataCell(SizedBox(child: Text(player.position ?? ""))),
            DataCell(SizedBox(child: Text(player.total ?? ""))),
            DataCell(SizedBox(child: Text(player.avg ?? ""))),
            DataCell(SizedBox(child: Text(player.years ?? ""))),
            DataCell(SizedBox(child: Text(player.fa ?? ""))),
            DataCell(SizedBox(child: Text(player.signedUsing ?? ""))),
            DataCell(SizedBox(child: Text(player.per ?? ""))),
            DataCell(SizedBox(child: Text(player.exp ?? ""))),
            DataCell(SizedBox(child: Text(player.age.toString()))),
          ]);
        }).toList(),
      ),
    );
  }
}
