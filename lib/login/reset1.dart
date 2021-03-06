import 'package:flutter/material.dart';
import 'package:swishapp/login/reset2.dart';

const primary = Color(0xffff7043);
const white = Color(0xffffffff);
const grey = Color(0xFFBDBDBD);

class Reset1Page extends StatefulWidget {
  @override
  _Reset1PageState createState() => _Reset1PageState();
}

class _Reset1PageState extends State<Reset1Page> {
  bool isShowPassword = false;
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
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
          'Reset Password ',
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
                "You forget password ? ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "IF you would like to verify your account by \n Email Verification,please follow these \n steps",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
                "verification Code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextField(
                obscureText: !isShowPassword,
                cursorColor: grey,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    hintText: "XXXXXXXXX",
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
                height: 100,
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
                                  builder: (context) => Reset2Page()));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: white),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
