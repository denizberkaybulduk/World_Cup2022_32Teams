import 'package:flutter/material.dart';
import 'package:world_cup/Constants/app_constants.dart';
import 'package:world_cup/Models/teams.dart';
import 'package:world_cup/Routes/routes.dart';
import 'select_team.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  final Team selectedTeam;
  final Tournament wc2022;
  final Fixture fixture;
  List<Match> gameWeek;
  late List<Match> nextGameWeek;
  late Team oppTeam;
  late int selectedTeamScore;
  late int oppTeamScore;

  ResultsPage(
      {required this.selectedTeam,
      required this.wc2022,
      required this.fixture,
      required this.gameWeek}) {
    nextGameWeek = findNextWeek(gameWeek)!;
    oppTeam = findOpponent(gameWeek, selectedTeam);
    for (var i = 0; i < gameWeek.length; i++) {
      gameWeek[i].ResultGroup();
      if (gameWeek[i].team1 == selectedTeam) {
        selectedTeamScore = gameWeek[i].team1_score;
        oppTeamScore = gameWeek[i].team2_score;
      } else if (gameWeek[i].team2 == selectedTeam) {
        selectedTeamScore = gameWeek[i].team2_score;
        oppTeamScore = gameWeek[i].team1_score;
      }
    }
  }

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

  Column Body(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1 / 5,
                width: MediaQuery.of(context).size.width * 3 / 10,
                child: Image.asset(selectedTeam.team_logo),
              ),
              Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 1 / 5,
                      alignment: Alignment.center,
                      child: Text(
                        "$selectedTeamScore - $oppTeamScore",
                        style: Constants.font_style,
                        textScaleFactor: 1.7,
                      ))),
              Container(
                  height: MediaQuery.of(context).size.height * 1 / 5,
                  width: MediaQuery.of(context).size.width * 3 / 10,
                  child: Image.asset(oppTeam.team_logo)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1 / 5 * 1 / 3,
                width: MediaQuery.of(context).size.width * 3 / 10,
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      selectedTeam.team_name.toUpperCase(),
                      style: Constants.font_style,
                    )),
              ),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 1 / 5 * 1 / 3,
                alignment: Alignment.center,
              )),
              Container(
                height: MediaQuery.of(context).size.height * 1 / 5 * 1 / 3,
                width: MediaQuery.of(context).size.width * 3 / 10,
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      oppTeam.team_name.toUpperCase(),
                      style: Constants.font_style,
                    )),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1 / 5 * 1 / 7,
                width: MediaQuery.of(context).size.width * 3 / 10,
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      "Points: ${selectedTeam.team_points}",
                      style: Constants.font_style,
                    )),
              ),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 1 / 5 * 1 / 7,
                alignment: Alignment.center,
              )),
              Container(
                height: MediaQuery.of(context).size.height * 1 / 5 * 1 / 7,
                width: MediaQuery.of(context).size.width * 3 / 10,
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      "Points: ${oppTeam.team_points}",
                      style: Constants.font_style,
                    )),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(selectedTeam.team_light_color),
              fixedSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width * 55 / 100,
                  MediaQuery.of(context).size.width * 1 / 7)),
            ),
            child: Container(
              height: MediaQuery.of(context).size.width * 1 / 7,
              width: MediaQuery.of(context).size.width * 55 / 100,
              padding: EdgeInsets.all(5),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Go to Next Week",
                  style: GoogleFonts.montserrat(
                      color: selectedTeam.team_dark_color,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/GamePlayPage", arguments: TeamArguments(selectedTeam, wc2022, fixture, nextGameWeek));
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: gameWeek.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: selectedTeam.team_light_color,
                  child: ListTile(
                    textColor: selectedTeam.team_dark_color,
                    leading: Container(
                        height: MediaQuery.of(context).size.height * 1 / 6,
                        width: MediaQuery.of(context).size.width * 1 / 4,
                        child: Image.asset(gameWeek[index].team1.team_logo)),
                    title: Text(
                      "${gameWeek[index].team1_score} - ${gameWeek[index].team2_score}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(),
                    ),
                    trailing: Container(
                        height: MediaQuery.of(context).size.height * 1 / 6,
                        width: MediaQuery.of(context).size.width * 1 / 4,
                        child: Image.asset(gameWeek[index].team2.team_logo)),
                  ),
                );
              }),
        )
      ],
    );
  }

  Team findOpponent(List<Match> week, Team selectedTeam) {
    for (var i = 0; i < week.length; i++) {
      if (week[i].team1 == selectedTeam) {
        return week[i].team2;
      } else if (week[i].team2 == selectedTeam) {
        return week[i].team1;
      }
    }
    return selectedTeam;
  }

  List<Match>? findNextWeek(List<Match> week){
    if (week == fixture.week1){
      return fixture.week2;
    }
    else if (week == fixture.week2){
      return fixture.week3;
    }
    else if (week == fixture.week3){
      return fixture.round16;
    }
    else if (week == fixture.round16){
      return fixture.qf;
    }
    else if (week == fixture.qf){
      return fixture.sf;
    }
    else if (week == fixture.sf){
      return fixture.fm;
    }
  }
}
