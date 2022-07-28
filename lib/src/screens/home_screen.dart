import 'package:class_assignment/src/widgets/profile_image.dart';
import 'package:class_assignment/src/widgets/social_card.dart';
import 'package:class_assignment/src/screens/message_screen.dart';
import 'package:class_assignment/src/widgets/social_links_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bottom_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 44),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: ProfileImage(),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    "Full Name".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 64.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF727272),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  const SocialLinksList(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: BottomIcon(
                  iconSize: 30,
                  icon: FontAwesomeIcons.whatsapp,
                  color: 0xff59FFAF,
                  iconColor: Colors.green,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: BottomIcon(
                  iconSize: 28,
                  color: 0xffE2F1FF,
                  icon: FontAwesomeIcons.solidEnvelope,
                  iconColor: Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageScreen(),
                      ),
                    );
                  },
                  child: BottomIcon(
                    iconSize: 25,
                    icon: FontAwesomeIcons.solidMessage,
                    color: 0xffD9CF75,
                    iconColor: Colors.greenAccent,
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
