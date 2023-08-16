import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_images.dart';
import '../widgets/drop_down.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';
import 'login.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController passengerAdultController =
      TextEditingController();
  final TextEditingController passengerChildrenController =
      TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController ticketNoController = TextEditingController();
  final TextEditingController departureLocationController =
      TextEditingController();
  String PassengerDropdownValue = '1';
  String departureDropDownValue = '1:00';

  // get selectedValue => null;
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _bodyWidget(),
      backgroundColor: Colors.black,
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Column(
        children: [
          // Container(
          //   height: 200, // Adjust this height as needed
          //   child: const Image(
          //     image: AssetImage(AppImages.bookingMain),
          //     fit: BoxFit.cover, // Adjust the BoxFit as needed
          //   ),
          // ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bookingMain),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Text(
                        AppStrings.bookingTopic,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: AppColors.bookingTopic,
                                ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: destinationController,
                        labelText: AppStrings.bookingDestination,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                        labelText: "Passengers",
                        lst: const [
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10'
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            PassengerDropdownValue = newValue!;
                          });
                        },
                        value: PassengerDropdownValue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: departureDateController,
                        labelText: AppStrings.departureDate,
                        lines: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                        labelText: "Departure Time",
                        lst: const [
                          '1:00',
                          '2:00',
                          '3:00',
                          '4:00',
                          '5:00',
                          '6:00',
                          '7:00',
                          '8:00',
                          '9:00',
                          '10:00'
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            departureDropDownValue = newValue!;
                          });
                        },
                        value: departureDropDownValue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: departureLocationController,
                        labelText: AppStrings.departureLocation,
                        lines: 1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GradientButton(
                        isDisabled: false,
                        title: AppStrings.next,
                        onPress: () {},
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
