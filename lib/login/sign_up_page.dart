import 'package:flutter/material.dart';
import 'package:swishapp/login/shippingaddress.dart';

const primary = Color(0xffff7043);
const white = Color(0xffffffff);
const grey = Color(0xFFBDBDBD);

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkBoxValue = false;
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  final TextEditingController _controllerFullname = new TextEditingController();
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
          'Create Account',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    TextField(
                      cursorColor: grey,
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        hintText: "Your name",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    TextField(
                      cursorColor: grey,
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        hintText: "Your Email address",
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                    Text(
                      "Phone",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    TextField(
                      cursorColor: grey,
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        hintText: "Mobile Number",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: checkBoxValue,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue = value;
                              });
                            }),
                        Text(
                            "I agree to the terms of services \n and Privacy Policy"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                              color: primary,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShipingPage()));
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signUP() {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    String fullname = _controllerFullname.text;
    print("$email, $password, $fullname");
  }
}
