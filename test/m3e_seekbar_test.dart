import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3e_seekbar/m3e_seekbar.dart';

void main() {
  group('M3ESeekbar', () {
    testWidgets('renders properly with default parameters', (
      WidgetTester tester,
    ) async {
      double value = 0.5;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: M3ESeekbar(
                value: value,
                onChanged: (newValue) {
                  value = newValue;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ESeekbar), findsOneWidget);
    });

    testWidgets('renders wavy seekbar properly', (WidgetTester tester) async {
      double value = 0.3;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: M3EWavySeekbar(
                value: value,
                isPlaying: true,
                onChanged: (newValue) {
                  value = newValue;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3EWavySeekbar), findsOneWidget);
    });

    test('decoration and theme configuration', () {
      const decoration = M3ESeekbarDecoration(
        handleShape: M3ESeekbarHandleShape.circle,
        trackHeight: 12.0,
      );

      expect(decoration.handleShape, M3ESeekbarHandleShape.circle);
      expect(decoration.trackHeight, 12.0);
    });
  });
}
