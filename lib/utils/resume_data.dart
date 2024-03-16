import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

int genderSelection = 0;
TextEditingController? txtSkills = TextEditingController(text: 'Programming');
List<TextEditingController>? txtSkillsController = [txtSkills!];
List<Uint8List>? pdfList;

class ResumeData
{
  File? profileImage;
  String? name,address,objective,gender,email,profession,aboutMe,phone;
  List<String>? skillList;
}

class Education
{
  String? universityName,degree,startYear,endYear;
}

class ResumeController
{
  TextEditingController? txtName;
  TextEditingController? txtEmail;
  TextEditingController? txtAddress;
  TextEditingController? txtPhone;
  TextEditingController? txtUniversityName;
  TextEditingController? txtDegree;
  TextEditingController? txtStartYear;
  TextEditingController? txtEndYear;

}


