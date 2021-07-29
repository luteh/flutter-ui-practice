import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:ui_practice/introduction/widgets/page_view_indicator.dart';

class CenterNextButton extends StatelessWidget {
  final AnimationController animationController;
  const CenterNextButton({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation = Tween(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _signUpMoveAnimation = Tween<double>(
      begin: 0,
      end: 1,
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

    final _loginTextMoveAnimation = Tween(
      begin: Offset(0, 5),
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
    return SlideTransition(
      position: _topMoveAnimation,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PageViewIndicator(
                animationController: animationController,
              ),
              SizedBox(height: 16),
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return InkWell(
                    onTap: () {
                      _handleNextAnimation();
                    },
                    child: Container(
                      height: 58,
                      width: 58 + (200 * _signUpMoveAnimation.value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8 + 32 * (1 - _signUpMoveAnimation.value),
                        ),
                        color: Color(0xff132137),
                      ),
                      child: PageTransitionSwitcher(
                        duration: Duration(milliseconds: 500),
                        reverse: _signUpMoveAnimation.value < 0.7,
                        transitionBuilder: (
                          Widget child,
                          Animation<double> primaryAnimation,
                          Animation<double> secondaryAnimation,
                        ) {
                          return SharedAxisTransition(
                            fillColor: Colors.transparent,
                            animation: primaryAnimation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.vertical,
                            child: child,
                          );
                        },
                        child: _signUpMoveAnimation.value > 0.7
                            ? InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward_rounded,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SlideTransition(
                  position: _loginTextMoveAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xff132137),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNextAnimation() {
    if (animationController.value == 0.2) {
      animationController.animateTo(0.4);
    } else if (animationController.value == 0.4) {
      animationController.animateTo(0.6);
    } else if (animationController.value == 0.6) {
      animationController.animateTo(0.8);
    }
  }
}
