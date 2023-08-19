import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/date_selector.dart';
import '../widgets/drop_down.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController unameController = TextEditingController();
  final TextEditingController interIDController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController ticketNoController = TextEditingController();
  final TextEditingController departureLocationController =
      TextEditingController();
  String PassengerDropdownValue = '1';
  String GenderDropDownValue = 'Male';

  // get selectedValue => null;
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: _bodyWidget(),
      backgroundColor: Colors.black,
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.profileScreen),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                NetworkImage('https://i.pravatar.cc/300'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                //getImage();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.outlineColor,
                                ),
                                child: const Icon(
                                  size: 30,
                                  Icons.camera_alt,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppStrings.profileTopic,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: AppColors.bookingTopic,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: unameController,
                        labelText: AppStrings.profileUNametxt,
                        textAlign: TextAlign.center,
                        hintText: AppStrings.profileUName,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: interIDController,
                        labelText: AppStrings.profileInterIDtxt,
                        textAlign: TextAlign.center,
                        hintText: AppStrings.profileInterID,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: addressController,
                        labelText: AppStrings.profileAdresstxt,
                        textAlign: TextAlign.center,
                        hintText: AppStrings.profileAdress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDateSelector(
                        labelText: AppStrings.profileDOBtxt,
                        initialDate: AppStrings.profileDOB,
                        onDateSelected: (date) {
                          departureDateController.text =
                              date.toString().split(' ')[0];
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                        labelText: "Gender",
                        lst: const [
                          'Male',
                          'Female',
                          'Other',
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            GenderDropDownValue = newValue!;
                          });
                        },
                        value: GenderDropDownValue,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: GradientButton(
                          isDisabled: false,
                          title: "Update Profile",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
