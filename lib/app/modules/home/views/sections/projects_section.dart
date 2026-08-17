import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
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

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppValues.paddingLarge
            : AppValues.paddingXXLarge,
        vertical: AppValues.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROJECT SAYA',
            style: GoogleFonts.ebGaramond(
              fontSize: isMobile ? 28 : 48,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 24),
          ...List.generate(controller.projects.length, (index) {
            final project = controller.projects[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _ProjectCard(
                project: project,
                index: index,
                isMobile: isMobile,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final dynamic project;
  final int index;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
    required this.index,
    required this.isMobile,
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
      child:
          NeoBrutalismCard(
                child: widget.isMobile
                    ? _buildVerticalLayout()
                    : _buildHorizontalLayout(),
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
              .animate(target: _isHovered ? 1 : 0)
              .moveY(
                begin: 0,
                end: -4,
                duration: 200.ms,
                curve: Curves.easeOut,
              ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Container(
          width: 220,
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.border,
              width: AppValues.borderWidth,
            ),
          ),
          child: Image.asset(widget.project.imageUrl, fit: BoxFit.cover),
        ),
        const SizedBox(width: 20),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Category
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.project.name,
                      style: GoogleFonts.ebGaramond(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.secondary,
                      border: Border.all(
                        color: AppTheme.border,
                        width: AppValues.borderWidth,
                      ),
                    ),
                    child: Text(
                      widget.project.category,
                      style: GoogleFonts.spaceMono(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                widget.project.description,
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // Tech Stack
              Text(
                'TECH STACK',
                style: GoogleFonts.spaceMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.techStack.map<Widget>((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.cardBg,
                      border: Border.all(
                        color: AppTheme.border,
                        width: AppValues.borderWidth,
                      ),
                    ),
                    child: Text(
                      tech.toLowerCase(),
                      style: GoogleFonts.spaceMono(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: NeoBrutalismButton(
                      text: 'Lihat Demo',
                      onPressed: () async {
                        final uri = Uri.parse(widget.project.demoUrl);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      backgroundColor: AppTheme.secondary,
                      textColor: AppTheme.primary,
                      icon: Icons.download,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: NeoBrutalismButton(
                      text: 'Lihat Source Code',
                      onPressed: () async {
                        final uri = Uri.parse(widget.project.codeUrl);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      backgroundColor: AppTheme.cardBg,
                      textColor: AppTheme.textPrimary,
                      icon: Icons.code,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Container(
          height: 160,
          width: double.infinity,
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
        const SizedBox(height: 12),
        // Title + Category
        Row(
          children: [
            Expanded(
              child: Text(
                widget.project.name,
                style: GoogleFonts.ebGaramond(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.secondary,
                border: Border.all(
                  color: AppTheme.border,
                  width: AppValues.borderWidth,
                ),
              ),
              child: Text(
                widget.project.category,
                style: GoogleFonts.spaceMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          widget.project.description,
          style: GoogleFonts.spaceMono(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        // Tech Stack
        Text(
          'TECH STACK',
          style: GoogleFonts.spaceMono(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: widget.project.techStack.map<Widget>((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.cardBg,
                border: Border.all(
                  color: AppTheme.border,
                  width: AppValues.borderWidth,
                ),
              ),
              child: Text(
                tech.toLowerCase(),
                style: GoogleFonts.spaceMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        // Buttons
        Row(
          children: [
            Expanded(
              child: NeoBrutalismButton(
                text: 'Lihat Demo',
                onPressed: () async {
                  final uri = Uri.parse(widget.project.demoUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                backgroundColor: AppTheme.secondary,
                textColor: AppTheme.primary,
                icon: Icons.download,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NeoBrutalismButton(
                text: 'Lihat Source Code',
                onPressed: () async {
                  final uri = Uri.parse(widget.project.codeUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                backgroundColor: AppTheme.cardBg,
                textColor: AppTheme.textPrimary,
                icon: Icons.code,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
