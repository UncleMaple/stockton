import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:redux/redux.dart';
import 'package:stockton/models/calendar_entry.dart';
import 'package:stockton/models/channel_state.dart';
import 'package:stockton/models/group.dart';
import 'package:stockton/models/in_app_notification.dart';
import 'package:stockton/models/member.dart';
import 'package:built_collection/built_collection.dart';
import 'package:stockton/models/message.dart';
import 'package:stockton/redux/ui/ui_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  BuiltList<CalendarEntry> get memberCalendar;

  BuiltMap<int, Group> get groups;

  @nullable
  int get selectedGroupId;

  // 用户信息
  @nullable
  Member get member;

  BuiltList<Member> get groupMembers;

  ChannelState get channelState;

  BuiltList<Message> get messagesOnScreen;

  // 重新进入app免登录用的 ???
  @nullable
  String get fcmToken;

  @nullable
  InAppNotification get inAppNotification;

  UiState get uiState;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.init() => AppState((a) => a
    ..groups = MapBuilder()
    ..channelState = ChannelState.init().toBuilder()
    ..messagesOnScreen = ListBuilder()
    ..groupMembers = ListBuilder()
    ..memberCalendar = ListBuilder()
    ..uiState = UiState().toBuilder());


  AppState clear() {
    // keep the temporal fcm token even when clearing state
    // so it can be set again on login.
    //
    // Add here anything else that also needs to be carried over.
    return AppState.init().rebuild((s) => s..fcmToken = fcmToken);
  }
}
