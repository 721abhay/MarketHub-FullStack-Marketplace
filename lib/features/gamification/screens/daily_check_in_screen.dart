import 'package:markethub/features/gamification/services/gamification_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/common/widgets/loader.dart';
import 'package:flutter/material.dart';

class DailyCheckInScreen extends StatefulWidget {
  static const String routeName = '/daily-check-in';
  const DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  final List<int> _rewards = [10, 20, 10, 50, 20, 10, 100]; // 7 days rewards
  final int _currentDay = 2; // Mock current day
  bool _claimedToday = false;
  final GamificationServices gamificationServices = GamificationServices();
  List<UserBadge>? badges;

  @override
  void initState() {
    super.initState();
    fetchBadges();
  }

  void fetchBadges() async {
    badges = await gamificationServices.fetchBadges(context: context);
    setState(() {});
  }

  void claimReward() {
    setState(() {
      _claimedToday = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You claimed ${_rewards[_currentDay]} Coins!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Daily Check-In',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Check in every day to earn Coins!',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 32),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: 7,
              itemBuilder: (context, index) {
                return _buildDayCard(index);
              },
            ),
            const SizedBox(height: 32),
            _buildClaimCard(),
            const SizedBox(height: 48),
            _buildBadgesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildClaimCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Day ${_currentDay + 1} Reward',
            style: const TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '+${_rewards[_currentDay]}',
            style: const TextStyle(
                fontSize: 48, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          const Text(
            'Coins',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _claimedToday ? null : claimReward,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              _claimedToday ? 'Come Back Tomorrow' : 'Claim Now',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Badges',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        badges == null
            ? const Loader()
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: badges!.length,
                itemBuilder: (context, index) {
                  final badge = badges![index];
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.05),
                            shape: BoxShape.circle,
                          ),
                          child:
                              Image.network(badge.iconUrl, fit: BoxFit.contain),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        badge.name,
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
      ],
    );
  }

  Widget _buildDayCard(int index) {
    bool isPast = index < _currentDay;
    bool isToday = index == _currentDay;

    return Container(
      decoration: BoxDecoration(
        color: isToday
            ? Colors.amber
            : (isPast ? Colors.green : Colors.white.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(16),
        border: isToday ? Border.all(color: Colors.white, width: 2) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Day ${index + 1}',
            style: TextStyle(
              color: isToday ? Colors.black87 : Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            isPast ? Icons.check_circle_rounded : Icons.monetization_on_rounded,
            color:
                isPast ? Colors.white : (isToday ? Colors.white : Colors.amber),
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            '+${_rewards[index]}',
            style: TextStyle(
              color: isToday ? Colors.black87 : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

