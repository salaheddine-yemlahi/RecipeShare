

import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileItem {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onEdit;

  ProfileItem({
    required this.icon,
    required this.label,
    required this.value,
    this.onEdit,
  });
}