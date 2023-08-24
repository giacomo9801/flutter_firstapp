import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) => Card(
          child: SizedBox(
        width: 300.0,
        child: Column(children: [_emailField(), _passwordField()]),
      ));

  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Inserisci la tua email',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
            icon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Inserisci la tua email';
            }
            return null;
          },
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            hintText: 'Inserisci la tua password',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
            icon: Icon(Icons.password),
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Inserisci la tua password';
            }
            return null;
          },
        ),
      );
}
