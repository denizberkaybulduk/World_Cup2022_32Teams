import 'dart:math';

import 'package:flutter/material.dart';

class Team extends Tournament{
  String team_name;
  String team_logo;
  Color team_dark_color;
  Color team_light_color;
  int att_power = 70;
  int def_power = 70;
  bool isEliminated = false;
  bool isFirst = false;
  bool isSecond = false;
  bool isThird = false;
  bool isFourt = false;
  int team_points = 0;
  int team_group_gd = 0;
  Team (this.team_name, this.team_logo, this.team_dark_color, this.team_light_color );
}







class Tournament {
  
  List<Team> Pot1 = [];
  List<Team> Pot2 = [];
  List<Team> Pot3 = [];
  List<Team> Pot4 = [];

  List<Team> GroupA = [];
  List<Team> GroupB = [];
  List<Team> GroupC = [];
  List<Team> GroupD = [];
  List<Team> GroupE = [];
  List<Team> GroupF = [];
  List<Team> GroupG = [];
  List<Team> GroupH = [];
  
  List groups = [];
  
}







class Fixture {
  List<Match> week1 = [];
  List<Match> week2 = [];
  List<Match> week3 = [];
  List<Match> round16 = [];
  List<Match> qf = [];
  List<Match> sf = [];
  List<Match> fm = [];
  
}









class Match {
  Team team1;
  Team team2;
  
  Match(this.team1, this.team2){
    List<Team> teams = [team1, team2];
  }
  int team1_score = 0;
  int team2_score = 0;

  ResultGroup(){
    for (var i = 0; i < 10; i++) {
      int position_chance = Random().nextInt(team1.att_power + team2.att_power);
      if (position_chance<team1.att_power) {
        int goal_chance = Random().nextInt(team1.att_power + team2.def_power*3);
       if (goal_chance<team1.att_power) {
          team1_score++;
          team1.team_group_gd++;
          team2.team_group_gd--;
        }
      }
      else {
        int goal_chance = Random().nextInt(team2.att_power + team1.def_power*3);
        if (goal_chance<team2.att_power) {
          team2_score++;
          team2.team_group_gd++;
          team1.team_group_gd--;
        }
      }
    }

    if (team1_score>team2_score) {
      team1.team_points = team1.team_points + 3;
    }
    else if (team2_score>team1_score){
      team2.team_points = team2.team_points + 3;
    }
    else {
      team1.team_points++;
      team2.team_points++;
    }
    
  }



  ResultKnockout(){
    for (var i = 0; i < 10; i++) {
      int position_chance = Random().nextInt(team1.att_power + team2.att_power);
      if (position_chance<team1.att_power) {
        int goal_chance = Random().nextInt(team1.att_power + team2.def_power*3);
        if (goal_chance<team1.att_power) {
          team1_score++;
          
        }
      }
      else {
        int goal_chance = Random().nextInt(team2.att_power + team1.def_power*3);
        if (goal_chance<team2.att_power) {
          team2_score++;
          
        }
      }
    }

    if (team1_score>team2_score) {
      team2.isEliminated = true;
    }
    else if (team2_score>team1_score){
      team1.isEliminated = true;
    }
    else {
      int pen_chance = Random().nextInt(team1.att_power + team2.att_power);
      if (pen_chance<team1.att_power){
        team2.isEliminated = true;
      }
      else {
        team1.isEliminated = true;
      }
    }
  }
}
