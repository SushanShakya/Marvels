import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels_app/repository/marvels_api_repository.dart';

import 'package:marvels_app/screens/main_screen.dart';
import 'package:marvels_app/services/network/marvel_network_service.dart';

import 'cubits/marvel_characters/marvelcharacters_cubit.dart';
import 'cubits/search_characters/searchcharacters_cubit.dart';

void main() => runApp(MarvelsApp());

class MarvelsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel's App",
      theme: ThemeData(
          primaryColor: Color(0xFF202020),
          bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF202020)),
          buttonTheme: ButtonThemeData(padding: EdgeInsets.all(5.0)),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Color(0xFF202020),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF202020),
              // selectedLabelStyle: TextStyle(color: Colors.red),
              // unselectedLabelStyle: TextStyle(color: Colors.white),
              showUnselectedLabels: true,
              unselectedIconTheme: IconThemeData(color: Colors.white),
              selectedIconTheme: IconThemeData(
                color: Colors.red,
              )),
          primaryIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchCharactersCubit(
                MarvelsApiRepository(MarvelNetworkService())),
          ),
          BlocProvider(
            create: (context) => MarvelCharactersCubit(
                MarvelsApiRepository(MarvelNetworkService())),
          )
        ],
        child: MainScreen(),
      ),
    );
  }
}
