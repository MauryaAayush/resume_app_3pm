import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../view/home_screen.dart';

Widget textFieldBox({required TextEditingController controller,required String hintText}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 60,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    ),
  );
}

