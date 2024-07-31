class SliderObject {
  String title;
  String subtitle;
  String image;

  SliderObject(this.title, this.subtitle, this.image);
}

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contact {
  String phone;
  String link;
  String email;

  Contact(this.phone, this.link, this.email);
}

class Authentication {
  Customer customer;
  Contact contact;

  Authentication(this.customer, this.contact);
}
