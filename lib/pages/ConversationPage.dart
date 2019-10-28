import 'package:flutter/material.dart';
import 'package:flutter_test1/config/Palette.dart';
import 'package:flutter_test1/widgets/ChatAppBar.dart';
import 'package:flutter_test1/widgets/ChatListWidget.dart';
import 'package:flutter_test1/widgets/ConversationBottomSheet.dart';
import 'package:flutter_test1/widgets/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();

  const ConversationPage();
}

class _ConversationPageState extends State<ConversationPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Container(
                color: Palette.secondaryTextColorLight,
                child:Stack(children: <Widget>[
                  Column(
                    children: <Widget>[
                      ChatListWidget(),
                      GestureDetector(
                          child: InputWidget(),
                          onPanUpdate: (details) {
                            if (details.delta.dy <0) {
                              _scaffoldKey.currentState
                                  .showBottomSheet<Null>((BuildContext context) {
                                return ConversationBottomSheet();
                              });
                            }
                          })
                    ],
                  ),
                ]))));
  }
}