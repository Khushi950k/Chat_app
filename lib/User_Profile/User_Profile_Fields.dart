import 'package:flutter/material.dart';

class UserField{
  static CustomTextField(String text,bool ToHide,TextEditingController controller){
    return Container(
      height: 45,
      width: 325,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white.withOpacity(.9)
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 20,top: 3),
        child: TextField(
          controller: controller,
          obscureText: ToHide,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
              border: InputBorder.none
          ),
        ),
      ),
    );
  }
}