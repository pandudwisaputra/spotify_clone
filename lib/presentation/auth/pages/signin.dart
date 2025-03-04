import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/service_locator.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../root/pages/root.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isObscure = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signInText(),
              const SizedBox(
                height: 15,
              ),
              _supportText(),
              const SizedBox(
                height: 26,
              ),
              _fullNameField(context),
              const SizedBox(
                height: 15,
              ),
              _passwordField(context, (){
                setState(() {
                  isObscure = !isObscure;
                });
              }),
              const SizedBox(
                height: 33,
              ),
              BasicAppButton(onPressed: () async {
                    var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                        email: _email.text.toString(),
                        password: _password.text.toString(),
                      ),
                    );
                    result.fold(
                      (l) {
                        var snackBar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        log("L = $l");
                      },
                      (r) {
                        var snackBar = SnackBar(content: Text(r));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RootPage(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  }, title: "Sign In"),
              const SizedBox(
                height: 39,
              ),
              _orText(context),
              const SizedBox(
                height: 51,
              ),
              _googleAppleButton(),
              const SizedBox(
                height: 32,
              ),
              _registerText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Not A Member? ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
        children: [
          TextSpan(
            text: "Register Now",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff288CE9),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }

  Widget _googleAppleButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(AppVectors.googleLogo),
        SvgPicture.asset(AppVectors.appleLogo),
      ],
    );
  }

  Widget _orText(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  context.isDarkMode
                      ? const Color(0xff5B5B5B)
                      : const Color(0xffD3D3D3),
                  context.isDarkMode
                      ? const Color(0xff252525)
                      : const Color(0xffB0B0B0),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Or",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  context.isDarkMode
                      ? const Color(0xff5B5B5B)
                      : const Color(0xffD3D3D3),
                  context.isDarkMode
                      ? const Color(0xff252525)
                      : const Color(0xffB0B0B0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _signInText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget _supportText() {
    return const Text.rich(
      TextSpan(
        text: "If you need any support ",
        style: TextStyle(
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: "Click Here",
            style: TextStyle(
              fontSize: 12,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: "Enter Username Or Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context, VoidCallback onPressed) {
    return TextField(
      controller: _password,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 30),
          width: 30,
          height: 30,
          child: GestureDetector(
            onTap: onPressed,
            child: SvgPicture.asset(
              AppVectors.hide,
            ),
          ),
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
