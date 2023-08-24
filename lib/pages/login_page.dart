// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:flutter_firstapp/pages/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina di Login'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [CustomTheme.gradientStart, CustomTheme.gradientEnd],
          ),
        ),
        child: Column(
          children: <Widget>[
            _imgLogin(), //immagine login
            _rowbtnlogin(),
          ],
        ),
      ),
    );
  }

  Widget _imgLogin() => const Image(
        image: AssetImage('assets/images/loginimg.png'),
        alignment: Alignment.topCenter,
      );

  Widget _rowbtnlogin() => Container(
        color: Colors.blue.shade400,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //aggiunti 2 textbutton registrati e login
            TextButton(
              onPressed: null,
              child: Text(
                'Registrati',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
}
