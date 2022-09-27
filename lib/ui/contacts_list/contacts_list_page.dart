// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/ui/contacts_list/models/contacts_model.dart';
import 'package:contacts_app/ui/contacts_list/widgets/contact_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:data_faker/data_faker.dart';
import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';

class ContactsListPage extends StatefulWidget {
  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  //This is called or refreshed or rebuilt or runs on every state change
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ScopedModelDescendant<ContactsModel>(
        builder: (context, child, model) {
          return ListView.builder(
            itemCount: model.contacts.length,
            itemBuilder: (context, index) {
              return ContactListTile(
                contactIndex: index,
              );
            },
          );
        },
      ),
    );
  }
}
