import 'package:flutter/material.dart';

class LongListDemo extends StatefulWidget {
  const LongListDemo({super.key});

  @override
  State<LongListDemo> createState() => _LongListDemoState();
}

class _LongListDemoState extends State<LongListDemo> {
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
        title: const Text('Long List Demo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.teal.shade50,
            child: const Text(
              'Complex layout with both vertical and horizontal scrolling. '
              'Scroll down to see the PageView, then try swiping back!',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                if (index == 10) {
                  // Insert PageView in the middle of the list
                  return Container(
                    height: 200,
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.view_carousel,
                                color: Colors.teal,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'PageView Section - Page ${_currentPage + 1} of 3',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: 3,
                            itemBuilder: (context, pageIndex) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.teal.shade300,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.photo_library,
                                        size: 60,
                                        color: Colors.teal.shade700,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Gallery ${pageIndex + 1}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal.shade700,
                                        ),
                                      ),
                                      if (pageIndex == 0)
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'First page - back swipe works!',
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
                      ],
                    ),
                  );
                }

                // Regular list items
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('List Item ${index + 1}'),
                    subtitle: Text(
                      index < 10
                          ? 'Content before PageView section'
                          : 'Content after PageView section',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'PageView is on page ${_currentPage + 1}. '
                'Try swiping back when on page 1!',
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.info, color: Colors.white),
      ),
    );
  }
}
