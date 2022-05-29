import 'package:example_contact_app/domain/providers/contacts_page_provider.dart';
import 'package:example_contact_app/presentation/contact_detail/contact_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/contacts/contacts_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactsPageProvider()),
      ],
      child: Scaffold(
        body: SafeArea(child: Navigator(
          onGenerateRoute: (settings) {
            final url = settings.name ?? '/';
            if(url == '/') {
              return MaterialPageRoute(
                  builder: (context) => const ContactsPage());
            } else {
              final path = url.split('/');
              final page = path[1];
              final id = path[2];
              switch (page) {
                case 'contact':
                  return MaterialPageRoute(
                      builder: (context) => ContactDetail(id: id));
              }
            }
          },
        )),
      ),
    );
  }
}
