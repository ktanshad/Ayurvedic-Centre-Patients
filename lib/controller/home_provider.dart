
import 'package:ayurvedic_centre_patients/model/patient_list_model.dart';
import 'package:ayurvedic_centre_patients/services/get_patient_list_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  HomeProvider(){
    getpatients();
  }
 
     TextEditingController searchController =TextEditingController();
   GetPtientListServices getPtientListServices = GetPtientListServices();
  List<Patient>? patienList=[];
  Future<void> getpatients() async {
  patienList=await getPtientListServices.getPtientListServices();
  notifyListeners();
  }



  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
}
} 