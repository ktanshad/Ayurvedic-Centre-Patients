import 'package:ayurvedic_centre_patients/model/branches_model.dart';
import 'package:ayurvedic_centre_patients/model/treatementlist_model.dart';
import 'package:ayurvedic_centre_patients/services/get_branches_Services.dart';
import 'package:ayurvedic_centre_patients/services/get_treatement_services.dart';
import 'package:ayurvedic_centre_patients/services/register_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterProvider extends ChangeNotifier{
RegisterProvider(){
  gettreatment();
  getBranch();
}
  TextEditingController nameController=TextEditingController();
  TextEditingController whatsAppController=TextEditingController();
   TextEditingController addressController=TextEditingController();
       TextEditingController totalAmountController=TextEditingController();
       TextEditingController balanceAmountController=TextEditingController();
        TextEditingController treatmentTimeController=TextEditingController();
  String? selectedLocation;
  String? selectedBranch;
  String? selectedHour;
  String? selectedMinuts;
  String? selectedTreatment;
  int? patientCount = 0;
  int? femalepatientCount = 0;

  //get treatment List
   GetTreatmentListServices getTreatmentListServices = GetTreatmentListServices();
  List<Treatment>? treatmentList=[];
  Future<void> gettreatment() async {
  treatmentList=await getTreatmentListServices.getTreatmentListServices();
  notifyListeners();
  }
 
  //get branches
   GetBranchesSServices getBranchesSServices = GetBranchesSServices();
  List<Branches> branchList=[];
  Future<void> getBranch() async {
  branchList=await getBranchesSServices.fetchBranches();
  notifyListeners();
  }

  // register patient 
    
  PatientRegisterServices patientRegisterServices =
   PatientRegisterServices();
 Future<void>registerPtients() async {
      FormData formData = await FormData.fromMap({
      'name': nameController.text,
       'phone':whatsAppController.text,
       'address':addressController.text,
       'total_amount':totalAmountController.text,
       'balance_amount':balanceAmountController.text,
       'date_nd_time':"${treatmentDateController.text+treatmentTimeController.text}",
       'branch':selectedBranch
    });
      await patientRegisterServices.registerPatientServices(formData);
      notifyListeners();
  }



void setSelectedlocation(value){
selectedLocation=value;
notifyListeners();
}
void setSelectedbranch(value){
selectedBranch=value;
notifyListeners();
}
void setSelectedTreatment(value){
selectedTreatment=value;
notifyListeners();
}

void setPatientCount(value){
patientCount=value;
notifyListeners();
}

void setFemalePatientCount(value){
femalepatientCount=value;
notifyListeners();
}



void setselectedHour(value){
selectedHour=value;
notifyListeners();
}

void setselectedminuts(value){
selectedMinuts=value;
notifyListeners();
}










 TextEditingController treatmentDateController = TextEditingController();
   DateTime? selectedtreatmentDate;
  //----select Dtae------------------------
  Future<void> selectDate(BuildContext context,) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedtreatmentDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );
    if (picked != null && picked != selectedtreatmentDate) {
      selectedtreatmentDate = picked;
      treatmentDateController.text = formatDate(selectedtreatmentDate!);
    }
  }

  String formatDate(DateTime date) {
    return date != null ? DateFormat('yyyy-MM-dd').format(date) : '';
  }

  //time picker
   String formatTime(TimeOfDay time) {
    int hour = time.hourOfPeriod;
    int minute = time.minute;
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';

    String formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';

    return formattedTime;
  }


  List Location=["Thiruvananthapuram","Kollam","Pathanamthitta","ALappuzha","Kottayam","Idukki","Ernakulam","Thrissure","Palakkad",
  "Malappuram","Kozhikode","wayanad","Kannur","Kasarkode"];

}