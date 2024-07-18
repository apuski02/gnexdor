//import 'package:bigcare/privacy.dart';
//import 'package:abokiborrow/intro/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {

    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Welcome()),);
    print("Hello of slide");
  }


  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 12.0, height: 1.5);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w900),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.all(20),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      /* globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logo1.png', 80),
          ),
        ),
      ),*/
      /*globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Get Started!',
            style: TextStyle(fontSize: 18.0, letterSpacing: 1.4, fontWeight: FontWeight.normal),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),*/
      pages: [
        PageViewModel(
          title: "Get the money you need, when you need it.",
          body:  "Fast and easy loans for any purpose.",
          image: _buildImage('a1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get approved in minutes and receive your funds quickly.",
          body: "Don't let a lack of savings hold you back, apply for a loan now.",
          image: _buildImage('a2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bad credit? No problem!",
          body:  "Consolidate your debt and lower your monthly payments.",
          image: _buildImage('13.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Minimal Documentation.",
          body: "No bank account opening, same day transaction.",
          image: _buildImage('14.jpg', 250),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      //done: ElevatedButton( onPressed: (){}, child: Text('Register'),  ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

