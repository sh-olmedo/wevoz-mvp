import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _ageRestriction = 18;
  int get ageRestriction => _ageRestriction;
  set ageRestriction(int value) {
    _ageRestriction = value;
  }

  double _uploadProgress = -1.0;
  double get uploadProgress => _uploadProgress;
  set uploadProgress(double value) {
    _uploadProgress = value;
  }

  Pages? _currentPage = Pages.home;
  Pages? get currentPage => _currentPage;
  set currentPage(Pages? value) {
    _currentPage = value;
  }

  String _navigationStack = 'home';
  String get navigationStack => _navigationStack;
  set navigationStack(String value) {
    _navigationStack = value;
  }

  String _speechToTextResult = '';
  String get speechToTextResult => _speechToTextResult;
  set speechToTextResult(String value) {
    _speechToTextResult = value;
  }

  List<String> _audioURLs = [];
  List<String> get audioURLs => _audioURLs;
  set audioURLs(List<String> value) {
    _audioURLs = value;
  }

  void addToAudioURLs(String value) {
    audioURLs.add(value);
  }

  void removeFromAudioURLs(String value) {
    audioURLs.remove(value);
  }

  void removeAtIndexFromAudioURLs(int index) {
    audioURLs.removeAt(index);
  }

  void updateAudioURLsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    audioURLs[index] = updateFn(_audioURLs[index]);
  }

  void insertAtIndexInAudioURLs(int index, String value) {
    audioURLs.insert(index, value);
  }

  String _playingAudioUrl = '';
  String get playingAudioUrl => _playingAudioUrl;
  set playingAudioUrl(String value) {
    _playingAudioUrl = value;
  }

  int _deepLinkContentId = 0;
  int get deepLinkContentId => _deepLinkContentId;
  set deepLinkContentId(int value) {
    _deepLinkContentId = value;
  }
}
