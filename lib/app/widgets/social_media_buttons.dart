import 'package:flutter/material.dart';

import '../helpers/hexcolor.dart';
import 'app_form_fields/app_button_field.dart';

class AppleLogin extends StatelessWidget {
  const AppleLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        width: double.infinity,
        child: AppButtonField(
            text: 'Continue with Apple',
            onPressed: () {},
            haveBorder: false,
            primary: Colors.black,
            prefix: Image.asset(
              'assets/images/apple.png',
              height: 24,
            ),
            textStyle: TextStyle(
              fontFamily: "SF Pro Display",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )));
  }
}

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        width: double.infinity,
        child: AppButtonField(
            text: 'Continue with Facebook',
            onPressed: () {},
            haveBorder: false,
            primary: HexColor("#1877F2"),
            prefix: Image.asset(
              'assets/images/facebook.png',
              height: 24,
            ),
            textStyle: TextStyle(
              fontFamily: "Helvetica",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )));
  }
}

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      child: AppButtonField(
          text: 'Continue with Google',
          haveBorder: false,
          onPressed: () {},
          primary: Colors.white,
          prefix: Image.asset(
            'assets/images/google.png',
            height: 24,
          ),
          textStyle: TextStyle(
            fontFamily: "Roboto",
            fontSize: 20,
            color: HexColor("#000000").withOpacity(0.54),
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
