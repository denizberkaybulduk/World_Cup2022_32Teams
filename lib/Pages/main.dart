import 'package:flutter/material.dart';
import 'package:world_cup/Constants/app_constants.dart';
import 'package:world_cup/Data/team_data.dart';
import 'package:world_cup/Models/teams.dart';
import 'package:world_cup/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World Cup 2022",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.routeGenerator,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff46256C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 4,
              child: Container(
                  child: Image.asset(
                "assets/FifaWC2022/WC7.png",
              ))),
          Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.all(50),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      fixedSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 55 / 100,
                          MediaQuery.of(context).size.width * 1 / 7)),
                    ),
                    child: Text(
                      "SEE ALL TEAMS",
                      style: Constants.font_style,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/SelectTeamPage");
                    },
                  ))),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
