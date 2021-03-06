import "package:flutter/material.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/theme.dart';

showDialogRsvp(context, RSVP rsvp) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            child: Container(
              width: _Style.dialogWidth,
              height: _Style.dialogHeight,
              child: _dialogContent(context, rsvp),
            ),
          ),
        );
      });
}

String _rsvpIcon(RSVP rsvp) {
  switch (rsvp) {
    case RSVP.YES:
      return "assets/graphics/channel/rsvp/rsvp_yes_large.png";
      break;
    case RSVP.MAYBE:
      return "assets/graphics/channel/rsvp/rsvp_maybe_large.png";
      break;
    case RSVP.NO:
      return "assets/graphics/channel/rsvp/rsvp_no_large.png";
      break;
    case RSVP.UNSET:
    default:
      return "";
      break;
  }
}

Column _dialogContent(context, RSVP rsvp) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Image.asset(
        _rsvpIcon(rsvp),
        height: _Style.dialogIconSize,
        width: _Style.dialogIconSize,
      ),
      _rsvpText(context, rsvp),
    ],
  );
}

Widget _rsvpText(context, RSVP rsvp) {
  switch (rsvp) {
    case RSVP.YES:
      return Text(
        StocktonLocalizations.of(context).eventRsvpDialogYes,
        style: AppTheme.dialogRsvpYesTextStyle,
      );
    case RSVP.MAYBE:
      return Text(
        StocktonLocalizations.of(context).eventRsvpDialogMaybe,
        style: AppTheme.dialogRsvpMaybeTextStyle,
      );
    case RSVP.NO:
      return Text(
        StocktonLocalizations.of(context).eventRsvpDialogNo,
        style: AppTheme.dialogRsvpNoTextStyle,
      );
    case RSVP.UNSET:
    default:
      return Container();
  }
}

class _Style {
  static const dialogWidth = 188.0;
  static const dialogHeight = 188.0;
  static const dialogIconSize = 64.0;
}
