import 'package:flutter/material.dart';
import '../tabs/homepage_tab.dart';
import '../tabs/library_tab.dart';
import '../tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final _pages = const [HomeTab(), LibraryTab(), ProfileTab()];

  String get _title {
    switch (_index) {
      case 0:
        return "Dashboard";
      case 1:
        return "Library";
      case 2:
        return "Profile";
      default:
        return "Dashboard";
    }
  }

  void _goTo(int i) {
    Navigator.pop(context); // tutup drawer
    setState(() => _index = i);
  }

  void _logout() {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: const Color(0xFF1E88E5),
      ),

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E88E5), Color(0xFF42A5F5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LMS Prasmul",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Navigation Menu",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text("Dashboard"),
                selected: _index == 0,
                onTap: () => _goTo(0),
              ),
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Library"),
                selected: _index == 1,
                onTap: () => _goTo(1),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                selected: _index == 2,
                onTap: () => _goTo(2),
              ),

              const Spacer(),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: _logout,
              ),
            ],
          ),
        ),
      ),

      body: _pages[_index],
    );
  }
}
