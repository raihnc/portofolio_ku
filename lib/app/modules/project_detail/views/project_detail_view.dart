import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/values/app_values.dart';
import '../../home/views/widgets/neo_brutalism_card.dart';
import '../../home/views/widgets/neo_brutalism_button.dart';
import '../controllers/project_detail_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.cardBg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.primary),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Detail Project',
          style: TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(height: 3, color: AppTheme.border),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeoBrutalismCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: isMobile ? 200 : 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.border,
                        width: AppValues.borderWidth,
                      ),
                    ),
                    child: Image.asset(
                      controller.project.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 200.ms)
                      .scale(begin: Offset(0.95, 0.95), end: Offset(1, 1)),
                  const SizedBox(height: 24),
                  Text(
                    controller.project.name,
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primary,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 300.ms)
                      .slideX(begin: -0.2, end: 0),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.secondary,
                      border: Border.all(color: AppTheme.border, width: 2),
                    ),
                    child: Text(
                      controller.project.category,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 400.ms)
                      .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1)),
                  const SizedBox(height: 24),
                  Text(
                    controller.project.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textPrimary,
                      height: 1.6,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 500.ms)
                      .slideX(begin: -0.2, end: 0),
                  const SizedBox(height: 32),
                  Text(
                    'TEKNOLOGI YANG DIGUNAKAN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                      letterSpacing: 1.5,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 600.ms)
                      .slideX(begin: -0.2, end: 0),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: controller.project.techStack
                        .asMap()
                        .entries
                        .map((entry) {
                      final index = entry.key;
                      final tech = entry.value;
                      return _TechBadge(tech: tech, index: index);
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  isMobile ? _buildMobileButtons() : _buildDesktopButtons(),
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NeoBrutalismButton(
          text: 'Lihat Demo (APK/AAB)',
          icon: Icons.download,
          onPressed: controller.launchDemo,
          backgroundColor: AppTheme.secondary,
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 700.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        NeoBrutalismButton(
          text: 'Lihat Source Code',
          icon: Icons.code,
          onPressed: controller.launchCode,
          backgroundColor: AppTheme.cardBg,
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 800.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }

  Widget _buildDesktopButtons() {
    return Row(
      children: [
        Expanded(
          child: NeoBrutalismButton(
            text: 'Lihat Demo (APK/AAB)',
            icon: Icons.download,
            onPressed: controller.launchDemo,
            backgroundColor: AppTheme.secondary,
          )
              .animate()
              .fadeIn(duration: 400.ms, delay: 700.ms)
              .slideY(begin: 0.2, end: 0),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: NeoBrutalismButton(
            text: 'Lihat Source Code',
            icon: Icons.code,
            onPressed: controller.launchCode,
            backgroundColor: AppTheme.cardBg,
          )
              .animate()
              .fadeIn(duration: 400.ms, delay: 800.ms)
              .slideY(begin: 0.2, end: 0),
        ),
      ],
    );
  }
}

class _TechBadge extends StatefulWidget {
  final String tech;
  final int index;

  const _TechBadge({
    required this.tech,
    required this.index,
  });

  @override
  State<_TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<_TechBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppTheme.accent,
          border: Border.all(
            color: AppTheme.border,
            width: AppValues.borderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.border,
              offset: Offset(
                _isHovered ? 5 : 3,
                _isHovered ? 5 : 3,
              ),
            ),
          ],
        ),
        child: Text(
          widget.tech,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.primary,
          ),
        ),
      )
          .animate()
          .fadeIn(duration: 300.ms, delay: (650 + widget.index * 50).ms)
          .scale(
            begin: Offset(0.8, 0.8),
            end: Offset(1, 1),
            duration: 300.ms,
            delay: (650 + widget.index * 50).ms,
          )
          .then()
          .animate(target: _isHovered ? 1 : 0)
          .scale(
            begin: Offset(1, 1),
            end: Offset(1.05, 1.05),
            duration: 200.ms,
          ),
    );
  }
}
