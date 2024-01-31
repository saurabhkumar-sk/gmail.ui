import 'package:email_ui/general_settings.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: 'General',
            ),
            Tab(
              text: 'labels',
            ),
            Tab(
              text: 'Inbox',
            ),
            Tab(
              text: 'Account and Imports',
            ),
            Tab(
              text: 'Filters and Block Address',
            ),
            Tab(
              text: 'Forwarding and POP/IMAP',
            ),
            Tab(
              text: 'add-ons',
            ),
            Tab(
              text: 'Chat and Meet',
            ),
            Tab(
              text: 'Advanced',
            ),
            Tab(
              text: 'Offline',
            ),
            Tab(
              text: 'Themes',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          GeneralSettings(),
          // Text('Labels'),
          // Text('Inbox'),
          // Text('data'),
          // Text('data'),
          // Text('data'),
        ]),
      ),
    );
  }
}
