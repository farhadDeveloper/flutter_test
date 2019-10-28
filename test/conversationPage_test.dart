import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test1/pages/ConversationPage.dart';
import 'package:flutter_test1/widgets/ChatAppBar.dart';
import 'package:flutter_test1/widgets/ChatListWidget.dart';
import 'package:flutter_test1/widgets/InputWidget.dart';

void main(){
   MaterialApp app = MaterialApp(
    home: Scaffold(
        body:   ConversationPage()
    ),
  );

  testWidgets('ConversationPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.byType(ChatAppBar),findsOneWidget);
    expect(find.byType(InputWidget),findsOneWidget);
    expect(find.byType(ChatListWidget),findsOneWidget);


  });
}