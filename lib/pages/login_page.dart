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
            _imgLogin(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login_page');
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Inizia', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imgLogin() => const Image(
        image: AssetImage('assets/images/loginimg.png'),
        alignment: Alignment.topCenter,
      );
}
