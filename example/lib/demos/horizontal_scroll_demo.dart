import 'package:flutter/material.dart';

class HorizontalScrollDemo extends StatefulWidget {
  const HorizontalScrollDemo({super.key});

  @override
  State<HorizontalScrollDemo> createState() => _HorizontalScrollDemoState();
}

class _HorizontalScrollDemoState extends State<HorizontalScrollDemo> {
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
        title: const Text('Horizontal Scroll Demo'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange.shade50,
            child: Column(
              children: [
                Text(
                  'Page ${_currentPage + 1} of 5',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Swipe horizontally to navigate between pages. '
                  'Try swiping back when you\'re on the first page!',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _currentPage
                            ? Colors.orange
                            : Colors.orange.shade300,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade300),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pages,
                          size: 80,
                          color: Colors.orange.shade700,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Page ${index + 1}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (index == 0)
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(horizontal: 32),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'You\'re on the first page! Try swiping back from anywhere on the screen.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        else
                          Text(
                            'Swipe left to go to the next page',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange.shade600,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
