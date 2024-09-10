import 'package:flutter/material.dart';
import 'package:healthcare/models/patient_data_mobile.dart'; // Mobile data import
import 'package:healthcare/models/patient_data_desktop.dart'; // Desktop data import
import 'package:healthcare/models/patient_model.dart';

class PatientlistScreen extends StatefulWidget {
  final ThemeMode themeMode; 
  const PatientlistScreen({super.key, required this.themeMode, required ThemeMode ThemeMode});

  @override
  State<PatientlistScreen> createState() => _PatientlistScreenState();
}

class _PatientlistScreenState extends State<PatientlistScreen> {
  bool isMobile = true;
  double maxW = 200;
  double maxH = 200;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = widget.themeMode == ThemeMode.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF38414B) :  Color(0xFFE4EBF1), // last is light theme ;
      body: LayoutBuilder(
        builder: (context, constraints) {
          maxW = constraints.maxWidth;
          maxH = constraints.maxHeight;
          isMobile = constraints.maxWidth <= 600; // Check if the screen is mobile

          // Decide which patient data to display based on view
          List<Patient> patients = isMobile ? mobilePatients : desktopPatients; // Fetch data based on screen type

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.start,
              children: [
                if (!isMobile) ...[
                  // Desktop Layout
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF48A9F8), // Blue color similar to the Sign In button
                          foregroundColor: Colors.white, // White text color
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Log Out'),
                      ),
                    ),
                  ),
                  //SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 50.0, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Patient List",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //height: 1.5,
                            fontSize: constraints.maxWidth * 0.07 > 90 ? 90 : constraints.maxWidth*0.07,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Manjari',
                          ),
                        ),                        
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.4 > 465 ? 465 + constraints.maxWidth * 0.01 : constraints.maxWidth * 0.4,
                            maxHeight: constraints.maxWidth * 0.2 > 50 ? 50 : constraints.maxWidth * 0.2,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Search by Patient, Bed No, Date etc.'),
                              prefixIcon: Image.asset(
                                'lib/assets/search_icon.png',
                                height: 5,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE4EBF1),
                            ),
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.02 > 24 ? 24 : constraints.maxWidth*0.02,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Manjari',
                            ),
                          ),
                        ),
                        SizedBox(
                            width: constraints.maxWidth * 0.1 > 8.0 ? 8.0 : constraints.maxWidth * 0.1),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.2 > 232 ? 232 + constraints.maxWidth * 0.01 : constraints.maxWidth * 0.2,
                            maxHeight: constraints.maxWidth * 0.2 > 50 ? 50 : constraints.maxWidth * 0.2,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Sort By :'),
                              suffixIcon: Image.asset(
                                'lib/assets/drop_icon.png',
                                height: 5,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE4EBF1),
                            ),
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.02 > 24 ? 24 : constraints.maxWidth*0.02,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manjari',
                            ),
                          ),
                        ),
                        Spacer(),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.15 > 173 ? 173 : constraints.maxWidth * 0.15,
                            maxHeight: constraints.maxWidth * 0.2 > 50 ? 50 : constraints.maxWidth * 0.2,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF48A9F8), // Blue color similar to the Sign In button
                              foregroundColor: Color(0xE4EBF1F5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              '+ Add Patient',
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.02 > 22 ? 22 : constraints.maxWidth*0.02,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manjari',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // List of patients for Desktop
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50.0, left: 50.0, bottom: 20.0),
                    child: Container(
                      color: Color(0xFFD3D8DE),
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, bottom: 10.0, top: 20),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.7 > 709 ? 709 : constraints.maxHeight * 0.7, // Adjust height to your needs
                        width: constraints.maxWidth * 0.95 > 1272 ? 1272 + constraints.maxWidth * 0.3 : constraints.maxWidth * 0.95,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevents inner scroll view conflict
                                itemCount: patients.length,
                                itemBuilder: (context, index) {
                                  return buildPatientCardDesktop(
                                      patients[index]);
                                },
                                separatorBuilder: (context, index) =>  SizedBox(height: 2),
                              ),
                            ],
                          ),
                        ),
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
                            Navigator.pop(
                                context); // Navigate back to the previous screen (LoginScreen)
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
                        SizedBox(
                          height: 18,
                        ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 10.0),
                    child: Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.31 > 130
                                ? 130 + constraints.maxWidth * 0.01
                                : constraints.maxWidth * 0.31,
                            maxHeight: constraints.maxWidth * 0.2 > 27
                                ? 27
                                : constraints.maxWidth * 0.2,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Search'),
                              prefixIcon: Image.asset(
                                'lib/assets/search_icon.png',
                                height: 5,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
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
                        SizedBox(
                            width: constraints.maxWidth * 0.1 > 8.0
                                ? 8.0
                                : constraints.maxWidth * 0.1),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.28 > 118
                                ? 118 + constraints.maxWidth * 0.01
                                : constraints.maxWidth * 0.28,
                            maxHeight: constraints.maxWidth * 0.2 > 27
                                ? 27
                                : constraints.maxWidth * 0.2,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('Sort By :'),
                              suffixIcon: Image.asset(
                                'lib/assets/drop_icon.png',
                                height: 5,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
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
                            maxWidth: constraints.maxWidth * 0.15 > 89
                                ? 89
                                : constraints.maxWidth * 0.15,
                            maxHeight: constraints.maxWidth * 0.2 > 27
                                ? 27
                                : constraints.maxWidth * 0.2,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF48A9F8), // Blue color similar to the Sign In button
                              foregroundColor: Color(0xE4EBF1F5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
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
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15.0, bottom: 20.0),
                    child: Container(
                      color: Color(0xFFD3D8DE),
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 10.0, top: 10),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.65 > 557 ? 557 : constraints.maxHeight * 0.65, // Adjust height to your needs
                        width: constraints.maxWidth * 0.95 > 332 ? 332 + constraints.maxWidth * 0.3 : constraints.maxWidth * 0.95,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevents inner scroll view conflict
                                itemCount: patients.length,
                                itemBuilder: (context, index) {
                                  return buildPatientCardMobile(
                                      patients[index]);
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 8),
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
    String imagePath = patient.images.isNotEmpty
        ? 'lib/assets/davatar_${patient.images}.png'
        : 'lib/assets/davatar_1.png';
    //print('Patient image path: ${patient.images}');
    //print(maxW);
    double i= double.parse("${patient.images}");
    double value = 55 * i * i - 215 * i + 525;
    print(value);
    //print(maxW* 0.03 > 40 ? 40 : maxW*0.03);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Container(
        // White background for the individual patient cards
        height: maxH * 0.8 > 199 ? 199 : maxH * 0.8,
        width: maxW * 0.8 > 1120 ? 1120 : maxW * 0.8,
        decoration: BoxDecoration(
          color: Color(
              0xFFD3D8DE), // Background color for the patient details container
          border: Border.all(
            color: Colors.black, // Outline color
            width: 1, // Outline width
          ),
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, top: 5, right: 10, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //print image from assests folder
              Image.asset(imagePath,
                  height: 150, width: 150),
              // Name and Info
              SizedBox(
                width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                                patient.name,
                                style: TextStyle(
                                  fontSize: maxW* 0.03 > 40 ? 40 : maxW*0.03,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Manjari',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                        SizedBox(width: value,),
                        
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                  "Dr. Abrams",
                                  style: TextStyle(
                                    fontSize: maxW* 0.025 > 24 ? 24 : maxW*0.025,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manjari',
                                  ),
                                ),
                            Text(
                                  "Last Appointment: 20/08/2024",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manjari',
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          // White background for the individual patient cards
                          height: maxH * 0.6 > 100 ? 100 : maxH * 0.6,
                          width: 306,
                          decoration: BoxDecoration(
                            color: Color(
                                0xFFD3D8DE), // Background color for the patient details container
                            border: Border.all(
                              color: Colors.black, // Outline color
                              width: 1, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(
                                3), // Rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Bed Number",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Manjari',
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Ward No.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Manjari',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      patient.bedNumber,
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Manjari',
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      patient.wardNumber,
                                      style: TextStyle(
                                        fontSize: 32,
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
                      SizedBox(width: 12.3,),
                              // Status box
                      Container(
                        width: 150,
                        height: 103,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          //print(patient.status),
                          color: (patient.status == "96%")
                              ? Color.fromARGB(162, 140, 215, 100)
                              : Color.fromARGB(162, 255, 153,
                                  0), // Green background color
              
                          border: Border.all(
                            color: (patient.status == "96%")
                                ? Color.fromARGB(162, 140, 215, 100)
                                : Color.fromARGB(162, 255, 153, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/doxy.png',
                                height: 50, width: 50),
                            //SizedBox(height: 5),
                            Text(patient.status,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Manjari',
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.3,
                      ),
              
                      // Blood Pressure box
                      Container(
                        width: 150,
                        height: 103,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: (patient.bloodPressure == "180/120")
                              ? Color.fromARGB(162, 165, 50, 50)
                              : Color.fromARGB(162, 255, 153, 0),
                          border: Border.all(
                            color: (patient.bloodPressure == "180/120")
                                ? Color.fromARGB(162, 165, 50, 50)
                                : Color.fromARGB(162, 255, 153, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                'lib/assets/dblood-drop-donation.png',
                                height: 50,
                                width: 50),
                            //SizedBox(height: 5),
                            Text(
                              patient.bloodPressure,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manjari',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.3,
                      ),
              
                      // Heart Rate box
                      Container(
                        width: 150,
                        height: 103,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: (patient.bloodPressure == "70")
                              ? Color.fromARGB(162, 255, 153, 0)
                              : Color.fromARGB(162, 140, 215,
                                  100), // Yellow background color
                          border: Border.all(
                            color: (patient.bloodPressure == "70")
                                ? Color.fromARGB(162, 255, 153, 0)
                                : Color.fromARGB(162, 140, 215, 100),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/dheart-rate.png',
                                height: 50, width: 50.2),
                            SizedBox(height: 5),
                            Text(
                              patient.heartRate,
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
                          ),

                        
                      
                    
                ],
              )
            ],
          ),
          
        ),
      ),
    );
  }

/*




break


*/

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
        height: maxH * 0.6 > 93 ? 93 : maxH * 0.6,
        width: 300,
        decoration: BoxDecoration(
          color: Color(
              0xFFD3D8DE), // Background color for the patient details container
          border: Border.all(
            color: Colors.black, // Outline color
            width: 1, // Outline width
          ),
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, top: 5, right: 10, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //print image from assests folder
              Image.asset('lib/assets/avatar_${patient.images}.png',
                  height: 40, width: 40),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                  // White background for the individual patient cards
                                  height: maxH * 0.6 > 24 ? 24 : maxH * 0.6,
                                  width: 149,
                                  decoration: BoxDecoration(
                                    color: Color(
                                        0xFFD3D8DE), // Background color for the patient details container
                                    border: Border.all(
                                      color: Colors.black, // Outline color
                                      width: 1, // Outline width
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        3), // Rounded corners
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                  )),
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
                              color: (patient.status == "96%")
                                  ? Color.fromARGB(162, 140, 215, 100)
                                  : Color.fromARGB(162, 255, 153,
                                      0), // Green background color

                              border: Border.all(
                                color: (patient.status == "96%")
                                    ? Color.fromARGB(162, 140, 215, 100)
                                    : Color.fromARGB(162, 255, 153, 0),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('lib/assets/oxy.png',
                                    height: 25, width: 24.7),
                                //SizedBox(height: 5),
                                Text(patient.status,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Manjari',
                                    )),
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
                              color: (patient.bloodPressure == "145/95")
                                  ? Color.fromARGB(162, 165, 50, 50)
                                  : Color.fromARGB(162, 140, 215,
                                      100), // Red background color
                              border: Border.all(
                                color: (patient.bloodPressure == "145/95")
                                    ? Color.fromARGB(162, 165, 50, 50)
                                    : Color.fromARGB(162, 140, 215, 100),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'lib/assets/blood-drop-donation.png',
                                    height: 20,
                                    width: 20),
                                //SizedBox(height: 5),
                                Text(
                                  patient.bloodPressure,
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
                          SizedBox(
                            width: 10,
                          ),

                          // Heart Rate box
                          Container(
                            width: 70,
                            height: 45,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: (patient.heartRate == "60 bpm")
                                  ? Color.fromARGB(162, 255, 153, 0)
                                  : Color.fromARGB(162, 140, 215, 100), // Yellow background color
                              border: Border.all(
                                color: (patient.heartRate == "60 bpm")
                                    ? Color.fromARGB(162, 255, 153, 0)
                                    : Color.fromARGB(162, 140, 215, 100),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('lib/assets/heart-rate.png',
                                    height: 22, width: 19.2),
                                SizedBox(height: 5),
                                Text(
                                  patient.heartRate,
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
