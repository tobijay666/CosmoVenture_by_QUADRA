import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class AccordionView extends StatefulWidget {
  final List<AccordionItem> items;
  final String? color;

  const AccordionView({super.key, required this.items, this.color});

  @override
  _AccordionViewState createState() => _AccordionViewState();
}

class _AccordionViewState extends State<AccordionView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.items.map<Widget>((item) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(0.95),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ExpansionTile(
              title: Text(
                item.labelText,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: widget.color == null
                          ? AppColors.black
                          : AppColors.whiteColor,
                    ),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item.content,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: widget.color == null
                              ? AppColors.whiteColor
                              : AppColors.black,
                        ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

//           child: SingleChildScrollView(
//             child: Column(
//               children: widget.items.map<Widget>((item) {
//                 return ExpansionTile(
//                   title: Text(
//                     item.labelText,
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           color: widget.color == null
//                               ? AppColors.whiteColor
//                               : AppColors.black,
//                         ),
//                   ),
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         item.content,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                               color: widget.color == null
//                                   ? AppColors.whiteColor
//                                   : AppColors.black,
//                             ),
//                       ),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//     );
//   }
// }

class AccordionItem {
  // final String title;
  final String content;
  final String labelText;

  AccordionItem({required this.labelText, required this.content});
}
