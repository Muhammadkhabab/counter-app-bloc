// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../bloc/core/colors.dart';
import '../bloc/core/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.backgroundColor = whiteColor,
  }) : super(key: key);

  final String hintText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                color: blackColor.withOpacity(.25),
                blurRadius: 1,
              )
            ]),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: mainColor,
            ),
            hintText: hintText,
            hintStyle: textStyleF10W400(color: blackColor.withOpacity(.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }
}