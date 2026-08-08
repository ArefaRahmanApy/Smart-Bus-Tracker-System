import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Notifications', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildNotificationItem(
            Icons.directions_bus,
            'Bus is Arriving',
            'Bus is arriving at your stop',
            '5 mins ago',
          ),
          _buildNotificationItem(
            Icons.warning_amber_rounded,
            'Delay Alerts',
            'Route-2 delay 10min',
            '10 mins ago',
          ),
          _buildNotificationItem(
            Icons.location_on,
            'Route Update',
            'A new stop added',
            '45 mins ago',
          ),
          _buildNotificationItem(
            Icons.traffic,
            'Traffic Alerts',
            'Heavy traffic at Mirpur',
            '2 hours ago',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(IconData icon, String title, String description, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF1A3E5D)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(description, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}
