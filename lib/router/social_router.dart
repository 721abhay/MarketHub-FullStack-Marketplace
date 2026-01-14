import 'package:markethub/features/social/screens/community_calendar_screen.dart';
import 'package:markethub/features/social/screens/community_feed_screen.dart';
import 'package:markethub/features/social/screens/community_profile_screen.dart';
import 'package:markethub/features/social/screens/create_post_screen.dart';
import 'package:markethub/features/social/screens/group_chat_screen.dart';
import 'package:markethub/features/social/screens/inbox_screen.dart';
import 'package:markethub/features/social/screens/post_detail_screen.dart';
import 'package:markethub/features/social/screens/social_groups_screen.dart';
import 'package:flutter/material.dart';

class SocialRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CommunityFeedScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CommunityFeedScreen());
      case PostDetailScreen.routeName:
        var post = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => PostDetailScreen(post: post));
      case CreatePostScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CreatePostScreen());
      case MessagingInboxScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MessagingInboxScreen());
      case GroupChatScreen.routeName:
        return MaterialPageRoute(builder: (_) => const GroupChatScreen());
      case SocialGroupsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SocialGroupsScreen());
      case CommunityProfileScreen.routeName:
        var username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CommunityProfileScreen(username: username),
        );
      case EventsCalendarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const EventsCalendarScreen());
      default:
        return null;
    }
  }
}
