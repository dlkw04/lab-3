import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String imagePath;

  const HeaderWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 240,
          color: Colors.lightBlue.shade100,
          child: const Center(
            child: Icon(Icons.directions_boat, size: 80, color: Colors.blue),
          ),
        );
      },
    );
  }
}
