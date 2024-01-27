import 'dart:io';
import 'package:chat_app/User_Profile/User_Profile_Fields.dart';
import 'package:chat_app/Widget/Home_Screen.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController statusController=TextEditingController();
  File? pickedImage;
  auth(String name,String status)async{
    if(name=="" && status==""){
      return UiHelper.CustomSnackBar("Enter Required Field's");
    }
    else{
      uploadImage();
    }
  }

  openAlert() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.grey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Show Us Your Smile 😊",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white.withOpacity(.4)),
                          child: Image.network(
                              "https://cdn.iconscout.com/icon/free/png-256/free-camera-1831-475002.png")),
                    ),
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white.withOpacity(.4)),
                          child: Image.network(
                              "https://cdn.icon-icons.com/icons2/2440/PNG/512/gallery_icon_148533.png")),
                    )
                  ],
                )
              ],
            ),
          );
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))));
  }

  uploadImage() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("Users Images")
        .child(FirebaseAuth.instance.currentUser!.email.toString())
        .putFile(pickedImage!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String img = await taskSnapshot.ref.getDownloadURL();
    String name=nameController.text.toString();
    String status=statusController.text.toString();

    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.email).set({
      "Email":FirebaseAuth.instance.currentUser!.email,
      "Images":img,
      "Name":name,
      "Status":status,
      "uid":FirebaseAuth.instance.currentUser!.uid
    }).then((value){
      Get.to(const HomeScreen());
      //Navigator.pushNamedAndRemoveUntil(context, PageConst.homescreen, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Card(
                elevation: 14,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)),
                child: GestureDetector(
                  onTap: () {
                    openAlert();
                  },
                  child: pickedImage != null
                      ? Container(
                    clipBehavior: Clip.antiAlias,
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.file(pickedImage!, fit: BoxFit.cover),
                  )
                      : Container(
                    height: 150,
                    width: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.9),
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.network(
                      "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg",fit: BoxFit.cover,),
                  ),
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
            const SizedBox(height: 30),
            UserField.CustomTextField("Username", false, nameController),
            const SizedBox(
              height: 20,
            ),
            UserField.CustomTextField("Status", false, statusController),
            const SizedBox(
              height: 20,),
            UiHelper.CustomButton(() {
              auth(nameController.text.toString(), statusController.text.toString());
            }, "Let's Go")
          ],
        ),
      ),
    );
  }

  pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (ex) {
      return UiHelper.CustomSnackBar(ex.toString(),);
    }
  }
}