import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

List<String> mergeListsUnique(
  List<String> incomingFilters,
  List<String> presentFilters,
) {
  incomingFilters.forEach((element) {
    if (!presentFilters.contains(element)) {
      presentFilters.add(element);
    }
  });
  return presentFilters;
}

List<String> mergeFilterLists(
  List<String> authorList,
  List<String> languageList,
  List<String> countryList,
  List<String> hashtagList,
  List<String> contentTypeList,
) {
  List<String> mergedList = [];
  mergedList.addAll(authorList);
  mergedList.addAll(contentTypeList);
  mergedList.addAll(languageList);
  mergedList.addAll(countryList);
  mergedList.addAll(hashtagList);
  return mergedList;
}

String formatDate(String inputDate) {
  try {
    DateTime dateTime = DateTime.parse(inputDate);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  } catch (e) {
    return 'date format error: $e';
  }
}

List<String> returnValidURLsList(
  List<String> urls,
  int startIndex,
) {
  if (startIndex == 0) {
    urls.removeWhere((url) => url == '');
    return urls;
  }
  List<String> cutUrlList = [];
  for (int i = startIndex; i < urls.length; i++) {
    if (urls[i] != '') {
      cutUrlList.add(urls[i]);
    }
  }
  return cutUrlList;
}

List<String> returnIntroUrlAndChapterUrls(
  String introUrl,
  List<String>? chapterUrls,
) {
  List<String> urls = [];
  if (introUrl.isNotEmpty && introUrl != '') {
    urls.add(introUrl);
  }
  if (chapterUrls == null || chapterUrls.isEmpty) {
    return urls;
  }
  urls.addAll(chapterUrls);
  return urls;
}

DateTime? stringToDate(String dateString) {
  try {
    return DateTime.parse(dateString);
  } catch (e) {
    print('wrong date format');
    return null;
  }
}

List<dynamic> addChapterToPlaylistContentAndJSON(
  List<ChapterStruct> content,
  ChapterStruct newChapter,
) {
  List<Map<String, dynamic>> jsonChapters = [];

  // Iterate through each chapter in the content list
  for (ChapterStruct chapter in content) {
    jsonChapters.add({
      "_id": chapter.id,
      "type": chapter.type != null ? chapter.type!.name : ContentType.Voz.name,
      "content": postToJson(chapter.content),
    });
  }

  // Add the new chapter to the list
  jsonChapters.add({
    "_id": newChapter.id,
    "type":
        newChapter.type != null ? newChapter.type!.name : ContentType.Voz.name,
    "content": postToJson(newChapter.content),
  });

  print(
      'addChapterToPlaylistContentAndJSON \n ${jsonChapters.runtimeType} \n $jsonChapters');

  return jsonChapters; // Return the list of JSON maps
}

dynamic postToJson(PostStruct post) {
  return {
    "age_rating": post.ageRating,
    "is_public": post.isPublic,
    "target_countries": post.targetCountries,
    "audience_members": post.audienceMembers,
    "id": post.id,
    "ranking": post.ranking,
    "audio_transcript": post.audioTranscript,
    "createdAt": post.createdAt, // Convert DateTime to ISO 8601 string
    "updatedAt": post.updatedAt,
    "audio_url": post.audioUrl,
    "tags": post.tags
        .map((tag) => tagToJson(tag))
        .toList(), // Assuming Tag has a toJson method
    "duration": post.timeDuration,
    'comments': post.commentsCount,
    "alias": aliasToJson(post.alias), // Assuming Alias has a toJson method
    "user_id": post.userId
  };
}

dynamic tagToJson(dynamic tag) {
  return {
    "_id": tag.id,
    "name": tag.name,
  };
}

dynamic aliasToJson(AliasStruct alias) {
  return {
    "user_id": alias.userId,
    "name": alias.name,
    "alias_photo": alias.aliasPhoto,
    "audio_url": alias.audioUrl,
    "ranking": alias.ranking,
    "following": alias.following,
    "_id": alias.id,
    "age_rating": alias.ageRating,
  };
}

String aliasQueryBuilder(
  AliasProperties property,
  QueryOperands operand,
  String value,
) {
  if (value == 'true') return 'true';
  return '${property.name} ${operand.name} \'$value\'';
}

String formatTimeDuration(int timeDuration) {
  int minutes = timeDuration ~/ 60; // Get total minutes
  int remainingSeconds = timeDuration % 60; // Get remaining seconds

  // Format as mm:ss
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

DateTime modifyDate(
  DateTime date,
  int daysToAdd,
  int monthsToAdd,
  int yearsToAdd,
) {
  DateTime newDateTime = DateTime(
      date.year + yearsToAdd,
      date.month + monthsToAdd,
      date.day + daysToAdd,
      date.hour,
      date.minute,
      date.second);
  print("modifyDate() \nReceived this: " +
      date.toString() +
      "\nReturning this: " +
      newDateTime.toString());
  return newDateTime;
}

int returnReactionVal(Reactions reaction) {
  switch (reaction) {
    case Reactions.like:
      return 0;

    case Reactions.smile:
      return 1;

    case Reactions.hmm:
      return 2;

    case Reactions.sad:
      return 3;

    case Reactions.angry:
      return 4;

    default:
      print('returnReactionVal() returning default for ${reaction.name}');
      return -1;
  }
}

DateTime parseODataDateTime(String isoString) {
  // Remove 'Z' (for UTC) if it exists
  if (isoString.endsWith('Z')) {
    isoString = isoString.substring(0, isoString.length - 1); // Remove 'Z'
  }

  // Check for the fractional part (seconds)
  int decimalIndex = isoString.indexOf('.');
  if (decimalIndex != -1) {
    // Truncate to 6 decimal places if it's longer than 6
    String beforeDecimal = isoString.substring(0, decimalIndex + 1);
    String afterDecimal = isoString.substring(decimalIndex + 1);

    if (afterDecimal.length > 6) {
      afterDecimal = afterDecimal.substring(0, 6); // Truncate to 6 digits
    }

    // Rebuild the string with truncated decimals
    isoString = beforeDecimal + afterDecimal;
  }

  print("parseOData($isoString) => ${DateTime.parse(isoString).toUtc()}");

  // Parse the datetime string as UTC
  return DateTime.parse(isoString).toUtc();
}
