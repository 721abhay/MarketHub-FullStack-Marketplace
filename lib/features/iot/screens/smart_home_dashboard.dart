import 'package:flutter/material.dart';
import 'package:markethub/features/iot/services/iot_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/common/widgets/loader.dart';

class SmartHomeDashboard extends StatefulWidget {
  static const String routeName = '/smart-home';
  const SmartHomeDashboard({super.key});

  @override
  State<SmartHomeDashboard> createState() => _SmartHomeDashboardState();
}

class _SmartHomeDashboardState extends State<SmartHomeDashboard> {
  final IoTServices iotServices = IoTServices();
  List<IoTDevice>? iotDevices;

  @override
  void initState() {
    super.initState();
    fetchIoTDevices();
  }

  void fetchIoTDevices() async {
    iotDevices = await iotServices.fetchIoTDevices(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
          title: const Text('Smart Home'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildEnvironmentBanner(),
            const SizedBox(height: 32),
            iotDevices == null
                ? const Loader()
                : _buildDeviceGrid(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }

  Widget _buildEnvironmentBanner() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white10)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _EnvItem(Icons.thermostat, '22°C', 'Indoor'),
          _EnvItem(Icons.water_drop, '45%', 'Humidity'),
          _EnvItem(Icons.air, 'Clean', 'Air Quality'),
        ],
      ),
    );
  }

  Widget _buildDeviceGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1),
      itemCount: iotDevices!.length,
      itemBuilder: (context, index) {
        final device = iotDevices![index];
        IconData deviceIcon = Icons.devices;
        Color deviceColor = Colors.blueAccent;

        // Simple mapping for demo
        if (device.name.contains('Light')) {
          deviceIcon = Icons.lightbulb;
          deviceColor = Colors.amber;
        } else if (device.name.contains('Thermostat')) {
          deviceIcon = Icons.thermostat;
          deviceColor = Colors.orange;
        } else if (device.name.contains('Hub')) {
          deviceIcon = Icons.router;
          deviceColor = Colors.blue;
        }

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(deviceIcon, color: deviceColor),
              const Spacer(),
              Text(device.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(device.status,
                      style: TextStyle(
                          color: deviceColor.withValues(alpha: 0.8),
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                  Text(device.battery,
                      style: const TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EnvItem extends StatelessWidget {
  final IconData icon;
  final String val;
  final String label;
  const _EnvItem(this.icon, this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(icon, color: Colors.blueAccent, size: 28),
      const SizedBox(height: 12),
      Text(val,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11))
    ]);
  }
}

