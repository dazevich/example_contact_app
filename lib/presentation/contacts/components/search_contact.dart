import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../domain/providers/contacts_page_provider.dart';

class SearchContactInput extends StatelessWidget {
  const SearchContactInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: (text) {
          context.read<ContactsPageProvider>().setFilter(text);
        },
        decoration: InputDecoration(
          labelText: 'Поиск контакта',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffcccccc),
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          prefixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}
