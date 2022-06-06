import 'package:doctor/constants.dart';
import 'package:doctor/screens/auth/sign_in_screen.dart';
import 'package:doctor/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/splash_bg.svg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/gerda_logo.svg"),
                  const Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF6CD8D1)),
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      style: TextButton.styleFrom(
                          // backgroundColor: Color(0xFF6CD8D1),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF6CD8D1)))),
                      child: const Text("Sign In"),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding * 2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
