import 'package:class_assignment/src/models/message.dart';
import 'package:class_assignment/src/models/message_dao.dart';
import 'package:class_assignment/src/widgets/bottom_message_input_field.dart';
import 'package:class_assignment/src/widgets/message_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late Stream<QuerySnapshot<Object?>> _streamResult;

  @override
  void initState() {
    super.initState();
    _streamResult = MessageDao().getMessagesStream();
  }

  @override
  Widget build(BuildContext context) {
    // double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    // double appBarHeight = AppBar().preferredSize.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: _buildMessagesAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2.1,
                          child: StreamBuilder(
                            stream: _streamResult,
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (!snapshot.hasData ||
                                  snapshot.data == null) {
                                return const Center(
                                  child: Text('No Data!'),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text('Error occurred!'),
                                );
                              }
                              return ListView.separated(
                                separatorBuilder: (_, index) {
                                  return const SizedBox(height: 12);
                                },
                                physics: const BouncingScrollPhysics(),
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: ((context, index) {
                                  final message = Message.fromSnapshot(
                                    snapshot.data.docs[index],
                                  );
                                  return MessageCard(
                                    name: message.name,
                                    description: message.description,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const BottomMessageInputField(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildMessagesAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      title: Text(
        "Messages".toUpperCase(),
        style: const TextStyle(
          fontSize: 24,
          color: Color(0xff404040),
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Material(
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(50),
            child: IconButton(
              splashColor: Colors.transparent,
              splashRadius: 1,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Center(
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.grey.shade800,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
