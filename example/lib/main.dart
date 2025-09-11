import 'package:flutter/material.dart';
import 'package:full_swipe_back_gesture/full_swipe_back_gesture.dart';
import 'demos/basic_page_demo.dart';
import 'demos/vertical_scroll_demo.dart';
import 'demos/horizontal_scroll_demo.dart';
import 'demos/nested_scroll_demo.dart';
import 'demos/long_list_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Swipe Back Gesture Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back Swipe Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Full Swipe Back Gesture Examples',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Try swiping back from anywhere on the screen in each demo. '
            'Notice how it works seamlessly with horizontal scrollables.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          _DemoCard(
            title: 'Basic Page',
            description: 'Simple page with no scrollable content',
            icon: Icons.pageview,
            onTap: () => _navigateToDemo(context, const BasicPageDemo()),
          ),
          _DemoCard(
            title: 'Vertical Scroll',
            description: 'Long vertical list with back swipe support',
            icon: Icons.list,
            onTap: () => _navigateToDemo(context, const VerticalScrollDemo()),
          ),
          _DemoCard(
            title: 'Horizontal Scroll (PageView)',
            description:
                'PageView with multiple pages - swipe back works when at left edge',
            icon: Icons.view_carousel,
            onTap: () => _navigateToDemo(context, const HorizontalScrollDemo()),
          ),
          _DemoCard(
            title: 'Nested Scroll',
            description: 'PageView inside a scrollable container',
            icon: Icons.layers,
            onTap: () => _navigateToDemo(context, const NestedScrollDemo()),
          ),
          _DemoCard(
            title: 'Long List with PageView',
            description:
                'Complex layout with both vertical and horizontal scrolling',
            icon: Icons.grid_view,
            onTap: () => _navigateToDemo(context, const LongListDemo()),
          ),
        ],
      ),
    );
  }

  void _navigateToDemo(BuildContext context, Widget page) {
    Navigator.of(context).push(BackSwipePageRoute(builder: (_) => page));
  }
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
