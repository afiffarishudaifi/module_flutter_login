import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/login/login_bloc.dart';
import 'package:flutter_login/blocs/login/login_event.dart';
import 'package:flutter_login/blocs/login/login_state.dart';
import 'package:flutter_login/screens/register.dart';
import 'package:flutter_login/theme/animation.dart';
import 'package:flutter_login/widgets.dart/contant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nis = TextEditingController();
  TextEditingController password = TextEditingController();
  final feature = ["Login", "Registrasi"];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Color(0xfffdfdfdf),
          body: i == 0
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                                // TabBar Code
                                children: [
                                  Container(
                                    height: height / 10,
                                    width: width / 2,
                                    child: TopAnime(
                                      2,
                                      5,
                                      child: ListView.builder(
                                        itemCount: feature.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                i = index;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    feature[index],
                                                    style: TextStyle(
                                                      color: i == index
                                                          ? Colors.black
                                                          : Colors.grey,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                i == index
                                                    ? Container(
                                                        height: 3,
                                                        width: width / 9,
                                                        color: Colors.black,
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),

                                  // Profile
                                  RightAnime(
                                    1,
                                    15,
                                    curve: Curves.easeInOutQuad,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        // color: Colors.red[400],
                                        child: Image(
                                          image: NetworkImage(
                                              "https://ruangumkm.ilmanaf.com/public/img/default/launcher.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),

                            SizedBox(
                              height: 30,
                            ),

                            // Top Text
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              width: width,
                              child: TopAnime(
                                1,
                                20,
                                curve: Curves.fastOutSlowIn,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Selamat Datang,",
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "Peserta Onboarding",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: height / 18,
                            ),

                            // TextFiled
                            Column(
                              children: [
                                Container(
                                  width: width / 1.2,
                                  height: height / 1.62,
                                  //  color: Colors.red,
                                  child: TopAnime(
                                    1,
                                    15,
                                    curve: Curves.easeInExpo,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          // readOnly: true, // * Just for Debug
                                          controller: nis,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          showCursor: true,
                                          //cursorColor: mainColor,
                                          decoration: kTextFiledInputDecoration
                                              .copyWith(
                                                  hintText: "87654321",
                                                  labelText: "nis"),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          obscureText: true,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          showCursor: true,
                                          controller: password,
                                          decoration: kTextFiledInputDecoration
                                              .copyWith(
                                                  hintText: "rangga",
                                                  labelText: "Password"),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              loginBloc.add(
                                                LoginButtonPressed(
                                                    nis: nis.text,
                                                    password: password.text),
                                              );
                                            },
                                            child: Text(
                                              "LOGIN",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .merge(
                                                    TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .primaryColor,
                                              padding: EdgeInsets.all(20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginFinished) {
                            if (state.errorCode == 0) {
                              Fluttertoast.showToast(
                                  msg: state.errorMessage,
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Berhasil Login',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                )
              : Register(),
        ),
      ),
    );
  }
}
