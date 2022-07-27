import 'package:flutter/material.dart';

class SocialModel {
  final String socialSite;
  final String socialLink;
  final String? path;
  final int cardColor;
  final IconData socialIcon;

  SocialModel({
    required this.socialLink,
    required this.socialSite,
    required this.path,
    required this.cardColor,
    required this.socialIcon,
  });

  factory SocialModel.fromMap(Map<String, dynamic> map) {
    return SocialModel(
      socialSite: map['socialSite'] ?? '',
      socialLink: map['socialLink'] ?? '',
      path: map['pathHeader'] ?? '',
      cardColor: map['cardColor'] ?? 0xffffff,
      socialIcon: map['socialIcon'] ?? '',
    );
  }
}
