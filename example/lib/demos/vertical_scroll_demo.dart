import 'package:flutter/material.dart';

class VerticalScrollDemo extends StatelessWidget {
  const VerticalScrollDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vertical Scroll Demo'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 50,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('${index + 1}'),
              ),
              title: Text('Item ${index + 1}'),
              subtitle: Text(
                'This is item number ${index + 1} in the vertical list',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vertical scroll works normally!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.info, color: Colors.white),
      ),
    );
  }
}
