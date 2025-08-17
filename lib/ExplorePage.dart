import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Explore'),
            floating: true,
            snap: true,
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(child: _buildSearchSection()),
          SliverToBoxAdapter(child: _buildCategoriesSection()),
          SliverToBoxAdapter(
            child: _buildSectionHeader('Trending repositories', 'See all'),
          ),
          _buildTrendingReposList(),
          SliverToBoxAdapter(
            child: _buildSectionHeader('Popular topics', 'See all'),
          ),
          _buildTopicsList(),
          SliverToBoxAdapter(
            child: _buildSectionHeader('Trending developers', 'See all'),
          ),
          _buildDevelopersList(),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF30363D)),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF8B949E)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Search GitHub',
                style: TextStyle(
                  color: const Color(0xFF8B949E).withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildCategoryItem(Icons.star, 'Repositories'),
          _buildCategoryItem(Icons.people, 'Developers'),
          _buildCategoryItem(Icons.local_fire_department, 'Trending'),
          _buildCategoryItem(Icons.collections_bookmark, 'Collections'),
          _buildCategoryItem(Icons.event, 'Events'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: const Color(0xFF58A6FF)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFC9D1D9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF0F6FC),
            ),
          ),
          Text(
            action,
            style: const TextStyle(
              color: Color(0xFF58A6FF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingReposList() {
    final List<Map<String, dynamic>> trendingRepos = [
      {
        'name': 'flutter/flutter',
        'description': 'Google UI toolkit for building natively compiled apps',
        'language': 'Dart',
        'languageColor': const Color(0xFF00B4AB),
        'stars': '146k',
        'forks': '23.8k',
      },
      {
        'name': 'facebook/react',
        'description':
            'A declarative, efficient, and flexible JavaScript library',
        'language': 'JavaScript',
        'languageColor': const Color(0xFFF1E05A),
        'stars': '208k',
        'forks': '43.5k',
      },
      {
        'name': 'tensorflow/tensorflow',
        'description': 'An Open Source Machine Learning Framework for Everyone',
        'language': 'Python',
        'languageColor': const Color(0xFF3572A5),
        'stars': '174k',
        'forks': '88.1k',
      },
      {
        'name': 'torvalds/linux',
        'description': 'Linux kernel source tree',
        'language': 'C',
        'languageColor': const Color(0xFF555555),
        'stars': '154k',
        'forks': '49.3k',
      },
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final repo = trendingRepos[index];
        return _buildRepoCard(repo);
      }, childCount: trendingRepos.length),
    );
  }

  Widget _buildRepoCard(Map<String, dynamic> repo) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.book_outlined, color: Color(0xFF8B949E)),
                const SizedBox(width: 8),
                Text(
                  repo['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF58A6FF),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.star_border, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              repo['description'],
              style: const TextStyle(color: Color(0xFF8B949E)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: repo['languageColor'],
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  repo['language'],
                  style: const TextStyle(color: Color(0xFF8B949E)),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.star, size: 16, color: Color(0xFF8B949E)),
                const SizedBox(width: 4),
                Text(
                  repo['stars'],
                  style: const TextStyle(color: Color(0xFF8B949E)),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.call_split,
                  size: 16,
                  color: Color(0xFF8B949E),
                ),
                const SizedBox(width: 4),
                Text(
                  repo['forks'],
                  style: const TextStyle(color: Color(0xFF8B949E)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicsList() {
    final List<String> topics = [
      'javascript',
      'python',
      'java',
      'typescript',
      'csharp',
      'php',
      'c++',
      'c',
      'go',
      'rust',
      'kotlin',
      'dart',
      'swift',
      'ruby',
      'scala',
      'elixir',
      'clojure',
      'haskell',
      'erlang',
    ];

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children:
              topics.map((topic) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF161B22),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF30363D)),
                  ),
                  child: Text(
                    topic,
                    style: const TextStyle(color: Color(0xFF58A6FF)),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildDevelopersList() {
    final List<Map<String, dynamic>> developers = [
      {
        'name': 'torvalds',
        'avatar': 'https://i.pravatar.cc/150?img=1',
        'repo': 'linux',
        'description': 'Creator of Linux and Git',
      },
      {
        'name': 'gaearon',
        'avatar': 'https://i.pravatar.cc/150?img=2',
        'repo': 'react',
        'description': 'React core team member',
      },
      {
        'name': 'defunkt',
        'avatar': 'https://i.pravatar.cc/150?img=3',
        'repo': 'dotfiles',
        'description': 'GitHub co-founder',
      },
      {
        'name': 'sindresorhus',
        'avatar': 'https://i.pravatar.cc/150?img=4',
        'repo': 'awesome',
        'description': 'Creator of Awesome lists',
      },
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final dev = developers[index];
        return _buildDeveloperCard(dev);
      }, childCount: developers.length),
    );
  }

  Widget _buildDeveloperCard(Map<String, dynamic> dev) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(dev['avatar']),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dev['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFF0F6FC),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dev['description'],
                    style: const TextStyle(color: Color(0xFF8B949E)),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.book_outlined,
                        size: 16,
                        color: Color(0xFF8B949E),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        dev['repo'],
                        style: const TextStyle(color: Color(0xFF58A6FF)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            IconButton(
              icon: const Icon(Icons.person_add, color: Color(0xFF8B949E)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
