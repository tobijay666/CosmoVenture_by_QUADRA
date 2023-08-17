import 'package:cosmoventure/presentaion/widgets/accordian_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../widgets/gradient_button.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
                  image: AssetImage(AppImages.transactionMain),
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
                        AppStrings.transactionTopic,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: AppColors.transactionColor,
                                ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AccordionView(
                        items: [
                          AccordionItem(
                              labelText: 'Payment to MARS',
                              content: 'BTC 1000'),
                          AccordionItem(
                              labelText: 'Payment to MARS',
                              content: 'BTC 1000'),
                          AccordionItem(
                              labelText: 'Payment to MARS',
                              content: 'BTC 1000'),
                          AccordionItem(
                              labelText: 'Payment to MARS',
                              content: 'BTC 1000'),
                          AccordionItem(
                              labelText: 'Payment to MARS',
                              content: 'BTC 1000'),
                          AccordionItem(
                              labelText: 'Payment to MARS',
                              content: 'BTC 1000'),
                          AccordionItem(
                              labelText: 'Payment to MARS', content: 'BTC 1000')
                        ],
                      ),
                      const SizedBox(
                        height: 40,
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
