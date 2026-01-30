import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  // These variables track if the password is hidden (true) or shown (false)
  bool _isObscurePass = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // --- EMAIL FIELD ---
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your emails";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),

          // --- PASSWORD FIELD ---
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: _isObscurePass, // Uses the variable
              cursorColor: kPrimaryColor,
              onSaved: (password) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                // The Eye Icon
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscurePass ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscurePass = !_isObscurePass;
                    });
                  },
                ),
              ),
            ),
          ),

          // --- CONFIRM PASSWORD FIELD ---
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: _isObscureConfirm, // Uses the separate variable
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Confirm your password",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                // The Eye Icon
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscureConfirm ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscureConfirm = !_isObscureConfirm;
                    });
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding / 2),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _formKey.currentState!.reset();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sign Up Success!")),
                );
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}