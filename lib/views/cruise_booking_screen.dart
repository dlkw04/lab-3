import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/preference_section_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rajang River Cruise'),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitView()
              : _buildLandscapeView();
        },
      ),
    );
  }

  Widget _buildPortraitView() {
    return ListView(
      children: [
        HeaderWidget(imagePath: viewModel.destination.imagePath),
        TitleSectionWidget(viewModel: viewModel),
        const ActionBarWidget(),
        DescriptionWidget(description: viewModel.destination.description),
        PreferenceSectionWidget(viewModel: viewModel),
      ],
    );
  }

  Widget _buildLandscapeView() {
    return Row(
      children: [
        Expanded(
          child: HeaderWidget(imagePath: viewModel.destination.imagePath),
        ),
        Expanded(
          child: ListView(
            children: [
              TitleSectionWidget(viewModel: viewModel),
              const ActionBarWidget(),
              DescriptionWidget(description: viewModel.destination.description),
              PreferenceSectionWidget(viewModel: viewModel),
            ],
          ),
        ),
      ],
    );
  }
}
