import 'package:class_assignment/mock_data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialModel {
  final String socialSite;
  final String socialLink;
  final int cardColor;
  final IconData socialIcon;

  SocialModel({
    required this.socialLink,
    required this.socialSite,
    required this.cardColor,
    required this.socialIcon,
  });

  factory SocialModel.fromMap(Map<String, dynamic> map) {
    return SocialModel(
      socialSite: map['socialSite'] ?? '',
      socialLink: map['socialLink'] ?? '',
      cardColor: map['cardColor'] ?? 0xffffff,
      socialIcon: map['socialIcon'] ?? '',
    );
  }
}
