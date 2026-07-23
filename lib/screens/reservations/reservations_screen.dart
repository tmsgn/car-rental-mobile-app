import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../mock_data/mock_data.dart';
import '../../models/booking_model.dart';
import '../../widgets/states/empty_state_widget.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_routes.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('My Bookings'),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textTertiary,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingsList(context, mockUpcomingBookings.where((b) => b.status == BookingStatus.pending).toList()),
            _buildBookingsList(context, mockPastBookings),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingsList(BuildContext context, List<Booking> bookings) {
    if (bookings.isEmpty) {
      return EmptyStateWidget(
        icon: LucideIcons.calendar,
        title: 'No bookings found',
        message: 'Your trips will appear here.',
        actionText: 'Find a Car',
        onAction: () => context.go(AppRoutes.home),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        final DateFormat formatter = DateFormat('MMM d, yyyy');
        return InkWell(
          onTap: () => context.push(AppRoutes.reservationDetails, extra: booking),
          child: Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      'Ref: ${booking.bookingReference}',
                      style: AppTypography.textTheme.labelSmall,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: booking.status == BookingStatus.pending 
                            ? AppColors.primaryLight 
                            : AppColors.surfaceElevated,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: Text(
                        booking.status.name.toUpperCase(),
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: booking.status == BookingStatus.pending 
                              ? AppColors.primary 
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      child: Image.network(
                        booking.vehicle.imageUrls.first,
                        width: 80,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking.vehicle.fullName, style: AppTypography.textTheme.titleLarge),
                          const SizedBox(height: AppSpacing.xs),
                          Text('${formatter.format(booking.pickupDate)} - ${formatter.format(booking.returnDate)}', style: AppTypography.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount', style: AppTypography.textTheme.bodyLarge),
                    Text('\$${booking.totalAmount.toStringAsFixed(2)}', style: AppTypography.textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
}
