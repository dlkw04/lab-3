import 'package:flutter/material.dart';
import 'models/cruise_destination.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  const destination = CruiseDestination(
    name: 'Rajang River Cruise',
    location: 'Sibu, Sarawak, Malaysia',
    description:
        'Sibu is the primary commercial hub and river port for Sarawak’s Sibu Economic Zone. '
        'To promote eco-tourism and heritage along Malaysia’s longest river, the Sibu Municipal Council '
        'offers riverboat cruises where tourists can review destinations, check riverboat schedules, '
        'pick travel modes, and reserve cruise dates.',
    initialStarCount: 41,
    imagePath: 'assets/images/rajang_river.jpg',
  );

  final viewModel = CruiseBookingViewModel(destination: destination);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return MaterialApp(
          title: 'Rajang River Cruise App',
          debugShowCheckedModeBanner: false,
          theme: viewModel.isDarkMode
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true).copyWith(
                  primaryColor: Colors.blue,
                ),
          home: CruiseBookingScreen(viewModel: viewModel),
        );
      },
    );
  }
}
