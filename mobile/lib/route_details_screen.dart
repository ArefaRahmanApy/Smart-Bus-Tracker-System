import 'package:flutter/material.dart';

class RouteDetailsScreen extends StatelessWidget {
  const RouteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Route Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Route - 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'BUBT Campus - Mirpur 14',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              _buildStopItem('BUBT Campus', isFirst: true, isCurrent: true),
              _buildStopItem('Shyamoli'),
              _buildStopItem('Asad Gate'),
              _buildStopItem('Shewrapara'),
              _buildStopItem('Mirpur-10'),
              _buildStopItem('Mirpur-14', isLast: true),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/map'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A3E5D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('View Map'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStopItem(String name, {bool isFirst = false, bool isLast = false, bool isCurrent = false}) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 2,
              height: 20,
              color: isFirst ? Colors.transparent : Colors.green,
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: isCurrent ? Colors.green : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2),
              ),
            ),
            Container(
              width: 2,
              height: 20,
              color: isLast ? Colors.transparent : Colors.green,
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
            if (isFirst) const Text('Start', style: TextStyle(color: Colors.grey, fontSize: 12)),
            if (isLast) const Text('Destination', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
