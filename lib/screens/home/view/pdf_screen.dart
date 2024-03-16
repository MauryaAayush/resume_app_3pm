import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:resume_app_3pm/screens/home/components/personal_info.dart';
import 'package:resume_app_3pm/screens/home/components/skill_dart.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        pdfFileName: '${resumeData.name}.pdf',
        build: (format) => generatePdf(),
      ),
    );
  }
}
