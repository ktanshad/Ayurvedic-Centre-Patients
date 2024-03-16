
import 'package:ayurvedic_centre_patients/controller/register_provider.dart';
import 'package:ayurvedic_centre_patients/view/register_screen/widgets/choosed_treatment_card_widget.dart';
import 'package:ayurvedic_centre_patients/widgets/dropdown_formfield_widget.dart';
import 'package:ayurvedic_centre_patients/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
     final registerProvider = Provider.of<RegisterProvider>(context);
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
              controller: registerProvider.nameController,
              title: " Name",
              hintText: "Enter your full name",
            ),
            TextFormWidget(
              controller: registerProvider.whatsAppController,
              title: " Whatsapp Number",
              hintText: "Enter your whatsapp number",
            ),
            TextFormWidget(
              controller: registerProvider.addressController,
              title: " Address",
              hintText: "Enter your full address",
              minLines: 1,
              maxLines: 5,
            ),
            DropdownFormFieldWidget(
              title: " Location",
              hintText: "Choose your location ",
               items: registerProvider.Location.map((location) => location.toString()).toList(),
              selectedValue:registerProvider.selectedLocation,
              onChanged: (value) {
                registerProvider.setSelectedlocation(value);
              },
            ),
            Consumer<RegisterProvider>(
              builder: (context, registerProvider, child) {
                final branchList=registerProvider.branchList;
                return    DropdownFormFieldWidget(
                title: " Branch",
                hintText: "Select the branch",
                items:  branchList.map((branch) => branch.name).toList(),
                selectedValue:registerProvider.selectedBranch,
                onChanged: (value) {
                   registerProvider.setSelectedbranch(value);
                },
              );
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
                      return AddTreatmentsAlertDialoge( size: size);
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
              controller: registerProvider.totalAmountController,
              title: " Total Ammount",
            ),
            TextFormWidget(
              controller: registerProvider.balanceAmountController,
              title: " Balance Ammount",
            ),
            Consumer<RegisterProvider>(
              builder: (context, provider, child) {
                return    TextFormWidget(
                  controller: provider.treatmentDateController,
                title: " Treatment Date",
                suffixIcon: GestureDetector(
                    onTap: () async {
                      await provider.selectDate(context,);
                    provider.treatmentDateController.text =registerProvider.formatDate(provider.selectedtreatmentDate!);
                    },
                    child: const Icon(Icons.calendar_month_outlined)),
              );
              },
          
            ),




              Consumer<RegisterProvider>(
              builder: (context, provider, child) {
                return    TextFormWidget(
                  controller: provider.treatmentTimeController,
                title: " Treatment Time",
                   suffixIcon: IconButton(
                        onPressed: () async {
                          // Assuming you have a function to pick time
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (selectedTime != null) {
                            String formattedTime =registerProvider.formatTime(selectedTime);
                            registerProvider.treatmentTimeController.text = formattedTime;
                          }
                        },
                        icon: const Icon(Icons.access_time),
                      ),
              );
              },
          
            ),
           
            Padding(
              padding: const EdgeInsets.all(14),
              child: MaterialButton(
                //Login button function
                onPressed: () async{
                       await registerProvider.registerPtients();
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




//alert Dialoge
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
                return   SizedBox(
                  child: DropdownFormFieldWidget(
                  title: "Choose Treatment",
                  hintText: "Choose prefered treatment",
                  items: treatmentList!.map((treatment) => treatment.name).toList(),
                  selectedValue: registerProvider.selectedTreatment,
                  onChanged: (value) {
                    registerProvider.setSelectedTreatment(value);
                  },
                                ),
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









  