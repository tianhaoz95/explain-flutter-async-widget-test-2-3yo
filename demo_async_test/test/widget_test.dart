import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_async_test/main.dart';

void main() {
  testWidgets('Counter increments', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Contrib screen shows up', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byKey(Key('contrib_btn')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('contrib_title')), findsOneWidget);
  });

  testWidgets('Slow screen content shows up', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byKey(Key('slow_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    expect(find.byKey(Key('slow_content')), findsOneWidget);
  });
}
