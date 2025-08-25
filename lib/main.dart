// import 'package:flutter/material.dart';

// void main() {
//   runApp(const GitHubApp());
// }

// class GitHubApp extends StatelessWidget {
//   const GitHubApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GitHub Clone',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color(0xFF0D1117),
//         colorScheme: const ColorScheme.dark(
//           primary: Color(0xFF2F81F7),
//           secondary: Color(0xFF8B949E),
//           surface: Color(0xFF161B22),
//         ),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Color(0xFF161B22),
//           elevation: 0,
//           iconTheme: IconThemeData(color: Color(0xFFC9D1D9)),
//           titleTextStyle: TextStyle(
//             color: Color(0xFFF0F6FC),
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         cardTheme: CardTheme(
//           color: const Color(0xFF161B22),
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//             side: BorderSide(color: const Color(0xFF30363D), width: 1),
//           ),
//         ),
//         textTheme: const TextTheme(
//           titleLarge: TextStyle(
//             color: Color(0xFFF0F6FC),
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//           bodyMedium: TextStyle(color: Color(0xFF8B949E), fontSize: 14),
//         ),
//       ),
//       home: const GitHubHomePage(),
//     );
//   }
// }

// class GitHubHomePage extends StatefulWidget {
//   const GitHubHomePage({super.key});

//   @override
//   State<GitHubHomePage> createState() => _GitHubHomePageState();
// }

// class _GitHubHomePageState extends State<GitHubHomePage> {
//   int _selectedIndex = 0;

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text('GitHub'),
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () => _scaffoldKey.currentState?.openDrawer(),
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.search), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.add), onPressed: () {}),
//         ],
//       ),
//       drawer: _buildDrawer(context),
//       body: HomeFeedPage(),
//       bottomNavigationBar: _buildBottomAppBar(),
//     );
//   }

//   Widget _buildDrawer(BuildContext context) {
//     return Drawer(
//       backgroundColor: const Color(0xFF161B22),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: const BoxDecoration(color: Color(0xFF161B22)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const CircleAvatar(
//                   radius: 30,
//                   backgroundImage: NetworkImage(
//                     'https://picsum.photos/200/200?random=1',
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'Mostafa Shebam',
//                   style: TextStyle(
//                     color: Color(0xFFF0F6FC),
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'mustafashibam56@gmail.com',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//           ),
//           _buildDrawerItem(Icons.account_circle, 'Your profile'),
//           _buildDrawerItem(Icons.bookmark_border, 'Your repositories'),
//           _buildDrawerItem(Icons.star_border, 'Your stars'),
//           _buildDrawerItem(Icons.settings, 'Settings'),
//           const Divider(color: Color(0xFF30363D), height: 1),
//           _buildDrawerItem(Icons.list, 'GitHub Docs'),
//           _buildDrawerItem(Icons.help_outline, 'GitHub Community'),
//           _buildDrawerItem(Icons.code, 'Developer API'),
//           const Divider(color: Color(0xFF30363D), height: 1),
//           _buildDrawerItem(Icons.logout, 'Sign out'),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawerItem(IconData icon, String title) {
//     return ListTile(
//       leading: Icon(icon, color: const Color(0xFFC9D1D9)),
//       title: Text(title, style: const TextStyle(color: Color(0xFFC9D1D9))),
//       onTap: () {},
//     );
//   }

//   Widget _buildBottomAppBar() {
//     return BottomAppBar(
//       color: const Color(0xFF161B22),
//       height: 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(Icons.home_filled, 'Home', 0),
//           _buildNavItem(Icons.notifications_none, 'Notifications', 1),
//           _buildNavItem(Icons.explore_outlined, 'Explore', 2),
//           _buildNavItem(Icons.account_circle_outlined, 'Profile', 3),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(IconData icon, String label, int index) {
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color:
//                 _selectedIndex == index
//                     ? const Color(0xFF2F81F7)
//                     : const Color(0xFF8B949E),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 10,
//               color:
//                   _selectedIndex == index
//                       ? const Color(0xFF2F81F7)
//                       : const Color(0xFF8B949E),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeFeedPage extends StatelessWidget {
//   const HomeFeedPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildHeaderSection(),
//           const SizedBox(height: 16),
//           _buildActivityItem(
//             avatar: 'https://avatars.githubusercontent.com/u/1?v=4',
//             username: 'torvalds',
//             repo: 'linux',
//             action: 'pushed to',
//             branch: 'master',
//             time: '2 hours ago',
//             commits: [
//               'Fix memory leak in process allocation',
//               'Update kernel version to 5.15.12',
//             ],
//           ),
//           _buildActivityItem(
//             avatar: 'https://avatars.githubusercontent.com/u/1024025?v=4',
//             username: 'torvalds',
//             repo: 'linux',
//             action: 'opened pull request',
//             prTitle: 'Add support for new ARM architecture',
//             time: '4 hours ago',
//           ),
//           _buildActivityItem(
//             avatar: 'https://avatars.githubusercontent.com/u/810438?v=4',
//             username: 'gaearon',
//             repo: 'react',
//             action: 'starred',
//             time: '6 hours ago',
//           ),
//           _buildActivityItem(
//             avatar: 'https://avatars.githubusercontent.com/u/69631?v=4',
//             username: 'facebook',
//             repo: 'react-native',
//             action: 'released',
//             release: 'v0.68.0',
//             time: '1 day ago',
//           ),
//           _buildActivityItem(
//             avatar: 'https://avatars.githubusercontent.com/u/9919?v=4',
//             username: 'github',
//             repo: 'docs',
//             action: 'created branch',
//             branch: 'feature/new-api',
//             time: '1 day ago',
//           ),
//           _buildActivityItem(
//             avatar: 'https://avatars.githubusercontent.com/u/70142?v=4',
//             username: 'defunkt',
//             repo: 'dotfiles',
//             action: 'forked',
//             time: '2 days ago',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeaderSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Home',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFFF0F6FC),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 36,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF161B22),
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(color: const Color(0xFF30363D)),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.search,
//                         size: 20,
//                         color: Color(0xFF8B949E),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         'Search GitHub',
//                         style: TextStyle(
//                           color: const Color(0xFF8B949E).withOpacity(0.7),
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Container(
//                 height: 36,
//                 width: 36,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF161B22),
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(color: const Color(0xFF30363D)),
//                 ),
//                 child: const Icon(Icons.filter_list, color: Color(0xFF8B949E)),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 _buildChip('For you', isSelected: true),
//                 const SizedBox(width: 8),
//                 _buildChip('Following'),
//                 const SizedBox(width: 8),
//                 _buildChip('Trending'),
//                 const SizedBox(width: 8),
//                 _buildChip('Explore'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChip(String label, {bool isSelected = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFF1F6FEB) : const Color(0xFF161B22),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: isSelected ? const Color(0xFF1F6FEB) : const Color(0xFF30363D),
//         ),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: isSelected ? Colors.white : const Color(0xFFC9D1D9),
//           fontSize: 14,
//         ),
//       ),
//     );
//   }

//   Widget _buildActivityItem({
//     required String avatar,
//     required String username,
//     required String repo,
//     required String action,
//     required String time,
//     String? branch,
//     String? prTitle,
//     String? release,
//     List<String>? commits,
//   }) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatar)),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: username,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFFF0F6FC),
//                             fontSize: 16,
//                           ),
//                         ),
//                         const TextSpan(text: ' '),
//                         TextSpan(
//                           text: action,
//                           style: const TextStyle(
//                             color: Color(0xFF8B949E),
//                             fontSize: 16,
//                           ),
//                         ),
//                         const TextSpan(text: ' '),
//                         TextSpan(
//                           text: repo,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF58A6FF),
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Text(
//                   time,
//                   style: const TextStyle(
//                     color: Color(0xFF8B949E),
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             if (branch != null)
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF161B22),
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(color: const Color(0xFF30363D)),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 12,
//                       height: 12,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.green[400],
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       branch,
//                       style: const TextStyle(
//                         color: Color(0xFF58A6FF),
//                         fontFamily: 'monospace',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             if (prTitle != null)
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF161B22),
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(color: const Color(0xFF30363D)),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.purple[400],
//                       ),
//                       child: const Icon(
//                         Icons.code,
//                         size: 12,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         prTitle,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFFF0F6FC),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             if (release != null)
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF161B22),
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(color: const Color(0xFF30363D)),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.tag, color: Color(0xFFDB61A2)),
//                     const SizedBox(width: 8),
//                     Text(
//                       release,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFFF0F6FC),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             if (commits != null)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   for (var commit in commits)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 12,
//                             height: 12,
//                             margin: const EdgeInsets.only(top: 4),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.green[400],
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               commit,
//                               style: const TextStyle(
//                                 color: Color(0xFF8B949E),
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     _buildReactionButton(Icons.comment_outlined, '12'),
//                     const SizedBox(width: 16),
//                     _buildReactionButton(Icons.repeat, '3'),
//                   ],
//                 ),
//                 _buildReactionButton(Icons.more_horiz, ''),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReactionButton(IconData icon, String count) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: const Color(0xFF8B949E)),
//         if (count.isNotEmpty) ...[
//           const SizedBox(width: 4),
//           Text(
//             count,
//             style: const TextStyle(color: Color(0xFF8B949E), fontSize: 14),
//           ),
//         ],
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:git_hub_pro/constants/colors.dart';
import 'package:git_hub_pro/pages/home_page.dart';

void main() {
  runApp(const GitHubApp());
}

class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.textSecondary),
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        cardTheme: CardTheme(
          color: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(color: AppColors.secondary, fontSize: 14),
        ),
      ),
      home: const GitHubHomePage(),
    );
  }
}
