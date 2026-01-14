import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:amazon_clone/features/account/screens/your_orders_screen.dart';
import 'package:amazon_clone/features/ai_chat/screens/ai_chat_screen.dart';
import 'package:amazon_clone/features/seller/screens/seller_payout_screen.dart';
import 'package:amazon_clone/features/account/screens/addresses_screen.dart';
import 'package:amazon_clone/features/account/screens/notifications_screen.dart';
import 'package:amazon_clone/features/account/screens/wallet_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/account/screens/wishlist_screen.dart';
import 'package:amazon_clone/features/account/screens/edit_profile_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/help_center_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/add_review_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/product_reviews_screen.dart'; // Added
import 'package:amazon_clone/features/order_details/screens/return_request_screen.dart'; // Added
import 'package:amazon_clone/features/order_details/screens/return_status_screen.dart'; // Added
import 'package:amazon_clone/features/search/screens/filter_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/features/seller/screens/add_product_screen.dart';
import 'package:amazon_clone/features/seller/screens/seller_analytics_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/seller_orders_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/seller_order_detail_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/shipment_manifest_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/coupons_manager_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/inventory_report_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/campaign_manager_screen.dart'; // Added
import 'package:amazon_clone/features/social/screens/community_feed_screen.dart';
import 'package:amazon_clone/features/social/screens/post_detail_screen.dart';
import 'package:amazon_clone/features/social/screens/create_post_screen.dart';
import 'package:amazon_clone/features/account/screens/loyalty_points_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/referral_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/safety_center_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/coupons_screen.dart'; // Added
import 'package:amazon_clone/features/content/screens/blog_screen.dart'; // Added
import 'package:amazon_clone/features/content/screens/blog_post_screen.dart'; // Added
import 'package:amazon_clone/features/content/screens/legal/terms_conditions_screen.dart'; // Added
import 'package:amazon_clone/features/content/screens/legal/privacy_policy_screen.dart'; // Added
import 'package:amazon_clone/features/content/screens/about_us_screen.dart'; // Added
import 'package:amazon_clone/features/social/screens/community_profile_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/live_support_chat_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/faq_topic_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/feedback_screen.dart'; // Added
import 'package:amazon_clone/features/gamification/screens/daily_check_in_screen.dart'; // Added
import 'package:amazon_clone/features/gamification/screens/spin_wheel_screen.dart'; // Added
import 'package:amazon_clone/features/gamification/screens/leaderboard_screen.dart'; // Added
import 'package:amazon_clone/features/gamification/screens/quiz_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/price_alert_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/compare_products_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/augmented_reality_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/grocery_home_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/slot_booking_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/grocery_category_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/order_tracking_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/fresh_order_details_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/milk_subscription_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/recipe_catalog_screen.dart'; // Added
import 'package:amazon_clone/features/grocery/screens/recipe_details_screen.dart'; // Added
import 'package:amazon_clone/features/health/screens/pharmacy_home_screen.dart'; // Added
import 'package:amazon_clone/features/health/screens/prescription_upload_screen.dart'; // Added
import 'package:amazon_clone/features/health/screens/medication_reminder_screen.dart'; // Added
import 'package:amazon_clone/features/health/screens/doctor_consultation_screen.dart'; // Added
import 'package:amazon_clone/features/health/screens/consultation_chat_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/business_home_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/bulk_rfq_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/tax_invoice_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/staff_management_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/gst_verification_screen.dart'; // Added
import 'package:amazon_clone/features/luxury/screens/luxury_home_screen.dart'; // Added
import 'package:amazon_clone/features/luxury/screens/designer_lookbook_screen.dart'; // Added
import 'package:amazon_clone/features/luxury/screens/virtual_storefront_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/support_bot_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/dispute_resolution_screen.dart'; // Added
import 'package:amazon_clone/features/finance/screens/gift_cards_screen.dart'; // Added
import 'package:amazon_clone/features/finance/screens/redeem_gift_card_screen.dart'; // Added
import 'package:amazon_clone/features/charity/screens/charity_donation_screen.dart'; // Added
import 'package:amazon_clone/features/corporate/screens/sustainability_report_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/impact_tracker_screen.dart'; // Added
import 'package:amazon_clone/features/travel/screens/travel_home_screen.dart';
import 'package:amazon_clone/features/travel/screens/seat_selection_screen.dart'; // Added // Added
import 'package:amazon_clone/features/travel/screens/flight_search_screen.dart'; // Added
import 'package:amazon_clone/features/travel/screens/hotel_booking_screen.dart'; // Added
import 'package:amazon_clone/features/travel/screens/bus_ticket_screen.dart'; // Added
import 'package:amazon_clone/features/travel/screens/my_bookings_screen.dart'; // Added
import 'package:amazon_clone/features/entertainment/screens/video_home_screen.dart'; // Added
import 'package:amazon_clone/features/entertainment/screens/video_player_screen.dart'; // Added
import 'package:amazon_clone/features/entertainment/screens/music_player_screen.dart'; // Added
import 'package:amazon_clone/features/entertainment/screens/game_pass_screen.dart'; // Added
import 'package:amazon_clone/features/entertainment/screens/cloud_gaming_portal.dart'; // Added
import 'package:amazon_clone/features/info/screens/news_feed_screen.dart'; // Added
import 'package:amazon_clone/features/info/screens/weather_screen.dart'; // Added
import 'package:amazon_clone/features/finance/screens/finance_home_screen.dart';
import 'package:amazon_clone/features/finance/screens/stock_tracker_screen.dart'; // Added
import 'package:amazon_clone/features/finance/screens/crypto_vault_screen.dart'; // Added
import 'package:amazon_clone/features/finance/screens/insurance_screen.dart'; // Added
import 'package:amazon_clone/features/finance/screens/file_claim_screen.dart'; // Added
import 'package:amazon_clone/features/services/screens/home_services_screen.dart'; // Added
import 'package:amazon_clone/features/services/screens/service_booking_screen.dart'; // Added
import 'package:amazon_clone/features/learning/screens/learning_home_screen.dart'; // Added
import 'package:amazon_clone/features/learning/screens/course_catalog_screen.dart'; // Added
import 'package:amazon_clone/features/learning/screens/lesson_player_screen.dart'; // Added
import 'package:amazon_clone/features/learning/screens/quiz_assessment_screen.dart'; // Added
import 'package:amazon_clone/features/learning/screens/my_certificates_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/events_home_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/event_details_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/venue_map_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/my_tickets_screen.dart'; // Added
import 'package:amazon_clone/features/iot/screens/smart_home_dashboard.dart'; // Added
import 'package:amazon_clone/features/iot/screens/device_pairing_screen.dart'; // Added
import 'package:amazon_clone/features/iot/screens/automation_routine_screen.dart'; // Added
import 'package:amazon_clone/features/iot/screens/energy_usage_report.dart'; // Added
import 'package:amazon_clone/features/iot/screens/security_camera_feed.dart'; // Added
import 'package:amazon_clone/features/iot/screens/smart_lock_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/property_home_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/property_search_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/virtual_tour_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/mortgage_calculator_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/agent_contact_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/jobs_home_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/job_search_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/resume_builder_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/application_status_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/interview_scheduler_screen.dart'; // Added
import 'package:amazon_clone/features/social/screens/social_groups_screen.dart'; // Added
import 'package:amazon_clone/features/social/screens/community_calendar_screen.dart'; // Added
import 'package:amazon_clone/features/social/screens/inbox_screen.dart'; // Added
import 'package:amazon_clone/features/social/screens/group_chat_screen.dart'; // Added
import 'package:amazon_clone/features/services/screens/expert_consultation_screen.dart'; // Added
import 'package:amazon_clone/features/wellness/screens/mental_health_home_screen.dart'; // Added
import 'package:amazon_clone/features/wellness/screens/meditation_session_screen.dart'; // Added
import 'package:amazon_clone/features/wellness/screens/sleep_tracker_screen.dart'; // Added
import 'package:amazon_clone/features/wellness/screens/fitness_challenge_screen.dart'; // Added
import 'package:amazon_clone/features/wellness/screens/nutrition_planner_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/fleet_management_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/warehouse_map_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/supplier_bidding_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/business_compliance_screen.dart'; // Added
import 'package:amazon_clone/features/business/screens/audit_log_screen.dart'; // Added
import 'package:amazon_clone/features/hub/screens/main_hub_dashboard.dart'; // Added
import 'package:amazon_clone/features/hub/screens/vertical_switcher_screen.dart'; // Added
import 'package:amazon_clone/features/hub/screens/global_search_hub_screen.dart'; // Added
import 'package:amazon_clone/features/hub/screens/rewards_catalog_screen.dart'; // Added
import 'package:amazon_clone/features/hub/screens/partner_program_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/job_detail_screen.dart'; // Added
import 'package:amazon_clone/features/jobs/screens/apply_job_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/property_detail_screen.dart'; // Added
import 'package:amazon_clone/features/real_estate/screens/schedule_tour_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/event_detail_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/ticket_selection_screen.dart'; // Added
import 'package:amazon_clone/features/events/screens/booking_confirmation_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/merchant_onboarding_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/verification_center_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/privacy_dashboard_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/theme_selector_screen.dart'; // Added
import 'package:amazon_clone/features/account/screens/settings_screen.dart';
import 'package:amazon_clone/features/hub/screens/milestone_celebration_screen.dart'; // Added
import 'package:amazon_clone/features/hub/screens/qr_scanner_screen.dart';
import 'package:amazon_clone/features/cart/screens/order_success_screen.dart';
import 'package:amazon_clone/features/seller/screens/seller_storefront_screen.dart';
import 'package:amazon_clone/features/search/screens/visual_search_screen.dart';
import 'package:amazon_clone/features/home/screens/deals_screen.dart';
import 'package:amazon_clone/features/home/screens/buying_guide_screen.dart';
import 'package:amazon_clone/features/hub/screens/plus_subscription_screen.dart';
import 'package:amazon_clone/features/fashion/screens/fashion_home_screen.dart';
import 'package:amazon_clone/features/mobiles/screens/mobile_home_screen.dart';
import 'package:amazon_clone/features/appliances/screens/appliance_home_screen.dart';
import 'package:amazon_clone/features/books/screens/book_home_screen.dart';
import 'package:amazon_clone/features/shopping_list/screens/shopping_list_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/features/hub/screens/universal_ai_search_screen.dart'; // Added
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case DealsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DealsScreen(),
      );
    case QRScannerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const QRScannerScreen(),
      );
    case OrderSuccessScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrderSuccessScreen(),
      );
    case SellerStorefrontScreen.routeName:
      var sellerName = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SellerStorefrontScreen(sellerName: sellerName),
      );
    case VisualSearchScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VisualSearchScreen(),
      );
    case BuyingGuideScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BuyingGuideScreen(category: category),
      );
    case MarketHubPlusScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MarketHubPlusScreen(),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case GroceryCategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => GroceryCategoryScreen(category: category),
      );
    case SlotBookingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SlotBookingScreen(),
      );
    case JobDetailScreen.routeName:
      var job = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => JobDetailScreen(job: job),
      );
    case ApplyJobScreen.routeName:
      var job = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ApplyJobScreen(job: job),
      );
    case PropertyDetailScreen.routeName:
      var property = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PropertyDetailScreen(property: property),
      );
    case ScheduleTourScreen.routeName:
      var property = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ScheduleTourScreen(property: property),
      );
    case EventDetailScreen.routeName:
      var event = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EventDetailScreen(event: event),
      );
    case TicketSelectionScreen.routeName:
      var event = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TicketSelectionScreen(event: event),
      );
    case BookingConfirmationScreen.routeName:
      var bookingData = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BookingConfirmationScreen(bookingData: bookingData),
      );
    case DoctorConsultationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DoctorConsultationScreen(),
      );
    case ConsultationChatScreen.routeName:
      var doctorName = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ConsultationChatScreen(doctorName: doctorName),
      );
    case UniversalAISearchScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UniversalAISearchScreen(),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    case YourOrdersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const YourOrdersScreen(),
      );
    case AddressesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddressesScreen(),
      );
    case NotificationsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationsScreen(),
      );
    case AIChatScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AIChatScreen(),
      );
    case WalletScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WalletScreen(),
      );
    case SellerPayoutScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SellerPayoutScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case FashionHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FashionHomeScreen(),
      );
    case MobileHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MobileHomeScreen(),
      );
    case ApplianceHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ApplianceHomeScreen(),
      );
    case BookHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BookHomeScreen(),
      );
    case ShoppingListScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ShoppingListScreen(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case WishlistScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WishlistScreen(),
      );
    case EditProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EditProfileScreen(),
      );
    case HelpCenterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HelpCenterScreen(),
      );
    case AddReviewScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddReviewScreen(product: product),
      );
    case ProductReviewsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductReviewsScreen(product: product),
      );
    case ReturnRequestScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ReturnRequestScreen(order: order),
      );
    case ReturnStatusScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ReturnStatusScreen(),
      );
    case FilterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FilterScreen(),
      );
    case SellerAnalyticsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SellerAnalyticsScreen(),
      );
    case InventoryReportScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InventoryReportScreen(),
      );
    case CampaignManagerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CampaignManagerScreen(),
      );
    case CommunityFeedScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CommunityFeedScreen(),
      );
    case PostDetailScreen.routeName:
      var post = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PostDetailScreen(post: post),
      );
    case CreatePostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CreatePostScreen(),
      );
    case LoyaltyPointsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoyaltyPointsScreen(),
      );
    case ReferralScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ReferralScreen(),
      );
    case SafetyCenterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SafetyCenterScreen(),
      );
    case CouponsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CouponsScreen(),
      );
    case BlogScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BlogScreen(),
      );
    case BlogPostScreen.routeName:
      var post = routeSettings.arguments as Map<String, String>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlogPostScreen(post: post),
      );
     case TermsConditionsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TermsConditionsScreen(),
      );
    case PrivacyPolicyScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PrivacyPolicyScreen(),
      );
    case SellerOrdersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SellerOrdersScreen(),
      );
    case SellerOrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SellerOrderDetailScreen(order: order),
      );
    case ShipmentManifestScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ShipmentManifestScreen(order: order),
      );
    case CouponsManagerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CouponsManagerScreen(),
      );
    case AboutUsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AboutUsScreen(),
      );
    case CommunityProfileScreen.routeName:
      var username = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CommunityProfileScreen(username: username),
      );
    case LiveSupportChatScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LiveSupportChatScreen(),
      );
    case FAQTopicScreen.routeName:
      var topic = routeSettings.arguments as Map<String, String>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FAQTopicScreen(topic: topic),
      );
    case FeedbackScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FeedbackScreen(),
      );
    case DailyCheckInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DailyCheckInScreen(),
      );
    case SpinWheelScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SpinWheelScreen(),
      );
    case LeaderboardScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LeaderboardScreen(),
      );
    case QuizScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const QuizScreen(),
      );
    case PriceAlertScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PriceAlertScreen(product: product),
      );
    case CompareProductsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CompareProductsScreen(product1: product),
      );
    case AugmentedRealityScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AugmentedRealityScreen(product: product),
      );
    case GroceryHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GroceryHomeScreen(),
      );

    case OrderTrackingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrderTrackingScreen(),
      );
    case FreshOrderDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FreshOrderDetailsScreen(),
      );
    case MilkSubscriptionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MilkSubscriptionScreen(),
      );
    case RecipeCatalogScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RecipeCatalogScreen(),
      );
    case RecipeDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RecipeDetailsScreen(),
      );
    case PharmacyHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PharmacyHomeScreen(),
      );
    case PrescriptionUploadScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PrescriptionUploadScreen(),
      );
    case MedicationReminderScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MedicationReminderScreen(),
      );
    case BusinessHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BusinessHomeScreen(),
      );
    case BulkRFQScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BulkRFQScreen(),
      );
    case TaxInvoiceScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TaxInvoiceScreen(),
      );
    case StaffManagementScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const StaffManagementScreen(),
      );
    case GSTVerificationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GSTVerificationScreen(),
      );
    case LuxuryBoutiqueHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LuxuryBoutiqueHomeScreen(),
      );
    case DesignerLookbookScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DesignerLookbookScreen(),
      );
    case VirtualStorefrontScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VirtualStorefrontScreen(),
      );
    case SupportBotScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SupportBotScreen(),
      );
    case DisputeResolutionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DisputeResolutionScreen(),
      );
    case GiftCardsHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GiftCardsHomeScreen(),
      );
    case GiftCardRedeemScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GiftCardRedeemScreen(),
      );
    case CharityDonationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CharityDonationScreen(),
      );
    case SustainabilityReportScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SustainabilityReportScreen(),
      );
    case EnvironmentalImpactTracker.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EnvironmentalImpactTracker(),
      );
    case TravelHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TravelHomeScreen(),
      );
    case FlightSearchScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FlightSearchScreen(),
      );
    case HotelBookingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HotelBookingScreen(),
      );
    case BusTicketScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BusTicketScreen(),
      );
    case MyBookingsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyBookingsScreen(),
      );
    case PrimeVideoHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PrimeVideoHomeScreen(),
      );
    case VideoPlayerScreen.routeName:
      var title = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => VideoPlayerScreen(title: title),
      );
    case MusicPlayerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MusicPlayerScreen(),
      );
    case GamePassScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GamePassScreen(),
      );
    case CloudGamingPortal.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CloudGamingPortal(),
      );
    case NewsFeedScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NewsFeedScreen(),
      );
    case WeatherSpecializedScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WeatherSpecializedScreen(),
      );
    case StockTrackerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const StockTrackerScreen(),
      );
    case CryptoVaultScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CryptoVaultScreen(),
      );
    case SeatSelectionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SeatSelectionScreen(),
      );
    case InsuranceCenterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InsuranceCenterScreen(),
      );
    case FileClaimScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FileClaimScreen(),
      );
    case ServiceProfessionalScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ServiceProfessionalScreen(),
      );
    case ServiceBookingScreen.routeName:
      var profName = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ServiceBookingScreen(professionalName: profName),
      );
    case LearningHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LearningHomeScreen(),
      );
    case CourseCatalogScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CourseCatalogScreen(),
      );
    case LessonPlayerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LessonPlayerScreen(),
      );
    case QuizAssessmentScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const QuizAssessmentScreen(),
      );
    case MyCertificatesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyCertificatesScreen(),
      );
    case EventsHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EventsHomeScreen(),
      );
    case EventDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EventDetailsScreen(),
      );
    case VenueMapScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VenueMapScreen(),
      );
    case MyTicketsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyTicketsScreen(),
      );
    case SmartHomeDashboard.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SmartHomeDashboard(),
      );
    case DevicePairingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DevicePairingScreen(),
      );
    case AutomationRoutineScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AutomationRoutineScreen(),
      );
    case EnergyUsageReport.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EnergyUsageReport(),
      );
    case SecurityCameraFeed.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SecurityCameraFeed(),
      );
    case SmartDoorLockControl.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SmartDoorLockControl(),
      );
    case RealEstateHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RealEstateHomeScreen(),
      );
    case PropertySearchScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PropertySearchScreen(),
      );
    case VirtualTourScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VirtualTourScreen(),
      );
    case MortgageCalculator.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MortgageCalculator(),
      );
    case AgentContactScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AgentContactScreen(),
      );
    case JobBoardHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const JobBoardHomeScreen(),
      );
    case JobSearchScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const JobSearchScreen(),
      );
    case ResumeBuilderScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ResumeBuilderScreen(),
      );
    case ApplicationStatusScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ApplicationStatusScreen(),
      );
    case InterviewScheduler.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InterviewScheduler(),
      );
    case SocialGroupsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SocialGroupsScreen(),
      );
    case EventsCalendarScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EventsCalendarScreen(),
      );
    case MessagingInboxScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MessagingInboxScreen(),
      );
    case GroupChatScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GroupChatScreen(),
      );
    case ExpertConsultationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ExpertConsultationScreen(),
      );
    case MentalHealthHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MentalHealthHomeScreen(),
      );
    case MeditationSessionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MeditationSessionScreen(),
      );
    case SleepTrackerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SleepTrackerScreen(),
      );
    case FitnessChallengeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FitnessChallengeScreen(),
      );
    case NutritionalPlannerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NutritionalPlannerScreen(),
      );
    case FleetManagementScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FleetManagementScreen(),
      );
    case WarehouseMapScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WarehouseMapScreen(),
      );
    case SupplierBiddingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SupplierBiddingScreen(),
      );
    case BusinessLicenseUpload.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BusinessLicenseUpload(),
      );
    case EnterpriseAuditLog.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EnterpriseAuditLog(),
      );
    case MainHubDashboard.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainHubDashboard(),
      );
    case VerticalSwitcherScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VerticalSwitcherScreen(),
      );
    case GlobalSearchHub.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GlobalSearchHub(),
      );
    case RewardsCatalogScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RewardsCatalogScreen(),
      );
    case PartnerProgramScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PartnerProgramScreen(),
      );
    case MerchantOnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MerchantOnboardingScreen(),
      );
    case VerificationCenterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VerificationCenterScreen(),
      );
    case DataPrivacyDashboard.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DataPrivacyDashboard(),
      );
    case CustomThemeSelector.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CustomThemeSelector(),
      );
    case GeneralSettingsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GeneralSettingsScreen(),
      );
    case FinanceHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FinanceHomeScreen(),
      );
    case FinalMilestoneScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FinalMilestoneScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
