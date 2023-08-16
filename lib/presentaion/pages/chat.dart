import 'package:cosmoventure/presentaion/pages/user_Chat.dart';
import 'package:cosmoventure/presentaion/widgets/chat_card.dart';
import 'package:cosmoventure/presentaion/widgets/drop_down.dart';
import 'package:cosmoventure/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController idController = TextEditingController();
  String locationDropdownValue = 'Mars';
  String homePlanetDropdownValue = 'Mars';
  String hobbiesDropdownValue = 'Singing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          AppStrings.chat,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Image(
            image: AssetImage(AppImages.chatImg),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.list,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Chats",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00 pm',
                    ),
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00 pm',
                    ),
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00 pm',
                    ),
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00 pm',
                    ),
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00 pm',
                    ),
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00 pm',
                    ),
                    ChatCard(
                      image: 'https://i.pravatar.cc/300',
                      name: 'Tom',
                      description: 'hi how are you',
                      time: '4.00pm',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Positioned(
                  bottom:
                      50, // Adjust the value to position the button as needed
                  right:
                      16, // Adjust the value to position the button as needed
                  child: FloatingActionButton(
                    onPressed: () {
                      // Button action
                      _showPopUpContainer(context);
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  void _showPopUpContainer(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 250, // Set the desired height of the pop-up
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message_rounded,
                  size: 40,
                  color: AppColors.outlineColor,
                ),
                SizedBox(
                  height: 30,
                ),
                GradientButton(
                  isDisabled: false,
                  title: "Chat With a Friend",
                  onPress: () {
                    Navigator.of(context).pop();
                    _showPopUpChatFriendContainer(context);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                GradientButton(
                  isDisabled: false,
                  title: "Chat With Some One Random",
                  onPress: () {
                    Navigator.of(context).pop();
                    _showPopUpRandomFriendContainer(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPopUpChatFriendContainer(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          // Set the desired height of the pop-up
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.message_rounded,
                      size: 40,
                      color: AppColors.outlineColor,
                    ),
                    CustomTextField(
                      color: "white",
                      textInputAction: TextInputAction.next,
                      textEditingController: idController,
                      labelText: AppStrings.id,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GradientButton(
                      isDisabled: false,
                      title: "Chat",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserChatScreen(
                                      uname: idController.text,
                                    )));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPopUpRandomFriendContainer(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            children: [
              Icon(
                Icons.message_rounded,
                size: 40,
                color: AppColors.outlineColor,
              ),
              CustomDropDown(
                labelText: "Location",
                lst: ['Mars', 'Venus', 'Jupiter', 'Neptune'],
                onChanged: (newValue) {
                  setState(() {
                    locationDropdownValue = newValue!;
                  });
                },
                value: locationDropdownValue,
              ),
              SizedBox(height: 30),
              CustomDropDown(
                labelText: "Home Planet",
                lst: ['Mars', 'Venus', 'Jupiter', 'Neptune'],
                onChanged: (newValue) {
                  setState(() {
                    homePlanetDropdownValue = newValue!;
                  });
                },
                value: homePlanetDropdownValue,
              ),
              SizedBox(height: 30),
              CustomDropDown(
                labelText: "Hobbies",
                lst: ['Singing', 'Dancing', 'Acting', 'Painting'],
                onChanged: (newValue) {
                  setState(() {
                    hobbiesDropdownValue = newValue!;
                  });
                },
                value: hobbiesDropdownValue,
              ),
              SizedBox(height: 30),
              GradientButton(
                isDisabled: false,
                title: "Chat",
                onPress: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
