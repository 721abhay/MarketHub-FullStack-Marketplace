import 'package:markethub/features/events/screens/event_detail_screen.dart';
import 'package:markethub/features/events/screens/events_home_screen.dart';
import 'package:markethub/features/events/screens/ticket_selection_screen.dart';
import 'package:markethub/features/events/screens/booking_confirmation_screen.dart';
import 'package:markethub/features/events/screens/my_tickets_screen.dart';
import 'package:markethub/features/events/screens/venue_map_screen.dart';
import 'package:flutter/material.dart';

class EventsRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EventsHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const EventsHomeScreen());
      case EventDetailScreen.routeName:
        var event = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => EventDetailScreen(event: event));
      case TicketSelectionScreen.routeName:
        var event = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => TicketSelectionScreen(event: event));
      case BookingConfirmationScreen.routeName:
        var bookingData = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BookingConfirmationScreen(bookingData: bookingData),
        );
      case MyTicketsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MyTicketsScreen());
      case VenueMapScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VenueMapScreen());
      default:
        return null;
    }
  }
}
