// import 'package:cosmoventure/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class ChatTextField extends StatefulWidget {
//   const ChatTextField({super.key, required this.textEditingController});

//   final TextEditingController textEditingController;

//   @override
//   State<ChatTextField> createState() => _ChatTextFieldState();
// }

// class _ChatTextFieldState extends State<ChatTextField> {
//   get textEditingController => null;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: [
//                 TextFormField(
//                   controller: textEditingController,
//                   decoration: InputDecoration(
//                     hintText: 'Type a message',
//                     hintStyle: const TextStyle(color: AppColors.greyColor),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: AppColors.greyColor),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                           color: _isDarkTheme
//                               ? BrandColor.greyLight
//                               : BrandColor.greyDark),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Color(0xFF00A884)),
//                     ),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   ),
//                 ),
//                 if (_isWaitingForResponse)
//                   Positioned(
//                     right: 40.0,
//                     bottom: 10.0,
//                     child: SizedBox(
//                       width: 20.0,
//                       height: 20.0,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 3.0,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//         IconButton(
//           icon: Icon(Icons.send_rounded, size: 30, color: BrandColor.greenDark),
//           onPressed: () {
//             // setState(() {
//             //   _isWaitingForResponse = true;
//             // });
//             _sendMessage();
//           },
//         ),
//       ],
//     );
//   }
// }
