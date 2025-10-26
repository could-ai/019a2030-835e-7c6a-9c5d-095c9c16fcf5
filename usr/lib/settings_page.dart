import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'VPN Configuration'),
          _buildSettingsCard(
            child: ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Server/Configuration'),
              subtitle: const Text('Select a server'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to server selection page
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Account'),
          _buildSettingsCard(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.sync),
                  title: const Text('Reconnect'),
                  onTap: () {
                    // Add reconnect logic
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.timer_off),
                  title: const Text('Reset Timer'),
                  onTap: () {
                    // Add reset timer logic
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.ad_units),
                  title: const Text('Check Ad Status'),
                  onTap: () {
                    // Navigate to ad status page or show a dialog
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildSettingsCard({required Widget child}) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
