import 'package:flutter/material.dart';
import 'package:git_hub_pro/constants/colors.dart';
import 'package:git_hub_pro/widgets/app_drawer.dart';
import 'package:git_hub_pro/widgets/bottom_nav_bar.dart';
import 'package:git_hub_pro/widgets/home_feed.dart';

class GitHubHomePage extends StatefulWidget {
  const GitHubHomePage({super.key});

  @override
  State<GitHubHomePage> createState() => _GitHubHomePageState();
}

class _GitHubHomePageState extends State<GitHubHomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('GitHub'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      drawer: const AppDrawer(),
      body: const HomeFeed(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
