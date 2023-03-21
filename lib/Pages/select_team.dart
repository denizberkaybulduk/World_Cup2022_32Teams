import 'package:flutter/material.dart';
import 'package:world_cup/Constants/app_constants.dart';
import 'package:world_cup/Models/teams.dart';
import 'package:world_cup/Data/team_data.dart';
import 'package:world_cup/Routes/routes.dart';

class SelectTeamPage extends StatelessWidget {
  late List<Team> allTeams;
  late Tournament wc2022;
  late Fixture fixture;
  
  
  SelectTeamPage(){
    allTeams = generateTeams();
    wc2022 = generateTournament(allTeams);
    fixture = generateFixture(wc2022);
    
    
  }

  

  
    

  @override
  Widget build(BuildContext context) {
    double heightContainer = MediaQuery.of(context).size.height * 1 / 9;
    double widthContainer = MediaQuery.of(context).size.width * 1 / 4;

    return Scaffold(
      backgroundColor: Color(0xff46256C),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Center(child: Text("SELECT A TEAM", style: Constants.font_style2,)),
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 48, 18, 82),
            expandedHeight: 20,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            list_teams_row(context, allTeams[0] , allTeams[1] , allTeams[2] , allTeams[3] ),
            list_teams_row(context, allTeams[4] , allTeams[5] , allTeams[6] , allTeams[7] ),
            list_teams_row(context, allTeams[8] , allTeams[9] , allTeams[10] , allTeams[11] ),
            list_teams_row(context, allTeams[12] , allTeams[13] , allTeams[14] , allTeams[15] ),
            list_teams_row(context, allTeams[16] , allTeams[17] , allTeams[18] , allTeams[19] ),
            list_teams_row(context, allTeams[20] , allTeams[21] , allTeams[22] , allTeams[23] ),
            list_teams_row(context, allTeams[24] , allTeams[25] , allTeams[26] , allTeams[27] ),
            list_teams_row(context, allTeams[28] , allTeams[29] , allTeams[30] , allTeams[31] ),
          ]))
        ],
      ),
    );
  }

  Container list_teams_row(BuildContext context, Team team1, Team team2, Team team3, Team team4) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1 / 6,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TeamIcon(context, team1),
        TeamIcon(context, team2),
        TeamIcon(context, team3),
        TeamIcon(context, team4),
      ]),
    );
  }

  Container TeamIcon(BuildContext context, Team team) {
    return Container(

      height: MediaQuery.of(context).size.height * 1 / 6,
      width: MediaQuery.of(context).size.width * 1 / 4,
      child: IconButton(
        padding: EdgeInsets.all(15),
        icon: Image.asset(
          team.team_logo, 
          fit: BoxFit.contain,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/GamePlayPage", arguments: TeamArguments(team, wc2022, fixture, fixture.week1) );
        },
      ),
    );
  }

  List<Team> generateTeams (){
    List<Team> gecici = [];
    for (int i = 0; i<32; i++){
    gecici.add(Team(teamData.teamNames[i],teamData.teamLogos[i], teamData.teamDarkColors[i], teamData.teamLightColors[i]));
  }
  return gecici;
  }
  
   
  Tournament generateTournament (List<Team> allTeams){
    Tournament wc2022 = Tournament();
    wc2022.Pot1.add(allTeams[0]);
    wc2022.Pot1.add(allTeams[2]);
    wc2022.Pot1.add(allTeams[3]);
    wc2022.Pot1.add(allTeams[11]);
    wc2022.Pot1.add(allTeams[10]);
    wc2022.Pot1.add(allTeams[26]);
    wc2022.Pot1.add(allTeams[22]);
    wc2022.Pot1.add(allTeams[21]);

    wc2022.Pot2.add(allTeams[7]);
    wc2022.Pot2.add(allTeams[8]);
    wc2022.Pot2.add(allTeams[12]);
    wc2022.Pot2.add(allTeams[19]);
    wc2022.Pot2.add(allTeams[27]);
    wc2022.Pot2.add(allTeams[29]);
    wc2022.Pot2.add(allTeams[30]);
    wc2022.Pot2.add(allTeams[17]);

    wc2022.Pot3.add(allTeams[14]);
    wc2022.Pot3.add(allTeams[15]);
    wc2022.Pot3.add(allTeams[16]);
    wc2022.Pot3.add(allTeams[18]);
    wc2022.Pot3.add(allTeams[20]);
    wc2022.Pot3.add(allTeams[24]);
    wc2022.Pot3.add(allTeams[25]);
    wc2022.Pot3.add(allTeams[28]);

    wc2022.Pot4.add(allTeams[31]);
    wc2022.Pot4.add(allTeams[4]);
    wc2022.Pot4.add(allTeams[5]);
    wc2022.Pot4.add(allTeams[6]);
    wc2022.Pot4.add(allTeams[9]);
    wc2022.Pot4.add(allTeams[13]);
    wc2022.Pot4.add(allTeams[1]);
    wc2022.Pot4.add(allTeams[23]);

    wc2022.Pot1.shuffle();
    wc2022.Pot2.shuffle();
    wc2022.Pot3.shuffle();
    wc2022.Pot4.shuffle();

    wc2022.GroupA = [wc2022.Pot1[0], wc2022.Pot2[0], wc2022.Pot3[0], wc2022.Pot4[0],];
    wc2022.GroupB = [wc2022.Pot1[1], wc2022.Pot2[1], wc2022.Pot3[1], wc2022.Pot4[1],];
    wc2022.GroupC = [wc2022.Pot1[2], wc2022.Pot2[2], wc2022.Pot3[2], wc2022.Pot4[2],];
    wc2022.GroupD = [wc2022.Pot1[3], wc2022.Pot2[3], wc2022.Pot3[3], wc2022.Pot4[3],];
    wc2022.GroupE = [wc2022.Pot1[4], wc2022.Pot2[4], wc2022.Pot3[4], wc2022.Pot4[4],];
    wc2022.GroupF = [wc2022.Pot1[5], wc2022.Pot2[5], wc2022.Pot3[5], wc2022.Pot4[5],];
    wc2022.GroupG = [wc2022.Pot1[6], wc2022.Pot2[6], wc2022.Pot3[6], wc2022.Pot4[6],];
    wc2022.GroupH = [wc2022.Pot1[7], wc2022.Pot2[7], wc2022.Pot3[7], wc2022.Pot4[7],];

    wc2022.groups = [wc2022.GroupA, wc2022.GroupB, wc2022.GroupC, wc2022.GroupD, wc2022.GroupE, wc2022.GroupF, wc2022.GroupG, wc2022.GroupH];


    for (var i = 0; i < 8; i++) {
      debugPrint("____________________");
      for(int j =0; j<4; j++){
      debugPrint(wc2022.groups[i][j].team_name);
    }
    }


    
    return wc2022;
  }





  Fixture generateFixture (Tournament wc2022){
    Fixture fixture = Fixture();
    
    for (int i = 0 ; i < 8 ; i++){
      fixture.week1.add(Match(wc2022.groups[i][0], wc2022.groups[i][1]));
      fixture.week1.add(Match(wc2022.groups[i][2], wc2022.groups[i][3]));
    }

    for (int i = 0 ; i < 8 ; i++){
      fixture.week2.add(Match(wc2022.groups[i][0], wc2022.groups[i][2]));
      fixture.week2.add(Match(wc2022.groups[i][1], wc2022.groups[i][3]));
    }

    for (int i = 0 ; i < 8 ; i++){
      fixture.week3.add(Match(wc2022.groups[i][0], wc2022.groups[i][3]));
      fixture.week3.add(Match(wc2022.groups[i][1], wc2022.groups[i][2]));
    }

    return fixture;
  }
  



}
