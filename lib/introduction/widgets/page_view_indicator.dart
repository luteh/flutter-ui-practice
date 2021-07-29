import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final AnimationController animationController;
  const PageViewIndicator({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return AnimatedOpacity(
          opacity: animationController.value >= 0.1 ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: _buildIndicator(),
        );
      },
    );
  }

  Widget _buildIndicator() {
    int _selectedIndex = 0;

    if (animationController.value >= 0.7) {
      _selectedIndex = 3;
    } else if (animationController.value >= 0.5) {
      _selectedIndex = 2;
    } else if (animationController.value >= 0.3) {
      _selectedIndex = 1;
    } else if (animationController.value >= 0.1) {
      _selectedIndex = 0;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.all(4),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: _selectedIndex == i ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 8,
              width: 8,
            ),
          ),
      ],
    );
  }
}
