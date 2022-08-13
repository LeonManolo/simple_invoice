import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      value: 1,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                     color: Theme.of(context).primaryColor.withOpacity(1),
                     value: 0.6,
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width / 3 / 2 - 16,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=13"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text("60 %", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.deepPurple)),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              alignment: Alignment.centerLeft,
              child: Text("Settings",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: Text("Change Logo"),
            )
          ],
        ),
      ),
    );
  }
}
