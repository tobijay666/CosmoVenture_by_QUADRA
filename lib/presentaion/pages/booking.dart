import 'package:cosmoventure/presentaion/bloc/booking/booking_bloc.dart';
import 'package:cosmoventure/presentaion/pages/payment.dart';
import 'package:cosmoventure/presentaion/widgets/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_images.dart';
import '../widgets/drop_down.dart';
import '../widgets/gradient_button.dart';
import '../widgets/message_dialog.dart';
import '../widgets/text_feild.dart';
import 'login.dart';

class BookingsScreen extends StatefulWidget {
  final String? destination;
  final String? uid;
  final String? price;
  const BookingsScreen({super.key, this.uid, this.destination, this.price});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  late String bookingId;
  final BookingBloc bloc = sl<BookingBloc>();
  bool isLoading = false;

  final TextEditingController destinationController = TextEditingController();
  final TextEditingController passengerAdultController =
      TextEditingController();
  final TextEditingController passengerChildrenController =
      TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController arrivalDateController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController ticketNoController = TextEditingController();
  final TextEditingController departureLocationController =
      TextEditingController();
  String adultPassengerDropdownValue = '1';
  String childPassengerDropdownValue = '1';
  String departureDropDownValue = '1:00';

  @override
  void initState() {
    // TODO: implement initState
    adultPassengerDropdownValue = '1';
    childPassengerDropdownValue = '1';

    departureDateController.text = DateTime.now().day.toString() +
        "/" +
        DateTime.now().month.toString() +
        "/" +
        DateTime.now().year.toString();
    arrivalDateController.text = DateTime.now().day.toString() +
        "/" +
        DateTime.now().month.toString() +
        "/" +
        DateTime.now().year.toString();
    super.initState();
  }

  // get selectedValue => null;
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (_) => bloc..add(BookingLoading()),
        child: BlocConsumer<BookingBloc, BookingState>(
          builder: (context, state) {
            if (state is BookingLoaded) {
              return _bodyWidget();
            }
            if (state is BookingError) {
              return _bodyWidget();
            }
            if (state is BookingSuccess) {
              bookingId = state.bookingId!;
              return _bodyWidget();
            }
            if (state is BookingPay) {
              return PaymentPortal(bookingId: bookingId, uid: widget.uid);
            }
            return const Scaffold(
              backgroundColor: AppColors.black,
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.outlineColor,
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is BookingError) {
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.errorTitle,
                  buttonTitle: AppStrings.tryAgain,
                  imagePath: AppImages.errorImage,
                  description: state.errorDesc, onPress: () {
                Navigator.pop(context);
                bloc.add(BookingLoading());
              });
              dialog.show();
            }
            if (state is BookingSuccess) {
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.successTitle!,
                  buttonTitle: AppStrings.ok,
                  imagePath: AppImages.successImage,
                  description: state.successDesc, onPress: () {
                Navigator.pop(context);
                bloc.add(BookingAdded());
              });
              dialog.show();
            }
          },
        ),
      ),
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
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            widget.destination!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropDown(
                              labelText: "Adult Passengers",
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
                                  adultPassengerDropdownValue = newValue!;
                                });
                              },
                              value: adultPassengerDropdownValue,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomDropDown(
                              labelText: "Child Passengers",
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
                                  childPassengerDropdownValue = newValue!;
                                });
                              },
                              value: childPassengerDropdownValue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDateSelector(
                              labelText: AppStrings.departureDate,
                              onDateSelected: (date) {
                                departureDateController.text =
                                    date.toString().split(' ')[0];
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomDateSelector(
                              labelText: AppStrings.arrivalDate,
                              onDateSelected: (date) {
                                arrivalDateController.text =
                                    date.toString().split(' ')[0];
                              },
                            ),
                          ),
                        ],
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
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: GradientButton(
                          isDisabled: false,
                          title: AppStrings.next,
                          onPress: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const PaymentPortal(),
                            //   ),
                            // );
                            setState(() {
                              isLoading = true;
                            });
                            print(widget.uid!);
                            print(widget.destination!);
                            print(departureLocationController.text);
                            print(
                              int.parse(adultPassengerDropdownValue) +
                                  int.parse(childPassengerDropdownValue),
                            );
                            print(departureDateController.text);
                            print(arrivalDateController.text);
                            print(departureTimeController.text);
                            bloc.add(BookingEventRequested(
                                id: widget.uid!,
                                price: widget.price!,
                                destination: widget.destination!,
                                departure: departureLocationController.text,
                                arrival: arrivalDateController.text,
                                passengerCount:
                                    int.parse(adultPassengerDropdownValue) +
                                        int.parse(childPassengerDropdownValue),
                                date: departureDateController.text,
                                time: departureDropDownValue));
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
