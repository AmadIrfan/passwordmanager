// import 'package:flutter/material.dart';
// import '../styles/properties.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

// class Drawers extends StatelessWidget {
//   const Drawers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey,
//       height: double.infinity,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Container(
//             padding: const EdgeInsets.all(3),
//             decoration: BoxDecoration(
//               // color: Colors.red,
//               border: Border.all(
//                 color: Colors.black,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(
//                 70,
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 70,
//             ),
//           ),
//           AnimatedTextKit(
//             totalRepeatCount: 10,
//             isRepeatingAnimation: true,
//             displayFullTextOnTap: true,
//             animatedTexts: [
//               RotateAnimatedText(
//                 'Amad',
//                 textStyle: aniStyle,
//               ),
//               RotateAnimatedText(
//                 'Irfan',
//                 textStyle: aniStyle,
//               ),
//               RotateAnimatedText(
//                 'Amad Irfan',
//                 textStyle: aniStyle,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
