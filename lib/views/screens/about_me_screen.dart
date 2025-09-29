import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});
  final String aboutMe = "Flutter Developer with experience in designing and implementing cross-platform applications (mobile, desktop, and web) and creating beautiful, user-friendly interfaces. Proficient in writing clean, scalable code and passionate about solving complex problems with creative and efficient solutions. Always eager to learn new technologies and contribute to challenging projects that deliver impactful user experiences.";

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
                SvgPicture.asset(
                  'assets/images/person_vector.svg',
                  height: 400,
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: GoogleFonts.sora(
                          fontSize: 28,
                          letterSpacing: -0.02 * 28,
                        ),
                        children: [
                          TextSpan(
                            text: "Hello I’am ",
                            style: GoogleFonts.sora(),
                          ),
                          TextSpan(
                            text: "Ali Asghar Zare.\n",
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: "Flutter ",
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: "Developer.",
                            style: GoogleFonts.sora(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      aboutMe,
                      softWrap: true,
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        color: Color(0xff71717A),
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
                  child: SvgPicture.asset(
                    'assets/images/person_vector.svg',
                    height: 460,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: GoogleFonts.sora(
                            fontSize: 48,
                            letterSpacing: -0.02 * 48,
                          ),
                          children: [
                            TextSpan(
                              text: "Hello I’am ",
                              style: GoogleFonts.sora(),
                            ),
                            TextSpan(
                              text: "Ali Asghar Zare.\n",
                              style: GoogleFonts.sora(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: "Flutter ",
                              style: GoogleFonts.sora(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: "Developer.",
                              style: GoogleFonts.sora(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        aboutMe,
                        softWrap: true,
                        style: GoogleFonts.sora(
                          fontSize: 16,
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