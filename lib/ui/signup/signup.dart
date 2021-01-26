import 'package:flutter/material.dart';
import 'package:login_signup_ui_flutter_app/animation/FadeAnimation.dart';
import 'package:login_signup_ui_flutter_app/ui/login/login.dart';
import 'package:login_signup_ui_flutter_app/ui/home/home.dart';
import 'package:login_signup_ui_flutter_app/utils/color-utils.dart';
import 'package:login_signup_ui_flutter_app/utils/validation-util.dart';
import 'package:intl/intl.dart';

void main() => runApp(SignupPage());

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MySignupPage(title: ''),
    );
  }
}

class MySignupPage extends StatefulWidget {
  MySignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySignupPageState createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {
  var _validationUtil = ValidationUtil();
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  final _textName = TextEditingController();
  final _textUserName = TextEditingController();
  final _textPassword = TextEditingController();
  final _textWeight = TextEditingController();

  bool _validateName = false;
  bool _validateUserName = false;
  bool _validatePassword = false;
  bool _validateWeight = false;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          new Container(
            margin: EdgeInsets.only(
                left: 30.0, right: 30.0, bottom: 25.0, top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Create an account, It's free",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.2,
                        makeInput(_validateName, _textName, 'Please enter Name',
                            label: "Name")),
                    FadeAnimation(1.3, makeInputDate(label: "Birthdate")),
                    FadeAnimation(1.4, makeInputgender(label: "Gender")),
                    FadeAnimation(
                        1.5,
                        makeInputWeight(
                            _validateWeight, _textWeight, 'Please enter Weight',
                            label: "Weight")),
                    FadeAnimation(
                        1.6,
                        makeInput(_validateUserName, _textUserName,
                            'Please enter Username',
                            label: "Username")),
                    FadeAnimation(
                        1.7,
                        makeInput(_validatePassword, _textPassword,
                            'Please enter Password',
                            label: "Password", obscureText: true)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                FadeAnimation(
                    1.8,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        color: ColorUtils.appColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                FadeAnimation(
                  1.9,
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?"),
                          Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  Widget makeInput(
      bool _validate, TextEditingController controller, String message,
      {label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: (value) => _validationUtil.validateField(value, message),
          decoration: InputDecoration(
            errorText: _validate ? message : null,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget makeInputWeight(
      bool _validate, TextEditingController controller, String message,
      {label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: (value) => _validationUtil.validateField(value, message),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: _validate ? message : null,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget makeInputDate({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey[400])),
              child: Text(DateFormat('yyyy/MM/dd').format(selectedDate)),
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget makeInputgender({label, obscureText = false}) {
    String dropdownValue = 'Male';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[400])),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 10,
                  underline: Container(
                    height: 0,
                    color: Colors.white,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
