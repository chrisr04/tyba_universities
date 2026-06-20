import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tyba_universities/common/widgets/horizontal_item_card.dart';
import 'package:tyba_universities/common/widgets/info_row.dart';
import 'package:tyba_universities/main.dart' as main_app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigate from Home to Detail', (tester) async {
    main_app.main();

    await tester.pumpAndSettle();

    await tester.tap(find.byType(HorizontalItemCard).first);

    await tester.pumpAndSettle();

    expect(find.byType(InfoRow), findsAtLeast(1));
  });
}
