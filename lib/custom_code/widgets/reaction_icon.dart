// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReactionIcon extends StatefulWidget {
  const ReactionIcon(
      {super.key,
      this.width,
      this.height,
      required this.icon,
      required this.onPressed,
      required this.iconColor,
      required this.onLongPress,
      required this.showLabel});

  final double? width;
  final double? height;
  final Reactions icon;
  final Future Function() onPressed;
  final Color iconColor;
  final Future Function(Reactions? reaction) onLongPress;
  final bool showLabel;

  @override
  State<ReactionIcon> createState() => _ReactionIconState();
}

class _ReactionIconState extends State<ReactionIcon> {
  bool _showLabel = false;

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/${widget.icon}.png';
    Image image = Image.asset(
      imagePath,
      fit: BoxFit.scaleDown, // Use BoxFit.cover for circular image
    );
    _showLabel = widget.showLabel;
    print('imagePath: $imagePath');

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        // Use Column for vertical placement
        mainAxisSize: MainAxisSize.min, // Restrict Column size
        children: [
          GestureDetector(
              onTap: () {
                setState(() => _showLabel = false);
                widget.onPressed();
                print('Icon pressed');
              },
              onLongPress: () {
                widget.onLongPress(widget.icon);
                setState(() => _showLabel = widget.showLabel);
              },
              child: !_showLabel
                  ? Container(
                      width: 24.0,
                      height: 24.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: image,
                    )
                  : Column(
                      // Use Column for vertical placement
                      mainAxisSize: MainAxisSize.min, // Restrict Column size
                      children: [
                          Container(
                            width: 40.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: widget.iconColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              widget.icon.name,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Container(
                            width: 48.0,
                            height: 48.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: image,
                          ),
                        ]))
        ],
      ),
    );
  }
}
