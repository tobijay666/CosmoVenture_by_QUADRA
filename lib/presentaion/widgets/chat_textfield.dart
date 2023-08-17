import 'package:cosmoventure/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  get textEditingController => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: const TextStyle(color: AppColors.greyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.greyColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.bookingTopic),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send_rounded,
              size: 30, color: AppColors.bookingTopic),
          onPressed: () {
            // setState(() {
            //   _isWaitingForResponse = true;
            // });
            // _sendMessage();
          },
        ),
      ],
    );
  }
}
