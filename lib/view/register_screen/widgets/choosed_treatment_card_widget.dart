import 'package:flutter/material.dart';

class ChoosedTreatmentCard extends StatelessWidget {
  const ChoosedTreatmentCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Treatments",style:TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              color: Colors.black,
              fontWeight:FontWeight.w400
            ),),
          Container(
            height:size.height/9,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("1. Couple Combo  package i...",style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w500),),
                Icon(Icons.highlight_remove,color: Colors.red,)
              ],
              ),
              Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Male
                Row(children: [
                  Text("Male",style: TextStyle(
                    color: const Color.fromARGB(255, 0, 104, 55),
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 10,),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 0, 104, 55),)
                    ),
                    child: Center(child: Text("2")),
                  )
                ],),
                 //Female
                    Row(children: [
                  Text("Female",style: TextStyle(
                    color: const Color.fromARGB(255, 0, 104, 55),
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400),),
                   SizedBox(width: 10,),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 0, 104, 55),)
                    ),
                    child: Center(child: Text("2")),
                  )
                ],),
                Icon(Icons.edit_outlined,color: const Color.fromARGB(255, 0, 104, 55),)
              ],
              )
            ],
          ),
          ),
        ],
      ),
    );
  }
}