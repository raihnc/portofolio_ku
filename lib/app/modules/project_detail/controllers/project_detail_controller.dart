import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/project_model.dart';

class ProjectDetailController extends GetxController {
  late ProjectModel project;

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments as ProjectModel;
  }

  Future<void> launchDemo() async {
    final uri = Uri.parse(project.demoUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> launchCode() async {
    final uri = Uri.parse(project.codeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
