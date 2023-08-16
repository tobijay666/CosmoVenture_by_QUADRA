import 'package:cosmoventure/presentaion/pages/user_Chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';

class ChatCard extends StatelessWidget {
  final String name;
  final String time;
  final String description;
  final String image;
  const ChatCard(
      {super.key,
      required this.name,
      required this.image,
      required this.description,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserChatScreen(uname: name)));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius:
                BorderRadius.circular(5), // Adjust the radius as needed
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(5), // Adjust the radius as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          Text(
                            time,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                          ),
                        ],
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.whiteColor,
                            ),
                      ),
                    ],
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
