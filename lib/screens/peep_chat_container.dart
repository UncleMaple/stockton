import 'package:flutter/material.dart';
import 'package:stockton/mock_data/message_model.dart';
import 'package:stockton/screens/chat_screen.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/theme.dart';

class PeepChatContainer extends StatelessWidget {
  final Message chat;

  const PeepChatContainer({
    Key key,
    @required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatScreen(
            user: chat.sender,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
//                    color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(chat.sender.imageUrl),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.sender.name,
                          style: TextStyle(
                            color: whiteBright,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            chat.text,
                            style: TextStyle(
                              color: whiteDark,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      chat.time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    chat.unread
                        ? Container(
                            width: 40.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'New',
                              style: TextStyle(
                                color: whiteBright,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppTheme.colorShallowBlack,
            height: 0,
            indent: 100,
            endIndent: 20,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
