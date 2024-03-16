import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final  validator;
  final  controller;
  final  title;
  final hintText;
  final minLines;
  final maxLines;
  final suffixIcon;
  
  const TextFormWidget({
    super.key, this.validator, this.controller, this.title, this.hintText, this.minLines, this.maxLines, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title,style:TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      color: Colors.black,
      fontWeight:FontWeight.w400
    ),),
          const SizedBox(height: 5,),
          TextFormField(
                validator: validator,
                  controller: controller,
                
                minLines: minLines,
                maxLines: maxLines,
                
                  decoration:InputDecoration(

                    suffixIcon: suffixIcon,
                    filled: true,
          fillColor:Color.fromARGB(255, 245, 242, 242),
           contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          hintText:hintText,
          hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),
        
          border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(10),)
          ),
                  ),
                  keyboardType:TextInputType.emailAddress,
                ),
        ],
      ),
    );
  }
}