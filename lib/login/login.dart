import 'package:flutter/material.dart';
import 'package:swishapp/login/forgot_password_page.dart';
import 'package:swishapp/login/sign_up_page.dart';

const primary = Color(0xffff7043);
const white = Color(0xffffffff);
const grey = Color(0xFFBDBDBD);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Log in',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "Sign In ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextField(
                cursorColor: grey,
                controller: _controllerEmail,
                decoration: InputDecoration(
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                  hintText: "exemple@email.com",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextField(
                obscureText: !isShowPassword,
                cursorColor: grey,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey)),
                    suffixIcon: FlatButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: Icon(
                          isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: grey,
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    gotoForgotPassword();
                  },
                  child: Align(
                    child: Text(
                      "Forgot your Password?",
                      style: TextStyle(color: Colors.red),
                    ),
                    alignment: Alignment.centerRight,
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        color: primary,
                        onPressed: () {
                          print("login action");
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: white),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "New on SWISH ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              InkWell(
                onTap: () {
                  goToSignUpPage();
                },
                child: Text(
                  "CREATE AN ACCOUNT",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToSignUpPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  gotoForgotPassword() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }
}
