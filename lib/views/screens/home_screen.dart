import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_me_screen.dart';
import 'contact_me_screen.dart';
import 'project_screen.dart';
import 'skills_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Ali Asghar Zare",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Theme.of(context).appBarTheme.foregroundColor),
                  ),
                  Spacer(),
                  DrawerButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              );
            }
            else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Ali Asghar Zare",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppBarMenu(
                    aboutKey: aboutKey,
                    skillsKey: skillsKey,
                    projectKey: projectKey,
                    contactKey: contactKey,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Resume"),
                    icon: const Icon(Icons.file_download_outlined),
                  ),
                ],
              );
            }
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          spacing: 10,
          children: [
            Container(
              color: Colors.black,
              child: SizedBox(
                height: 100,
                child: Center(child: Text("Ali Asghar Zare", style: TextStyle(color: Colors.white),)),
              ),
            ),
            AppBarMenu(aboutKey: aboutKey, skillsKey: skillsKey, projectKey: projectKey, contactKey: contactKey),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: aboutKey,
              child: const AboutMeScreen(),
            ),
            Container(
              key: skillsKey,
              color: Colors.black,
              child: SkillsScreen(),
            ),
            Container(
              key: projectKey,
              child: ProjectScreen(),
            ),
            Container(
              key: contactKey,
              color: Colors.black,
              child: const ContactMeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({
    super.key,
    required this.aboutKey,
    required this.skillsKey,
    required this.projectKey,
    required this.contactKey,
  });

  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text("About Me"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    skillsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text("Skills"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    projectKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text("Project"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Scrollable.ensureVisible(
                    contactKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text("Contact Me"),
              ),
            ],
          );
        }
        else {
        return Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                
              },
              child: const Text("About Me"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  skillsKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text("Skills"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  projectKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text("Project"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Scrollable.ensureVisible(
                  contactKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text("Contact Me"),
            ),
          ],
        );
        }
      }
    );
  }
}
