import 'package:flutter/material.dart';
import 'package:ui_practice/introduction/widgets/care_view.dart';
import 'package:ui_practice/introduction/widgets/center_next_button.dart';
import 'package:ui_practice/introduction/widgets/mood_diary_view.dart';
import 'package:ui_practice/introduction/widgets/relax_view.dart';
import 'package:ui_practice/introduction/widgets/splash_view.dart';
import 'package:ui_practice/introduction/widgets/top_back_skip_view.dart';
import 'package:ui_practice/introduction/widgets/welcome_view.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    _animationController.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      body: Stack(
        children: [
          SplashView(
            animationController: _animationController,
          ),
          RelaxView(
            animationController: _animationController,
          ),
          CareView(
            animationController: _animationController,
          ),
          MoodDiaryView(
            animationController: _animationController,
          ),
          WelcomeView(
            animationController: _animationController,
          ),
          TopBackSkipView(
            animationController: _animationController,
          ),
          CenterNextButton(
            animationController: _animationController,
          ),
        ],
      ),
    );
  }
}
