// ignore: file_names
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true; //controlla se visualizzare o meno la password

  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        child: Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: SizedBox(
              width: 300.0,
              child: Column(children: [_emailField(), _passwordField()]),
            )),
      );

  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextFormField(
          focusNode: _focusNodeEmail,
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Inserisci la tua email',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
            icon: Icon(Icons.email),
          ),
          onFieldSubmitted: (_) {
            _focusNodePassword.requestFocus();
          },
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextFormField(
          obscureText: _isObscure,
          focusNode: _focusNodePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Inserisci la tua password',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
            icon: const Icon(Icons.password),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: _isObscure
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off)),
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Inserisci la tua password';
            }
            return null;
          },
          onFieldSubmitted: (_) {},
          textInputAction: TextInputAction
              .go, //con il go diciamo che abbiamo completato l'inserimento della password
        ),
      );
}
