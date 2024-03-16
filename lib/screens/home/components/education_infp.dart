import 'package:flutter/material.dart';
import 'package:resume_app_3pm/screens/home/components/text_field_box.dart';

import '../view/home_screen.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Education'),
          ),
          textFieldBox(
              controller: resumeController.txtUniversityName!,
              hintText: 'University Name'),
          textFieldBox(
              controller: resumeController.txtDegree!,
              hintText: 'Degree or Course'),
          textFieldBox(
              controller: resumeController.txtStartYear!, hintText: '2012'),
          textFieldBox(
              controller: resumeController.txtEndYear!, hintText: '2024'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  education.universityName = resumeController.txtUniversityName!.text;
                  education.degree = resumeController.txtDegree!.text;
                  education.startYear = resumeController.txtStartYear!.text;
                  education.endYear = resumeController.txtEndYear!.text;
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
