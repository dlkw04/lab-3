import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/models/cruise_destination.dart';
import 'package:first_flutter_app/viewmodels/cruise_booking_viewmodel.dart';
import 'package:first_flutter_app/views/cruise_booking_screen.dart';
import 'package:first_flutter_app/main.dart';

void main() {
  testWidgets('App load smoke test', (WidgetTester tester) async {
    const destination = CruiseDestination(
      name: 'Rajang River Cruise',
      location: 'Sibu, Sarawak, Malaysia',
      description: 'Test description',
      initialStarCount: 41,
      imagePath: 'assets/images/rajang_river.jpg',
    );
    final viewModel = CruiseBookingViewModel(destination: destination);

    await tester.pumpWidget(MyApp(viewModel: viewModel));

    expect(find.byType(CruiseBookingScreen), findsOneWidget);
    expect(find.text('Rajang River Cruise'), findsNWidgets(2));
  });
}
