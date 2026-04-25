import 'package:flutter/material.dart';

import 'employer_shell.dart';
import 'worker_shell.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFCCFBF1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text('Voice-first hiring for blue-collar workers'),
              ),
              const SizedBox(height: 24),
              Text(
                'PaniUndo',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                'Speak to get hired. Employers get AI-matched candidates without resumes or long forms.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    _RoleCard(
                      title: 'I am a worker',
                      subtitle:
                          'Choose your language, record a short intro, and get a ready-to-share profile.',
                      cta: 'Open worker flow',
                      onTap: () => Navigator.pushNamed(context, WorkerShell.routeName),
                    ),
                    _RoleCard(
                      title: 'I am an employer',
                      subtitle:
                          'Post a job, review AI-matched candidates, and shortlist workers quickly.',
                      cta: 'Open employer flow',
                      onTap: () => Navigator.pushNamed(context, EmployerShell.routeName),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.cta,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String cta;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(subtitle),
            const SizedBox(height: 20),
            FilledButton(onPressed: onTap, child: Text(cta)),
          ],
        ),
      ),
    );
  }
}
