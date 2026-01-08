// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NavigateBackParent extends StatefulWidget {
  const NavigateBackParent({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<NavigateBackParent> createState() => _NavigateBackParentState();
}

class _NavigateBackParentState extends State<NavigateBackParent> {
  bool _swipeHandled = false; // Flag to track if swipe has been handled
  final double _swipeDistanceThreshold = 0.5; // Set to half the screen width
  Offset? _initialSwipePosition; // To track the initial position of the swipe

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        // Detect where the swipe starts
        onHorizontalDragStart: (details) {
          _initialSwipePosition =
              details.localPosition; // Store the initial position of the swipe
        },
        onHorizontalDragEnd: (details) {
          // Check if swipe has been handled already
          if (_swipeHandled) return;

          // Get screen width and calculate zones
          double screenWidth = MediaQuery.of(context).size.width;
          double firstThird = screenWidth / 3; // First third of the screen
          double thirdThird = 2 * screenWidth / 3; // Third third of the screen
          double threshold = screenWidth * _swipeDistanceThreshold;

          // Check where the swipe started
          if (_initialSwipePosition != null) {
            double swipeStartX = _initialSwipePosition!.dx;

            // Determine the swipe direction and valid starting zones
            bool isValidSwipe = false;

            // Swipe starting from the first third (left side) should move rightwards
            if (swipeStartX <= firstThird &&
                details.velocity.pixelsPerSecond.dx > 0 && // Rightward swipe
                details.velocity.pixelsPerSecond.dx.abs() > threshold) {
              isValidSwipe = true;
            }
            // Swipe starting from the third third (right side) should move leftwards
            else if (swipeStartX >= thirdThird &&
                details.velocity.pixelsPerSecond.dx < 0 && // Leftward swipe
                details.velocity.pixelsPerSecond.dx.abs() > threshold) {
              isValidSwipe = true;
            }

            // Handle valid swipes
            if (isValidSwipe && FFAppState().navigationStack != 'home') {
              _swipeHandled = true; // Mark swipe as handled
              navigateBackCustom().whenComplete(
                  () => _swipeHandled = false); // Reset after the action
            }
          }
        },
      ),
    );
  }
}
