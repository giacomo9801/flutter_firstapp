import 'package:flutter/material.dart';
import 'package:flutter_firstapp/pages/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //crea una welcome page con sfondo con un bottone che porta alla home page e inserisci un immagine

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [CustomTheme.gradientStart, CustomTheme.gradientEnd],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Benvenuto nella mia prima app!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
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
            const SizedBox(height: 70),
            Image.asset('assets/images/welcomeimg.png'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Powered by Giacomo Corcella",
                textAlign: TextAlign.center,

                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),

                //crea padding dall alto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
