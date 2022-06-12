// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:public_market/config/themes/colors.dart';
// import 'package:public_market/shared_components/widgets/footer.dart';
// import 'package:sizer/sizer.dart';

// class CategoryFilter extends StatefulWidget {
//   const CategoryFilter({Key? key}) : super(key: key);

//   @override
//   State<CategoryFilter> createState() => _CategoryFilterState();
// }

// class _CategoryFilterState extends State<CategoryFilter> {
//   final dateList = <String>['Newest First', 'Oldest First', 'Others'];
//   final posterList = <String>['All posters', 'Others'];
//   var dateDropdownValue = 'Select Date';
//   var posterDropdownValue = 'Select Poster type';
//   bool checkedValueUrgent = false;
//   bool checkdValueFeatured = false;
//   bool checkdValueflat10 = false;
//   bool checkdValueflat20 = false;
//   bool checkdValueflat50 = false;
//   double _currentSliderValue = 20;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: const Footer(),
//         backgroundColor: Colors.white,
//         body: Stack(children: [
//           Positioned(top: 10.h, left: 0, right: 0, child: __appbar()),
//           Positioned(
//             top: 18.h,
//             left: 0,
//             right: 0,
//             bottom: 3.h,
//             child: __contentWidget(),
//           ),
//         ]));
//   }

//   Widget __appbar() {
//     return Container(
//         color: Colors.white,
//         height: 7.h,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: 5.w,
//                 ),
//                 Text('Filters',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.bold)),
//               ],
//             ),
//             IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: const Icon(
//                   Icons.close,
//                   color: ConstantColor.primary,
//                   size: 30,
//                 ))
//           ],
//         ));
//   }

//   Widget __contentWidget() {
//     return Container(
//       color: Colors.white,
//       height: 85.h,
//       child: ListView(
//         padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5),
//         children: [
//           const Text(
//             'Sort by',
//             style: TextStyle(color: Colors.red),
//           ),
//           Container(
//             // padding: EdgeInsets.only(left: 5.w, right: 5.w),
//             child: DropdownButton(
//                 dropdownColor: Colors.white,
//                 focusColor: Colors.white,
//                 hint: Text(dateDropdownValue,
//                     style: const TextStyle(
//                         color: ConstantColor.loginCredential,
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal)),
//                 style:
//                     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
//                 isExpanded: true,
//                 underline: Container(
//                   alignment: Alignment.center,
//                   height: 1.5,
//                   color: Color.fromARGB(255, 245, 171, 166),
//                   width: 2,
//                 ),
//                 items: dateList.map((val) {
//                   return DropdownMenuItem<String>(
//                     value: val,
//                     child: Text(val,
//                         style: const TextStyle(color: Colors.black87)),
//                   );
//                 }).toList(),
//                 onChanged: (String? value) {
//                   setState(() {
//                     dateDropdownValue = value!;
//                     print(dateDropdownValue);
//                   });
//                 }),
//           ),
//           const Text(
//             'Type of poster',
//             style: TextStyle(color: Colors.red),
//           ),
//           Container(
//             // padding: EdgeInsets.only(left: 5.w, right: 5.w),
//             child: DropdownButton(
//                 dropdownColor: Colors.white,
//                 focusColor: Colors.white,
//                 hint: Text(posterDropdownValue,
//                     style: const TextStyle(
//                         color: ConstantColor.loginCredential,
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal)),
//                 style:
//                     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
//                 isExpanded: true,
//                 underline: Container(
//                   alignment: Alignment.center,
//                   height: 1.5,
//                   color: Color.fromARGB(255, 245, 171, 166),
//                   width: 2,
//                 ),
//                 items: posterList.map((val) {
//                   return DropdownMenuItem<String>(
//                     value: val,
//                     child: Text(val,
//                         style: const TextStyle(color: Colors.black87)),
//                   );
//                 }).toList(),
//                 onChanged: (String? value) {
//                   setState(() {
//                     posterDropdownValue = value!;
//                     print(posterDropdownValue);
//                   });
//                 }),
//           ),
//           const Text('Filter ads by:', style: TextStyle(color: Colors.red)),
//           Row(
//             children: [
//               Checkbox(
//                   side: const BorderSide(color: Colors.red, width: 3),
//                   activeColor: Colors.red,
//                   value: checkedValueUrgent,
//                   onChanged: (value) {
//                     setState(() {
//                       checkedValueUrgent = value!;
//                     });
//                   }),
//               const Text('  Urgent',
//                   style: TextStyle(
//                       color: ConstantColor.loginCredential,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal))
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Row(
//             children: [
//               Checkbox(
//                   side: const BorderSide(color: Colors.red, width: 3),
//                   activeColor: Colors.red,
//                   value: checkdValueFeatured,
//                   onChanged: (value) {
//                     setState(() {
//                       checkdValueFeatured = value!;
//                     });
//                   }),
//               const Text('  Featured',
//                   style: TextStyle(
//                       color: ConstantColor.loginCredential,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal))
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           const Text(
//             'Price Range(K)',
//             style: TextStyle(
//                 color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           Slider(
//             value: _currentSliderValue,
//             max: 100,
//             divisions: 100,
//             thumbColor: Colors.red,
//             activeColor: ConstantColor.icon,
//             inactiveColor: ConstantColor.icon,
//             label: _currentSliderValue.round().toString(),
//             onChanged: (double value) {
//               setState(() {
//                 _currentSliderValue = value;
//               });
//               print(_currentSliderValue);
//             },
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 5.w),
//                 child: const Text(
//                   '0',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 5.w),
//                 child: const Text(
//                   '100K',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           const Text('Top deals',
//               style: TextStyle(
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18)),
//           Row(
//             children: [
//               Checkbox(
//                   side: const BorderSide(color: Colors.red, width: 3),
//                   activeColor: Colors.red,
//                   value: checkdValueflat10,
//                   onChanged: (value) {
//                     setState(() {
//                       checkdValueflat10 = value!;
//                     });
//                   }),
//               const Text('  Flat 10% Off',
//                   style: TextStyle(
//                       color: ConstantColor.loginCredential,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal))
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Row(
//             children: [
//               Checkbox(
//                   side: const BorderSide(color: Colors.red, width: 3),
//                   activeColor: Colors.red,
//                   value: checkdValueflat20,
//                   splashRadius: 20,
//                   onChanged: (value) {
//                     setState(() {
//                       checkdValueflat20 = value!;
//                     });
//                   }),
//               //  ),
//               const Text('  Flat 20% Off',
//                   style: TextStyle(
//                       color: ConstantColor.loginCredential,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal))
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           SizedBox(
//             child: Row(
//               children: [
//                 Checkbox(
//                     side: const BorderSide(color: Colors.red, width: 3),
//                     activeColor: Colors.red,
//                     value: checkdValueflat50,
//                     onChanged: (value) {
//                       setState(() {
//                         checkdValueflat50 = value!;
//                       });
//                     }),
//                 const Text('  Flat 50% Off',
//                     style: TextStyle(
//                         color: ConstantColor.loginCredential,
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Container(
//             // padding: EdgeInsets.only(left: 5.w, right: 5.w),
//             height: 15.h,
//             width: 90.w,
//             color: Colors.grey,
//             child: const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Google Ad',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   child: const Padding(
//                     padding: EdgeInsets.all(19.0),
//                     child: Text(
//                       'Clear All',
//                       style: TextStyle(
//                           color: Colors.red, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: OutlinedButton(
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.red)),
//                   onPressed: () {},
//                   child: const Padding(
//                     padding: EdgeInsets.all(19.0),
//                     child: Text(
//                       'Apply Filter',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//         ],
//       ),
//     );
//   }
// }
