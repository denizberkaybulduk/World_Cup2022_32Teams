import 'package:flutter/material.dart';
import 'package:world_cup/Models/teams.dart';
import 'package:google_fonts/google_fonts.dart';

class FixturePage extends StatelessWidget {
  final Team selectedTeam;
  final Tournament wc2022;
  final Fixture fixture;
  final List<Match> gameWeek;
  FixturePage({required this.selectedTeam,
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
                style: GoogleFonts.montserrat(color: selectedTeam.team_dark_color, fontWeight: FontWeight.w500))),
      ),
      body: Body(context),
    );
  }
  Container Body(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: gameWeek.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            
            color: selectedTeam.team_light_color,
            child: ListTile(
              
              textColor: selectedTeam.team_dark_color,
              leading: Container(
                
                height: MediaQuery.of(context).size.height * 1 / 6,
                width: MediaQuery.of(context).size.width * 1 / 4,
                child: Image.asset(gameWeek[index].team1.team_logo)),
              title: Text("vs", textAlign: TextAlign.center, style: GoogleFonts.montserrat(),),
              trailing: Container(
                height: MediaQuery.of(context).size.height * 1 / 6,
                width: MediaQuery.of(context).size.width * 1 / 4,
                child: Image.asset(gameWeek[index].team2.team_logo)),

            ),
          );
        }
        ),
    );
  }
}