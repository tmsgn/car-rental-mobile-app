import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../core/routes/app_routes.dart';
import '../../models/vehicle_model.dart';
import '../../widgets/buttons/app_buttons.dart';

class BookingSuccessScreen extends StatelessWidget {
  final Vehicle vehicle;

  const BookingSuccessScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.xxl),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.checkCircle,
                  size: 80,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                'Booking Confirmed!',
                style: AppTypography.textTheme.displayMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'You are all set for your trip in the ${vehicle.fullName}. We have sent the itinerary to your email.',
                style: AppTypography.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),
              
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Text('Reference Number', style: AppTypography.textTheme.bodyMedium),
                    const SizedBox(height: AppSpacing.xs),
                    Text('BKG-847291', style: AppTypography.textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
                  ],
                ),
              ),
              
              const SizedBox(height: AppSpacing.xxxl),
              PrimaryButton(
                text: 'View Itinerary',
                onPressed: () {
                  context.go(AppRoutes.home); // Assuming trips tab logic is handled
                },
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                text: 'Back to Home',
                onPressed: () => context.go(AppRoutes.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
