import 'package:class_assignment/mock/data.dart';
import 'package:class_assignment/src/components/social_card.dart';
import 'package:class_assignment/src/models/social_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksList extends StatelessWidget {
  const SocialLinksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SocialModel> socials =
        mockData.map((item) => SocialModel.fromMap(item)).toList();
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: socials.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemBuilder: (context, index) {
        final social = socials[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: SizedBox(
            width: 300,
            height: 50,
            child: InkWell(
              onTap: () async {
                final urlLink = Uri(
                  scheme: 'https',
                  host: social.socialLink,
                  path: social.path,
                );
                if (!await launchUrl(
                  urlLink,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not launch $urlLink';
                }
              },
              child: SocialCard(
                social: social,
              ),
            ),
          ),
        );
      },
    );
  }
}
