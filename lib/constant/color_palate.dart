import 'package:flutter/material.dart';

const Color background = Color(0xFF131313);
const Color textBlue = Color(0xFF00FFFF);
const Color textGold = Color(0xFFFFD700);
const Color searchField = Color(0x3DFFFFFF);
const Color searchFieldText = Color(0xB3FFFFFF);
const Color matteBlack = Color(0xFF28282B);
const Color justWhite = Color(0xFFffffff);

final Gradient darkGradient = LinearGradient(
  colors: [matteBlack, Colors.grey[700]!],
  // Replace Colors.grey[900] with your desired end color
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);

const List<Gradient> colorGradients = [
  LinearGradient(
    colors: [Colors.black, Colors.white],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.red],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.green],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.blue],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.black],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.white12, Colors.white],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.yellow],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.teal],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black, Colors.purple],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black12, Colors.orange],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  LinearGradient(
    colors: [Colors.black, Color(0xFFFF00FF)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
];

const styleBB24 = TextStyle(
  //color: Color(0xffFFA500),
  color: textBlue,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const styleBB20 = TextStyle(
  //color: Color(0xffFFA500),
  color: textBlue,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const styleBB16 = TextStyle(
  //color: Color(0xffFFA500),
  color: textBlue,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const styleGB24 = TextStyle(
  color: textGold,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const styleGB20 = TextStyle(
  color: textGold,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const styleGB16 = TextStyle(
  color: textGold,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const styleWB24 = TextStyle(
  color: justWhite,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const styleWB20 = TextStyle(
  color: justWhite,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const styleWB18 = TextStyle(
  color: justWhite,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);const styleWB16 = TextStyle(
  color: justWhite,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
const styleWB12 = TextStyle(
  color: justWhite,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
