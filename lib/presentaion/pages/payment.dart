import 'package:cosmoventure/presentaion/bloc/payment/payment_bloc.dart';
import 'package:cosmoventure/presentaion/pages/booking_Confirmation.dart';
import 'package:cosmoventure/presentaion/pages/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/drop_down.dart';
import '../widgets/gradient_button.dart';
import '../widgets/message_dialog.dart';
import '../widgets/text_feild.dart';
import 'login.dart';

class PaymentPortal extends StatefulWidget {
  final String? bookingId;
  final String? uid;

  const PaymentPortal({super.key, this.bookingId, this.uid});

  @override
  State<PaymentPortal> createState() => _PaymentPortalState();
}

class _PaymentPortalState extends State<PaymentPortal> {
  late String? bookingName;
  late String? price;
  late String? date;
  late String? time;
  late num? count;

  final PaymentBloc bloc = sl<PaymentBloc>();
  bool isLoading = false;
  final TextEditingController bookingIdController = TextEditingController();
  final TextEditingController bookingNameController = TextEditingController();
  String paymentMethodValue = AppStrings.paymentType1;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc..add(PaymentLoading(bookingId: widget.bookingId!)),
        child: BlocConsumer<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoaded) {
              bookingName = state.bookingEntity?.destination!;
              count = state.bookingEntity?.passengerCount!;
              price = state.bookingEntity?.price!;
              date = state.bookingEntity?.date!;
              time = state.bookingEntity?.time!;
              time = state.bookingEntity?.time!;
              return _bodyWidget();
            }
            if (state is PaymentError) {
              return _bodyWidget();
            }
            if (state is PaymentSuccess) {
              return _bodyWidget();
            }
            if (state is PaymentConfirmation) {
              return BookingConfirmedScreen(
                uid: widget.uid,
                bookingId: widget.bookingId,
                count: count!,
                price: (count! * int.parse(price!)).toString(),
                time: time,
                departure: date,
              );
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
            if (state is PaymentError) {
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.errorTitle,
                  buttonTitle: AppStrings.tryAgain,
                  imagePath: AppImages.errorImage,
                  description: state.errorDesc, onPress: () {
                Navigator.pop(context);
                bloc.add(PaymentLoading(bookingId: widget.bookingId!));
              });
              dialog.show();
            }
            if (state is PaymentSuccess) {
              setState(() {
                isLoading = false;
              });

              MessageDialog dialog = MessageDialog(context,
                  title: state.successTitle,
                  buttonTitle: AppStrings.ok,
                  imagePath: AppImages.successImage,
                  description: state.successDesc, onPress: () {
                Navigator.pop(context);
                bloc.add(PaymentMade());
              });
              dialog.show();
            }
          },
        ),
      ),
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
                  image: AssetImage(AppImages.paymentportalMain),
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
                        AppStrings.paymentPortalTopic,
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
                            widget.bookingId!,
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
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            bookingName!,
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
                      CustomDropDown(
                        labelText: AppStrings.paymentMethod,
                        lst: const [
                          AppStrings.paymentType1,
                          AppStrings.paymentType2,
                          AppStrings.paymentType3,
                          AppStrings.paymentType4,
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            paymentMethodValue = newValue!;
                          });
                        },
                        value: paymentMethodValue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppStrings.paymentAmount,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                (count! * int.parse(price!)).toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
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
                            //     builder: (context) =>
                            //         const BookingConfirmedScreen(),
                            //   ),
                            // );
                            bloc.add(PaymentMake(
                                price: (count! * int.parse(price!)).toString(),
                                destination: bookingName!,
                                paymentType: paymentMethodValue,
                                bookingId: widget.bookingId!));
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

  void _showBookingConfirmedContainer(BuildContext context) {
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
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Text("Sdsdfsa"),
            ));
      },
    );
  }
}
