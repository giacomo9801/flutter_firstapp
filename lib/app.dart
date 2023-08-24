import 'package:flutter/material.dart';
import 'package:flutter_firstapp/pages/login_page.dart';
import 'package:flutter_firstapp/pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-First App',
      home: const WelcomePage(),
      //per togliere il banner di debug
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_page': (context) => const LoginPage(),
        // Aggiungi altre rotte qui, se necessario
      },
    );
  }

  //home: const MyHomePage(title: 'Flutter Demo Home Page'),
}
