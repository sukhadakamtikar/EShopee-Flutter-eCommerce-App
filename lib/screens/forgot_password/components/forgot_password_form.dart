import 'package:e_commerce_app_flutter/components/custom_suffix_icon.dart';
import 'package:e_commerce_app_flutter/components/default_button.dart';

import 'package:e_commerce_app_flutter/components/no_account_text.dart';
import 'package:e_commerce_app_flutter/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  String email;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // TODO: add code to trigger the Forgot Password task
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter your email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
      onChanged: (value) {
        email = value;
        if (value.isNotEmpty) {
          return kEmailNullError;
        } else if (emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      validator: (value) {
        email = value;
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      onSaved: (newValue) => email = newValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}