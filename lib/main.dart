import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/login/login_bloc.dart';
import 'package:flutter_login/blocs/login/login_state.dart';
import 'package:flutter_login/blocs/register/register_bloc.dart';
import 'package:flutter_login/blocs/register/register_state.dart';
import 'package:flutter_login/screens/splash_screen.dart';
import 'package:flutter_login/theme/color.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) {
          return LoginBloc(LoginInitial());
        }),
        BlocProvider(create: (BuildContext context) {
          return RegisterBloc(RegisterInitial());
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OnBoarding App',
        theme: ThemeData(
            primaryColor: primary,
            appBarTheme: AppBarTheme(
              color: Colors.white24,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            tabBarTheme: TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff4a8f9f),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              // labelPadding: EdgeInsets.symmetric(horizontal: 2,),
            ),
            inputDecorationTheme: InputDecorationTheme(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(color: primary),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 46, fontWeight: FontWeight.bold, color: textColor),
              headline2: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
              subtitle1: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
              subtitle2: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w600, color: textColor),
              bodyText1: TextStyle(fontSize: 16, color: textColor),
            )),
        home: SplashScreen(),
        // home: RootApp(),
      ),
    );
  }
}
