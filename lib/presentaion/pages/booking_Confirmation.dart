import 'package:cosmoventure/main.dart';
import 'package:cosmoventure/presentaion/bloc/booking_confirmation/booking_confirmation_bloc.dart';
import 'package:cosmoventure/presentaion/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../utils/app_colors.dart';

class BookingConfirmedScreen extends StatefulWidget {
  final String? bookingId;
  final String? uid;
  final String? price;
  final num? count;
  final String? departure;
  final String? time;
  const BookingConfirmedScreen(
      {super.key,
      this.uid,
      this.bookingId,
      this.count,
      this.price,
      this.departure,
      this.time});

  @override
  State<BookingConfirmedScreen> createState() => _BookingConfirmedScreenState();
}

class _BookingConfirmedScreenState extends State<BookingConfirmedScreen> {
  final BookingConfirmationBloc bloc = sl<BookingConfirmationBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: BlocProvider(
        create: (_) => bloc..add(BookingConfirmationLoading()),
        child: BlocConsumer<BookingConfirmationBloc, BookingConfirmationState>(
          builder: (context, state) {
            if (state is BookingConfirmationLoaded) {
              return _bodyWidget();
            }
            if (state is BookingConfirmationSuccess) {
              return MyHomePage(index: 2, uid: widget.uid!);
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
          listener: (context, state) {},
        ),
      ),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      // );
                      bloc.add(BookingConfirmationComplete());
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
                          "Booking Id : " + widget.bookingId!,
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
                padding: const EdgeInsets.only(left: 16, right: 16),
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
                                                  widget.count.toString(),
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
                                                  widget.departure!,
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
                                                  " - " + widget.time!,
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
                              widget.price! + " BTC",
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
