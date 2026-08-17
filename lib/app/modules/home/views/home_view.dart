import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio_ku/app/core/widgets/grain_overlay.dart';
import '../controllers/home_controller.dart';
import 'widgets/custom_app_bar.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/education_section.dart';
import 'sections/tech_stack_section.dart';
import 'sections/certificate_section.dart';
import 'sections/contact_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GrainOverlay(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(controller: controller),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    AboutSection(
                      key: controller.aboutKey,
                      controller: controller,
                    ),
                    TechStackSection(
                      key: controller.techStackKey,
                      controller: controller,
                    ),
                    ProjectsSection(
                      key: controller.projectsKey,
                      controller: controller,
                    ),
                    EducationSection(
                      key: controller.educationKey,
                      controller: controller,
                    ),
                    CertificateSection(
                      key: controller.certificateKey,
                      controller: controller,
                    ),
                    ContactSection(
                      key: controller.contactKey,
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
