import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Abuse Group Code

class AbuseGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetAbusesCall getAbusesCall = GetAbusesCall();
  static ReportAbuseCall reportAbuseCall = ReportAbuseCall();
  static GetAbuseByIDCall getAbuseByIDCall = GetAbuseByIDCall();
  static UpdateAbuseCall updateAbuseCall = UpdateAbuseCall();
  static DeleteAbuseCall deleteAbuseCall = DeleteAbuseCall();
}

class GetAbusesCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderBy = 'id',
    int? numRecords = 10,
    int? skip = 0,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AbuseGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Abuses',
      apiUrl: '${baseUrl}/Abuse/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderBy': orderBy,
        '\$top': numRecords,
        '\$skip': skip,
        '\$count': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportAbuseCall {
  Future<ApiCallResponse> call({
    dynamic? abuseReportJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AbuseGroup.getBaseUrl(
      authToken: authToken,
    );

    final abuseReport = _serializeJson(abuseReportJson);
    final ffApiRequestBody = '''
${abuseReport}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Report Abuse',
      apiUrl: '${baseUrl}/Abuse/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAbuseByIDCall {
  Future<ApiCallResponse> call({
    int? abuseId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AbuseGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Abuse by ID',
      apiUrl: '${baseUrl}/Abuse/${unloggedToken}/single/${abuseId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAbuseCall {
  Future<ApiCallResponse> call({
    dynamic? newAbuseJson,
    int? abuseId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AbuseGroup.getBaseUrl(
      authToken: authToken,
    );

    final newAbuse = _serializeJson(newAbuseJson);
    final ffApiRequestBody = '''
${newAbuse}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Abuse',
      apiUrl: '${baseUrl}/Abuse/${unloggedToken}/${abuseId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAbuseCall {
  Future<ApiCallResponse> call({
    int? abuseId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AbuseGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Abuse',
      apiUrl: '${baseUrl}/Abuse/${unloggedToken}/${abuseId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Abuse Group Code

/// Start Alias Group Code

class AliasGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetAliasesCall getAliasesCall = GetAliasesCall();
  static AddAliasCall addAliasCall = AddAliasCall();
  static GetAliasByIDCall getAliasByIDCall = GetAliasByIDCall();
  static UpdateAliasCall updateAliasCall = UpdateAliasCall();
  static DeleteAliasCall deleteAliasCall = DeleteAliasCall();
  static VerifyAliasNameCall verifyAliasNameCall = VerifyAliasNameCall();
  static BlockAliasCall blockAliasCall = BlockAliasCall();
  static UnblockAliasCall unblockAliasCall = UnblockAliasCall();
  static FollowAliasCall followAliasCall = FollowAliasCall();
  static UnfollowAliasCall unfollowAliasCall = UnfollowAliasCall();
}

class GetAliasesCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderBy = 'id asc',
    int? numItems = 10,
    int? skip = 0,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Aliases',
      apiUrl: '${baseUrl}/Alias/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderBy,
        '\$top': numItems,
        '\$skip': skip,
        '\$count': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddAliasCall {
  Future<ApiCallResponse> call({
    String? newAliasName = '',
    int? userId,
    String? unauthToken,
    String? authToken = '',
  }) async {
    unauthToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "name": ${newAliasName == null ? 'null' : '"${escapeStringForJson(newAliasName)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Alias',
      apiUrl: '${baseUrl}/Alias/${unauthToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAliasByIDCall {
  Future<ApiCallResponse> call({
    int? aliasId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Alias by ID',
      apiUrl: '${baseUrl}/Alias/${unloggedToken}/single/${aliasId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAliasCall {
  Future<ApiCallResponse> call({
    int? aliasId,
    dynamic? updatedAliasJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    final updatedAlias = _serializeJson(updatedAliasJson);
    final ffApiRequestBody = '''
${updatedAlias}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Alias',
      apiUrl: '${baseUrl}/Alias/${unloggedToken}/${aliasId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAliasCall {
  Future<ApiCallResponse> call({
    int? aliasId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Alias',
      apiUrl: '${baseUrl}/Alias/${unloggedToken}/${aliasId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyAliasNameCall {
  Future<ApiCallResponse> call({
    String? nameToVerify = '',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
${nameToVerify == null ? 'null' : '"${escapeStringForJson(nameToVerify)}"'}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Alias name',
      apiUrl: '${baseUrl}/Alias/${unloggedToken}/verifyAlias',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlockAliasCall {
  Future<ApiCallResponse> call({
    int? aliasToReportId,
    int? reporterId,
    String? authToken = '',
  }) async {
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Block Alias',
      apiUrl: '${baseUrl}/Alias/block',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetAliasId': aliasToReportId,
        'requestAliasId': reporterId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnblockAliasCall {
  Future<ApiCallResponse> call({
    int? aliasToUnblockId,
    int? requesterAlias,
    String? authToken = '',
  }) async {
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Unblock Alias',
      apiUrl: '${baseUrl}/Alias/unblock',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetAliasId': aliasToUnblockId,
        'requestAliasId': requesterAlias,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FollowAliasCall {
  Future<ApiCallResponse> call({
    int? aliasToFollowId,
    int? requesterId,
    String? authToken = '',
  }) async {
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Follow Alias',
      apiUrl: '${baseUrl}/Alias/follow',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetAliasId': aliasToFollowId,
        'requestAliasId': requesterId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnfollowAliasCall {
  Future<ApiCallResponse> call({
    int? aliasToUnfollowId,
    int? requesterId,
    String? authToken = '',
  }) async {
    final baseUrl = AliasGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Unfollow Alias',
      apiUrl: '${baseUrl}/Alias/unfollow',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetAliasId': aliasToUnfollowId,
        'requestAliasId': requesterId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Alias Group Code

/// Start Bug Group Code

class BugGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetBugsCall getBugsCall = GetBugsCall();
  static ReportBugCall reportBugCall = ReportBugCall();
  static GetBugByIDCall getBugByIDCall = GetBugByIDCall();
  static UpdateBugCall updateBugCall = UpdateBugCall();
  static DeleteBugCall deleteBugCall = DeleteBugCall();
}

class GetBugsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id desc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = BugGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Bugs',
      apiUrl: '${baseUrl}/Bug/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$numItems': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportBugCall {
  Future<ApiCallResponse> call({
    dynamic? bugJson,
    String? unloggedToken = '',
    String? authToken = '',
  }) async {
    final baseUrl = BugGroup.getBaseUrl(
      authToken: authToken,
    );

    final bug = _serializeJson(bugJson);
    final ffApiRequestBody = '''
${bug}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Report Bug',
      apiUrl: '${baseUrl}/Bug/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBugByIDCall {
  Future<ApiCallResponse> call({
    int? bugId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = BugGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Bug by ID',
      apiUrl: '${baseUrl}/Bug/${unloggedToken}/single/${bugId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateBugCall {
  Future<ApiCallResponse> call({
    int? bugId,
    dynamic? bugJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = BugGroup.getBaseUrl(
      authToken: authToken,
    );

    final bug = _serializeJson(bugJson);
    final ffApiRequestBody = '''
${bug}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Bug',
      apiUrl: '${baseUrl}/Bug/${unloggedToken}/${bugId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteBugCall {
  Future<ApiCallResponse> call({
    int? bugId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = BugGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Bug',
      apiUrl: '${baseUrl}/Bug/${unloggedToken}/${bugId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Bug Group Code

/// Start Channel Group Code

class ChannelGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetChannelsCall getChannelsCall = GetChannelsCall();
  static CreateChannelCall createChannelCall = CreateChannelCall();
  static GetChannelByIDCall getChannelByIDCall = GetChannelByIDCall();
  static UpdateChannelCall updateChannelCall = UpdateChannelCall();
  static DeleteChannelCall deleteChannelCall = DeleteChannelCall();
  static FollowChannelCall followChannelCall = FollowChannelCall();
  static UnfollowChannelCall unfollowChannelCall = UnfollowChannelCall();
}

class GetChannelsCall {
  Future<ApiCallResponse> call({
    int? numItems = 10,
    int? skip = 0,
    String? orderby = 'id asc',
    String? filter = 'true',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Channels',
      apiUrl: '${baseUrl}/Channel/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateChannelCall {
  Future<ApiCallResponse> call({
    dynamic? channelJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    final channel = _serializeJson(channelJson);
    final ffApiRequestBody = '''
${channel}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Channel',
      apiUrl: '${baseUrl}/Channel/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChannelByIDCall {
  Future<ApiCallResponse> call({
    int? channelId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Channel by ID',
      apiUrl: '${baseUrl}/Channel/${unloggedToken}/single/${channelId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateChannelCall {
  Future<ApiCallResponse> call({
    int? channelId,
    dynamic? channelJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    final channel = _serializeJson(channelJson);
    final ffApiRequestBody = '''
${channel}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Channel',
      apiUrl: '${baseUrl}/Channel/${unloggedToken}/${channelId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteChannelCall {
  Future<ApiCallResponse> call({
    int? channelId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Channel',
      apiUrl: '${baseUrl}/Channel/${unloggedToken}/${channelId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FollowChannelCall {
  Future<ApiCallResponse> call({
    int? requesterId,
    int? targetChannelId,
    String? authToken = '',
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Follow Channel',
      apiUrl: '${baseUrl}/Channel/follow',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetChannelId': targetChannelId,
        'requestAliasId': requesterId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnfollowChannelCall {
  Future<ApiCallResponse> call({
    int? targetChannelId,
    int? requesterId,
    String? authToken = '',
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Unfollow Channel',
      apiUrl: '${baseUrl}/Channel/unfollow',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetChannelId': targetChannelId,
        'requestAliasId': requesterId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Channel Group Code

/// Start Chapter  DELETED Group Code

class ChapterDELETEDGroup {
  static String getBaseUrl() => 'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'accept': 'application/json;odata.metadata=minimal;odata.streaming=true',
  };
  static GetChaptersCall getChaptersCall = GetChaptersCall();
  static AddChapterCall addChapterCall = AddChapterCall();
  static GetChapterByIDCall getChapterByIDCall = GetChapterByIDCall();
  static UpdateChapterCall updateChapterCall = UpdateChapterCall();
  static DeleteChapterCall deleteChapterCall = DeleteChapterCall();
}

class GetChaptersCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
  }) async {
    final baseUrl = ChapterDELETEDGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Chapters',
      apiUrl: '${baseUrl}/Chapter',
      callType: ApiCallType.GET,
      headers: {
        'accept':
            'application/json;odata.metadata=minimal;odata.streaming=true',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddChapterCall {
  Future<ApiCallResponse> call({
    dynamic? chapterJson,
  }) async {
    final baseUrl = ChapterDELETEDGroup.getBaseUrl();

    final chapter = _serializeJson(chapterJson);
    final ffApiRequestBody = '''
${chapter}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Chapter',
      apiUrl: '${baseUrl}/Chapter',
      callType: ApiCallType.POST,
      headers: {
        'accept':
            'application/json;odata.metadata=minimal;odata.streaming=true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChapterByIDCall {
  Future<ApiCallResponse> call({
    int? chapterId,
  }) async {
    final baseUrl = ChapterDELETEDGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Chapter by ID',
      apiUrl: '${baseUrl}/Chapter/${chapterId}',
      callType: ApiCallType.GET,
      headers: {
        'accept':
            'application/json;odata.metadata=minimal;odata.streaming=true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateChapterCall {
  Future<ApiCallResponse> call({
    int? chapterId,
    dynamic? chapterJson,
  }) async {
    final baseUrl = ChapterDELETEDGroup.getBaseUrl();

    final chapter = _serializeJson(chapterJson);
    final ffApiRequestBody = '''
${chapter}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Chapter',
      apiUrl: '${baseUrl}/Chapter/${chapterId}',
      callType: ApiCallType.PUT,
      headers: {
        'accept':
            'application/json;odata.metadata=minimal;odata.streaming=true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteChapterCall {
  Future<ApiCallResponse> call({
    int? chapterId,
  }) async {
    final baseUrl = ChapterDELETEDGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Chapter',
      apiUrl: '${baseUrl}/Chapter/${chapterId}',
      callType: ApiCallType.DELETE,
      headers: {
        'accept':
            'application/json;odata.metadata=minimal;odata.streaming=true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Chapter  DELETED Group Code

/// Start Comment Group Code

class CommentGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetCommentsCall getCommentsCall = GetCommentsCall();
  static PostCommentCall postCommentCall = PostCommentCall();
  static GetCommentByIDCall getCommentByIDCall = GetCommentByIDCall();
  static UpdateCommentCall updateCommentCall = UpdateCommentCall();
  static DeleteCommentCall deleteCommentCall = DeleteCommentCall();
}

class GetCommentsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = CommentGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Comments',
      apiUrl: '${baseUrl}/Comment/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostCommentCall {
  Future<ApiCallResponse> call({
    dynamic? postJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = CommentGroup.getBaseUrl(
      authToken: authToken,
    );

    final post = _serializeJson(postJson);
    final ffApiRequestBody = '''
${post}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Comment',
      apiUrl: '${baseUrl}/Comment/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCommentByIDCall {
  Future<ApiCallResponse> call({
    int? commentId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = CommentGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Comment by ID',
      apiUrl: '${baseUrl}/Comment/${unloggedToken}/single/${commentId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateCommentCall {
  Future<ApiCallResponse> call({
    int? commentId,
    dynamic? commentJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = CommentGroup.getBaseUrl(
      authToken: authToken,
    );

    final comment = _serializeJson(commentJson);
    final ffApiRequestBody = '''
${comment}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Comment',
      apiUrl: '${baseUrl}/Comment/${unloggedToken}/${commentId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteCommentCall {
  Future<ApiCallResponse> call({
    int? commentId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = CommentGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Comment',
      apiUrl: '${baseUrl}/Comment/${unloggedToken}/${commentId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Comment Group Code

/// Start Hashtag Group Code

class HashtagGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetHashtagsCall getHashtagsCall = GetHashtagsCall();
  static PostHashtagCall postHashtagCall = PostHashtagCall();
  static GetHashtagByIDCall getHashtagByIDCall = GetHashtagByIDCall();
  static UpdateHashtagCall updateHashtagCall = UpdateHashtagCall();
  static DeleteHashtagCall deleteHashtagCall = DeleteHashtagCall();
}

class GetHashtagsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? numItems = 10,
    int? skip = 0,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = HashtagGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Hashtags',
      apiUrl: '${baseUrl}/Hashtag/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        'top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostHashtagCall {
  Future<ApiCallResponse> call({
    dynamic? hashtagJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = HashtagGroup.getBaseUrl(
      authToken: authToken,
    );

    final hashtag = _serializeJson(hashtagJson);
    final ffApiRequestBody = '''
${hashtag}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Hashtag',
      apiUrl: '${baseUrl}/Hashtag/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHashtagByIDCall {
  Future<ApiCallResponse> call({
    int? hashtagId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = HashtagGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Hashtag by ID',
      apiUrl: '${baseUrl}/Hashtag/${unloggedToken}/single/${hashtagId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateHashtagCall {
  Future<ApiCallResponse> call({
    int? hashtagId,
    dynamic? hashtagJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = HashtagGroup.getBaseUrl(
      authToken: authToken,
    );

    final hashtag = _serializeJson(hashtagJson);
    final ffApiRequestBody = '''
${hashtag}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Hashtag',
      apiUrl: '${baseUrl}/Hashtag/${unloggedToken}/${hashtagId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteHashtagCall {
  Future<ApiCallResponse> call({
    int? hashtagId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = HashtagGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Hashtag',
      apiUrl: '${baseUrl}/Hashtag/${unloggedToken}/${hashtagId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Hashtag Group Code

/// Start Notification Group Code

class NotificationGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetNotificationsCall getNotificationsCall = GetNotificationsCall();
  static PostNotificationCall postNotificationCall = PostNotificationCall();
  static GetNotificationByIDCall getNotificationByIDCall =
      GetNotificationByIDCall();
  static UpdateNotificationCall updateNotificationCall =
      UpdateNotificationCall();
  static DeleteNotificationCall deleteNotificationCall =
      DeleteNotificationCall();
}

class GetNotificationsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = NotificationGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Notifications',
      apiUrl: '${baseUrl}/Notification/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostNotificationCall {
  Future<ApiCallResponse> call({
    dynamic? notificationJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = NotificationGroup.getBaseUrl(
      authToken: authToken,
    );

    final notification = _serializeJson(notificationJson);
    final ffApiRequestBody = '''
${notification}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Notification',
      apiUrl: '${baseUrl}/Notification/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNotificationByIDCall {
  Future<ApiCallResponse> call({
    int? notificationId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = NotificationGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Notification by ID',
      apiUrl:
          '${baseUrl}/Notification/${unloggedToken}/single/${notificationId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateNotificationCall {
  Future<ApiCallResponse> call({
    int? notificationId,
    dynamic? notificationJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = NotificationGroup.getBaseUrl(
      authToken: authToken,
    );

    final notification = _serializeJson(notificationJson);
    final ffApiRequestBody = '''
${notification}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Notification',
      apiUrl: '${baseUrl}/Notification/${unloggedToken}/${notificationId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteNotificationCall {
  Future<ApiCallResponse> call({
    int? notificationId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = NotificationGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Notification',
      apiUrl: '${baseUrl}/Notification/${unloggedToken}/${notificationId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Notification Group Code

/// Start Permission Group Code

class PermissionGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetPermissionsCall getPermissionsCall = GetPermissionsCall();
  static CreatePermissionCall createPermissionCall = CreatePermissionCall();
  static GetPermissionByIDCall getPermissionByIDCall = GetPermissionByIDCall();
  static UpdatePermissionCall updatePermissionCall = UpdatePermissionCall();
  static DeletePermissionCall deletePermissionCall = DeletePermissionCall();
}

class GetPermissionsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PermissionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Permissions',
      apiUrl: '${baseUrl}/Permission/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatePermissionCall {
  Future<ApiCallResponse> call({
    dynamic? permissionJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PermissionGroup.getBaseUrl(
      authToken: authToken,
    );

    final permission = _serializeJson(permissionJson);
    final ffApiRequestBody = '''
${permission}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Permission',
      apiUrl: '${baseUrl}/Permission/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPermissionByIDCall {
  Future<ApiCallResponse> call({
    int? permissionId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PermissionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Permission by ID',
      apiUrl: '${baseUrl}/Permission/${unloggedToken}/single/${permissionId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePermissionCall {
  Future<ApiCallResponse> call({
    int? permissionId,
    dynamic? permissionJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PermissionGroup.getBaseUrl(
      authToken: authToken,
    );

    final permission = _serializeJson(permissionJson);
    final ffApiRequestBody = '''
${permission}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Permission',
      apiUrl: '${baseUrl}/Permission/${unloggedToken}/${permissionId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePermissionCall {
  Future<ApiCallResponse> call({
    int? permissionId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PermissionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Permission',
      apiUrl: '${baseUrl}/Permission/${unloggedToken}/${permissionId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Permission Group Code

/// Start Playlist Group Code

class PlaylistGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetPlaylistsCall getPlaylistsCall = GetPlaylistsCall();
  static PostPlaylistCall postPlaylistCall = PostPlaylistCall();
  static GetPlaylistByIDCall getPlaylistByIDCall = GetPlaylistByIDCall();
  static UpdatePlaylistCall updatePlaylistCall = UpdatePlaylistCall();
  static DeletePlaylistCall deletePlaylistCall = DeletePlaylistCall();
}

class GetPlaylistsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PlaylistGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Playlists',
      apiUrl: '${baseUrl}/Playlist/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostPlaylistCall {
  Future<ApiCallResponse> call({
    dynamic? playlistJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PlaylistGroup.getBaseUrl(
      authToken: authToken,
    );

    final playlist = _serializeJson(playlistJson);
    final ffApiRequestBody = '''
${playlist}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Playlist',
      apiUrl: '${baseUrl}/Playlist/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPlaylistByIDCall {
  Future<ApiCallResponse> call({
    int? playlistId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PlaylistGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Playlist by ID',
      apiUrl: '${baseUrl}/Playlist/${unloggedToken}/single/${playlistId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePlaylistCall {
  Future<ApiCallResponse> call({
    int? playlistId,
    dynamic? playlistJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PlaylistGroup.getBaseUrl(
      authToken: authToken,
    );

    final playlist = _serializeJson(playlistJson);
    final ffApiRequestBody = '''
${playlist}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Playlist',
      apiUrl: '${baseUrl}/Playlist/${unloggedToken}/${playlistId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePlaylistCall {
  Future<ApiCallResponse> call({
    int? playlistId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PlaylistGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Playlist',
      apiUrl: '${baseUrl}/Playlist/${unloggedToken}/${playlistId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Playlist Group Code

/// Start Policy Group Code

class PolicyGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetPoliciesCall getPoliciesCall = GetPoliciesCall();
  static AddPolicyCall addPolicyCall = AddPolicyCall();
  static GetPolicyByIDCall getPolicyByIDCall = GetPolicyByIDCall();
  static UpdatePolicyCall updatePolicyCall = UpdatePolicyCall();
  static DeletePolicyCall deletePolicyCall = DeletePolicyCall();
}

class GetPoliciesCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? authToken = '',
  }) async {
    final baseUrl = PolicyGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Policies',
      apiUrl: '${baseUrl}/Policy',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPolicyCall {
  Future<ApiCallResponse> call({
    dynamic? policyJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PolicyGroup.getBaseUrl(
      authToken: authToken,
    );

    final policy = _serializeJson(policyJson);
    final ffApiRequestBody = '''
${policy}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Policy',
      apiUrl: '${baseUrl}/Policy/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPolicyByIDCall {
  Future<ApiCallResponse> call({
    int? policyId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PolicyGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Policy by ID',
      apiUrl: '${baseUrl}/Policy/${unloggedToken}/single/${policyId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePolicyCall {
  Future<ApiCallResponse> call({
    int? policyId,
    dynamic? policyJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PolicyGroup.getBaseUrl(
      authToken: authToken,
    );

    final policy = _serializeJson(policyJson);
    final ffApiRequestBody = '''
${policy}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Policy',
      apiUrl: '${baseUrl}/Policy/${unloggedToken}/${policyId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePolicyCall {
  Future<ApiCallResponse> call({
    int? policyId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PolicyGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Policy',
      apiUrl: '${baseUrl}/Policy/${unloggedToken}/${policyId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Policy Group Code

/// Start Post Group Code

class PostGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetPostsCall getPostsCall = GetPostsCall();
  static AddPostCall addPostCall = AddPostCall();
  static GetPostByIDCall getPostByIDCall = GetPostByIDCall();
  static UpdatePostCall updatePostCall = UpdatePostCall();
  static DeletePostCall deletePostCall = DeletePostCall();
}

class GetPostsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PostGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Posts',
      apiUrl: '${baseUrl}/Post/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPostCall {
  Future<ApiCallResponse> call({
    dynamic? postJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PostGroup.getBaseUrl(
      authToken: authToken,
    );

    final post = _serializeJson(postJson);
    final ffApiRequestBody = '''
${post}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Post',
      apiUrl: '${baseUrl}/Post/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPostByIDCall {
  Future<ApiCallResponse> call({
    int? postId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PostGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Post by ID',
      apiUrl: '${baseUrl}/Post/${unloggedToken}/single/${postId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePostCall {
  Future<ApiCallResponse> call({
    int? postId,
    dynamic? postJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PostGroup.getBaseUrl(
      authToken: authToken,
    );

    final post = _serializeJson(postJson);
    final ffApiRequestBody = '''
${post}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Post',
      apiUrl: '${baseUrl}/Post/${unloggedToken}/${postId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePostCall {
  Future<ApiCallResponse> call({
    int? postId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = PostGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Post',
      apiUrl: '${baseUrl}/Post/${unloggedToken}/${postId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Post Group Code

/// Start Reaction Group Code

class ReactionGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetAliasReactionsCall getAliasReactionsCall = GetAliasReactionsCall();
  static ReactToAnAliasCall reactToAnAliasCall = ReactToAnAliasCall();
  static RemoveAliasReactionCall removeAliasReactionCall =
      RemoveAliasReactionCall();
  static GetChannelReactionsCall getChannelReactionsCall =
      GetChannelReactionsCall();
  static ReactToAChannelCall reactToAChannelCall = ReactToAChannelCall();
  static RemoveChannelReactionCall removeChannelReactionCall =
      RemoveChannelReactionCall();
  static GetCommentReactionsCall getCommentReactionsCall =
      GetCommentReactionsCall();
  static ReactToACommentCall reactToACommentCall = ReactToACommentCall();
  static RemoveCommentReactionCall removeCommentReactionCall =
      RemoveCommentReactionCall();
  static GetPostReactionsCall getPostReactionsCall = GetPostReactionsCall();
  static ReactToAPostCall reactToAPostCall = ReactToAPostCall();
  static RemovePostReactionCall removePostReactionCall =
      RemovePostReactionCall();
  static GetVozCastReactionsCall getVozCastReactionsCall =
      GetVozCastReactionsCall();
  static ReactToAVozCastCall reactToAVozCastCall = ReactToAVozCastCall();
  static RemoveVozCastReactionCall removeVozCastReactionCall =
      RemoveVozCastReactionCall();
}

class GetAliasReactionsCall {
  Future<ApiCallResponse> call({
    int? aliasId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Alias Reactions',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Alias/${aliasId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactToAnAliasCall {
  Future<ApiCallResponse> call({
    int? aliasId,
    int? reactingAliasId,
    String? reactionType = '',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'React to an Alias',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Alias/${aliasId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'AliasId': reactingAliasId,
        'ReactionType': reactionType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveAliasReactionCall {
  Future<ApiCallResponse> call({
    int? reactingAliasId,
    int? aliasId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Alias Reaction',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Alias/${aliasId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'requestAliasId': reactingAliasId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChannelReactionsCall {
  Future<ApiCallResponse> call({
    int? channelId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Channel Reactions',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Channel/${channelId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactToAChannelCall {
  Future<ApiCallResponse> call({
    int? reactingAliasId,
    int? channelId,
    String? reactionType = '',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'React to a Channel',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Channel/${channelId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'AliasId': reactingAliasId,
        'ReactionType': reactionType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveChannelReactionCall {
  Future<ApiCallResponse> call({
    int? channelId,
    int? reactingAliasId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Channel Reaction',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Channel/${channelId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'requestAliasId': reactingAliasId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCommentReactionsCall {
  Future<ApiCallResponse> call({
    int? commentId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Comment Reactions',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Comment/${commentId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactToACommentCall {
  Future<ApiCallResponse> call({
    int? commentId,
    int? reactingAliasId,
    String? reactionType = '',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'React to a Comment',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Comment/${commentId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'AliasId': reactingAliasId,
        'ReactionType': reactionType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveCommentReactionCall {
  Future<ApiCallResponse> call({
    int? reactingAliasId,
    int? commentId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Comment Reaction',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Comment/${commentId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'requestAliasId': reactingAliasId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPostReactionsCall {
  Future<ApiCallResponse> call({
    int? postId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Post Reactions',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Post/${postId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactToAPostCall {
  Future<ApiCallResponse> call({
    int? reactingAliasId,
    int? postId,
    String? reactionType = '',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'React to a Post',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Post/${postId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'AliasId': reactingAliasId,
        'ReactionType': reactionType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemovePostReactionCall {
  Future<ApiCallResponse> call({
    int? reactingAliasId,
    int? postId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Post Reaction',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/Post/${postId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'requestAliasId': reactingAliasId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVozCastReactionsCall {
  Future<ApiCallResponse> call({
    int? vozCastId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get VozCast Reactions',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/VozCast/${vozCastId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactToAVozCastCall {
  Future<ApiCallResponse> call({
    int? reactingAliasId,
    int? vozCastId,
    String? reactionType = '',
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'React to a VozCast',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/VozCast/${vozCastId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'AliasId': reactingAliasId,
        'ReactionType': reactionType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveVozCastReactionCall {
  Future<ApiCallResponse> call({
    int? vozCastId,
    int? reactingAliasId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = ReactionGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove VozCast Reaction',
      apiUrl: '${baseUrl}/Reaction/${unloggedToken}/VozCast/${vozCastId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'requestAliasId': reactingAliasId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Reaction Group Code

/// Start Role Group Code

class RoleGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetRolesCall getRolesCall = GetRolesCall();
  static AddRoleCall addRoleCall = AddRoleCall();
  static GetRoleByIDCall getRoleByIDCall = GetRoleByIDCall();
  static UpdateRoleCall updateRoleCall = UpdateRoleCall();
  static DeleteRoleCall deleteRoleCall = DeleteRoleCall();
}

class GetRolesCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? authToken = '',
  }) async {
    final baseUrl = RoleGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Roles',
      apiUrl: '${baseUrl}/Role',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddRoleCall {
  Future<ApiCallResponse> call({
    dynamic? roleJson,
    String? authToken = '',
  }) async {
    final baseUrl = RoleGroup.getBaseUrl(
      authToken: authToken,
    );

    final role = _serializeJson(roleJson);
    final ffApiRequestBody = '''
${role}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Role',
      apiUrl: '${baseUrl}/Role',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRoleByIDCall {
  Future<ApiCallResponse> call({
    int? roleId,
    String? authToken = '',
  }) async {
    final baseUrl = RoleGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Role by ID',
      apiUrl: '${baseUrl}/Role/${roleId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateRoleCall {
  Future<ApiCallResponse> call({
    int? roleId,
    dynamic? roleJson,
    String? authToken = '',
  }) async {
    final baseUrl = RoleGroup.getBaseUrl(
      authToken: authToken,
    );

    final role = _serializeJson(roleJson);
    final ffApiRequestBody = '''
${role}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Role',
      apiUrl: '${baseUrl}/Role/${roleId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteRoleCall {
  Future<ApiCallResponse> call({
    int? roleId,
    String? authToken = '',
  }) async {
    final baseUrl = RoleGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Role',
      apiUrl: '${baseUrl}/Role/${roleId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Role Group Code

/// Start User Group Code

class UserGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetUsersCall getUsersCall = GetUsersCall();
  static AddUserCall addUserCall = AddUserCall();
  static GetUserByIDCall getUserByIDCall = GetUserByIDCall();
  static UpdateUserCall updateUserCall = UpdateUserCall();
  static DeleteUserCall deleteUserCall = DeleteUserCall();
  static UpdateUserPasswordCall updateUserPasswordCall =
      UpdateUserPasswordCall();
}

class GetUsersCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = UserGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Users',
      apiUrl: '${baseUrl}/User/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddUserCall {
  Future<ApiCallResponse> call({
    dynamic? userJson,
    String? authToken = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      authToken: authToken,
    );

    final user = _serializeJson(userJson);
    final ffApiRequestBody = '''
${user}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add User',
      apiUrl: '${baseUrl}/User',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserByIDCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = UserGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User by ID',
      apiUrl: '${baseUrl}/User/${unloggedToken}/single/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserCall {
  Future<ApiCallResponse> call({
    dynamic? userJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = UserGroup.getBaseUrl(
      authToken: authToken,
    );

    final user = _serializeJson(userJson);
    final ffApiRequestBody = '''
${user}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User',
      apiUrl: '${baseUrl}/User/${unloggedToken}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? authToken = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete User',
      apiUrl: '${baseUrl}/User/${userId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserPasswordCall {
  Future<ApiCallResponse> call({
    String? unloggedToken,
    int? userId,
    String? password = '',
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = UserGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Update User Password',
      apiUrl: '${baseUrl}/User/${unloggedToken}',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'Id': userId,
        'Password': password,
        'ConfirmPassword': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End User Group Code

/// Start Vozcast Group Code

class VozcastGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
    'authorization': 'Bearer [auth_token]',
  };
  static GetVozCastsCall getVozCastsCall = GetVozCastsCall();
  static PostVozCastCall postVozCastCall = PostVozCastCall();
  static GetVozCastByIDCall getVozCastByIDCall = GetVozCastByIDCall();
  static UpdateVozCastCall updateVozCastCall = UpdateVozCastCall();
  static DeleteVozCastCall deleteVozCastCall = DeleteVozCastCall();
  static FollowVozCastCall followVozCastCall = FollowVozCastCall();
  static UnfollowVozCastCall unfollowVozCastCall = UnfollowVozCastCall();
}

class GetVozCastsCall {
  Future<ApiCallResponse> call({
    String? filter = 'true',
    String? orderby = 'id asc',
    int? skip = 0,
    int? numItems = 10,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get VozCasts',
      apiUrl: '${baseUrl}/VozCast/${unloggedToken}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        '\$filter': filter,
        '\$orderby': orderby,
        '\$skip': skip,
        '\$top': numItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostVozCastCall {
  Future<ApiCallResponse> call({
    dynamic? vozcastJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    final vozcast = _serializeJson(vozcastJson);
    final ffApiRequestBody = '''
${vozcast}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post VozCast',
      apiUrl: '${baseUrl}/VozCast/${unloggedToken}',
      callType: ApiCallType.POST,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVozCastByIDCall {
  Future<ApiCallResponse> call({
    int? vozcastId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get VozCast by ID',
      apiUrl: '${baseUrl}/VozCast/${unloggedToken}/single/${vozcastId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateVozCastCall {
  Future<ApiCallResponse> call({
    int? vozcastId,
    dynamic? vozcastJson,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    final vozcast = _serializeJson(vozcastJson);
    final ffApiRequestBody = '''
${vozcast}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update VozCast',
      apiUrl: '${baseUrl}/VozCast/${unloggedToken}/${vozcastId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVozCastCall {
  Future<ApiCallResponse> call({
    int? vozcastId,
    String? unloggedToken,
    String? authToken = '',
  }) async {
    unloggedToken ??= FFAppConstants.UnauthToken;
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete VozCast',
      apiUrl: '${baseUrl}/VozCast/${unloggedToken}/${vozcastId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FollowVozCastCall {
  Future<ApiCallResponse> call({
    int? targetVozCastId,
    int? requesterId,
    String? authToken = '',
  }) async {
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Follow VozCast',
      apiUrl:
          '${baseUrl}/VozCast/follow?targetVozCastId=${targetVozCastId}&requestAliasId=${requesterId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnfollowVozCastCall {
  Future<ApiCallResponse> call({
    int? targetVozCastId,
    int? requesterId,
    String? authToken = '',
  }) async {
    final baseUrl = VozcastGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Unfollow VozCast',
      apiUrl: '${baseUrl}/VozCast/unfollow',
      callType: ApiCallType.PATCH,
      headers: {
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
        'authorization': 'Bearer ${authToken}',
      },
      params: {
        'targetVozCastId': targetVozCastId,
        'requestAliasId': requesterId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Vozcast Group Code

/// Start Auth Group Code

class AuthGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api/Auth';
  static Map<String, String> headers = {
    'authorization': 'Bearer [auth_token]',
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
  };
  static LoginCall loginCall = LoginCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static GetClaimsCall getClaimsCall = GetClaimsCall();
  static ChangePassworddCall changePassworddCall = ChangePassworddCall();
  static LogoutCall logoutCall = LogoutCall();
  static RegisterCall registerCall = RegisterCall();
  static SendVerificationEmailCall sendVerificationEmailCall =
      SendVerificationEmailCall();
  static VerifyEmailCall verifyEmailCall = VerifyEmailCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "username": ${username == null ? 'null' : '"${escapeStringForJson(username)}"'},
  "password": ${password == null ? 'null' : '"${escapeStringForJson(password)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Refresh Token',
      apiUrl: '${baseUrl}/refresh_token',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {
        'token': refreshToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetClaimsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Claims',
      apiUrl: '${baseUrl}/get_claims',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePassworddCall {
  Future<ApiCallResponse> call({
    String? newPassword = '',
    String? confirmNewPassword = '',
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "password": ${newPassword == null ? 'null' : '"${escapeStringForJson(newPassword)}"'},
  "confirmPassword": ${confirmNewPassword == null ? 'null' : '"${escapeStringForJson(confirmNewPassword)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Passwordd',
      apiUrl: '${baseUrl}/change_password',
      callType: ApiCallType.PUT,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${baseUrl}/logout_all',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? lastName = '',
    String? email = '',
    String? phone = '',
    String? password = '',
    String? birthDate = '',
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '${baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {
        'Name': name,
        'Surname': lastName,
        'Email': email,
        'Phone': phone,
        'Password': password,
        'BirthDate': birthDate,
        'Is2Fa': false,
        'IsMailVerified': false,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendVerificationEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Send Verification Email',
      apiUrl: '${baseUrl}/verify_email',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyEmailCall {
  Future<ApiCallResponse> call({
    String? emailToVerify = '',
    String? authToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
${emailToVerify == null ? 'null' : '"${escapeStringForJson(emailToVerify)}"'}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Email',
      apiUrl: '${baseUrl}/verify_email',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Auth Group Code

/// Start MareMagnum Group Code

class MareMagnumGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://wevozapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'authorization': 'Bearer [auth_token]',
    'Accept':
        'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
  };
  static MareMagnumStandardCall mareMagnumStandardCall =
      MareMagnumStandardCall();
  static MareMagnumKeyCall mareMagnumKeyCall = MareMagnumKeyCall();
}

class MareMagnumStandardCall {
  Future<ApiCallResponse> call({
    String? unauthToken,
    String? authToken = '',
  }) async {
    unauthToken ??= FFAppConstants.UnauthToken;
    final baseUrl = MareMagnumGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'MareMagnum Standard',
      apiUrl: '${baseUrl}/MareMagnum/home/${unauthToken}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<MareMagnumContentResStruct>? topDay(dynamic response) => (getJsonField(
        response,
        r'''$.top_day_data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => MareMagnumContentResStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<MareMagnumContentResStruct>? topWeek(dynamic response) => (getJsonField(
        response,
        r'''$.top_week_data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => MareMagnumContentResStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<MareMagnumContentResStruct>? topMonth(dynamic response) => (getJsonField(
        response,
        r'''$.top_month_data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => MareMagnumContentResStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<HashtagStruct>? topHashtags(dynamic response) => (getJsonField(
        response,
        r'''$.trending_hashtags''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => HashtagStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class MareMagnumKeyCall {
  Future<ApiCallResponse> call({
    String? unauthToken,
    String? key = '',
    int? page,
    String? filter = '',
    String? expand = '',
    String? orderby = '',
    int? top,
    int? skip,
    String? authToken = '',
  }) async {
    unauthToken ??= FFAppConstants.UnauthToken;
    final baseUrl = MareMagnumGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'MareMagnum Key',
      apiUrl: '${baseUrl}/MareMagnum/mare_magnum/${unauthToken}/${key}/${page}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${authToken}',
        'Accept':
            'application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=true',
      },
      params: {
        '\$filter': filter,
        '\$expand': expand,
        '\$orderby': orderby,
        '\$top': top,
        '\$skip': skip,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End MareMagnum Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  final encoded = jsonEncode(input);
  return encoded.substring(1, encoded.length - 1);
}
