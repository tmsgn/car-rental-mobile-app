import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../core/routes/app_routes.dart';
import '../../mock_data/mock_data.dart';
import '../../models/branch_model.dart';

class BranchListScreen extends StatelessWidget {
  const BranchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Our Locations')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        itemCount: mockBranches.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.lg),
        itemBuilder: (context, index) {
          final branch = mockBranches[index];
          return _buildBranchCard(context, branch);
        },
      ),
    );
  }

  Widget _buildBranchCard(BuildContext context, Branch branch) {
    return InkWell(
      onTap: () => context.push(AppRoutes.branchDetail, extra: branch),
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg)),
              child: Image.network(
                branch.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(branch.name, style: AppTypography.textTheme.titleLarge)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: branch.isOpen ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                        ),
                        child: Text(
                          branch.isOpen ? 'Open' : 'Closed',
                          style: AppTypography.textTheme.labelSmall?.copyWith(
                            color: branch.isOpen ? AppColors.success : AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const Icon(LucideIcons.mapPin, size: 16, color: AppColors.textTertiary),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(child: Text(branch.address, style: AppTypography.textTheme.bodyMedium)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const Icon(LucideIcons.car, size: 16, color: AppColors.textTertiary),
                      const SizedBox(width: AppSpacing.xs),
                      Text('${branch.availableVehicles} vehicles available', style: AppTypography.textTheme.bodyMedium),
                      const Spacer(),
                      const Icon(Icons.star, size: 16, color: AppColors.warning),
                      const SizedBox(width: 4),
                      Text(branch.rating.toString(), style: AppTypography.textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
