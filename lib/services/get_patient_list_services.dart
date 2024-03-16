import 'package:ayurvedic_centre_patients/model/patient_list_model.dart';
import 'package:ayurvedic_centre_patients/widgets/read_token.dart';
import 'package:dio/dio.dart';




class GetPtientListServices {
  final Dio _dio = Dio();

  Future<List<Patient>> getPtientListServices() async {
    String? token =
        await readToken();

    final url =
        'https://flutter-amr.noviindus.in/api/PatientList';

    try {
      final response = await _dio.get(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));

      if (response.statusCode == 200) {
        final BranchesModel = PatientListModel.fromJson(response.data);
        return BranchesModel.patient;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
