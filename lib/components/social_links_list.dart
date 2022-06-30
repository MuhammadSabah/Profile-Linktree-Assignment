import 'package:class_assignment/components/social_card.dart';
import 'package:class_assignment/mock_data/data.dart';
import 'package:class_assignment/models/social_model.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

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
            child: SocialCard(
              social: social,
            ),
          ),
        );
      },
    );
  }
}
