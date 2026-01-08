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

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';

class AudioPlayerCustom extends StatefulWidget {
  const AudioPlayerCustom({
    super.key,
    this.width,
    this.height,
    required this.onCommentPress,
    required this.onSavePress,
  });

  final double? width;
  final double? height;
  final Future Function() onCommentPress;
  final Future Function() onSavePress;

  @override
  State<AudioPlayerCustom> createState() => _AudioPlayerCustomState();
}

class _AudioPlayerCustomState extends State<AudioPlayerCustom>
    with SingleTickerProviderStateMixin {
  late AudioPlayer audioPlayer;

  bool isPlaying = false;

  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  bool isLooping = false;

  List<double> speedValues = [
    0.25,
    0.5,
    1,
    1.5,
    2,
  ];
  int speedValueIndex = 2;
  String speedValueLabel = '1x';
  Color labelColor = Colors.white;

  List<String> _audioURLs = [];
  int _currentAudioIndex = 0;

  @override
  void initState() {
    super.initState();

    _audioURLs = FFAppState().audioURLs;
    setState(
        () => FFAppState().playingAudioUrl = _audioURLs[_currentAudioIndex]);

    print(
        "initState() / _audioURLs: ${_audioURLs.length} - ${_audioURLs}  | playing audio: ${_audioURLs[_currentAudioIndex]}");
    audioPlayer = AudioPlayer();
    audioPlayer.setUrl(_audioURLs[_currentAudioIndex]);
    audioPlayer.playerStateStream.listen((PlayerState state) {
      setState(() {
        isPlaying = state.playing;
        totalDuration = audioPlayer.duration ?? Duration.zero;
        currentPosition = audioPlayer.position ?? Duration.zero;
      });

      if (state.processingState == ProcessingState.completed) {
        playNext();
      }
    });
    audioPlayer.positionStream.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });

    FFAppState().addListener(_onAppStateChanges);

    // Start playing right away
    if (!isPlaying && _audioURLs.length > 0) {
      setState(() {
        isPlaying = true;
        audioPlayer.play();
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // Added to FFAppState listener
  // Gets called when the AppState variables get updated
  void _onAppStateChanges() {
    print("_checkAppStateChanges");
    // Gets called when 'playAudioButton' is clicked (pause)
    if (FFAppState().playingAudioUrl == '') {
      print("playingAudioURL is paused");
      audioPlayer.pause();
    }
    // Gets called when 'playAudioButton' is clicked (play)
    if (_audioURLs != FFAppState().audioURLs) {
      print("changed audioURL list: ${FFAppState().audioURLs}");
      setState(() {
        if (audioPlayer.playing) audioPlayer.pause();

        _currentAudioIndex = 0;
        _audioURLs = FFAppState().audioURLs;

        updatePosition(0.0);
        if (_audioURLs.length > 0) {
          setState(() => FFAppState()
              .update(() => FFAppState().playingAudioUrl = _audioURLs[0]));

          audioPlayer.setUrl(_audioURLs[0]);
          audioPlayer.play();
        } else {
          print("audioURLs are empty");
          setState(() =>
              FFAppState().update(() => FFAppState().playingAudioUrl = ''));
          audioPlayer.pause();
        }
      });
    }
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  void updatePosition(double value) {
    final newPosition = Duration(milliseconds: value.toInt());
    seekTo(newPosition); // Complete the method call by passing newPosition
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer.pause();
      setState(
          () => FFAppState().update(() => FFAppState().playingAudioUrl = ''));
    } else {
      audioPlayer.play();
      setState(() => FFAppState().update(
          () => FFAppState().playingAudioUrl = _audioURLs[_currentAudioIndex]));
    }
  }

  // Function to skip +-10 seconds of the track
  void skip(Duration duration) {
    final newPosition = currentPosition + duration;
    if (newPosition < Duration.zero) {
      seekTo(Duration.zero);
    } else if (newPosition > totalDuration) {
      seekTo(totalDuration);
    } else {
      seekTo(newPosition);
    }
  }

  // Play previous track
  void playPrevious() {
    if (_currentAudioIndex > 0) {
      _currentAudioIndex--;
    } else {
      _currentAudioIndex = _audioURLs.length - 1;
    }
    audioPlayer.pause();
    setState(() => FFAppState().update(
        () => FFAppState().playingAudioUrl = _audioURLs[_currentAudioIndex]));
    audioPlayer.setUrl(_audioURLs[_currentAudioIndex]);
    audioPlayer.play();
  }

  // Play next track
  void playNext() {
    if (_audioURLs.length == 0) {
      audioPlayer.pause();
      return;
    }
    if (_currentAudioIndex < _audioURLs.length - 1) {
      _currentAudioIndex++;
    } else {
      _currentAudioIndex = 0;
    }
    audioPlayer.pause();
    setState(() => FFAppState().update(
        () => FFAppState().playingAudioUrl = _audioURLs[_currentAudioIndex]));
    audioPlayer.setUrl(_audioURLs[_currentAudioIndex]);
    audioPlayer.play();
  }

  void toggleLooping() {
    setState(() {
      isLooping = !isLooping;
      audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  void setPlaybackSpeed() {
    setState(() {
      speedValueIndex = ++speedValueIndex % 5;
      speedValueLabel = '${speedValues[speedValueIndex]}x';
      audioPlayer.setSpeed(speedValues[speedValueIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Container(
        width: double.infinity,
        //height: 88.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 31, 29, 48),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              right: 16.0,
              top: 8.0,
              left: 16.0,
              bottom: 8.0), // Set padding here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Time elapsed + slider + total duration
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Time elapsed
                Text(
                  '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: labelColor),
                ),
                // Slider indicator
                Expanded(
                  child: Slider(
                    value: currentPosition.inMilliseconds.toDouble(),
                    min: 0,
                    max: totalDuration.inMilliseconds.toDouble(),
                    onChanged: (double value) {
                      updatePosition(value);
                    },
                    activeColor: Color.fromARGB(255, 238, 139, 96),
                    inactiveColor: Color.fromARGB(255, 149, 161, 172),
                  ),
                ),
                // Total duration
                Text(
                  '${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: labelColor),
                ),
              ]),
              SizedBox(height: 8),
              // Commands
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Loop + playback speed
                  SizedBox(
                    width: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: toggleLooping,
                          child: isLooping
                              ? Icon(Icons.repeat_one_rounded,
                                  size: 24, color: labelColor)
                              : Icon(Icons.repeat_rounded,
                                  size: 24, color: labelColor),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: setPlaybackSpeed,
                          child: SizedBox(
                            width: 40,
                            child: Text(speedValueLabel,
                                style: TextStyle(
                                    color: labelColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Playback controls
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => skip(Duration(seconds: -10)),
                          child: Icon(Icons.replay_10_rounded,
                              size: 24, color: labelColor),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: playPrevious,
                          child: Icon(Icons.skip_previous_rounded,
                              size: 24, color: labelColor),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: playPause,
                          child: isPlaying
                              ? Icon(Icons.pause_rounded,
                                  size: 24, color: labelColor)
                              : Icon(Icons.play_arrow_rounded,
                                  size: 24, color: labelColor),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: playNext,
                          child: Icon(Icons.skip_next_rounded,
                              size: 24, color: labelColor),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => skip(Duration(seconds: 10)),
                          child: Icon(Icons.forward_10_rounded,
                              size: 24, color: labelColor),
                        ),
                      ],
                    ),
                  ),
                  // Save + comment
                  SizedBox(
                    width: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            widget.onCommentPress,
                          },
                          child: Icon(FontAwesomeIcons.comment,
                              size: 20, color: labelColor),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: widget.onSavePress,
                          child: Icon(Icons.bookmark_border_rounded,
                              size: 24, color: labelColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
