import 'package:ayurvedic_centre_patients/view/home_screen.dart';
import 'package:ayurvedic_centre_patients/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          padding:  EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "Login Or Register To Book Your Appointments",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const TextFormWidget(
            title: "  Email",
            hintText: "Enter your email",
          ),
          const TextFormWidget(
            title: "  Password",
            hintText: "Enter Password",
          ),
          SizedBox(
            height: size.height / 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: MaterialButton(
              //Login button function
              onPressed: () {
               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              color: const Color.fromARGB(255, 0, 104, 55),
              height: size.height / 17,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
             SizedBox(
            height: size.height / 100,
          ),
           
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text("By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy."),
          )
        ],
      ),
    );
  }
}
