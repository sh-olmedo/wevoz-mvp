import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/alias_min/alias_min_widget.dart';
import '/shared/channel_min/channel_min_widget.dart';
import '/shared/comment/comment_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import '/shared/voz/voz_widget.dart';
import '/shared/vozcast_min/vozcast_min_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'playlist_widget.dart' show PlaylistWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlaylistModel extends FlutterFlowModel<PlaylistWidget> {
  ///  Local state fields for this component.

  ContentType? currentContentKind;

  List<String> urls = [];
  void addToUrls(String item) => urls.add(item);
  void removeFromUrls(String item) => urls.remove(item);
  void removeAtIndexFromUrls(int index) => urls.removeAt(index);
  void insertAtIndexInUrls(int index, String item) => urls.insert(index, item);
  void updateUrlsAtIndex(int index, Function(String) updateFn) =>
      urls[index] = updateFn(urls[index]);

  int loopIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // Models for voz dynamic component.
  late FlutterFlowDynamicModels<VozModel> vozModels;
  // Models for vozcast-min dynamic component.
  late FlutterFlowDynamicModels<VozcastMinModel> vozcastMinModels;
  // Models for channel-min dynamic component.
  late FlutterFlowDynamicModels<ChannelMinModel> channelMinModels;
  // Models for alias-min dynamic component.
  late FlutterFlowDynamicModels<AliasMinModel> aliasMinModels;
  // Models for comment dynamic component.
  late FlutterFlowDynamicModels<CommentModel> commentModels;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    vozModels = FlutterFlowDynamicModels(() => VozModel());
    vozcastMinModels = FlutterFlowDynamicModels(() => VozcastMinModel());
    channelMinModels = FlutterFlowDynamicModels(() => ChannelMinModel());
    aliasMinModels = FlutterFlowDynamicModels(() => AliasMinModel());
    commentModels = FlutterFlowDynamicModels(() => CommentModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    vozModels.dispose();
    vozcastMinModels.dispose();
    channelMinModels.dispose();
    aliasMinModels.dispose();
    commentModels.dispose();
  }

  /// Action blocks.
  /// Loop action to iterate through 'Playlist[chapters]' and query each element
  /// with the correct api call
  Future queryPlaylistItemUrls(
    BuildContext context, {
    int? startIndex,
  }) async {
    ApiCallResponse? acBlGetPost;
    ApiCallResponse? acBlGetVozcast;
    ApiCallResponse? acBlGetChannel;
    ApiCallResponse? acBlGetAlias;
    ApiCallResponse? acBlGetComment;

    loopIndex = startIndex != null ? startIndex! : 0;
    urls = [];
    while (
        (urls.length <= 5) || (loopIndex < widget!.playlist!.chapters.length)) {
      await actions.consolePrint(
        'Querying ${(widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.type?.name} with id: ${(widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.id?.toString()}',
      );
      if ((widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.type ==
          ContentType.Voz) {
        acBlGetPost = await PostGroup.getPostByIDCall.call(
          postId:
              (widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.postId,
          authToken: currentAuthenticationToken,
        );

        if ((acBlGetPost?.succeeded ?? true)) {
          addToUrls(
              PostStruct.maybeFromMap((acBlGetPost?.jsonBody ?? ''))!.audioUrl);
        }
      } else if ((widget!.playlist?.chapters?.elementAtOrNull(loopIndex))
              ?.type ==
          ContentType.VozCast) {
        acBlGetVozcast = await VozcastGroup.getVozCastByIDCall.call(
          vozcastId: (widget!.playlist?.chapters?.elementAtOrNull(loopIndex))
              ?.vozCastId,
          authToken: currentAuthenticationToken,
        );

        if ((acBlGetVozcast?.succeeded ?? true)) {
          addToUrls(
              VozCastStruct.maybeFromMap((acBlGetVozcast?.jsonBody ?? ''))!
                  .audioUrl);
        }
      } else if ((widget!.playlist?.chapters?.elementAtOrNull(loopIndex))
              ?.type ==
          ContentType.Channel) {
        acBlGetChannel = await ChannelGroup.getChannelByIDCall.call(
          channelId: (widget!.playlist?.chapters?.elementAtOrNull(loopIndex))
              ?.channelId,
          authToken: currentAuthenticationToken,
        );

        if ((acBlGetChannel?.succeeded ?? true)) {
          addToUrls(
              ChannelStruct.maybeFromMap((acBlGetChannel?.jsonBody ?? ''))!
                  .audioUrl);
        }
      } else if ((widget!.playlist?.chapters?.elementAtOrNull(loopIndex))
              ?.type ==
          ContentType.Alias) {
        acBlGetAlias = await AliasGroup.getAliasByIDCall.call(
          aliasId:
              (widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.postId,
          authToken: currentAuthenticationToken,
        );

        if ((acBlGetAlias?.succeeded ?? true)) {
          addToUrls(AliasStruct.maybeFromMap((acBlGetAlias?.jsonBody ?? ''))!
              .audioUrl);
        }
      } else if ((widget!.playlist?.chapters?.elementAtOrNull(loopIndex))
              ?.type ==
          ContentType.Comment) {
        acBlGetComment = await CommentGroup.getCommentByIDCall.call(
          commentId:
              (widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.postId,
          authToken: currentAuthenticationToken,
        );

        if ((acBlGetComment?.succeeded ?? true)) {
          addToUrls(
              CommentStruct.maybeFromMap((acBlGetComment?.jsonBody ?? ''))!
                  .audioUrl);
        }
      } else {
        await actions.consolePrint(
          'Query for ${(widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.type?.name} with internal id ${(widget!.playlist?.chapters?.elementAtOrNull(loopIndex))?.id?.toString()} not done. Skipping to next element',
        );
      }

      loopIndex = loopIndex + 1;
    }
    loopIndex = 0;
  }
}
