import 'package:flutter/material.dart';
import 'package:passwordmanager/models/address.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});
  static const routeName = '/addAddress';

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final nameNode = FocusNode();
  final btnNode = FocusNode();
  final orgNode = FocusNode();
  final phoneNode = FocusNode();
  final emailNode = FocusNode();
  final countryNode = FocusNode();
  final street_AddressNode = FocusNode();
  final cityNode = FocusNode();
  final postalCodeNode = FocusNode();
  final _form = GlobalKey<FormState>();
  bool inItVal = true;
  Address adrs = Address(
    id: null,
    name: "",
    city: "",
    country: "",
    email: "",
    orgnization: "",
    phone: "",
    postalCode: "",
    street_Address: "",
  );

  Map adrMap = {
    "name": "",
    "city": "",
    "country": "",
    "email": "",
    "orgnization": "",
    "phone": "",
    "postalCode": "",
    "streetAddress": "",
  };

  @override
  void dispose() {
    btnNode.dispose();
    nameNode.dispose();
    orgNode.dispose();
    phoneNode.dispose();
    cityNode.dispose();
    countryNode.dispose();
    street_AddressNode.dispose();
    postalCodeNode.dispose();
    emailNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (inItVal) {
      final data = ModalRoute.of(context)!.settings.arguments;
      print(data);
      if (data != null) {
        adrs = Provider.of<AddressDate>(context, listen: false)
            .findById(data.toString());
        adrMap = {
          "name": adrs.name,
          "city": adrs.city,
          "country": adrs.country,
          "email": adrs.email,
          "orgnization": adrs.orgnization,
          "phone": adrs.phone,
          "postalCode": adrs.postalCode,
          "streetAddress": adrs.street_Address,
        };
      }
    }
    inItVal = false;
    super.didChangeDependencies();
  }

  onSaved() {
    bool isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      if (adrs.id != null) {
        Provider.of<AddressDate>(context, listen: false).upDate(
          adrs.id!,
          adrs,
        );
      } else {
        Provider.of<AddressDate>(context, listen: false).addToList(adrs);
        Navigator.of(context).pop(true);
      }
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['name'].toString(),
                focusNode: nameNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Name"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: newValue,
                    city: adrs.city,
                    country: adrs.country,
                    email: adrs.email,
                    orgnization: adrs.orgnization,
                    phone: adrs.phone,
                    postalCode: adrs.postalCode,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(phoneNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: phoneNode,
                initialValue: adrMap['phone'].toString(),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Phone"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: adrs.city,
                    country: adrs.country,
                    email: adrs.email,
                    orgnization: adrs.orgnization,
                    phone: newValue,
                    postalCode: adrs.postalCode,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(emailNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['email'].toString(),
                focusNode: emailNode,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Email"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: adrs.city,
                    country: adrs.country,
                    email: newValue,
                    orgnization: adrs.orgnization,
                    phone: adrs.phone,
                    postalCode: adrs.postalCode,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(countryNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['country'].toString(),
                focusNode: countryNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Country/Region"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: adrs.city,
                    country: newValue,
                    email: adrs.email,
                    orgnization: adrs.orgnization,
                    phone: adrs.phone,
                    postalCode: adrs.postalCode,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(street_AddressNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['streetAddress'].toString(),
                focusNode: street_AddressNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Street Address"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: adrs.city,
                    country: adrs.country,
                    email: adrs.email,
                    orgnization: adrs.orgnization,
                    phone: adrs.phone,
                    postalCode: adrs.postalCode,
                    street_Address: newValue,
                  );
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(cityNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['city'].toString(),
                focusNode: cityNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("City"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: newValue,
                    country: adrs.country,
                    email: adrs.email,
                    orgnization: adrs.orgnization,
                    phone: adrs.phone,
                    postalCode: adrs.postalCode,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(orgNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['orgnization'].toString(),
                focusNode: orgNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Orgnization"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: adrs.city,
                    country: adrs.country,
                    email: adrs.email,
                    orgnization: newValue,
                    phone: adrs.phone,
                    postalCode: newValue,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(postalCodeNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: adrMap['postalCode'].toString(),
                focusNode: postalCodeNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  label: const Text("Postal Code"),
                ),
                onSaved: (newValue) {
                  adrs = Address(
                    id: adrs.id,
                    name: adrs.name,
                    city: adrs.city,
                    country: adrs.country,
                    email: adrs.email,
                    orgnization: adrs.orgnization,
                    phone: adrs.phone,
                    postalCode: newValue,
                    street_Address: adrs.street_Address,
                  );
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(btnNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  focusNode: btnNode,
                  onPressed: () {
                    onSaved();
                  },
                  child: Text(
                    adrs.id == null ? 'Save' : "Update",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
