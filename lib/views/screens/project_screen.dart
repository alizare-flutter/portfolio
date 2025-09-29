import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/project.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key});
  final List<Project> projects = [
    Project(title: "Clinic App", description: "A comprehensive Flutter desktop application for clinic management, featuring patient records, appointment scheduling, financial tracking, and service management. Built with modern Flutter architecture using GetX for state management and Hive for local data storage.", image: "assets/images/clinic_app_cover.png", link: "https://github.com/alizare-flutter/clinic_app"),

  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              children: [
                Text("My Projects", style: GoogleFonts.sora(
                  fontSize: 28,
                  fontWeight: FontWeight.w700
                )),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final Project project = projects[index];
                    return ProjectCard(project: project, isReversed: index.isEven);
                  },
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
            child: Column(
              children: [
                Text("My Projects", style: GoogleFonts.sora(
                  fontSize: 48,
                  fontWeight: FontWeight.w700
                )),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final Project project = projects[index];
                      return ProjectCard(project: project, isReversed: index.isEven);
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.isReversed = false});
  final Project project;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProjectImage(image: project.image),
                SizedBox(height: 28),
                ProjectInfo(title: project.title, description: project.description, link: project.link)
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: isReversed 
              ? [
                  Flexible(child: ProjectInfo(title: project.title, description: project.description, link: project.link)),
                  SizedBox(width: 50),
                  Flexible(child: ProjectImage(image: project.image)),
                ] 
              : [
                  Flexible(child: ProjectImage(image: project.image)),
                  SizedBox(width: 50),
                  Flexible(child: ProjectInfo(title: project.title, description: project.description, link: project.link)),
                ],
            ),
          );
        }
      },
    );
  }
}


class ProjectImage extends StatelessWidget {
  const ProjectImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
            ),
          );
        }
        double imageWidth = MediaQuery.sizeOf(context).width * 0.39;
        return SizedBox(
          width: imageWidth,
          child: AspectRatio(
            aspectRatio: 16 / 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({
    super.key,
    required this.title,
    required this.description,
    required this.link,
  });
  final String title;
  final String description;
  final String link;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.sora(
                fontSize: 20,
                fontWeight: FontWeight.w700
              )),
              const SizedBox(height: 20),
              Text(description, style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w400
              )),
              IconButton(
                onPressed: () async {
                  await launchUrl(Uri.parse(link));
                },
                icon: const Icon(FontAwesomeIcons.upRightFromSquare),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.sora(
              fontSize: 32,
              fontWeight: FontWeight.w600
            )),
            Text(description, style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w400
            )),
            IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse(link));
              }, 
              icon: const Icon(FontAwesomeIcons.arrowUpRightFromSquare),
            ),
          ],
        );
      },
    );
  }
}