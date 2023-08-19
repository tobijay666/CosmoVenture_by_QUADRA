import 'package:cosmoventure/presentaion/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';

class BookingConfirmedScreen extends StatefulWidget {
  final String? uid;
  const BookingConfirmedScreen({super.key, this.uid});

  @override
  State<BookingConfirmedScreen> createState() => _BookingConfirmedScreenState();
}

class _BookingConfirmedScreenState extends State<BookingConfirmedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                  Text(
                    "Booking Confirmed",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 16), // Add some spacing
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.lightGreen,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Congratulation !",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Your tickets are successfully booked  ",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                        ),
                        Text(
                          "Booking Id : NG 2434532523",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          "Booked On : 17/04/2023",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Booking Details",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Passengers",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "2 Adults",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "1 Child",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Departure",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "17/2/2013",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "-7.00 PM",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Payment Summary",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.lightGreen,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Text(
                              "500BTC",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
