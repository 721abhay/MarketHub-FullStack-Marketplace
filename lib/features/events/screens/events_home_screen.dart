import 'package:markethub/features/events/screens/event_detail_screen.dart';
import 'package:markethub/features/social/services/social_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/common/widgets/loader.dart';
import 'package:flutter/material.dart';

class EventsHomeScreen extends StatefulWidget {
  static const String routeName = '/events-home';
  const EventsHomeScreen({super.key});

  @override
  State<EventsHomeScreen> createState() => _EventsHomeScreenState();
}

class _EventsHomeScreenState extends State<EventsHomeScreen> {
  final SocialServices socialServices = SocialServices();
  List<EventModel>? trendingEvents;

  @override
  void initState() {
    super.initState();
    fetchTrendingEvents();
  }

  void fetchTrendingEvents() async {
    trendingEvents = await socialServices.fetchTrendingEvents(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Movies & Events'),
          backgroundColor: const Color(0xFFF43F5E),
          foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBox(),
            const SizedBox(height: 32),
            const Text('Trending Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            trendingEvents == null
                ? const Loader()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: trendingEvents!.length,
                    itemBuilder: (context, index) {
                      final event = trendingEvents![index];
                      return _buildEventCard(context, event);
                    },
                  ),
            const SizedBox(height: 32),
            const Text('Popular Movies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildMovieScroll(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(16)),
      child: const TextField(
          decoration: InputDecoration(
              hintText: 'Search for Movies, Plays, Sports...',
              prefixIcon: Icon(Icons.search, color: Color(0xFFF43F5E)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16))),
    );
  }

  Widget _buildEventCard(BuildContext context, EventModel event) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, EventDetailScreen.routeName,
          arguments: {'title': event.name, 'image': event.imageUrl}),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(event.imageUrl,
                    height: 200, width: double.infinity, fit: BoxFit.cover)),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(24))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${event.date} • ${event.location}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 13))
                        ]),
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, EventDetailScreen.routeName,
                          arguments: {
                            'title': event.name,
                            'image': event.imageUrl
                          }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF43F5E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text('Book')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieScroll() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
              width: 150,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1440404696488-dc49436bb7fc?auto=format&fit=crop&q=80&w=200'),
                      fit: BoxFit.cover)));
        },
      ),
    );
  }
}

