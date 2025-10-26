import 'package:ethio_tunnel/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EthioTunnelApp());
}

class EthioTunnelApp extends StatelessWidget {
  const EthioTunnelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ethio Tunnel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A1931),
        scaffoldBackgroundColor: const Color(0xFF0A1931),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF185ADB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white70,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _launchTelegram() async {
    final Uri url = Uri.parse('https://t.me/your_channel_link'); // Replace with actual link
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.shield,
                size: 100,
                color: Color(0xFF185ADB),
              ),
              const SizedBox(height: 20),
              Text(
                'Ethio Tunnel',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Secure & Fast VPN',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // _launchTelegram(); // This will be used to open the telegram link
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const DashboardPage()),
                  );
                },
                child: const Text('Join Telegram Channel'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const DashboardPage()),
                  );
                },
                child: const Text('Later'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isConnected = false;
  String connectionStatus = 'Disconnected';
  String remainingTime = '02:00:00';

  void _toggleConnection() {
    setState(() {
      isConnected = !isConnected;
      if (isConnected) {
        connectionStatus = 'Connected';
        // Here you would start the countdown timer and VPN service
      } else {
        connectionStatus = 'Disconnected';
        // Here you would stop the countdown timer and VPN service
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ethio Tunnel'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Text(
                  connectionStatus,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: isConnected ? Colors.greenAccent : Colors.white70,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  remainingTime,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            _buildConnectButton(),
            _buildBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectButton() {
    return GestureDetector(
      onTap: _toggleConnection,
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: isConnected
                ? [Colors.red.shade700, Colors.red.shade900]
                : [const Color(0xFF185ADB), Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF185ADB).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            isConnected ? 'DISCONNECT' : 'CONNECT',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info_outline, color: Colors.white70, size: 20),
          const SizedBox(width: 10),
          Text(
            'Watch ads to extend your session!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
