import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedFilter = 0;
  bool _showOnlyParticipating = false;

  final List<Map<String, dynamic>> _allNotifications = [
    {
      'type': 'pr',
      'title': 'Added support for dark mode',
      'repo': 'flutter/flutter',
      'author': 'flutterdeveloper',
      'time': '2 hours ago',
      'unread': true,
    },
    {
      'type': 'issue',
      'title': 'Fix memory leak in image loader',
      'repo': 'dart-lang/sdk',
      'author': 'dartmaintainer',
      'time': '4 hours ago',
      'unread': true,
    },
    {
      'type': 'mention',
      'title': 'Mentioned you in a comment',
      'repo': 'google/material-design',
      'author': 'designlead',
      'time': '1 day ago',
      'unread': false,
    },
    {
      'type': 'discussion',
      'title': 'Started a new discussion',
      'repo': 'firebase/flutterfire',
      'author': 'firebaseteam',
      'time': '1 day ago',
      'unread': false,
    },
    {
      'type': 'star',
      'title': 'Starred your repository',
      'repo': 'yourusername/awesome-project',
      'author': 'newcontributor',
      'time': '2 days ago',
      'unread': false,
    },
    {
      'type': 'fork',
      'title': 'Forked your repository',
      'repo': 'yourusername/awesome-project',
      'author': 'opensourcelover',
      'time': '3 days ago',
      'unread': false,
    },
    {
      'type': 'release',
      'title': 'New release published',
      'repo': 'flutter/flutter',
      'author': 'flutterteam',
      'time': '3 days ago',
      'unread': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
            tooltip: 'Mark all as read',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
            tooltip: 'Notification settings',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'All'), Tab(text: 'Unread')],
          indicatorColor: const Color(0xFF2F81F7),
          labelColor: const Color(0xFFF0F6FC),
          unselectedLabelColor: const Color(0xFF8B949E),
        ),
      ),
      body: Column(
        children: [
          _buildFilterRow(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNotificationList(_allNotifications),
                _buildNotificationList(
                  _allNotifications.where((n) => n['unread']).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFF161B22),
      child: Row(
        children: [
          PopupMenuButton<int>(
            onSelected: (value) {
              setState(() {
                _selectedFilter = value;
              });
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 0, child: Text('Inbox')),
                  const PopupMenuItem(value: 1, child: Text('Repository')),
                  const PopupMenuItem(value: 2, child: Text('Assignments')),
                  const PopupMenuItem(value: 3, child: Text('Mentions')),
                  const PopupMenuItem(value: 4, child: Text('Team mentions')),
                ],
            child: Row(
              children: [
                Text(
                  _getFilterText(),
                  style: const TextStyle(color: Color(0xFF8B949E)),
                ),
                const Icon(Icons.arrow_drop_down, color: Color(0xFF8B949E)),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _showOnlyParticipating = !_showOnlyParticipating;
              });
            },
            child: Row(
              children: [
                Text(
                  'Participating',
                  style: TextStyle(
                    color:
                        _showOnlyParticipating
                            ? const Color(0xFF2F81F7)
                            : const Color(0xFF8B949E),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  _showOnlyParticipating ? Icons.toggle_on : Icons.toggle_off,
                  color:
                      _showOnlyParticipating
                          ? const Color(0xFF2F81F7)
                          : const Color(0xFF8B949E),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getFilterText() {
    switch (_selectedFilter) {
      case 0:
        return 'Inbox';
      case 1:
        return 'Repository';
      case 2:
        return 'Assignments';
      case 3:
        return 'Mentions';
      case 4:
        return 'Team mentions';
      default:
        return 'Filter';
    }
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              size: 64,
              color: const Color(0xFF8B949E).withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No notifications',
              style: TextStyle(color: Color(0xFF8B949E), fontSize: 18),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationItem(notification);
      },
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    final isUnread = notification['unread'] as bool;
    final iconData = _getIconForType(notification['type']);
    final iconColor = _getColorForType(notification['type']);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF30363D).withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: Stack(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF30363D)),
              ),
              child: Icon(iconData, color: iconColor),
            ),
            if (isUnread)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2F81F7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: notification['author'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF58A6FF),
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: _getActionForType(notification['type']),
                style: const TextStyle(color: Color(0xFF8B949E)),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: notification['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFF0F6FC),
                ),
              ),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Text(
                notification['repo'],
                style: const TextStyle(color: Color(0xFF8B949E)),
              ),
              const SizedBox(width: 8),
              Text(
                notification['time'],
                style: const TextStyle(color: Color(0xFF8B949E), fontSize: 12),
              ),
            ],
          ),
        ),
        trailing:
            isUnread
                ? IconButton(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF8B949E)),
                  onPressed: () {
                    _showNotificationOptions(notification);
                  },
                )
                : null,
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'pr':
        return Icons.call_merge;
      case 'issue':
        return Icons.error_outline;
      case 'mention':
        return Icons.alternate_email;
      case 'discussion':
        return Icons.forum_outlined;
      case 'star':
        return Icons.star_border;
      case 'fork':
        return Icons.call_split;
      case 'release':
        return Icons.new_releases_outlined;
      default:
        return Icons.notifications;
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'pr':
        return const Color(0xFF3FB950);
      case 'issue':
        return const Color(0xFFDB61A2);
      case 'mention':
        return const Color(0xFF58A6FF);
      case 'discussion':
        return const Color(0xFFD29922);
      case 'star':
        return const Color(0xFFD29922);
      case 'fork':
        return const Color(0xFFA371F7);
      case 'release':
        return const Color(0xFF3FB950);
      default:
        return const Color(0xFF58A6FF);
    }
  }

  String _getActionForType(String type) {
    switch (type) {
      case 'pr':
        return 'opened a pull request in';
      case 'issue':
        return 'opened an issue in';
      case 'mention':
        return 'mentioned you in';
      case 'discussion':
        return 'started a discussion in';
      case 'star':
        return 'starred';
      case 'fork':
        return 'forked';
      case 'release':
        return 'published a release for';
      default:
        return 'notified you about';
    }
  }

  void _showNotificationOptions(Map<String, dynamic> notification) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF161B22),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.mark_email_read,
                  color: Color(0xFF8B949E),
                ),
                title: const Text(
                  'Mark as read',
                  style: TextStyle(color: Color(0xFFF0F6FC)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Implement mark as read
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications_off,
                  color: Color(0xFF8B949E),
                ),
                title: const Text(
                  'Mute this thread',
                  style: TextStyle(color: Color(0xFFF0F6FC)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Implement mute
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.unsubscribe,
                  color: Color(0xFF8B949E),
                ),
                title: const Text(
                  'Unsubscribe',
                  style: TextStyle(color: Color(0xFFF0F6FC)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Implement unsubscribe
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy, color: Color(0xFF8B949E)),
                title: const Text(
                  'Copy link',
                  style: TextStyle(color: Color(0xFFF0F6FC)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Implement copy link
                },
              ),
              const Divider(color: Color(0xFF30363D), height: 1),
              ListTile(
                leading: const Icon(Icons.close, color: Color(0xFF8B949E)),
                title: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xFFF0F6FC)),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
