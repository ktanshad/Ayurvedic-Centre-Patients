import 'package:ayurvedic_centre_patients/widgets/read_token.dart';
import 'package:dio/dio.dart';

class PatientRegisterServices {
 Future<void> registerPatientServices(formData,) async {
    String? token = await readToken();
    Dio dio = Dio();

    try {
      String apiUrl =
          'https://flutter-amr.noviindus.in/api/patientUpdate';
      Response response = await dio.post(apiUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data:formData);

// Handle the response
      if (response.statusCode == 200) {
        print('Response: ${response.data}');
      } else if (response.statusCode == 409) {
        // Handle conflict (duplicate entry) scenario
        print('Error: Duplicate entry');
        print('Server Response: ${response.data}');
      } else {
        // Handle other errors
        print('response: ${response.statusCode}, ${response.statusMessage}');
      }
    } catch (e) {
      print('response: $e');
    }
  }
}
