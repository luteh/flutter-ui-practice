import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  const WelcomeView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstAnimation = Tween(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondAnimation = Tween(
      begin: Offset(0, 0),
      end: Offset(-1, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _titleFirstAnimation = Tween(
      begin: Offset(2, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _titleSecondAnimation = Tween(
      begin: Offset(0, 0),
      end: Offset(-2, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageFirstAnimation = Tween(
      begin: Offset(4, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageSecondAnimation = Tween(
      begin: Offset(0, 0),
      end: Offset(-4, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: _firstAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _imageFirstAnimation,
            child: SlideTransition(
              position: _imageSecondAnimation,
              child: Container(
                constraints: BoxConstraints(maxWidth: 350, maxHeight: 250),
                child: Image.asset(
                  'assets/introduction_animation/welcome.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          SlideTransition(
            position: _titleFirstAnimation,
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
              "Stay organised and live stress-free with you-do app",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
