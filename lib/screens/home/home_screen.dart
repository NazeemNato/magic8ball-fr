import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magicball/widgets/widgets.dart';

import 'views/views.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        title: Text(
          '8 Magic Ball',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Responsive(
        desktop: HomeWeb(),
        tablet: HomeTablet(),
        mobile: HomeMobile(),
      ),
    );
  }
}
