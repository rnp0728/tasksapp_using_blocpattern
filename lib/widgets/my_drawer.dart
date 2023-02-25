import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text('My Tasks'),
              trailing: Text('0'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text('Bin'),
              trailing: Text('0'),
            ),
          ],
        ),
      ),
    );
  }
}
