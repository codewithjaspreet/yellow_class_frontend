import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ContactListing extends StatefulWidget {
  const ContactListing({Key? key ,required this.token}) : super(key: key);


  final String token;

  @override
  State<ContactListing> createState() => _ContactListingState();
}


class _ContactListingState extends State<ContactListing> {

  late String email;
  @override
  void initState() {
    // TODO: implement onInit

    Map<String, dynamic> myToken = JwtDecoder.decode(widget.token);

     email = myToken['email'];
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(

        child: Text(email)
      ),
    );
  }
}
