// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contacts_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:data_faker/data_faker.dart';
import 'package:faker/faker.dart' as faker;

class ContactsListPage extends StatelessWidget {
  List<Contact> contacts = List.generate(100, (index) {
    return Contact(
      name: Faker.name,
      email: Faker.email,
      phoneNumber: faker.RandomGenerator().integer(1000000).toString(),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
          );
        },
      ),
    );
  }
}
