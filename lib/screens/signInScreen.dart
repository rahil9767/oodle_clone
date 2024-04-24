import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oodle/provider/google_SignIn.dart';
import 'package:oodle/utils/colour.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  // TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: MyColors.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  const Text(
                    "OodLe",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          backgroundColor: Colors.white, // Set background color
                        ),
                        icon: Container(
                          padding: EdgeInsets.all(10), // Adjust padding as needed
                          child: SvgPicture.asset(
                            'assets/images/google_logo.svg',
                            height: 24, //
                            width: 24, //
                          ),
                        ),
                        label: Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          final provider =
                          Provider.of<GoogleSignInProvider>(context,
                              listen: false);
                          provider.googleLogin();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 10),
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      Text(
                        'or',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 20),
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        IntlPhoneField(
                          focusNode:focusNode,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          languageCode: "en",
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          child: Text('Submit'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          minWidth: double.maxFinite,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            _formKey.currentState?.validate();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Click here to confirm that you have read and agreed to the ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'terms and conditions',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Implement navigation or any action here
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
