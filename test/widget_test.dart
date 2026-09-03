import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:esmambolasmi/main.dart'; // Sesuaikan import main app lo

void main() {
  testWidgets('Katalog Es Mambo smoke test', (WidgetTester tester) async {
    // Bungkus MyApp dengan ProviderScope agar Riverpod tidak error
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Pastikan aplikasi berhasil dimuat tanpa crash
    expect(find.byType(MyApp), findsOneWidget);
  });
}
