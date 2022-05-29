import 'package:example_contact_app/data/api/api_util.dart';
import 'package:example_contact_app/presentation/components/button.dart';
import 'package:example_contact_app/presentation/contact_detail/components/titled_row.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import '../../domain/models/contact.dart';

class ContactDetail extends StatelessWidget {
  final String id;

  const ContactDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Contact?>(
        future: ApiUtil().fetchContact(id: id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Center(child: Text('Контакт не найден'));
            }
            final contact = snapshot.data as Contact;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      minHeight: 200,
                    ),
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Color(0xffcccccc),
                          offset: Offset(0, 4),
                          blurRadius: 24,
                          blurStyle: BlurStyle.inner),
                    ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(contact.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(height: 10),
                          Text(contact.company.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppButton.secondary(
                                  callback: () {
                                    url.launchUrl(Uri.parse('tel://${contact.phone}'));
                                  }, text: 'позвонить'),
                              const SizedBox(width: 50),
                              AppButton.primary(
                                  callback: () {
                                    url.launch('tel:${contact.phone}');
                                  }, text: 'написать'),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ]),
                  ),
                  TitledRow(title: 'Логин', value: contact.username),
                  TitledRow(
                    title: 'Веб-сайт',
                    value: contact.website,
                      callBack: () {
                        url.launchUrl(Uri.parse('https://${contact.website}'));
                      }),
                  TitledRow(title: 'Телефон', value: contact.phone),
                  TitledRow(
                      title: 'Адрес',
                      value: contact.address.toString(),
                      callBack: () {
                        url.launchUrl(Uri.parse(
                            'https://maps.google.com/?q=${contact.address.geo['lat']},${contact.address.geo['lng']}'));
                      }),
                  TitledRow(title: 'Компания', value: contact.company.name),
                  TitledRow(
                      title: 'Слоган', value: contact.company.catchPhrase),
                  TitledRow(title: 'БС', value: contact.company.bs),
                ],
              ),
            );
          } else if (snapshot.hasError) {}
          return Center(child: CircularProgressIndicator());
        });
  }
}
