import 'dart:ui';

import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: statefulLogin(),
    );
  }
}

// ignore: camel_case_types
class statefulLogin extends StatefulWidget {
  const statefulLogin({Key? key}) : super(key: key);

  @override
  _statefulLoginState createState() => _statefulLoginState();
}

// ignore: camel_case_types
class _statefulLoginState extends State<statefulLogin> {
  var fkey = GlobalKey<FormState>();
  var txtUserName = TextEditingController();
  var txtPassword = TextEditingController();

  Widget myTextField(
      {Icon? icon,
      String? hintText,
      String? labelText,
      String? Function(String?)? validator,
      TextEditingController? controller,
      String obscuringCharacter = "*",
      bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          // fillColor: Colors.white,
          // filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              // borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          icon: icon,
          errorStyle: TextStyle(color: Colors.white),
          hoverColor: Colors.white,
          labelStyle: TextStyle(),
        ),
        validator: validator,
        obscuringCharacter: obscuringCharacter,
        obscureText: obscureText,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 3,
          //     spreadRadius: 0.1,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFf6d365),
              Color(0xFFfda085),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: ClipPath(
                clipper: DrawClipTop(),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: DrawClipBottom(),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(bottom: 10, left: 20),
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              myTextField(
                                controller: txtUserName,
                                icon: Icon(Icons.person),
                                hintText: "Tên đăng nhập",
                                labelText: "Tên đăng nhập*",
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Vui lòng nhập tên đăng nhập";
                                  else
                                    return null;
                                },
                              ),
                              myTextField(
                                  controller: txtPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Vui lòng nhập mật khẩu";
                                    else if (value.length < 6)
                                      return "Nhập lại mật khẩu";
                                    else
                                      return null;
                                  },
                                  icon: Icon(Icons.lock_open),
                                  hintText: "Mật khẩu",
                                  labelText: "Mật khẩu*",
                                  obscureText: true),
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 30,
                                        right: 40,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xfffa709a),
                                          Color(0xFFfda085),
                                        ],
                                      ),
                                    ),
                                    child: Text("ĐĂNG NHẬP",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawClipBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.8, size.width / 2, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.35, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DrawClipTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.5,
        size.width * 0.4, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.7, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
