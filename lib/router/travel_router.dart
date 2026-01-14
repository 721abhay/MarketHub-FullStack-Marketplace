import 'package:markethub/features/travel/screens/bus_ticket_screen.dart';
import 'package:markethub/features/travel/screens/train_ticket_screen.dart';
import 'package:markethub/features/travel/screens/flight_search_screen.dart';
import 'package:markethub/features/travel/screens/hotel_booking_screen.dart';
import 'package:markethub/features/travel/screens/my_bookings_screen.dart';
import 'package:markethub/features/travel/screens/seat_selection_screen.dart';
import 'package:markethub/features/travel/screens/travel_home_screen.dart';
import 'package:flutter/material.dart';

class TravelRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TravelHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TravelHomeScreen());
      case FlightSearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FlightSearchScreen());
      case SeatSelectionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SeatSelectionScreen());
      case HotelBookingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HotelBookingScreen());
      case BusTicketScreen.routeName:
        return MaterialPageRoute(builder: (_) => const BusTicketScreen());
      case TrainTicketScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TrainTicketScreen());
      case MyBookingsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MyBookingsScreen());
      default:
        return null;
    }
  }
}
