

import 'package:ayurvedic_centre_patients/model/branches_model.dart';
import 'package:ayurvedic_centre_patients/widgets/read_token.dart';
import 'package:dio/dio.dart';




class GetBranchesSServices {
  final Dio _dio = Dio();

  Future<List<Branches>> fetchBranches() async {
    String? token =
        await readToken();

    final url =
        'https://flutter-amr.noviindus.in/api/HomeApi';

    try {
      final response = await _dio.post(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));

      if (response.statusCode == 200) {
        final BranchesModel = BranchModel.fromJson(response.data);
        return BranchesModel.branches;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
