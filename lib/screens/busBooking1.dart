import 'package:flutter/material.dart';

class BusSelectionScreen extends StatefulWidget {
  const BusSelectionScreen({super.key});

  @override
  _BusSelectionScreenState createState() => _BusSelectionScreenState();
}

class _BusSelectionScreenState extends State<BusSelectionScreen> {
  List<Map<String, dynamic>> buses = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadBusData(); // Directly load static bus data
  }

  // Method to load static bus data
  void loadBusData() {
    setState(() {
      buses = [
        {
          'Bus_Name': 'Express Bus',
          'Ticket_Price': '200',
          'Total_Seats': '50',
          'Route_Number': 'R1',
          'Start_Location': 'Station A',
          'End_Location': 'Station B',
          'Start_Time': '08:00 AM',
        },
        {
          'Bus_Name': 'City Bus',
          'Ticket_Price': '150',
          'Total_Seats': '30',
          'Route_Number': 'R2',
          'Start_Location': 'Station B',
          'End_Location': 'Station C',
          'Start_Time': '09:00 AM',
        },
        {
          'Bus_Name': 'Night Bus',
          'Ticket_Price': '250',
          'Total_Seats': '40',
          'Route_Number': 'R3',
          'Start_Location': 'Station C',
          'End_Location': 'Station D',
          'Start_Time': '10:00 PM',
        },
      ];
      isLoading = false; // Stop the loading indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Bus Selection'),
      //   backgroundColor: Colors.orange,
      //   centerTitle: true,
      // ),
      body: isLoading
          ? Center(child: _buildLoadingIndicator())
          : ListView.builder(
              itemCount: buses.length,
              itemBuilder: (context, index) {
                return BusCard(bus: buses[index]);
              },
            ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      width: 60,
      height: 60,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  final Map<String, dynamic> bus;

  const BusCard({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 8, // Shadow for depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.directions_bus,
                    color: Colors.orange, size: 30),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    bus['Bus_Name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  'Rs. ${bus['Ticket_Price']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Seats', '${bus['Total_Seats']}'),
            _buildInfoRow('Route', bus['Route_Number']),
            _buildInfoRow('Start', bus['Start_Location']),
            _buildInfoRow('End', bus['End_Location']),
            _buildInfoRow('Time', bus['Start_Time']),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement booking functionality here
                // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
