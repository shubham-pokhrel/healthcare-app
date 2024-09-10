import 'package:flutter/material.dart';
import 'package:healthcare/models/patient_data_mobile.dart'; // Mobile data import
import 'package:healthcare/models/patient_data_desktop.dart'; // Desktop data import
import 'package:healthcare/models/patient_model.dart';

class PatientlistScreen extends StatefulWidget {
  const PatientlistScreen({super.key});

  @override
  State<PatientlistScreen> createState() => _PatientlistScreenState();
}

class _PatientlistScreenState extends State<PatientlistScreen> {
  String? _selectedSortOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4EBF1), // Background color similar to login screen
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth <= 600; // Check if the screen is mobile

          // Decide which patient data to display based on view
          List<Patient> patients = isMobile ? mobilePatients : desktopPatients; // Fetch data based on screen type

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.start,
              children: [
                if (!isMobile) ...[
                  // Desktop Layout
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF48A9F8), // Blue color similar to the Sign In button
                        foregroundColor: Colors.white, // White text color
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Logout'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Patient List",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Manjari',
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: constraints.maxWidth * 0.8,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Color(0xFFD3DDE5), // Background color similar to the login screen
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text('test'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // List of patients for Desktop
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7, // Adjust height to your needs
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(), // Ensures it is scrollable
                        itemCount: patients.length, // List based on screen type
                        itemBuilder: (context, index) {
                          return buildPatientCardDesktop(patients[index]); // Desktop-specific method
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 10),
                      ),
                    ),
                  ),
                ] else ...[
                  // Mobile Layout
                  
                  Container(
                    color: Color(0xFFD3D8DE),
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 18,),
                        Text(
                          "Patient",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Manjari',
                          ),
                        ),
                        Text(
                          "List",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 0.9,
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Manjari',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),            
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                    child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.31 > 130 ? 130 + constraints.maxWidth * 0.01 : constraints.maxWidth * 0.31,
                        maxHeight: constraints.maxWidth * 0.2 > 27 ? 27 : constraints.maxWidth * 0.2,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ('Search'),
                          prefixIcon: Image.asset(
                            'lib/assets/search_icon.png',
                            height: 5,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Color(0xFFE4EBF1),
                        ),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Manjari',
                        ),
                      ),
                    ),
                    SizedBox(width: constraints.maxWidth * 0.1 > 8.0 ? 8.0 : constraints.maxWidth * 0.1)
                    ,
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.28 > 118 ? 118 + constraints.maxWidth * 0.01 : constraints.maxWidth * 0.28,
                        maxHeight: constraints.maxWidth * 0.2 > 27 ? 27 : constraints.maxWidth * 0.2,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ('Sort By :'),
                          suffixIcon: Image.asset(
                            'lib/assets/drop_icon.png',
                            height: 5,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Color(0xFFE4EBF1),
                        ),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Manjari',
                        ),
                      ),
                    ),
                    Spacer(),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.15 > 89 ? 89 : constraints.maxWidth * 0.15,
                        maxHeight: constraints.maxWidth * 0.2 > 27 ? 27 : constraints.maxWidth * 0.2,
                  
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF48A9F8), // Blue color similar to the Sign In button
                          foregroundColor: Color(0xE4EBF1F5),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          '+Add',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'Manjari',
                          ),
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
                // List of patients for Mobile
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 20.0),
                  child: Container(
                  color: Color(0xFFD3D8DE),
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0, top: 10),
                  child: SizedBox(
                    height: constraints.maxHeight * 0.65 > 557 ? 557 : constraints.maxHeight * 0.65, // Adjust height to your needs
                    width: constraints.maxWidth * 0.95 > 332 ? 332 + constraints.maxWidth *0.3 : constraints.maxWidth * 0.95, 
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // Prevents inner scroll view conflict
                            itemCount: patients.length,
                            itemBuilder: (context, index) {
                              return buildPatientCardMobile(patients[index]);
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                                      ),
                                    ),
                ],
              ],
            ),
          );
        },
      ),
      );
  }

  // Method to build patient card for Desktop view
  Widget buildPatientCardDesktop(Patient patient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Name and Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Manjari',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Bed Number: ${patient.bedNumber}"),
                  Text("Ward Number: ${patient.wardNumber}"),
                ],
              ),
              Spacer(),
              // Status, Blood Pressure, Heart Rate
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text("Status: "),
                      Text(
                        patient.status,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text("BP: ${patient.bloodPressure}"),
                  Text("HR: ${patient.heartRate}"),
                  //Text("${patient.wardNumber}")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build patient card for Mobile view
  Widget buildPatientCardMobile(Patient patient) {
    String imagePath = patient.images.isNotEmpty
      ? 'lib/assets/avatar_${patient.images}.png'
      : 'lib/assets/avatar_1.png';
    //print('Patient image path: ${patient.images}');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Container(
         // White background for the individual patient cards
        height: MediaQuery.of(context).size.height * 0.6 > 93 ? 93 : MediaQuery.of(context).size.height * 0.6,
        width: 300,
        decoration: BoxDecoration(
        color: Color(0xFFD3D8DE), // Background color for the patient details container
        border: Border.all(
          color: Colors.black, // Outline color
          width: 1,         // Outline width
        ),
        borderRadius: BorderRadius.circular(8), // Rounded corners
    
      ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, right: 10, bottom: 5),
          
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //print image from assests folder
              Image.asset('lib/assets/avatar_${patient.images}.png', height: 40, width: 40),
              // Name and Info
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              patient.name,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manjari',
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                              // White background for the individual patient cards
                                height: MediaQuery.of(context).size.height * 0.6 > 24 ? 24 : MediaQuery.of(context).size.height * 0.6,
                                width: 149,
                                decoration: BoxDecoration(
                                color: Color(0xFFD3D8DE), // Background color for the patient details container
                                border: Border.all(
                                  color: Colors.black, // Outline color
                                  width: 1,         // Outline width
                                ),
                                borderRadius: BorderRadius.circular(3), // Rounded corners
                            
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Bed Number",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Manjari',
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Ward No.",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Manjari',
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Consultant",
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Manjari',
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            patient.bedNumber,
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Manjari',
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            patient.wardNumber,
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Manjari',
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Dr. Joshi",
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Manjari',
                                            ),
                                          ),
                                        ],
                                      ),
                                    
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ],
                        ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Status box
                          Container(
                            width: 70,
                            height: 45,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              //print(patient.status),
                              color: (patient.status == "96%") ? Color.fromARGB(162, 140, 215, 100) : Color.fromARGB(162, 255, 153, 0), // Green background color
                              
                              border: Border.all(color: (patient.status == "96%") ? Color.fromARGB(162, 140, 215, 100) : Color.fromARGB(162, 255, 153, 0),
                              width: 3,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('lib/assets/oxy.png', height: 25, width: 24.7),
                                //SizedBox(height: 5),
                                Text(patient.status,
                                style: 
                                  TextStyle(color: Colors.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manjari',
                                  )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          
                      // Blood Pressure box
                      Container(
                        width: 70,
                        height: 45,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: (patient.bloodPressure == "145/95") ? Color.fromARGB(162, 165, 50, 50) : Color.fromARGB(162, 140, 215, 100), // Red background color
                          border: Border.all(color: (patient.bloodPressure == "145/95") ? Color.fromARGB(162, 165, 50, 50) : Color.fromARGB(162, 140, 215, 100),
                          width: 3,
                          ),
                          borderRadius: BorderRadius.circular(2),
                          
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/blood-drop-donation.png', height: 20, width: 20),
                            //SizedBox(height: 5),
                            Text(patient.bloodPressure, 
                            style: TextStyle(color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manjari',
                              ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      // Heart Rate box
                      Container(
                        width: 70,
                        height: 45,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: (patient.bloodPressure == "145/95") ?Color.fromARGB(162, 255, 153, 0) : Color.fromARGB(162, 140, 215, 100), // Yellow background color
                          border: 
                          Border.all(
                            color: (patient.bloodPressure == "145/95") ?Color.fromARGB(162, 255, 153, 0) : Color.fromARGB(162, 140, 215, 100),
                          width: 3,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/heart-rate.png', height: 22, width: 19.2),
                            SizedBox(height: 5),
                            Text(patient.heartRate, 
                            
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manjari',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
           
            ],
          ),
        ),
      ),
    );
  }
}
