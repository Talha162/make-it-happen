import 'package:flutter/material.dart';

import 'event_detail_view.dart';

class EventBookingConfirmView extends StatelessWidget {
  const EventBookingConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventDetailView(mode: EventDetailMode.available);
  }
}
