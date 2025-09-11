import 'package:flutter/material.dart';

class NestedScrollDemo extends StatefulWidget {
  const NestedScrollDemo({super.key});

  @override
  State<NestedScrollDemo> createState() => _NestedScrollDemoState();
}

class _NestedScrollDemoState extends State<NestedScrollDemo> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Scroll Demo'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.purple.shade50,
            child: const Text(
              'This demo shows a PageView inside a scrollable container. '
              'Notice how back swipe works when the PageView is at the left edge.',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    margin: const EdgeInsets.all(16),
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.purple.shade300),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.view_carousel,
                                  size: 60,
                                  color: Colors.purple.shade700,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'PageView ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple.shade700,
                                  ),
                                ),
                                if (index == 0)
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'At left edge - back swipe works!',
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'PageView Page ${_currentPage + 1} of 3',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Add some content below the PageView to make it scrollable
                  ...List.generate(10, (index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text('${index + 1}'),
                        ),
                        title: Text('Scrollable Item ${index + 1}'),
                        subtitle: const Text(
                          'This content is below the PageView',
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.info_outline, color: Colors.purple),
                        SizedBox(height: 8),
                        Text(
                          'Try swiping back when the PageView is on the first page. '
                          'The back gesture should work even with nested scrollables!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
