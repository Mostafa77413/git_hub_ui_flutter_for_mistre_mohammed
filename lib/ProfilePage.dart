import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 465,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: _buildProfileHeader(),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    tabs: const [
                      Tab(text: 'Repositories'),
                      Tab(text: 'Projects'),
                      Tab(text: 'Packages'),
                      Tab(text: 'Stars'),
                    ],
                    isScrollable: true,
                    indicatorColor: const Color(0xFFF78166),
                    labelColor: const Color(0xFFF78166),
                    unselectedLabelColor: const Color(0xFF8B949E),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildRepositoriesTab(),
              _buildProjectsTab(),
              _buildPackagesTab(),
              _buildStarsTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: const Color(0xFF0D1117),
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF30363D), width: 1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://i.pravatar.cc/300',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mostafa',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF0F6FC),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '@Most_67',
                      style: TextStyle(fontSize: 16, color: Color(0xFF8B949E)),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFF30363D)),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              color: Color(0xFFC9D1D9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFF30363D)),
                          ),
                          child: const Icon(
                            Icons.more_horiz,
                            color: Color(0xFFC9D1D9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          const Text(
            'The mascot and brand for GitHub. Lives in San Francisco, CA',
            style: TextStyle(color: Color(0xFFC9D1D9), fontSize: 14),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Color(0xFF8B949E)),
              SizedBox(width: 4),
              Text('Yemen, Sanaa', style: TextStyle(color: Color(0xFF8B949E))),
              SizedBox(width: 16),
              Icon(Icons.link, size: 16, color: Color(0xFF8B949E)),
              SizedBox(width: 4),
              Text(
                'https://github.com/most_67',
                style: TextStyle(color: Color(0xFF58A6FF)),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Repositories', '42'),
              _buildStatItem('Followers', '500.9k'),
              _buildStatItem('Following', '12'),
            ],
          ),
          const SizedBox(height: 16),
          _buildContributionGraph(),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF0F6FC),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF8B949E)),
        ),
      ],
    );
  }

  Widget _buildContributionGraph() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contributions in the last year',
          style: TextStyle(
            color: Color(0xFF8B949E),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFF161B22),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF30363D)),
          ),
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 13,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: 364, // 52 weeks * 7 days - 1
            itemBuilder: (context, index) {
              // Generate random contribution levels for demo
              final level = (index % 5).clamp(0, 4);
              final colors = [
                const Color(0xFF161B22), // No contributions
                const Color(0xFF0E4429), // Low
                const Color(0xFF006D32), // Medium
                const Color(0xFF26A641), // High
                const Color(0xFF39D353), // Very high
              ];
              return Container(
                decoration: BoxDecoration(
                  color: colors[level],
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRepositoriesTab() {
    final List<Map<String, dynamic>> repos = [
      {
        'name': 'mostafa/Spoon-Knife',
        'description': 'This repo is for demonstration purposes only.',
        'language': 'HTML',
        'stars': '1.2k',
        'forks': '2.8k',
        'isPrivate': false,
        'isFork': false,
      },
      {
        'name': 'mostafa/hello-world',
        'description': 'My first repository on GitHub!',
        'language': 'JavaScript',
        'stars': '842',
        'forks': '1.5k',
        'isPrivate': false,
        'isFork': false,
      },
      {
        'name': 'mostafa/mostafa.github.io',
        'description': 'Personal website',
        'language': 'CSS',
        'stars': '245',
        'forks': '120',
        'isPrivate': false,
        'isFork': true,
      },
      {
        'name': 'mostafa/secret-project',
        'description': 'Top secret project',
        'language': 'Dart',
        'stars': '0',
        'forks': '0',
        'isPrivate': true,
        'isFork': false,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return _buildRepositoryItem(repo);
      },
    );
  }

  Widget _buildRepositoryItem(Map<String, dynamic> repo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF30363D).withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                repo['isPrivate'] ? Icons.lock : Icons.book,
                size: 16,
                color: const Color(0xFF8B949E),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  repo['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF58A6FF),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.star_border, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          if (repo['isFork'])
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Forked from another repository',
                style: TextStyle(
                  color: const Color(0xFF8B949E).withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: Text(
              repo['description'] ?? '',
              style: const TextStyle(color: Color(0xFF8B949E)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                if (repo['language'] != null) ...[
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _getLanguageColor(repo['language']),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    repo['language'],
                    style: const TextStyle(
                      color: Color(0xFF8B949E),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                const Icon(Icons.star, size: 14, color: Color(0xFF8B949E)),
                const SizedBox(width: 4),
                Text(
                  repo['stars'],
                  style: const TextStyle(
                    color: Color(0xFF8B949E),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.call_split,
                  size: 14,
                  color: Color(0xFF8B949E),
                ),
                const SizedBox(width: 4),
                Text(
                  repo['forks'],
                  style: const TextStyle(
                    color: Color(0xFF8B949E),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getLanguageColor(String language) {
    switch (language) {
      case 'Dart':
        return const Color(0xFF00B4AB);
      case 'JavaScript':
        return const Color(0xFFF1E05A);
      case 'HTML':
        return const Color(0xFFE34C26);
      case 'CSS':
        return const Color(0xFF563D7C);
      case 'Python':
        return const Color(0xFF3572A5);
      default:
        return const Color(0xFF8B949E);
    }
  }

  Widget _buildProjectsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.work_outline,
            size: 64,
            color: const Color(0xFF8B949E).withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No projects yet',
            style: TextStyle(color: Color(0xFF8B949E), fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'Projects let you organize your work',
            style: TextStyle(color: Color(0xFF8B949E)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF30363D)),
            ),
            child: const Text(
              'New project',
              style: TextStyle(
                color: Color(0xFF58A6FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackagesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64,
            color: const Color(0xFF8B949E).withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No packages yet',
            style: TextStyle(color: Color(0xFF8B949E), fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'Packages help you publish and share code',
            style: TextStyle(color: Color(0xFF8B949E)),
          ),
        ],
      ),
    );
  }

  Widget _buildStarsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border,
            size: 64,
            color: const Color(0xFF8B949E).withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No stars yet',
            style: TextStyle(color: Color(0xFF8B949E), fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'Star repositories to show them here',
            style: TextStyle(color: Color(0xFF8B949E)),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: const Color(0xFF0D1117), child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
