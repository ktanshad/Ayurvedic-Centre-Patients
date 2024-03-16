import 'package:ayurvedic_centre_patients/controller/login_provider.dart';
import 'package:ayurvedic_centre_patients/view/home_screen.dart';
import 'package:ayurvedic_centre_patients/widgets/read_token.dart';
import 'package:ayurvedic_centre_patients/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

   final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height / 4,
              child: Image.asset(
                'assets/LoginPageImage.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "Login Or Register To Book Your Appointments",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.height / 50), // Add space here
            Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
              child: TextFormWidget(
                controller: loginProvider.usernameController,
                title: "  Username",
                hintText: "Enter your username",
                  validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username ';
                      } else {
                        return null;
                      }
                    }
              ),
            ),
            SizedBox(height: size.height / 50), // Add space here
            Padding(
               padding: EdgeInsets.symmetric(vertical: 6),
              child: TextFormWidget(
                controller: loginProvider.passwordController,
                title: "  Password",
                hintText: "Enter Password",
                  validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        return null;
                      }
                    }
              ),
            ),
            SizedBox(height: size.height / 50), // Add space here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14 ,vertical: 70),
              child: MaterialButton(
                //Login button function
                onPressed: () async {
                    if (formkey.currentState!.validate()) {
                  await loginProvider.loginAndGetToken();
                  final token = await readToken();
                  if (token != null && token.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to login. Please try again.'),
                      ),
                    );
                  }
                    }else{
                       print('empty value');
                    }
                },
                color: const Color.fromARGB(255, 0, 104, 55),
                height: size.height / 17,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: size.height / 50), // Add space here
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                  "By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy."),
            ),
          ],
        ),
      ),
    );
  }
}
