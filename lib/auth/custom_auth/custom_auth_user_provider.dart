import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class WevozDevelopmentAuthUser {
  WevozDevelopmentAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<WevozDevelopmentAuthUser> wevozDevelopmentAuthUserSubject =
    BehaviorSubject.seeded(WevozDevelopmentAuthUser(loggedIn: false));
Stream<WevozDevelopmentAuthUser> wevozDevelopmentAuthUserStream() =>
    wevozDevelopmentAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
