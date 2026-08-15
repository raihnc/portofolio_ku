import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/education_model.dart';
import '../../../data/models/tech_stack_model.dart';
import '../../../data/models/certificate_model.dart';
import '../../../data/repositories/portfolio_repository.dart';

class HomeController extends GetxController {
  final PortfolioRepository _repository = PortfolioRepository();
  final ScrollController scrollController = ScrollController();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey techStackKey = GlobalKey();
  final GlobalKey certificateKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  late List<ProjectModel> projects;
  late List<EducationModel> education;
  late List<TechStackModel> techStack;
  late List<CertificateModel> certificates;
  late Map<String, String> contactInfo;
  late Map<String, String> aboutMe;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    projects = _repository.getProjects();
    education = _repository.getEducation();
    techStack = _repository.getTechStack();
    certificates = _repository.getCertificates();
    contactInfo = _repository.getContactInfo();
    aboutMe = _repository.getAboutMe();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  List<TechStackModel> getTechByCategory(String category) {
    return techStack.where((tech) => tech.category == category).toList();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
