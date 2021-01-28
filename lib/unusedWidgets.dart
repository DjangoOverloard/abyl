  // var areaTotal;
  // var areaFloor;
  // var buildingHeight;
  // var buildingMaxVisits;
  // bool techFloorExists = true;
  // var areaTechFloor;
  // bool basementFloorExists = true;
  
// Widget customInput(name, value) {
//   return Column(
//     children: [
//       SizedBox(height: 10), 
//       SizedBox(
//         width: 300,
//         child: Row(
//           children: [
//             Expanded(
//                 child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(name,
//                         style: TextStyle(
//                           fontSize: 18,
//                         )))),
//             SizedBox(width: 10),
//             Container(
//               height: 40,
//               width: 100,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.black, width: 1),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(left: 5),
//                           child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Значение',
//                     border: InputBorder.none,
//                   ),
//                   onChanged: (val) {
//                     value = val;
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget defaultBoolInput(name, value, onTap){
//   return Column(
//     children: [
//        SizedBox(height: 10), 
//       SizedBox(
//         width: 300, 
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(name, style: TextStyle(
//                 fontSize: 18, 
//               )),
//             ),
//             SizedBox(width: 10),
//             SizedBox(height: 35, width: 40, child: Checkbox(
//               value: value, 
//               onChanged: (val){
//                 value = val;
//                 onTap();
//               },
//             ),),
//           ],
//         ),
//       ),
//     ],
//   );
// }
