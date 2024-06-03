import 'package:flutter/material.dart';

class ExperienceSingleWidget extends StatelessWidget {
  final String position;
  final DateTime startDate;
  final DateTime? endDate;
  final String companyName;
  final String companyWebsite;
  final List<String> responsibilities;

  const ExperienceSingleWidget({
    super.key,
    required this.position,
    required this.startDate,
    this.endDate,
    required this.companyName,
    required this.companyWebsite,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
