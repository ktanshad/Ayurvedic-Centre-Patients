
import 'package:ayurvedic_centre_patients/view/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    // validator: validator,
                    // controller: controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 242, 242),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0), // Adjust padding
                      hintText: "Search for treatments",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                //Login button function
                onPressed: () {},
                color: const Color.fromARGB(255, 0, 104, 55),
                height: size.height / 17,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  const Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
                            ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
              Text("Sort by:",    style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),)
              ],
            ),
          ),
        Divider(thickness: 1,color: Colors.black,),


        Expanded(
          child: ListView.builder(
            itemCount:10,
            itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 208, 208, 208),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                 
                  height: size.height/7,
                  child: Column(
                    children: [
                      SizedBox(height:size.height/90,),
                      SizedBox(
                         width: size.width/1.6,
                        child: Text("${index+1}. Vikram Singh")),
                      SizedBox(
                        width: size.width/1.6,
                        child: Text("Couple Combo Package (rejuvenkjkln")),
                          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today_outlined,color: Colors.red,),
                                Text("31/01/2024"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.people_outline,color: Colors.red,),
                              Text("Jithesh"),
                            ],
                          ),
                          
                          ],
                      ),
                      Divider(thickness: 1,color: Colors.grey,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        
                        Text("View Booking details"),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],)
                    ],
                  ),
                ),
              );
            }, 
             
            ),
        ),
       
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: MaterialButton(
              //Login button function
              onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterScreen(),));
              },
              color: const Color.fromARGB(255, 0, 104, 55),
              height: size.height / 17,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  const Text(
                "Register Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
