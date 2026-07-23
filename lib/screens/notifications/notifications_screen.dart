import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../widgets/states/empty_state_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate mock notifications
    final notifications = [
      _NotificationItem(
        title: 'Booking Confirmed',
        message: 'Your booking for Tesla Model S is confirmed for tomorrow.',
        time: '2 hours ago',
        icon: LucideIcons.checkCircle,
        color: AppColors.success,
        isUnread: true,
      ),
      _NotificationItem(
        title: 'Exclusive Offer',
        message: 'Get 20% off your next weekend trip! Use code WEEKEND20.',
        time: 'Yesterday',
        icon: LucideIcons.tag,
        color: AppColors.primary,
        isUnread: true,
      ),
      _NotificationItem(
        title: 'Trip Completed',
        message: 'How was your trip with the BMW X5? Leave a review now.',
        time: '3 days ago',
        icon: LucideIcons.star,
        color: AppColors.warning,
        isUnread: false,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.checkCheck),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All notifications marked as read')),
              );
            },
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const EmptyStateWidget(
              icon: LucideIcons.bell,
              title: 'No Notifications',
              message: 'You\'re all caught up! Check back later for updates.',
            )
          : ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = notifications[index];
                return _buildNotificationTile(item);
              },
            ),
    );
  }

  Widget _buildNotificationTile(_NotificationItem item) {
    return Container(
      color: item.isUnread ? AppColors.primary.withOpacity(0.05) : AppColors.surface,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.color, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title,
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        fontWeight: item.isUnread ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                    Text(
                      item.time,
                      style: AppTypography.textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  item.message,
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: item.isUnread ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
  final bool isUnread;

  _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
    required this.isUnread,
  });
}
