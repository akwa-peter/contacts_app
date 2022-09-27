import 'package:contacts_app/ui/contacts_list/models/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/data/contact.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.contactIndex,
  }) : super(key: key);

  final int contactIndex;
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<ContactsModel>(context);
    final Contact displayedContact = model.contacts[contactIndex];
    return ListTile(
      title: Text(displayedContact.name),
      subtitle: Text(displayedContact.email),
      trailing: IconButton(
        icon: Icon(
          displayedContact.isFavorite ? Icons.star : Icons.star_border,
          color: displayedContact.isFavorite ? Colors.amber : Colors.grey,
        ),
        onPressed: () {
          model.changeFavoriteStatus(contactIndex);
        },
      ),
    );
  }
}
