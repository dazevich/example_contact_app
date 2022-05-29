import 'package:example_contact_app/domain/models/contact.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final Contact contact;
  const ContactView({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            offset: Offset.zero,
            color: Color(0xffcccccc),
            blurRadius: 4,
            blurStyle: BlurStyle.solid
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(contact.company.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/contact/${contact.id}');
          }, icon: Icon(
              Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.primary,
          )),
        ],
      ),
    );
  }
}
