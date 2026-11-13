import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class PreferenceSectionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const PreferenceSectionWidget({super.key, required this.viewModel});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.updateVisitDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        "${viewModel.selectedDate.year}-${viewModel.selectedDate.month.toString().padLeft(2, '0')}-${viewModel.selectedDate.day.toString().padLeft(2, '0')}";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Interactive Controls & Booking',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.calendar_today, color: Colors.blue),
                title: const Text('Visit Date'),
                subtitle: Text(formattedDate),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 4),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.directions_boat, color: Colors.blue),
                title: const Text('Cruise Package'),
                trailing: DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  underline: const SizedBox(),
                  items: viewModel.availablePackages.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      viewModel.updatePackage(newValue);
                    }
                  },
                ),
              ),
              const SizedBox(height: 4),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.dark_mode, color: Colors.blue),
                title: const Text('Dark Mode Theme'),
                trailing: Switch(
                  value: viewModel.isDarkMode,
                  onChanged: (bool value) {
                    viewModel.toggleDarkMode(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
