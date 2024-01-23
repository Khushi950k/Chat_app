import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UiHelper {
  static CustomTextField(TextEditingController controller, String text,
      bool ToHide,void Function(String value)? func) {
    return Container(
      height: 50,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white.withOpacity(.6)),
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 20),
        child: TextField(
          controller: controller,
          obscureText: ToHide,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
              border: InputBorder.none),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback callback, String text) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: 50,
        width: 320,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
  static CustomSnackBar(String text
      //,BuildContext context
      ) {
    return Get.showSnackbar(GetSnackBar(
      title: text,
      backgroundColor: Colors.blue.withOpacity(.2),
      snackPosition: SnackPosition.BOTTOM,
    )
   // )
    );
  }
}

