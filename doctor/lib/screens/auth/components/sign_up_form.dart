import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String _userName, _email, _password, _phone;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFieldTitle(text: "Username"),
            TextFormField(
              decoration: const InputDecoration(hintText: "Please input"),
              validator: RequiredValidator(errorText: "Username is required"),
              onSaved: (username) => _userName = username!,
            ),
            const SizedBox(height: defaultPadding),
            const TextFieldTitle(text: "Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "nam.duong1@tiki.vn"),
              validator: EmailValidator(errorText: "Email is required"),
              onSaved: (email) => _email = email!,
            ),
            const SizedBox(height: defaultPadding),
            const TextFieldTitle(text: "Phone"),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: "0353264570"),
              validator: RequiredValidator(errorText: "Phone is required"),
              onSaved: (phone) => _phone = phone!,
            ),
            const SizedBox(height: defaultPadding),
            const TextFieldTitle(text: "Password"),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: "*******"),
              validator: passwordValidator,
              onSaved: (password) => _password = password!,
              onChanged: (pass) => _password = pass,
            ),
            const SizedBox(height: defaultPadding),
            const TextFieldTitle(text: "Confirm Password"),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: "*******"),
              validator: (pass) =>
                  MatchValidator(errorText: "Password do not match")
                      .validateMatch(pass!, _password),
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
