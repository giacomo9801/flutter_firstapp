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
  void dispose() {
    super.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _formWidget(),
            _signInButton(),
          ],
        ), //stack serve per sovrapporre i widget
      );

  Widget _formWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 13.0),
        child: Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: SizedBox(
              width: 300.0,
              child: Column(children: [
                _emailField(),
                const Divider(
                  height: 0,
                ),
                _passwordField()
              ]),
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

  // Widget _forgotPasswordBtn() => TextButton(
  //       onPressed: () {},
  //       child: const Text(
  //         "Password dimenticata?",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     );

  Widget _signInButton() => ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 18.0),
          child: Text(
            "accedi",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onPressed: () {},
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
