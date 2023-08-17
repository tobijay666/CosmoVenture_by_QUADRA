import 'package:cosmoventure/presentaion/pages/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/drop_down.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_feild.dart';
import 'login.dart';

class PaymentPortal extends StatefulWidget {
  const PaymentPortal({super.key});

  @override
  State<PaymentPortal> createState() => _PaymentPortalState();
}

class _PaymentPortalState extends State<PaymentPortal> {
  final TextEditingController bookingIdController = TextEditingController();
  final TextEditingController bookingNameController = TextEditingController();
  String paymentMethodValue = AppStrings.paymentType1;

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
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: bookingIdController,
                        labelText: AppStrings.bookingID,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        textEditingController: bookingNameController,
                        labelText: AppStrings.bookingName,
                        textAlign: TextAlign.center,
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
                            child: Text(
                              "AppStrings.paymentAmount",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: AppColors.greyColor,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransactionScreen(),
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
