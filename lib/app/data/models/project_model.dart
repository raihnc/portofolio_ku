class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String demoUrl;
  final String codeUrl;
  final String category;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    required this.demoUrl,
    required this.codeUrl,
    required this.category,
  });
}
