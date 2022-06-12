// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:public_market/shared_components/widgets/footer.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:sizer/sizer.dart';
// import 'package:geocoding/geocoding.dart';

// class Location extends StatefulWidget {
//   Location({Key? key}) : super(key: key);

//   @override
//   State<Location> createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   final _searchLocationController = TextEditingController();
//   int selected = 0;
//   String currentLocation = '';
//   @override
//   void initState() {
//     super.initState();
//     __getCurrentLocation();
//   }

//   __getCurrentLocation() async {
//     // LocationPermission permission;
//     // permission = await Geolocator.requestPermission();
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     currentLocation = placemarks.first.locality.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('build called');
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           toolbarHeight: 40,
//           title: Text('Pick a location',
//               style: TextStyle(color: Colors.white, fontSize: 18.sp)),
//         ),
//         body: Stack(children: [
//           Positioned(
//             top: 0.h,
//             left: 0,
//             right: 0,
//             child: __contentWidget(),
//           ),
//           Positioned(
//               top: 21.h, left: 0, right: 0, child: __divisionExpansionTile()),
//           const Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Footer(),
//           )
//         ]));
//   }

//   Widget __divisionExpansionTile() {
//     return SizedBox(
//       height: 65.h,
//       child: ListView.builder(
//         key: Key('builder key ${selected.toString()}'),
//         // physics: const NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.only(left: 5.w),
//         shrinkWrap: true,
//         itemCount: division.length,
//         itemBuilder: (context, index) {
//           return ExpansionTile(
//             key: Key(index.toString()),
//             initiallyExpanded: index == selected,
//             iconColor: Colors.amber,
//             collapsedIconColor: Colors.red,
//             title: Text(
//               division[index].title,
//               style: const TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.black,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: Column(
//                   children: _buildExpandableContent(division[index]),
//                 ),
//               ),
//             ],
//             onExpansionChanged: ((newState) {
//               if (newState) {
//                 setState(() {
//                   // Duration(seconds: 59);
//                   selected = index;
//                 });
//               } else {
//                 setState(() {
//                   selected = -1;
//                 });
//               }
//             }),
//           );
//         },
//       ),
//     );
//   }

//   Widget __contentWidget() {
//     return Container(
//       color: const Color.fromARGB(255, 248, 244, 244),
//       height: 20.h,
//       child: ListView(
//         // shrinkWrap: true,
//         padding: EdgeInsets.only(left: 5.w, right: 5.w),
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.location_pin,
//                 ),
//                 color: Colors.red,
//               ),
//               // SizedBox(
//               //   width: 5.w,
//               // ),
//               TextButton(
//                 onPressed: () async {
//                   if (currentLocation == '') {
//                     const CircularProgressIndicator();
//                   } else {
//                     Get.defaultDialog(
//                         title: 'Current location', middleText: currentLocation);
//                   }
//                 },
//                 child: const Text('Use current location',
//                     style: TextStyle(color: Colors.red, fontSize: 16)),
//               ),
//             ],
//           ),
//           TextField(
//             controller: _searchLocationController,
//             //cursorHeight: 8,
//             cursorColor: Colors.white,
//             style: const TextStyle(fontSize: 16, color: Colors.black54),
//             decoration: InputDecoration(
//                 isDense: true,
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 //  border: const OutlineInputBorder(),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 0),
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 fillColor: Colors.red.shade400,
//                 filled: true,
//                 prefixIcon: const Icon(
//                   Icons.search,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//                 prefixIconConstraints:
//                     const BoxConstraints(minHeight: 5, minWidth: 10),
//                 hintText: 'Search for a location',
//                 hintStyle:
//                     const TextStyle(color: Color.fromARGB(255, 233, 227, 227))),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text(
//                 'All Of Bangladesh',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Icon(
//                 Icons.arrow_forward_ios,
//                 color: Colors.red,
//               )
//             ],
//           ),
//           const Divider(
//             thickness: 2,
//           ),
//         ],
//       ),
//     );
//   }

//   _buildExpandableContent(Division division) {
//     List<Widget> columnContent = [];

//     for (String content in division.contents) {
//       columnContent.add(
//         ListTile(
//           title: Text(
//             content,
//             style: TextStyle(fontSize: 15.0),
//           ),
//         ),
//       );
//     }

//     return columnContent;
//   }
// }

// class Division {
//   final String title;
//   List<String> contents = [];

//   Division(this.title, this.contents);
// }

// List<Division> division = [
//   Division(
//     'Dhaka ',
//     [
//       'All ads in Dhaka',
//       'Manikgonj',
//       'Munshigonj',
//       'Narsingdi',
//     ],
//   ),
//   Division(
//     'Chittagoang ',
//     [
//       'All ads in Chittagoang',
//       'Manikgonj',
//       'Munshigonj',
//       'Narsingdi',
//     ],
//   ),
//   Division(
//     'Barishal ',
//     [
//       'All ads in Barishal',
//       'Manikgonj',
//       'Munshigonj',
//       'Narsingdi',
//     ],
//   ),
//   Division(
//     'Sylhet ',
//     [
//       'All ads in Sylhet',
//       'Manikgonj',
//       'Munshigonj',
//       'Narsingdi',
//     ],
//   ),
//   Division(
//     'Khulna ',
//     [
//       'All ads in Khulna',
//       'Manikgonj',
//       'Munshigonj',
//       'Narsingdi',
//     ],
//   ),
//   Division(
//     'Rajshahi ',
//     [
//       'All ads in Rajshahi',
//       'Manikgonj',
//       'Munshigonj',
//       'Narsingdi',
//     ],
//   ),
// ];
