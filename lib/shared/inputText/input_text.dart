import 'package:flutter/material.dart';

Widget formEmailText({
  required TextEditingController controller,
}) =>
    Card(
      child: TextFormField(
          autofocus: false,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Email");
            }
            // reg expression for email validation
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Please Enter a valid email");
            }
            return null;
          },
          onSaved: (value) {
            controller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
          )),
    );

Widget formNormalText(
        {required TextEditingController controller,
        required String hintext,
        required Icon icon,
        bool isEdit = false}) =>
    Card(
      child: TextFormField(
          autofocus: false,
          controller: controller,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your $hintext");
            }
            // reg expression for email validation

            return null;
          },
          onSaved: (value) {
            controller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: icon,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: hintext,
            border: InputBorder.none,
          )),
    );

Widget formPassword(
        {required TextEditingController controller,
        required String title,
        TextEditingController? toMatch}) =>
    Card(
      child: TextFormField(
          autofocus: false,
          controller: controller,
          obscureText: true,
          validator: (value) {
            RegExp regex = RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return ("${title[0].toUpperCase()}${title.substring(1).toLowerCase()} is required");
            }
            if (!regex.hasMatch(value)) {
              return ("Enter Valid ${title[0].toUpperCase()}${title.substring(1).toLowerCase()}(Min. 6 Character)");
            }

            if (toMatch != null) {
              if (toMatch.text != controller.text) {
                return ("Password not match");
              }
            }

            return null;
          },
          onSaved: (value) {
            controller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText:
                "${title[0].toUpperCase()}${title.substring(1).toLowerCase()}",
            border: InputBorder.none,
          )),
    );
