// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, unused_element, unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:spendwise/constant/constant.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    final cc = Colorclass();

    String name = "";
    String amount = "";
    String type = "";
    final List<String> items = [
      'Income',
      'Expense',
    ];

    void sendmessage() async {
      final user = FirebaseAuth.instance.currentUser!;
      if (name.isEmpty || amount.isEmpty || type.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enter Complete Data'),
          ),
        );
        return;
      }
      FirebaseFirestore.instance.collection(user.uid).add({
        "name": name,
        "amount": amount,
        "type": type,
        "createdAt": Timestamp.now(),
        "user_email": user.email,
        "username": user.displayName,
      });
      final userdata = await FirebaseFirestore.instance
          .collection(user.email!)
          .doc(user.uid)
          .get();
      final maindata = userdata.data()!;

      double user_total = double.parse(maindata["total"]);
      double user_income = double.parse(maindata["income"]);
      double user_expense = double.parse(maindata["expense"]);

      if (type.toLowerCase() == "income") {
        await FirebaseFirestore.instance
            .collection(user.email!)
            .doc(user.uid)
            .set({
          "expense": user_expense.toString(),
          "total": (user_total + double.parse(amount)).toString(),
          "income": (user_income + double.parse(amount)).toString(),
        });
      } else {
        await FirebaseFirestore.instance
            .collection(user.email!)
            .doc(user.uid)
            .set({
          "expense": (double.parse(amount) + user_expense).toString(),
          "total": (user_total - double.parse(amount)).toString(),
          "income": user_income.toString(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense Successfully Added'),
        ),
      );
      setState(() {
        name = "";
        amount = "";
        type = "";
      });
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(21, 209, 204, 204),
          Color.fromARGB(255, 180, 169, 169),
          Color.fromARGB(20, 160, 155, 155),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: cc.background_color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.elliptical(60, 20),
                  bottomRight: Radius.elliptical(60, 20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 5,
            // right: MediaQuery.of(context).size.width / .5,
            child: Text(
              "Expense And Income",
              style: cc.textstyle_normal,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5.4,
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            left: MediaQuery.of(context).size.width / 5.8,
            // right: MediaQuery.of(context).size.width / .5,
            child: Text(
              "Name",
              style: cc.textstyle_normal_black_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: MediaQuery.of(context).size.width / 6,
            right: MediaQuery.of(context).size.width / 6,
            child: TextFormField(
              onChanged: (value) {
                name = value;
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Fooding",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: MediaQuery.of(context).size.width / 5.8,
            // right: MediaQuery.of(context).size.width / .5,
            child: Text(
              "Amount",
              style: cc.textstyle_normal_black_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.6,
            left: MediaQuery.of(context).size.width / 6,
            right: MediaQuery.of(context).size.width / 6,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amount = value;
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "100",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.16,
            left: MediaQuery.of(context).size.width / 5.8,
            // right: MediaQuery.of(context).size.width / .5,
            child: Text(
              "Type",
              style: cc.textstyle_normal_black_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.94,
            left: MediaQuery.of(context).size.width / 6,
            right: MediaQuery.of(context).size.width / 6,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Border color
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              child: DropDown(
                items: const ["Income", "Expense"],
                hint: const Text("Income"),
                showUnderline: false,
                icon: const Icon(
                  Icons.expand_more,
                  color: Colors.black,
                ),
                onChanged: (p0) {
                  if (p0 == null) {
                    type = "Income";
                  } else {
                    type = p0;
                  }
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.6,
            left: MediaQuery.of(context).size.width / 3.2,
            // right: MediaQuery.of(context).size.width / .5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: cc.white_color,
                  elevation: 24,
                  backgroundColor: cc.background_color),
              onPressed: () {
                sendmessage();
              },
              child: Text(
                "Submit",
                style: cc.textstyle_button,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
