// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomDropdown extends StatelessWidget {
//   final List<String> options;
//   final String? selectedOption;
//   final ValueChanged<String>? onChanged;
//   final String? hint;
//
//   CustomDropdown({
//     required this.options,
//     this.selectedOption,
//     this.onChanged,
//    this.hint,
//     String? value,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               child: Column(
//                 children: [
//                   if (hint != null)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         hint!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: options.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(options[index]),
//                           onTap: () {
//                             onChanged?.call(options[index]);
//                             Navigator.pop(context);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white.withOpacity(0.5),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               selectedOption ?? hint ?? 'Select an option',
//               style: TextStyle(color: Colors.black),
//             ),
//             Icon(Icons.arrow_drop_down, color: Colors.black),
//           ],
//         ),
//       ),
//     );
//   }
// }
