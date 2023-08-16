import 'package:cosmoventure/presentaion/widgets/incoming_msg.dart';
import 'package:cosmoventure/presentaion/widgets/send_msg.dart';
import 'package:cosmoventure/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';

class UserChatScreen extends StatefulWidget {
  final String uname;
  const UserChatScreen({super.key, required this.uname});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Text(
          widget.uname,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
      body: _bodyWidget(),
      backgroundColor: AppColors.black2,
    );
  }

  _bodyWidget() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SendMsg(),
            SizedBox(
              height: 20,
            ),
            SendMsg(),
            SizedBox(
              height: 20,
            ),
            incomingMsg(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
