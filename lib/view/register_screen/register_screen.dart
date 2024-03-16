import 'package:ayurvedic_centre_patients/view/home_screen.dart';
import 'package:ayurvedic_centre_patients/view/register_screen/widgets/choosed_treatment_card_widget.dart';
import 'package:ayurvedic_centre_patients/widgets/dropdown_formfield_widget.dart';
import 'package:ayurvedic_centre_patients/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  String? selectedLocation;
  String? selectedBranch;
  String? selectedHour;
  String? selectedMinuts;
  String? selectedTreatment;
  DateTime? selectedstartDate;
  int? patientCount = 0;
  TextEditingController startDateController = TextEditingController();
  //----select Dtae------------------------
  Future<void> selectDate(BuildContext context, DateTime? selectedDate,
      TextEditingController dateController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = formatDate(selectedDate);
    }
  }

  String formatDate(DateTime date) {
    return date != null ? DateFormat('yyyy-MM-dd').format(date) : '';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_sharp,
                size: 35,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            TextFormWidget(
              title: " Name",
              hintText: "Enter your full name",
            ),
            TextFormWidget(
              title: " Whatsapp Number",
              hintText: "Enter your whatsapp number",
            ),
            TextFormWidget(
              title: " Address",
              hintText: "Enter your full address",
              minLines: 1,
              maxLines: 5,
            ),
            DropdownFormFieldWidget(
              title: " Location",
              hintText: "Choose your location ",
              items: ["london", "kerala", "America"],
              selectedValue: selectedLocation,
              onChanged: (value) {
                setState(() {
                  selectedLocation = value;
                });
              },
            ),
            DropdownFormFieldWidget(
              title: " Branch",
              hintText: "Select the branch",
              items: ["koduvally", "omassery", "mukkam"],
              selectedValue: selectedBranch,
              onChanged: (value) {
                setState(() {
                  selectedBranch = value;
                });
              },
            ),
            ChoosedTreatmentCard(size: size),
            Padding(
              padding: const EdgeInsets.all(14),
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          content: Column(
                            children: [
                              DropdownFormFieldWidget(
                                title: "Choose Treatment",
                                hintText: "Choose prefered treatment",
                                items: ["panjakarama", "njavara kizhi"],
                                selectedValue: selectedTreatment,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTreatment = value;
                                  });
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Add Patients")),
                                        //Male
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 214, 213, 213))),
                                          child: Center(child: Text("Male")),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (patientCount! > 0) {
                                                    patientCount =
                                                        patientCount! - 1;
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outlined,
                                                  color: const Color.fromARGB(
                                                      255, 0, 104, 55),
                                                )),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 214, 213, 213))),
                                              child: Center(
                                                  child: Text("${patientCount}")),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    patientCount =
                                                        patientCount! + 1;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outlined,
                                                  color: const Color.fromARGB(
                                                      255, 0, 104, 55),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                        
                        
                                         Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 214, 213, 213))),
                                          child: Center(child: Text("Female")),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (patientCount! > 0) {
                                                    patientCount =
                                                        patientCount! - 1;
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outlined,
                                                  color: const Color.fromARGB(
                                                      255, 0, 104, 55),
                                                )),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 214, 213, 213))),
                                              child: Center(
                                                  child: Text("${patientCount}")),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    patientCount =
                                                        patientCount! + 1;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outlined,
                                                  color: const Color.fromARGB(
                                                      255, 0, 104, 55),
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                        
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: MaterialButton(
                                      //Login button function
                                      onPressed: () {
                                       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
                                      },
                                      color: const Color.fromARGB(255, 0, 104, 55),
                                      height: size.height / 17,
                                      minWidth: double.infinity,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child:  const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                color: Color.fromARGB(255, 166, 232, 201),
                height: size.height / 17,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "+ Add Treatments",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            TextFormWidget(
              title: " Total Ammount",
            ),
            TextFormWidget(
              title: " Balance Ammount",
            ),
            TextFormWidget(
              title: " Treatment Date",
              suffixIcon: GestureDetector(
                  onTap: () async {
                    await selectDate(
                        context, selectedstartDate, startDateController);
                    startDateController.text = formatDate(selectedstartDate!);
                  },
                  child: const Icon(Icons.calendar_month_outlined)),
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownFormFieldWidget(
                    hintText: "Hour",
                    items: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                      "10",
                      "11",
                      "12"
                    ],
                    selectedValue: selectedHour,
                    title: " Treatment Time",
                    onChanged: (value) {
                      setState(() {
                        selectedHour = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownFormFieldWidget(
                    hintText: "Minuts",
                    items: [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                      "10",
                      "11",
                      "12"
                    ],
                    selectedValue: selectedMinuts,
                    onChanged: (value) {
                      setState(() {
                        selectedMinuts = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: MaterialButton(
                //Login button function
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                color: const Color.fromARGB(255, 0, 104, 55),
                height: size.height / 17,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
