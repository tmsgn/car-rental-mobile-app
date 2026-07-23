import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../models/vehicle_model.dart';
import '../../models/review_model.dart';
import '../../mock_data/mock_data.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/states/empty_state_widget.dart';

class ReviewsScreen extends StatelessWidget {
  final Vehicle vehicle;

  const ReviewsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    // Generate mock reviews for this vehicle based on mockCurrentUser and some dummies
    final reviews = [
      Review(
        id: 'r1',
        vehicleId: vehicle.id,
        userName: mockCurrentUser.fullName,
        userProfileImageUrl: mockCurrentUser.profileImageUrl,
        rating: 5.0,
        comment: 'Absolutely fantastic car! Very clean and runs perfectly. The owner was very responsive and easy to coordinate with. Highly recommend!',
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Review(
        id: 'r2',
        vehicleId: vehicle.id,
        userName: 'Alex Johnson',
        userProfileImageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=200',
        rating: 4.5,
        comment: 'Great experience overall. The car was exactly as described. Only minor issue was finding the pickup location, but the host helped me right away.',
        date: DateTime.now().subtract(const Duration(days: 12)),
      ),
      Review(
        id: 'r3',
        vehicleId: vehicle.id,
        userName: 'Sarah Connor',
        userProfileImageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=200',
        rating: 5.0,
        comment: 'Beautiful vehicle. Drives like a dream. Will definitely rent again when I am in town.',
        date: DateTime.now().subtract(const Duration(days: 20)),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: reviews.isEmpty
          ? EmptyStateWidget(
              icon: LucideIcons.messageSquare,
              title: 'No Reviews Yet',
              message: 'Be the first to review this ${vehicle.brand} ${vehicle.model}!',
            )
          : Column(
              children: [
                _buildReviewSummary(reviews),
                const Divider(),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(AppSpacing.pagePadding),
                    itemCount: reviews.length,
                    separatorBuilder: (context, index) => const Divider(height: AppSpacing.xxl),
                    itemBuilder: (context, index) {
                      return _buildReviewItem(reviews[index]);
                    },
                  ),
                ),
                _buildBottomBar(context),
              ],
            ),
    );
  }

  Widget _buildReviewSummary(List<Review> reviews) {
    final avgRating = reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;
    
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      child: Row(
        children: [
          Text(
            avgRating.toStringAsFixed(1),
            style: AppTypography.textTheme.displayMedium,
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < avgRating.floor() ? LucideIcons.star : LucideIcons.starHalf,
                    color: AppColors.warning,
                    size: 20,
                  );
                }),
              ),
              const SizedBox(height: 4),
              Text('Based on ${reviews.length} reviews', style: AppTypography.textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Review review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(review.userProfileImageUrl),
              radius: 20,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.userName, style: AppTypography.textTheme.titleMedium),
                  Text(
                    '${review.date.day}/${review.date.month}/${review.date.year}',
                    style: AppTypography.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.star, size: 14, color: AppColors.warning),
                  const SizedBox(width: 4),
                  Text(
                    review.rating.toStringAsFixed(1),
                    style: AppTypography.textTheme.labelMedium?.copyWith(color: AppColors.warning),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(review.comment, style: AppTypography.textTheme.bodyLarge),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: PrimaryButton(
        text: 'Write a Review',
        onPressed: () {
          // In a real app, open a modal to write a review
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Review editor coming soon')),
          );
        },
        icon: LucideIcons.edit3,
      ),
    );
  }
}
