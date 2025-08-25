import 'package:flutter/material.dart';
import 'package:git_hub_pro/constants/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.surface),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200/200?random=1',
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Mostafa Shebam',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'mustafashibam56@gmail.com',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          _DrawerItem(icon: Icons.account_circle, title: 'Your profile'),
          _DrawerItem(icon: Icons.bookmark_border, title: 'Your repositories'),
          _DrawerItem(icon: Icons.star_border, title: 'Your stars'),
          _DrawerItem(icon: Icons.settings, title: 'Settings'),
          const Divider(color: AppColors.border, height: 1),
          _DrawerItem(icon: Icons.list, title: 'GitHub Docs'),
          _DrawerItem(icon: Icons.help_outline, title: 'GitHub Community'),
          _DrawerItem(icon: Icons.code, title: 'Developer API'),
          const Divider(color: AppColors.border, height: 1),
          _DrawerItem(icon: Icons.logout, title: 'Sign out'),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _DrawerItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      onTap: () {},
    );
  }
}
