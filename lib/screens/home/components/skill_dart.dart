import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:resume_app_3pm/screens/home/components/personal_info.dart';
import 'package:resume_app_3pm/screens/home/components/text_field_box.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:resume_app_3pm/screens/home/view/pdf_screen.dart';
import '../../../utils/resume_data.dart';
import '../view/home_screen.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        ...List.generate(txtSkillsController!.length, (index) =>
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: textFieldBox(controller: txtSkillsController![index], hintText: 'Programming'),
                ),
                IconButton(onPressed: () {
                  setState(() {

                  });
                }, icon: Icon(Icons.delete)),

                IconButton(onPressed: () {
                  setState(() {

                    TextEditingController txtSkill = TextEditingController(text: 'Flutter');
                    txtSkillsController!.add(txtSkill);

                  });
                }, icon: const Icon(Icons.add)),

              ],
            ),),

        ElevatedButton(
          onPressed: () {

            resumeData.skillList = txtSkillsController!.map((e) => e.text).toList();

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfScreen(),));

          },
          child: const Text('Next'),
        ),
      ],
    );
  }
}

Future<Uint8List> generatePdf()
async {
  final pdf = pd.Document();
  final imageBytes = pd.MemoryImage(imgPath!.readAsBytesSync());
  // final img = imageBytes;
  pdf.addPage(
  pd.Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return pd.Column(
        children: [
          pd.Container(
            height: 150,
            width: double.infinity,
            decoration: const pd.BoxDecoration(
              color: PdfColors.cyan
            ),
            alignment: pd.Alignment.center,
            child: pd.Row(

              children: [
                pd.Container(
                    height: 120,
                    width: 120,
                    alignment: pd.Alignment.center,
                    decoration: const pd.BoxDecoration(
                        shape: pd.BoxShape.circle,
                        color: PdfColors.white
                    ),
                  child: pd.ClipRRect(
                    horizontalRadius: 60,
                    verticalRadius: 60,
                    child: pd.Image(imageBytes,fit: pd.BoxFit.cover)
                  ),
                ),
                pd.SizedBox(width: 20),
                pd.Text(resumeData.name!,style: pd.TextStyle(fontSize: 30,color: PdfColors.white)),
              ]
            ),
          ),

          pd.Text(resumeData.email!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(resumeData.phone!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(resumeData.address!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(resumeData.gender!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(education.universityName!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(education.degree!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(education.startYear!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),
          pd.Text(education.endYear!,style: pd.TextStyle(fontSize: 20,color: PdfColors.black)),

          ...List.generate(resumeData.skillList!.length, (index) => pd.Text(resumeData.skillList![index],style: pd.TextStyle(fontSize: 20))),


        ]
      );
    },
  ),);

  // await Printing.layoutPdf(onLayout: (format) => pdf.save(),);
  return await pdf.save();
}

