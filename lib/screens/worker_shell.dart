import 'package:flutter/material.dart';

import '../widgets/section_card.dart';

class WorkerShell extends StatefulWidget {
  const WorkerShell({super.key});

  static const routeName = '/worker';

  @override
  State<WorkerShell> createState() => _WorkerShellState();
}

class _WorkerShellState extends State<WorkerShell> {
  int _currentIndex = 0;
  bool _availableForSharedWork = true;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _WorkerHome(),
      const _WorkerJobs(),
      _WorkerAvailability(
        availableForSharedWork: _availableForSharedWork,
        onChanged: (value) => setState(() => _availableForSharedWork = value),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Worker App')),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.mic), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.work_outline), label: 'Jobs'),
          NavigationDestination(icon: Icon(Icons.schedule), label: 'Availability'),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.videocam),
              label: const Text('Record intro'),
            )
          : null,
    );
  }
}

class _WorkerHome extends StatelessWidget {
  const _WorkerHome();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        SectionCard(
          title: 'Choose your language',
          subtitle: 'Multilingual onboarding for low-literacy workers.',
          child: Wrap(
            spacing: 8,
            children: [
              ChoiceChip(label: Text('Hindi'), selected: true),
              ChoiceChip(label: Text('Tamil'), selected: false),
              ChoiceChip(label: Text('Bengali'), selected: false),
            ],
          ),
        ),
        SectionCard(
          title: 'AI introduction flow',
          subtitle: 'Record or upload a short voice/video intro to create a profile.',
          child: Column(
            children: [
              ListTile(leading: Icon(Icons.radio_button_checked), title: Text('Intro recorded')),
              ListTile(leading: Icon(Icons.radio_button_unchecked), title: Text('Transcript generated')),
              ListTile(leading: Icon(Icons.radio_button_unchecked), title: Text('Profile created')),
            ],
          ),
        ),
        SectionCard(
          title: 'AI-generated worker profile',
          subtitle: 'No resume needed.',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Skills: Cashier, delivery, stock handling'),
              SizedBox(height: 8),
              Text('Experience: 2 years in retail support'),
              SizedBox(height: 8),
              Text('Location: Coimbatore'),
              SizedBox(height: 8),
              Text('Preference: Full-time + flexible part-time shifts'),
            ],
          ),
        ),
      ],
    );
  }
}

class _WorkerJobs extends StatelessWidget {
  const _WorkerJobs();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        SectionCard(
          title: 'Recommended jobs',
          subtitle: 'A simple list of AI-matched opportunities.',
          child: Column(
            children: [
              _JobTile(title: 'Shop assistant', location: 'Gandhipuram', score: '92% match'),
              _JobTile(title: 'Delivery runner', location: 'RS Puram', score: '88% match'),
            ],
          ),
        ),
      ],
    );
  }
}

class _WorkerAvailability extends StatelessWidget {
  const _WorkerAvailability({
    required this.availableForSharedWork,
    required this.onChanged,
  });

  final bool availableForSharedWork;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Availability',
          subtitle: 'Workers can opt into part-time or shared workforce shifts.',
          child: SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Available for part-time/shared work'),
            subtitle: const Text('Show flexible shift availability to nearby employers'),
            value: availableForSharedWork,
            onChanged: onChanged,
          ),
        ),
        const SectionCard(
          title: 'Preferred schedule',
          subtitle: 'Demo chips for a hackathon-ready MVP.',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text('Morning')),
              Chip(label: Text('Evening')),
              Chip(label: Text('Weekend')),
              Chip(label: Text('Near home')),
            ],
          ),
        ),
      ],
    );
  }
}

class _JobTile extends StatelessWidget {
  const _JobTile({
    required this.title,
    required this.location,
    required this.score,
  });

  final String title;
  final String location;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(title),
        subtitle: Text(location),
        trailing: SizedBox(
          width: 104,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(score),
              const SizedBox(height: 8),
              FilledButton(onPressed: () {}, child: const Text('Apply')),
            ],
          ),
        ),
      ),
    );
  }
}
