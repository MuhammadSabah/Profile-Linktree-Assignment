import 'package:class_assignment/src/models/social_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({Key? key, required this.social}) : super(key: key);
  final SocialModel social;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: Color(social.cardColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(
                  social.socialIcon,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  social.socialSite,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
