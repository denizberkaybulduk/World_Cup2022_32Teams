import 'package:flutter/material.dart';
import 'package:world_cup/Models/teams.dart';
import 'package:world_cup/Pages/main.dart';
import 'package:world_cup/Pages/results.dart';
import 'package:world_cup/Pages/select_team.dart';
import 'package:world_cup/Pages/gameplay.dart';
import 'package:world_cup/Pages/fixture.dart';
import 'package:world_cup/Pages/table.dart';

class TeamArguments {
    final Team team;
    final Tournament wc2022;
    final Fixture fixture;
    final List<Match> gameWeek;
    TeamArguments(this.team, this.wc2022, this.fixture, this.gameWeek);

  }



class Routes {
  static Route<dynamic>? routeGenerator (RouteSettings settings){

    switch (settings.name) {
      case "/":
      return MaterialPageRoute(builder: (context)=>HomePage());

      case "/SelectTeamPage":
      return MaterialPageRoute(builder: (context)=>SelectTeamPage()); 

      case "/GamePlayPage":
      final args = settings.arguments as TeamArguments;
      return MaterialPageRoute(builder: (context)=>GamePlayPage(selectedTeam: args.team, wc2022: args.wc2022, fixture: args.fixture, gameWeek: args.gameWeek), settings: settings); 

      case "/ResultsPage":
      final args = settings.arguments as TeamArguments;
      return MaterialPageRoute(builder: (context)=>ResultsPage(selectedTeam: args.team, wc2022: args.wc2022, fixture: args.fixture, gameWeek: args.gameWeek), settings: settings);

      case "/FixturePage":
      final args = settings.arguments as TeamArguments;
      return MaterialPageRoute(builder: (context)=>FixturePage(selectedTeam: args.team, wc2022: args.wc2022, fixture: args.fixture, gameWeek: args.gameWeek), settings: settings);

      case "/TablePage":
      final args = settings.arguments as TeamArguments;
      return MaterialPageRoute(builder: (context)=>TablePage(selectedTeam: args.team, wc2022: args.wc2022, fixture: args.fixture, gameWeek: args.gameWeek), settings: settings);
             
      default:
      return MaterialPageRoute(builder: (context)=>HomePage());
    }





  } 
}