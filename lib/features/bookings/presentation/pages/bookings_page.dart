import 'package:flutter/material.dart';
import 'package:venuze_app/core/widgets/app_top_bar.dart';
import 'package:venuze_app/features/bookings/presentation/widgets/bookings_empty_state.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(notificationCount: 3, onNotificationTap: () {}),
      body: BookingsEmptyState(onSignIn: () {}),
    );
  }
}
