import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../models/booking_model.dart';
import '../../widgets/buttons/app_buttons.dart';

class ReservationDetailsScreen extends StatelessWidget {
  final Booking booking;

  const ReservationDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Reservation Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusHeader(),
            const SizedBox(height: AppSpacing.xxl),
            _buildVehicleInfo(),
            const SizedBox(height: AppSpacing.xxl),
            _buildTimeline(),
            const SizedBox(height: AppSpacing.xxl),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Column(
        children: [
          Text('Booking Reference', style: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.primary)),
          const SizedBox(height: 4),
          Text(booking.bookingReference, style: AppTypography.textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildVehicleInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          child: Image.network(
            booking.vehicle.imageUrls.first,
            width: 100,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(booking.vehicle.fullName, style: AppTypography.textTheme.titleLarge),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(LucideIcons.mapPin, size: 14, color: AppColors.textTertiary),
                  const SizedBox(width: 4),
                  Expanded(child: Text(booking.pickupLocation, style: AppTypography.textTheme.bodyMedium)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rental Timeline', style: AppTypography.textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.md),
        _buildTimelineItem('Pickup', 'Aug 12, 10:00 AM', isCompleted: true),
        _buildTimelineItem('Vehicle Inspection', 'Completed by Host', isCompleted: true),
        _buildTimelineItem('Trip Active', 'Enjoy your ride!', isCompleted: false, isCurrent: true),
        _buildTimelineItem('Return', 'Aug 15, 10:00 AM', isCompleted: false, isLast: true),
      ],
    );
  }

  Widget _buildTimelineItem(String title, String subtitle, {bool isCompleted = false, bool isCurrent = false, bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted || isCurrent ? AppColors.primary : AppColors.surface,
                border: Border.all(color: isCompleted || isCurrent ? AppColors.primary : AppColors.border, width: 2),
                shape: BoxShape.circle,
              ),
              child: isCompleted ? const Icon(LucideIcons.check, size: 14, color: Colors.white) : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? AppColors.primary : AppColors.border,
              ),
          ],
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.textTheme.titleMedium?.copyWith(color: isCurrent ? AppColors.primary : AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTypography.textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: 'View Rental Agreement',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Downloading Rental Agreement...')));
          },
          icon: LucideIcons.fileText,
          isFullWidth: true,
        ),
        const SizedBox(height: AppSpacing.md),
        SecondaryButton(
          text: 'Report an Issue',
          onPressed: () {},
          icon: LucideIcons.alertCircle,
        ),
      ],
    );
  }
}
