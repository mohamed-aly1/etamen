import 'package:etamen/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget defaultButton({
  double size = 20,
  double width = 180,
  double height = 50,
  Color backgroundColor = const Color(0xFFF06D57),
  Color textColor = Colors.white,
  required VoidCallback onpressedfunction,
  required String title,
}) =>
    ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: ElevatedButton(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: GoogleFonts.leagueSpartan(
              textStyle: TextStyle(
                fontSize: size,
                color: textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          onPressed: onpressedfunction,
        ),
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required String? Function(String?)? validateFun,
  TextInputType keyboardType = TextInputType.text,
  VoidCallback? onSubmitFun,
  VoidCallback? onTapFun,
  VoidCallback? onChangedFun,
  required String hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double width = 300,
  int maxlines = 1,
  bool obscureText = false,
  bool readOnly = false,
  TextAlign textAlign = TextAlign.start,
  double fontSize = 16,
  String? initialvalue,
}) =>
    Container(
      width: width,
      child: TextFormField(
        initialValue: initialvalue,
        textAlign: textAlign,
        maxLines: maxlines,
        readOnly: readOnly,
        onTap: onTapFun,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        validator: validateFun,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: fontSize),
      ),
    );

Widget timeButton({
  double size = 13,
  double width = 115,
  double height = 50,
  Color backgroundColor = const Color(0xFFE8E8E8),
  Color textColor = Colors.black,
  required VoidCallback onpressedfunction,
  required String title,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: GoogleFonts.leagueSpartan(
          textStyle: TextStyle(
            fontSize: size,
            color: textColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      onPressed: onpressedfunction,
    );
