import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculator app smoke test', (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp());

    
    expect(find.text('7'), findsOneWidget);
    
    
    await tester.tap(find.text('7'));
    await tester.pump();

    expect(find.text('7'), findsOneWidget); 
  });
}
