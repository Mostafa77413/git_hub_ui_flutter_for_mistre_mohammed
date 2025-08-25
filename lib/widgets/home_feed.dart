import 'package:flutter/material.dart';
import 'package:git_hub_pro/constants/colors.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeaderSection(),
          _ActivityItem(
            avatar: 'https://avatars.githubusercontent.com/u/1?v=4',
            username: 'torvalds',
            repo: 'linux',
            action: 'pushed to',
            time: '2 hours ago',
            branch: 'master',
            commits: const [
              'Fix memory leak in process allocation',
              'Update kernel version to 5.15.12',
            ],
          ),
          _ActivityItem(
            avatar: 'https://avatars.githubusercontent.com/u/1024025?v=4',
            username: 'torvalds',
            repo: 'linux',
            action: 'opened pull request',
            prTitle: 'Add support for new ARM architecture',
            time: '4 hours ago',
          ),
          _ActivityItem(
            avatar: 'https://avatars.githubusercontent.com/u/810438?v=4',
            username: 'gaearon',
            repo: 'react',
            action: 'starred',
            time: '6 hours ago',
          ),
          _ActivityItem(
            avatar: 'https://avatars.githubusercontent.com/u/69631?v=4',
            username: 'facebook',
            repo: 'react-native',
            action: 'released',
            release: 'v0.68.0',
            time: '1 day ago',
          ),
          _ActivityItem(
            avatar: 'https://avatars.githubusercontent.com/u/9919?v=4',
            username: 'github',
            repo: 'docs',
            action: 'created branch',
            branch: 'feature/new-api',
            time: '1 day ago',
          ),
          _ActivityItem(
            avatar: 'https://avatars.githubusercontent.com/u/70142?v=4',
            username: 'defunkt',
            repo: 'dotfiles',
            action: 'forked',
            time: '2 days ago',
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 20,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Search GitHub',
                        style: TextStyle(
                          color: AppColors.secondary.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Icon(
                  Icons.filter_list,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _Chip(label: 'For you', isSelected: true),
                const SizedBox(width: 8),
                const _Chip(label: 'Following'),
                const SizedBox(width: 8),
                const _Chip(label: 'Trending'),
                const SizedBox(width: 8),
                const _Chip(label: 'Explore'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _Chip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1F6FEB) : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF1F6FEB) : AppColors.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String avatar;
  final String username;
  final String repo;
  final String action;
  final String time;
  final String? branch;
  final String? prTitle;
  final String? release;
  final List<String>? commits;

  const _ActivityItem({
    required this.avatar,
    required this.username,
    required this.repo,
    required this.action,
    required this.time,
    this.branch,
    this.prTitle,
    this.release,
    this.commits,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatar)),
                const SizedBox(width: 12),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: username,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: action,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: repo,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blueLink,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (branch != null) _BranchWidget(branch: branch!),
            if (prTitle != null) _PullRequestWidget(prTitle: prTitle!),
            if (release != null) _ReleaseWidget(release: release!),
            if (commits != null) _CommitList(commits: commits!),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _ReactionButton(icon: Icons.comment_outlined, count: '12'),
                    const SizedBox(width: 16),
                    _ReactionButton(icon: Icons.repeat, count: '3'),
                  ],
                ),
                _ReactionButton(icon: Icons.more_horiz),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BranchWidget extends StatelessWidget {
  final String branch;
  const _BranchWidget({required this.branch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green[400],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            branch,
            style: const TextStyle(
              color: AppColors.blueLink,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class _PullRequestWidget extends StatelessWidget {
  final String prTitle;
  const _PullRequestWidget({required this.prTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple[400],
            ),
            child: const Icon(Icons.code, size: 12, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              prTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReleaseWidget extends StatelessWidget {
  final String release;
  const _ReleaseWidget({required this.release});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.tag, color: Color(0xFFDB61A2)),
          const SizedBox(width: 8),
          Text(
            release,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _CommitList extends StatelessWidget {
  final List<String> commits;
  const _CommitList({required this.commits});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var commit in commits)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[400],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    commit,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ReactionButton extends StatelessWidget {
  final IconData icon;
  final String? count;
  const _ReactionButton({required this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.secondary),
        if (count != null && count!.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(
            count!,
            style: const TextStyle(color: AppColors.secondary, fontSize: 14),
          ),
        ],
      ],
    );
  }
}
