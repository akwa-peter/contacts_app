// ignore_for_file: prefer_final_fields

import 'package:contacts_app/data/contact.dart';
import 'package:data_faker/data_faker.dart';
import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';

class ContactsModel extends Model {
  List<Contact> _contacts = List.generate(100, (index) {
    return Contact(
      name: Faker.name,
      email: Faker.email,
      phoneNumber: faker.RandomGenerator().integer(1000000).toString(),
    );
  });

  //Get all the contacts
  List<Contact> get contacts => _contacts;

  //Change favorite status of a contact
  void changeFavoriteStatus(int index) {
    _contacts[index].isFavorite = !_contacts[index].isFavorite;
    _sortContacts();

    //Notify all listeners to rebuild the widgets
    notifyListeners();
  }

  //Sort contacts
  void _sortContacts() {
    contacts.sort((cont1, cont2) {
      int comparisonResult;

      //Primary sorting
      comparisonResult = _sortBasedOnFavoriteStatus(cont1, cont2);

      //Secondary sorting
      if (comparisonResult == 0) {
        comparisonResult = _sortAlphabetically(cont1, cont2);
      }

      //Return comparison result
      return comparisonResult;
    });
  }

  //Sort based on favourite
  int _sortBasedOnFavoriteStatus(Contact cont1, Contact cont2) {
    if (cont1.isFavorite) {
      return -1;
    } else if (cont2.isFavorite) {
      return 1;
    } else {
      return 0;
    }
  }

  int _sortAlphabetically(Contact cont1, Contact cont2) {
    return cont1.name.compareTo(cont2.name);
  }
}
