
import 'package:ayurvedic_centre_patients/model/patient_list_model.dart';
import 'package:ayurvedic_centre_patients/services/get_patient_list_services.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier{
  HomeProvider(){
    getpatients();
  }
 

   GetPtientListServices getPtientListServices = GetPtientListServices();
  List<Patient>? patienList=[];
  Future<void> getpatients() async {
  patienList=await getPtientListServices.getPtientListServices();
  notifyListeners();
  }
} 