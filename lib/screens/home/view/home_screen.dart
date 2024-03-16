import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_app_3pm/screens/home/components/education_infp.dart';
import 'package:resume_app_3pm/screens/home/components/personal_info.dart';
import 'package:resume_app_3pm/screens/home/components/skill_dart.dart';
import 'package:resume_app_3pm/utils/resume_data.dart';
import 'package:resume_app_3pm/utils/utils.dart';

import '../components/text_field_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int tabIndex = 0;


ResumeController resumeController = ResumeController();
Education education = Education();



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    resumeController.txtName = TextEditingController(text: 'Niraj Rajput');
    resumeController.txtEmail = TextEditingController(text: 'niraj@gmail.com');
    resumeController.txtPhone = TextEditingController(text: '8529637410');
    resumeController.txtAddress = TextEditingController(
        text: '3rd Pillar, Parking, The Palace, Paravt Patia, Surat - 395010');

    resumeController.txtUniversityName = TextEditingController(text: 'Sunrise School');
    resumeController.txtDegree = TextEditingController(text: 'HSC');
    resumeController.txtStartYear = TextEditingController(text: '2010');
    resumeController.txtEndYear = TextEditingController(text: '2012');

    // resumeController.txtSkills = TextEditingController(text: 'Dart');
    // resumeController.txtSkillsController = [resumeController.txtSkills!];

    return DefaultTabController(
      initialIndex: 2,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          bottom: TabBar(
            labelStyle: TextStyle(color: bgColor),
            dividerColor: bgColor,
            indicatorColor: bgColor,
            padding: EdgeInsets.all(5),
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: [
              Text('Personal'),
              Text('Education'),
              Text('Skils'),
              Text('Objective'),
              Text('About'),
            ],
          ),
        ),
        body: TabBarView(

          children: [

            PersonalInfo(),
            EducationInfo(),
            SkillScreen(),

            Text('Objective'),
            Text('About'),
          ],
        ),
      ),
    );
  }
}
