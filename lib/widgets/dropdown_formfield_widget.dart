import 'package:flutter/material.dart';

class DropdownFormFieldWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged onChanged;
  final FormFieldValidator<String>? validator;
  final String? title;

  DropdownFormFieldWidget(
      {required this.hintText,
      required this.items,
      required this.selectedValue,
      required this.onChanged,
      this.validator,
       this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(title??"",style:TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: Colors.black,
        fontWeight:FontWeight.w400
      ),),
            const SizedBox(height: 5,),
          DropdownButtonFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                filled: true,
                  fillColor:Color.fromARGB(255, 245, 242, 242),
                 border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(10),)
              ),
                errorStyle: TextStyle(color: Colors.red),
                hintText: hintText,
                 hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            dropdownColor: Colors.white,
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
