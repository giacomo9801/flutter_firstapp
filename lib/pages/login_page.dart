import 'package:flutter/material.dart';
import 'package:flutter_firstapp/pages/theme.dart';
import 'package:flutter_firstapp/pages/widgets/SignIn.dart';
import 'package:flutter_firstapp/pages/widgets/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PageController
      _pageController; //servirà per passare da una pagina all'altra

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina di Login'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
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
            _pageView(),
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
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 70,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //aggiunti 2 textbutton registrati e login
            Expanded(
              child: TextButton(
                onPressed: () {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: const Text(
                  'Registrati',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              //con expanded si espande il bottone esattamente per la metà dello spazio a disposizione
              child: TextButton(
                onPressed: () {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _pageView() => Expanded(
        child: PageView(
          controller:
              _pageController, //abbiamo collegato il controller scritto sopra
          children: const [SignIn(), SignUp()],
        ),
      );
}
