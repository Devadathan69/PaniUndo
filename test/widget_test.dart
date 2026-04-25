import 'package:flutter_test/flutter_test.dart';
import 'package:pani_undo/main.dart';

void main() {
  testWidgets('landing screen shows both role entry points', (tester) async {
    await tester.pumpWidget(const PaniUndoApp());

    expect(find.text('PaniUndo'), findsOneWidget);
    expect(find.text('I am a worker'), findsOneWidget);
    expect(find.text('I am an employer'), findsOneWidget);
  });
}
