import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(fs, fw, tc){
  return GoogleFonts.roboto(
    fontSize: fs.toDouble(), 
    fontWeight: fw,
    color: tc
  );
}