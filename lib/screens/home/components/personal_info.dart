
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app_3pm/screens/home/components/text_field_box.dart';

import '../../../utils/resume_data.dart';
import '../../../utils/utils.dart';
import '../view/home_screen.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

ResumeData resumeData = ResumeData();
File? imgPath;

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GestureDetector(
              onTap: () async {

                ImagePicker image = ImagePicker();
                XFile? img = await image.pickImage(source: ImageSource.camera);
               setState(() {

                 imgPath = File(img!.path);


               });


              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: primaryColor,
                backgroundImage: (imgPath!=null)?FileImage(imgPath!):null,
              ),
            ),
          ),
          textFieldBox(
              hintText: 'Full Name',
              controller: resumeController.txtName!),
          textFieldBox(
              hintText: 'Email',
              controller: resumeController.txtEmail!),
          textFieldBox(
              hintText: 'Phone',
              controller: resumeController.txtPhone!),
          textFieldBox(
              hintText: 'Address',
              controller: resumeController.txtAddress!),
          RadioListTile(
            value: 0,
            groupValue: genderSelection,
            onChanged: (value) {
              setState(() {
                genderSelection = value!;
              });
            },
            title: Text('Male'),
          ),
          RadioListTile(
            value: 1,
            groupValue: genderSelection,
            onChanged: (value) {
              setState(() {
                genderSelection = value!;
              });
            },
            title: Text('Female'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // tabIndex=1;
                // print('button pressed $tabIndex');

                resumeData.name = resumeController.txtName!.text;
                resumeData.email = resumeController.txtEmail!.text;
                resumeData.phone = resumeController.txtPhone!.text;
                resumeData.address = resumeController.txtAddress!.text;
                resumeData.gender = (genderSelection==0)?'Male':'Female';


              });

            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

