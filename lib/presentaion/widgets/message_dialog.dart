import 'package:flutter/material.dart';

import 'msg_dialog.dart';

class MessageDialog {
  final String title;
  final String buttonTitle;
  final String imagePath;
  final void Function() onPress;
  final String? description;
  final BuildContext context;

  MessageDialog(
    this.context, {
    required this.title,
    required this.buttonTitle,
    required this.imagePath,
    required this.onPress,
    this.description,
  });

  void show() {
    FocusScope.of(context).unfocus();
    showBottomSheet(
      backgroundColor: const Color.fromARGB(255, 230, 231, 232),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return MessageDialog(
          context,
          title: title,
          buttonTitle: buttonTitle,
          imagePath: imagePath,
          description: description,
          onPress: onPress,
        ).build();
      },
    );
  }

  Widget build() {
    return MsgDialog(context,
        title: title,
        buttonTitle: buttonTitle,
        imagePath: imagePath,
        description: description,
        onPress: onPress);
  }
}
