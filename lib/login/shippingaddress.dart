import 'package:flutter/material.dart';

const primary = Color(0xffff7043);
const white = Color(0xffffffff);
const grey = Color(0xFFBDBDBD);

class ShipingPage extends StatefulWidget {
  @override
  _ShipingPageState createState() => _ShipingPageState();
}

class _ShipingPageState extends State<ShipingPage> {
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
          'Shipping Adress',
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
                      "Add new address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Name*",
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
                        hintText: "User",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Phone Number",
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
                        hintText: "5555555555",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Address Line 1*",
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
                        hintText: "Steet,Adress,Company name,",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Address Line 2*",
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
                        hintText: "Steet,Adress,Company name,",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "City*",
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
                        hintText: "Your City",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Zip code*",
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
                        hintText: "Your Zipcode",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Zip code*",
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
                        hintText: "Your Zipcode",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Country*",
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
                        hintText: "select your country",
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
                        Text("Default Adress"),
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
                                signUP();
                              },
                              child: Text(
                                "Create",
                                style: TextStyle(color: white),
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
