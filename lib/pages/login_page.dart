import 'package:flutter/material.dart';
import 'package:flutter_firstapp/custompaint/bubble_indicator.dart';
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

  Color signInColor = Colors.black;
  Color signUpColor = Colors.black;

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
          borderRadius: BorderRadius.circular(35),
        ),
        height: 50,
        width: 290,
        child: CustomPaint(
          //custom Paint serve per "colorare" l indicatore della pagina corrente
          painter: BubbleIndicator(pageController: _pageController),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //aggiunti 2 textbutton registrati e login
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    'Registrati',
                    style: TextStyle(
                        fontSize: 20,
                        color: signUpColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                //con expanded si espande il bottone esattamente per la metà dello spazio a disposizione
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: signInColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _pageView() => Expanded(
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              signInColor = index == 0 ? Colors.white : Colors.black;
              signUpColor = index == 1 ? Colors.white : Colors.black;
            });
          },
          controller:
              _pageController, //abbiamo collegato il controller scritto sopra
          children: const [SignIn(), SignUp()],
        ),
      );
}
