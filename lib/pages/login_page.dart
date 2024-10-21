import 'package:flutter/material.dart';
import 'package:new_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(loginpage());
}

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => loginpageState();
}

class loginpageState extends State<loginpage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.Homeroute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.theme.colorScheme.onPrimary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/dark _login.jpg",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 38,
                      ),
                      Text(
                        "Welcome ",
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "$name",
                          style: TextStyle(
                            color: context.theme.colorScheme.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        cursorColor: context.theme.colorScheme.primary,
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: context.theme.colorScheme.primary,
                            letterSpacing: 1.6,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.theme.colorScheme.primary,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: context.theme.colorScheme.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be Empty!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;

                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        cursorColor: context.theme.colorScheme.primary,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: context.theme.colorScheme.primary,
                            letterSpacing: 1.7,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.theme.colorScheme.primary,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: context.theme.colorScheme.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be Empty!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: context.theme.colorScheme.primary,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 30 : 5),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () => MoveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: changeButton ? 50 : 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: context.theme.colorScheme.onPrimary,
                                    size: 25,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color:
                                          context.theme.colorScheme.onPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
