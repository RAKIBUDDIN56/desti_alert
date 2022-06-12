// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:public_market/config/themes/colors.dart';
// import 'package:public_market/shared_components/widgets/footer.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:sizer/sizer.dart';

// class PickCategory extends StatefulWidget {
//   PickCategory({Key? key}) : super(key: key);

//   @override
//   State<PickCategory> createState() => _PickCategoryState();
// }

// class _PickCategoryState extends State<PickCategory> {
//   final _keywordController = TextEditingController();
//   final divisionList = <String>[
//     'Dhaka',
//     'Khulna',
//     'Barishal',
//     'Chittagong',
//     'Mymensingh',
//     'Rajshahi',
//     'Rangpur',
//     'Sylhet',
//   ];
//   final categoryList = <String>[
//     'Mobile',
//     'Electronics',
//     'Home & Living',
//     'Vehicle & Transportation',
//     'Daily Essential Products',
//     'Health & Beauty',
//     'Garments & Clothing',
//     'Hobbies, Sports & Babies',
//     'Agriculture & Agro',
//     'Business & Industry',
//     'Education',
//     'Fuel, Oil & Gas',
//     'Real Estate & Property',
//     'Pet & Animals',
//     'PM Food Bank & Restaurant',
//     'Personal Advertisements',
//     'Companies Product Branding',
//     'Service',
//     'Tour & Travels',
//     'Local Business Point',
//     'Resort, Hotel & Community Centre',
//     'Rent-To-Let',
//     'Others'
//   ];
//   var divisionDropdownValue = 'Select Division';
//   var categoryDropdownValue = 'Select Category';
//   final _keywordList = <String>[
//     'Camera',
//     'Mobile',
//     'Bike',
//     'Hijab',
//     'Lipstick',
//     'Shirt',
//     'Abaya',
//     'Pet',
//   ];
//   var imageList = [
//     'assets/category/mobile.png',
//     'assets/category/electronics-1.png'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: ConstantColor.bar,
//           toolbarHeight: 40,
//           title: Text('Pick a category',
//               style: TextStyle(color: Colors.white, fontSize: 16.sp)),
//         ),
//         bottomNavigationBar: const Footer(),
//         body: Column(children: [
//           __searchWidget(),
//           __contentWidget(),
//           Expanded(child: __divisionExpansionTile()),
//         ]));
//   }

//   Widget __contentWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               width: 5.w,
//             ),
//             const Text('Go to all ads',
//                 style: TextStyle(color: ConstantColor.bar)),
//           ],
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.arrow_forward,
//             size: 30,
//           ),
//           color: ConstantColor.icon,
//         )
//       ],
//     );
//   }

//   Widget __divisionExpansionTile() {
//     return ListView.separated(
//       shrinkWrap: true,
//       itemCount: subCategoryList.length,
//       itemBuilder: (context, i) {
//         return ExpansionTile(
//           childrenPadding: EdgeInsets.only(
//             left: 8.w,
//           ),
//           tilePadding: EdgeInsets.only(left: 10.w, right: 2.w),
//           collapsedIconColor: Colors.white,
//           collapsedBackgroundColor: ConstantColor.textHighlight,
//           backgroundColor: Colors.white,
//           iconColor: ConstantColor.icon,
//           textColor: ConstantColor.bar,
//           collapsedTextColor: Colors.white,
//           title: Row(
//             children: [
//               Image.asset(imageList[i]),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Text(
//                 subCategoryList[i].title,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   //  color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           children: [
//             Column(
//               children: _buildExpandableContent(subCategoryList[i]),
//             ),
//           ],
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(
//         height: 3,
//       ),
//     );
//   }

//   _buildExpandableContent(Category category) {
//     List<Widget> columnContent = [];

//     for (String content in category.subCategory) {
//       columnContent.add(
//         Column(
//           children: [
//             ListTile(
//               title: Text(
//                 content,
//                 style: const TextStyle(fontSize: 15.0, color: Colors.black),
//               ),
//             ),
//             const Divider(
//               thickness: 1,
//               color: ConstantColor.textHighlight,
//             )
//           ],
//         ),
//       );
//     }

//     return columnContent;
//   }

//   Widget __searchWidget() {
//     return Container(
//       height: 12.h,
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.all(1.w),
//         child: Container(
//           height: 10.h,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//               color: ConstantColor.bar),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 6,
//               ),
//               Row(children: [
//                 SizedBox(
//                   width: 2.w,
//                 ),
//                 //division dropdown button
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     //  height: 4.5.h,
//                     padding: EdgeInsets.only(
//                       left: 2.w,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(4.0),
//                       color: Colors.white,
//                     ),
//                     child: DropdownButton(
//                         dropdownColor: Colors.white,
//                         focusColor: Colors.white,
//                         hint: AutoSizeText(divisionDropdownValue,
//                             maxLines: 1,
//                             minFontSize: 8,
//                             style: TextStyle(
//                                 color: Colors.black54, fontSize: 8.sp)),
//                         style: TextStyle(
//                             fontSize: 10.sp, fontWeight: FontWeight.normal),
//                         isExpanded: true,
//                         isDense: false,
//                         underline: Container(
//                           alignment: Alignment.center,
//                           height: 1,
//                           color: Colors.transparent,
//                           width: 2,
//                         ),
//                         items: divisionList.map((val) {
//                           return DropdownMenuItem<String>(
//                             value: val,
//                             child: Text(val,
//                                 style: const TextStyle(color: Colors.black87)),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           setState(() {
//                             divisionDropdownValue = value!;
//                             print(divisionDropdownValue);
//                           });
//                         }),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 1.w,
//                 ),
//                 //category dropdown button
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     //  height: 4.5.h,
//                     padding: EdgeInsets.only(left: 2.w),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(4.0),
//                       color: Colors.white,
//                     ),
//                     child: DropdownButton(
//                         dropdownColor: Colors.white,
//                         focusColor: Colors.white,
//                         hint: AutoSizeText(categoryDropdownValue,
//                             maxLines: 1,
//                             minFontSize: 8,
//                             style: const TextStyle(
//                               color: Colors.black54,
//                             )),
//                         style: TextStyle(
//                             fontSize: 8.sp, fontWeight: FontWeight.normal),
//                         isExpanded: true,
//                         underline: Container(
//                           alignment: Alignment.center,
//                           height: 1,
//                           color: Colors.transparent,
//                           width: 2,
//                         ),
//                         items: categoryList.map((val) {
//                           return DropdownMenuItem<String>(
//                             value: val,
//                             child: Text(val,
//                                 style: const TextStyle(color: Colors.black87)),
//                           );
//                         }).toList(),
//                         onChanged: (String? value) {
//                           setState(() {
//                             categoryDropdownValue = value!;
//                             print(categoryDropdownValue);
//                           });
//                         }),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 1.w,
//                 ),
//                 //keyword textfield
//                 Expanded(
//                     flex: 2,
//                     child: TextField(
//                         controller: _keywordController,
//                         cursorColor: Colors.black,
//                         style: const TextStyle(
//                             fontSize: 16, color: Colors.black54),
//                         decoration: const InputDecoration(
//                             isDense: true,
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 13, horizontal: 2),
//                             //  border: const OutlineInputBorder(),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 0),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: 'Type Keyword',
//                             hintStyle: TextStyle(
//                                 color: Colors.black54, fontSize: 12)))),
//                 SizedBox(
//                   width: 1.w,
//                 ),
//                 //search button
//                 Expanded(
//                     flex: 1,
//                     child: OutlinedButton(
//                         style: ButtonStyle(
//                             minimumSize:
//                                 MaterialStateProperty.all(const Size(0, 0)),
//                             padding: MaterialStateProperty.all(
//                                 const EdgeInsets.only(top: 15, bottom: 15)),
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.white)),
//                         onPressed: () {},
//                         child: const AutoSizeText(
//                           'Search',
//                           maxLines: 1,
//                           minFontSize: 8,
//                           textAlign: TextAlign.left,
//                           style: TextStyle(fontSize: 14, color: Colors.black54),
//                         ))),
//                 SizedBox(
//                   width: 2.w,
//                 ),
//               ]),
//               //keywords list
//               Expanded(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 4.w,
//                     ),
//                     Text(
//                       'Trending Keywords: ',
//                       style: TextStyle(color: Colors.white, fontSize: 8.sp),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: _keywordList.length,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             children: [
//                               Text(
//                                 _keywordList[index],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 8.sp),
//                               ),
//                               SizedBox(
//                                 width: 5.w,
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Category {
//   final String title;
//   List subCategory = [];
//   Category(this.title, this.subCategory);
// }

// List<Category> subCategoryList = [
//   Category('Mobiles', [
//     'Mobile Phones',
//     'Mobile Phone Accessories',
//     'SIM Cards',
//     'Mobile Phone Services',
//     'Mobile Internet',
//     'Wearable Technology'
//   ]),
//   Category('Electronics', [
//     'Desktop Computers',
//     'Laptops ',
//     'Laptop & Computer Accessories ',
//     'TVs ',
//     'Audio & Sound Systems ',
//     'Cameras, Camcorders & Accessories '
//   ]),
// ];
