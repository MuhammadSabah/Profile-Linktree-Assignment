import 'package:class_assignment/src/models/message.dart';
import 'package:class_assignment/src/models/message_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomMessageInputField extends StatefulWidget {
  const BottomMessageInputField({Key? key}) : super(key: key);

  @override
  State<BottomMessageInputField> createState() =>
      _BottomMessageInputFieldState();
}

class _BottomMessageInputFieldState extends State<BottomMessageInputField> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _nameController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final messageDao = Provider.of<MessageDao>(context, listen: false);
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffE9E9E9),
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Text(
              "SEND ME A MESSAGE".toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff404040),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // !: First Text field
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 500,
                      ),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Write a Description';
                          }
                          return null;
                        },
                        controller: _descriptionController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autocorrect: false,
                        maxLines: 4,
                        cursorColor: Colors.grey.shade800,
                        decoration: InputDecoration(
                          hintText: 'MESSAGE',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // !: Second Text field
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Name Required';
                              }
                              return null;
                            },
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            autocorrect: false,
                            // maxLines: 1,
                            cursorColor: Colors.grey.shade800,
                            decoration: InputDecoration(
                              hintText: 'NAME',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF6F6F6),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xffE9E9E9),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xffE9E9E9),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xffE9E9E9),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            splashRadius: 28,
                            splashColor: Colors.white60,
                            onPressed: () {
                              _sendMessage(messageDao);
                            },
                            icon: const Icon(
                              Icons.send,
                              size: 40,
                              color: Color(0xff00FF85),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(MessageDao messageDao) {
    if (_descriptionController.text.isNotEmpty &&
        _nameController.text.isNotEmpty) {
      final message = Message(
        name: _nameController.text,
        description: _descriptionController.text,
        date: DateTime.now(),
      );
      messageDao.saveMessage(message);
      _nameController.clear();
      _descriptionController.clear();
      setState(() {});
    }
  }
}
