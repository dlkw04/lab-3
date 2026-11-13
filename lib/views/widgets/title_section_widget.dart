import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class TitleSectionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const TitleSectionWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.destination.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  viewModel.destination.location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              viewModel.isStarred ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
            onPressed: () {
              viewModel.toggleStar();
            },
          ),
          Text('${viewModel.starCount}'),
        ],
      ),
    );
  }
}
