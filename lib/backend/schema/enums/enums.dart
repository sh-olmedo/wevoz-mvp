import 'package:collection/collection.dart';

enum Reactions {
  like,
  smile,
  hmm,
  sad,
  angry,
}

enum PlaylistType {
  Dynamic,
  Static,
}

enum ContentType {
  Voz,
  VozCast,
  Channel,
  Alias,
  Playlist,
  Comment,
}

enum AgeRestrictions {
  Over18,
  Over16,
  Over14,
}

enum FilterOptions {
  Author,
  Content,
  Language,
  Country,
  Hashtag,
  Age,
  Unknown,
}

enum Pages {
  home,
  filtered,
  library,
  record,
  channel,
  vozcast,
  alias,
  login,
  register,
  verifyEmail,
  createFirstAlias,
  notification,
  singleVoz,
  playlist,
}

enum NotificationOptions {
  myAlias,
  mySubscriptions,
  following,
}

enum NotificationType {
  push,
  email,
  notificationArea,
}

enum AdvancedSearchTypes {
  top_content,
  hashtag,
  advanced_search,
  static_playlist,
  dynamic_playlist,
}

enum AliasProperties {
  id,
  user_id,
  name,
}

enum QueryOperands {
  eq,
  ne,
  gt,
  ge,
  lt,
  le,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Reactions):
      return Reactions.values.deserialize(value) as T?;
    case (PlaylistType):
      return PlaylistType.values.deserialize(value) as T?;
    case (ContentType):
      return ContentType.values.deserialize(value) as T?;
    case (AgeRestrictions):
      return AgeRestrictions.values.deserialize(value) as T?;
    case (FilterOptions):
      return FilterOptions.values.deserialize(value) as T?;
    case (Pages):
      return Pages.values.deserialize(value) as T?;
    case (NotificationOptions):
      return NotificationOptions.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (AdvancedSearchTypes):
      return AdvancedSearchTypes.values.deserialize(value) as T?;
    case (AliasProperties):
      return AliasProperties.values.deserialize(value) as T?;
    case (QueryOperands):
      return QueryOperands.values.deserialize(value) as T?;
    default:
      return null;
  }
}
