import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination;

  DateTime _selectedDate = DateTime.now();
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;
  int _starCount;
  bool _isStarred = false;

  final List<String> _availablePackages = const [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  CruiseBookingViewModel({required this.destination})
      : _starCount = destination.initialStarCount;

  // Getters
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  List<String> get availablePackages => _availablePackages;

  // Actions
  void updateVisitDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updatePackage(String package) {
    _selectedPackage = package;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleStar() {
    _isStarred = !_isStarred;
    if (_isStarred) {
      _starCount += 1;
    } else {
      _starCount -= 1;
    }
    notifyListeners();
  }
}
