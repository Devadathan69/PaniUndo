import 'package:flutter/material.dart';

import '../widgets/section_card.dart';

class EmployerShell extends StatefulWidget {
  const EmployerShell({super.key});

  static const routeName = '/employer';

  @override
  State<EmployerShell> createState() => _EmployerShellState();
}

class _EmployerShellState extends State<EmployerShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const pages = [
      _EmployerOverview(),
      _EmployerJobs(),
      _EmployerCandidates(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Employer Dashboard')),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.login), label: 'Access'),
          NavigationDestination(icon: Icon(Icons.post_add), label: 'Jobs'),
          NavigationDestination(icon: Icon(Icons.people_alt_outlined), label: 'Candidates'),
        ],
      ),
    );
  }
}

class _EmployerOverview extends StatelessWidget {
  const _EmployerOverview();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Employer demo access',
          subtitle: 'Minimal login/demo shell for a hackathon MVP.',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(child: Icon(Icons.storefront)),
            title: const Text('Ravi Stores'),
            subtitle: const Text('Hiring cashier + shift support'),
            trailing: FilledButton(onPressed: () {}, child: const Text('Demo')),
          ),
        ),
        const SectionCard(
          title: 'What employers get',
          subtitle: 'Dashboard goals pulled directly from the product summary.',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text('AI-matched candidates')),
              Chip(label: Text('Watch intro')),
              Chip(label: Text('Shortlist faster')),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmployerJobs extends StatelessWidget {
  const _EmployerJobs();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Post a job',
          subtitle: 'Minimal form fields for the employer flow.',
          child: Column(
            children: [
              const TextField(decoration: InputDecoration(labelText: 'Role title', border: OutlineInputBorder())),
              SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: 'Location', border: OutlineInputBorder())),
              SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: 'Shift / schedule', border: OutlineInputBorder())),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(onPressed: null, child: Text('Publish demo job')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmployerCandidates extends StatelessWidget {
  const _EmployerCandidates();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        SectionCard(
          title: 'Matched candidates',
          subtitle: 'Candidate cards with match score and intro preview.',
          child: Column(
            children: [
              _CandidateTile(name: 'Meena', role: 'Cashier', score: '94%'),
              _CandidateTile(name: 'Arun', role: 'Delivery support', score: '89%'),
            ],
          ),
        ),
      ],
    );
  }
}

class _CandidateTile extends StatelessWidget {
  const _CandidateTile({
    required this.name,
    required this.role,
    required this.score,
  });

  final String name;
  final String role;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: Theme.of(context).textTheme.titleMedium),
                      Text(role),
                    ],
                  ),
                ),
                Chip(label: Text(score)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_circle_outline),
                    label: const Text('Watch intro'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Shortlist'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
