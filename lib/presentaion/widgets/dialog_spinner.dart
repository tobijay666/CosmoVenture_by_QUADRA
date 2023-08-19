import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DialogSpinner extends StatelessWidget {
  final String msg;
  const DialogSpinner({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 80.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
