import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full_swipe_back_gesture/full_swipe_back_gesture.dart';

void main() {
  testWidgets('BackSwipePageRoute smoke test', (WidgetTester tester) async {
    // Test that BackSwipePageRoute can be created without errors
    final route = BackSwipePageRoute(
      builder: (context) =>
          const Scaffold(body: Center(child: Text('Test Page'))),
    );

    expect(route, isA<BackSwipePageRoute>());
    expect(route.edgeStartWidthPx, equals(24.0));
    expect(route.pushCurve, equals(Curves.easeOutCubic));
    expect(route.popCurve, equals(Curves.easeIn));
  });

  testWidgets('BackSwipePageRoute with custom parameters', (
    WidgetTester tester,
  ) async {
    final route = BackSwipePageRoute(
      builder: (context) =>
          const Scaffold(body: Center(child: Text('Test Page'))),
      edgeStartWidthPx: 50.0,
      pushCurve: Curves.easeInOut,
      popCurve: Curves.easeOut,
      transitionDuration: const Duration(milliseconds: 300),
    );

    expect(route.edgeStartWidthPx, equals(50.0));
    expect(route.pushCurve, equals(Curves.easeInOut));
    expect(route.popCurve, equals(Curves.easeOut));
    expect(route.transitionDuration, equals(const Duration(milliseconds: 300)));
  });
}
