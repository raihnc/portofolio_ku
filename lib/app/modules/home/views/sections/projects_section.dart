import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../../../../routes/app_pages.dart';
import '../widgets/neo_brutalism_card.dart';
import '../widgets/neo_brutalism_button.dart';
import '../../controllers/home_controller.dart';

class ProjectsSection extends StatelessWidget {
  final HomeController controller;

  const ProjectsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;
    final isTablet =
        size.width >= AppValues.mobileBreakpoint &&
        size.width < AppValues.tabletBreakpoint;

    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROJECT SAYA',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.w800,
              color: AppTheme.primary,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.85,
            ),
            itemCount: controller.projects.length,
            itemBuilder: (context, index) {
              final project = controller.projects[index];
              return _ProjectCard(
                project: project,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final project;
  final int index;

  const _ProjectCard({
    required this.project,
    required this.index,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: NeoBrutalismCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.border,
                  width: AppValues.borderWidth,
                ),
              ),
              child: Image.asset(
                widget.project.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.project.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.project.description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.textSecondary,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: NeoBrutalismButton(
                text: 'Lihat Detail',
                onPressed: () => Get.toNamed(
                  Routes.PROJECT_DETAIL,
                  arguments: widget.project,
                ),
                backgroundColor: Color(0xFF00FFFF),
                icon: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 600.ms, delay: (100 * widget.index).ms)
          .slideY(
            begin: 0.3,
            end: 0,
            duration: 600.ms,
            delay: (100 * widget.index).ms,
          )
          .then()
          .animate(
            target: _isHovered ? 1 : 0,
          )
          .moveY(
            begin: 0,
            end: -8,
            duration: 200.ms,
            curve: Curves.easeOut,
          ),
    );
  }
}
