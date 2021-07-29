import 'package:flutter/material.dart';

class TopBackSkipView extends StatelessWidget {
  final AnimationController animationController;
  const TopBackSkipView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animation = Tween(
      begin: Offset(0, -1),
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

    final _skipMoveAnimation = Tween(
      begin: Offset(0, 0),
      end: Offset(2, 0),
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
      position: _animation,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _handleBackAnimation();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              //   ),
            ),
            SlideTransition(
              position: _skipMoveAnimation,
              child: IconButton(
                onPressed: () {
                  animationController.animateTo(
                    0.8,
                    duration: Duration(milliseconds: 1200),
                  );
                },
                icon: Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleBackAnimation() {
    if (animationController.value == 0.2) {
      animationController.animateTo(0);
    } else if (animationController.value == 0.4) {
      animationController.animateTo(0.2);
    } else if (animationController.value == 0.6) {
      animationController.animateTo(0.4);
    } else if (animationController.value == 0.8) {
      animationController.animateTo(0.6);
    }
  }
}
