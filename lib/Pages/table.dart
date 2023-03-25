import 'package:flutter/material.dart';
import 'package:world_cup/Models/teams.dart';
import 'package:google_fonts/google_fonts.dart';

class TablePage extends StatelessWidget {
  final Team selectedTeam;
  final Tournament wc2022;
  final Fixture fixture;
  final List<Match> gameWeek;
  TablePage(
      {required this.selectedTeam,
      required this.wc2022,
      required this.fixture,
      required this.gameWeek});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedTeam.team_dark_color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: selectedTeam.team_light_color,
        title: Center(
            child: Text(selectedTeam.team_name.toUpperCase(),
                style: GoogleFonts.montserrat(
                    color: selectedTeam.team_dark_color,
                    fontWeight: FontWeight.w500))),
      ),
      body: Body(context),
    );
  }

  Container Body(BuildContext context) {
    return Container(
      child: showTable(wc2022.GroupA)
    );
  }

  

  showTable(List<Team> a) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              
              title: Text("Team Names"),
              trailing: Text("PTS GD"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                  child: Image.asset(a[3].team_logo)),
              title: Text(a[3].team_name),
              trailing: Text("${a[3].team_points} ${a[3].team_group_gd}"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                  child: Image.asset(a[2].team_logo)),
              title: Text(a[2].team_name),
              trailing: Text("${a[2].team_points} ${a[2].team_group_gd}"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                  child: Image.asset(a[1].team_logo)),
              title: Text(a[1].team_name),
              trailing: Text("${a[1].team_points} ${a[1].team_group_gd}"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Container(
                  child: Image.asset(a[0].team_logo)),
              title: Text(a[0].team_name),
              trailing: Text("${a[0].team_points} ${a[0].team_group_gd}"),
            ),
          ),
        ],
      ),
    );
  }
}
