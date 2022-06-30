import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffBDFFD7).withOpacity(0.5),
            width: 8,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: SizedBox(
            height: 220,
            width: 220,
            child: Image.network(
              'https://i.pinimg.com/736x/3d/6d/6c/3d6d6ccf59bff0984fbf5de2521f6e0c.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
