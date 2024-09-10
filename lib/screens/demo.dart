// Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       //crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           patient.name,
//                           style: TextStyle(
//                             fontSize: maxW* 0.03 > 40 ? 40 : maxW*0.03,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: 'Manjari',
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                         //Spacer(),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               "Dr. Joshi",
//                               style: TextStyle(
//                                 fontSize: 9,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'Manjari',
//                               ),
//                             ),
//                             Text(
//                               "Dr. Joshi",
//                               style: TextStyle(
//                                 fontSize: 9,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'Manjari',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                           padding:
//                               const EdgeInsets.symmetric(vertical: 5.0),
//                           child: Container(
//                               // White background for the individual patient cards
//                               height: maxH * 0.6 > 24 ? 24 : maxH * 0.6,
//                               width: 149,
//                               decoration: BoxDecoration(
//                                 color: Color(
//                                     0xFFD3D8DE), // Background color for the patient details container
//                                 border: Border.all(
//                                   color: Colors.black, // Outline color
//                                   width: 1, // Outline width
//                                 ),
//                                 borderRadius: BorderRadius.circular(
//                                     3), // Rounded corners
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 4),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           "Bed Number",
//                                           style: TextStyle(
//                                             fontSize: 6,
//                                             fontWeight: FontWeight.w600,
//                                             fontFamily: 'Manjari',
//                                           ),
//                                         ),
//                                         SizedBox(width: 10),
//                                         Text(
//                                           "Ward No.",
//                                           style: TextStyle(
//                                             fontSize: 6,
//                                             fontWeight: FontWeight.w600,
//                                             fontFamily: 'Manjari',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           patient.bedNumber,
//                                           style: TextStyle(
//                                             fontSize: 9,
//                                             fontWeight: FontWeight.w700,
//                                             fontFamily: 'Manjari',
//                                           ),
//                                         ),
//                                         SizedBox(width: 12),
//                                         Text(
//                                           patient.wardNumber,
//                                           style: TextStyle(
//                                             fontSize: 9,
//                                             fontWeight: FontWeight.w700,
//                                             fontFamily: 'Manjari',
//                                           ),
//                                         ),                                            
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       // Status box
//                       Container(
//                         width: 70,
//                         height: 45,
//                         padding: const EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           //print(patient.status),
//                           color: (patient.status == "96%")
//                               ? Color.fromARGB(162, 140, 215, 100)
//                               : Color.fromARGB(162, 255, 153,
//                                   0), // Green background color
              
//                           border: Border.all(
//                             color: (patient.status == "96%")
//                                 ? Color.fromARGB(162, 140, 215, 100)
//                                 : Color.fromARGB(162, 255, 153, 0),
//                             width: 3,
//                           ),
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset('lib/assets/oxy.png',
//                                 height: 25, width: 24.7),
//                             //SizedBox(height: 5),
//                             Text(patient.status,
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 8,
//                                   fontWeight: FontWeight.w700,
//                                   fontFamily: 'Manjari',
//                                 )),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
              
//                       // Blood Pressure box
//                       Container(
//                         width: 70,
//                         height: 45,
//                         padding: const EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           color: (patient.bloodPressure == "145/95")
//                               ? Color.fromARGB(162, 165, 50, 50)
//                               : Color.fromARGB(162, 140, 215,
//                                   100), // Red background color
//                           border: Border.all(
//                             color: (patient.bloodPressure == "145/95")
//                                 ? Color.fromARGB(162, 165, 50, 50)
//                                 : Color.fromARGB(162, 140, 215, 100),
//                             width: 3,
//                           ),
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                                 'lib/assets/blood-drop-donation.png',
//                                 height: 20,
//                                 width: 20),
//                             //SizedBox(height: 5),
//                             Text(
//                               patient.bloodPressure,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 8,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'Manjari',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
              
//                       // Heart Rate box
//                       Container(
//                         width: 70,
//                         height: 45,
//                         padding: const EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           color: (patient.bloodPressure == "145/95")
//                               ? Color.fromARGB(162, 255, 153, 0)
//                               : Color.fromARGB(162, 140, 215,
//                                   100), // Yellow background color
//                           border: Border.all(
//                             color: (patient.bloodPressure == "145/95")
//                                 ? Color.fromARGB(162, 255, 153, 0)
//                                 : Color.fromARGB(162, 140, 215, 100),
//                             width: 3,
//                           ),
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset('lib/assets/heart-rate.png',
//                                 height: 22, width: 19.2),
//                             SizedBox(height: 5),
//                             Text(
//                               patient.heartRate,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 8,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'Manjari',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),