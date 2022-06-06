import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFieldTitle(text: "Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "nam.duong1@tiki.vn"),
              validator: EmailValidator(errorText: "Email is required"),
              onSaved: (email) => _email = email!,
            ),
            const SizedBox(height: defaultPadding),
            const TextFieldTitle(text: "Password"),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: "*******"),
              validator: passwordValidator,
              onSaved: (password) => _password = password!,
            ),
          ],
        ));
  }
}

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
