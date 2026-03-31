import 'package:flutter/material.dart';

void main() {
  runApp(const BridgeCourseApp());
}

class BridgeCourseApp extends StatelessWidget {
  const BridgeCourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bridge Course Lesson Plan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LessonPlanScreen(),
      },
    );
  }
}

// Data model for a lesson module
class LessonModule {
  final String week;
  final String title;
  final String objective;
  final List<String> topics;

  LessonModule({
    required this.week,
    required this.title,
    required this.objective,
    required this.topics,
  });
}

class LessonPlanScreen extends StatefulWidget {
  const LessonPlanScreen({super.key});

  @override
  State<LessonPlanScreen> createState() => _LessonPlanScreenState();
}

class _LessonPlanScreenState extends State<LessonPlanScreen> {
  // Mock data for the bridge course lesson plan
  final List<LessonModule> _modules = [
    LessonModule(
      week: 'Week 1',
      title: 'Foundations & Prerequisites',
      objective: 'Establish a strong baseline understanding of core concepts.',
      topics: [
        'Introduction to the Course & Objectives',
        'Review of Basic Terminology',
        'Fundamental Principles and Theories',
        'Diagnostic Assessment',
      ],
    ),
    LessonModule(
      week: 'Week 2',
      title: 'Bridging the Gap',
      objective: 'Connect prior knowledge to new, advanced concepts.',
      topics: [
        'Transitioning from Basics to Intermediate',
        'Common Pitfalls and Misconceptions',
        'Analytical Thinking and Problem Solving',
        'Case Studies: Real-world Applications',
      ],
    ),
    LessonModule(
      week: 'Week 3',
      title: 'Advanced Methodologies',
      objective: 'Introduce standard practices and advanced techniques.',
      topics: [
        'Deep Dive into Advanced Topics',
        'Tools and Technologies Overview',
        'Collaborative Group Project Kickoff',
        'Hands-on Practical Workshop',
      ],
    ),
    LessonModule(
      week: 'Week 4',
      title: 'Integration & Assessment',
      objective: 'Synthesize learning and evaluate readiness for the main program.',
      topics: [
        'Project Presentations and Peer Review',
        'Final Comprehensive Review',
        'Summative Assessment / Final Exam',
        'Next Steps and Main Program Orientation',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bridge Course Plan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildCourseOverview(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildModuleCard(context, _modules[index]);
                },
                childCount: _modules.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40), // Bottom padding
          )
        ],
      ),
    );
  }

  Widget _buildCourseOverview(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.school,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Intensive Bridge Course',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Duration: 4 Weeks\nFormat: Hybrid (Online & In-person)',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'This course is designed to bridge the knowledge gap and prepare students for the rigorous demands of the upcoming main academic program.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, LessonModule module) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // Removes the border when expanded
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            child: Text(
              module.week.split(' ')[1], // Extracts the number from "Week X"
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            module.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              module.week,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  Text(
                    'Objective:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    module.objective,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Topics Covered:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...module.topics.map((topic) => Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                topic,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
