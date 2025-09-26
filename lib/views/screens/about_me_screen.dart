import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile
        if (constraints.maxWidth < 600) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/person_vector.png',
                  height: 400,
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Me", style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                    )),
                    const SizedBox(height: 20),
                    Text(
                      "Motivated and enthusiastic junior mobile developer with expertise in Flutter and solid experience using GetX for state management and Hive for local data storage. Skilled in building modern, responsive, and user-friendly mobile interfaces. Although I do not have formal work experience, I have completed multiple personal projects and hands-on practice in Flutter development. I am eager to contribute my skills to a dynamic team, gain professional experience, and grow as a developer.",
                      softWrap: true,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else { 
          // Desktop
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/images/person_vector.png',
                    height: 460,
                  )
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About Me", style: GoogleFonts.montserrat(
                        fontSize: 48,
                        fontWeight: FontWeight.w700
                      )),
                      const SizedBox(height: 20),
                      Text(
                        "Motivated and enthusiastic junior mobile developer with expertise in Flutter and solid experience using GetX for state management and Hive for local data storage. Skilled in building modern, responsive, and user-friendly mobile interfaces. Although I do not have formal work experience, I have completed multiple personal projects and hands-on practice in Flutter development. I am eager to contribute my skills to a dynamic team, gain professional experience, and grow as a developer.",
                        softWrap: true,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xff71717A)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }
    );
  }
}