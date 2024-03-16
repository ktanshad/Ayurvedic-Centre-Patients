import 'package:ayurvedic_centre_patients/controller/register_provider.dart';
import 'package:ayurvedic_centre_patients/widgets/dropdown_formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTreatmentsAlertDialoge extends StatelessWidget {
  const AddTreatmentsAlertDialoge({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
     final registerProvider = Provider.of<RegisterProvider>(context);
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255),
        content: Column(
          children: [
            Consumer<RegisterProvider>(
              builder: (context,registerProvider, child) {
                final treatmentList=registerProvider.treatmentList;
                return   DropdownFormFieldWidget(
                title: "Choose Treatment",
                hintText: "Choose prefered treatment",
                items: treatmentList!.map((treatment) => treatment.name).toList(),
                selectedValue: registerProvider.selectedTreatment,
                onChanged: (value) {
                  registerProvider.setSelectedTreatment(value);
                },
                              );
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
                                if (registerProvider.patientCount! > 0) {
                                registerProvider. setPatientCount(registerProvider.patientCount!-1);
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
                            child: Consumer<RegisterProvider>(
                              builder: (context, registerrProvider, child) {
                                return  Center(
                                  child: Text("${registerrProvider.patientCount}"));
                              },
                             
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                              registerProvider.setPatientCount(registerProvider.patientCount!+1);
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
                                if (registerProvider.femalepatientCount! > 0) {
                                 registerProvider.setFemalePatientCount(registerProvider.femalepatientCount!-1);
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
                                child: Consumer<RegisterProvider>(
                              builder: (context, registerrProvider, child) {
                                return  Center(
                                  child: Text("${registerrProvider.femalepatientCount}"));
                              },
                             
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                               registerProvider.setFemalePatientCount(registerProvider.femalepatientCount!+1);
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
  }
}