import 'package:ayurvedic_centre_patients/model/patient_list_model.dart';
import 'package:ayurvedic_centre_patients/model/treatementlist_model.dart';
import 'package:ayurvedic_centre_patients/widgets/read_token.dart';
import 'package:dio/dio.dart';




class GetTreatmentListServices {
  final Dio _dio = Dio();

  Future<List<Treatment>> getTreatmentListServices() async {
    String? token =
        await readToken();

    final url =
        'https://flutter-amr.noviindus.in/api/TreatmentList';

    try {
      final response = await _dio.get(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));

      if (response.statusCode == 200) {
        final BranchesModel = TreatmentListModel.fromJson(response.data);
        return BranchesModel.treatments;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
