// ignore_for_file: avoid_unnecessary_containers, unused_import, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/constant/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cc = Colorclass();
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;

    String conversion(Timestamp timestamp) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat('dd MMMM yyyy').format(dateTime);
    }

    return Container(
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
            left: 20,
            child: Text(
              "Welcome",
              style: cc.textstyle_normal,
            ),
          ),
          Positioned(
            top: 84,
            left: 20,
            child: Text(
              user.displayName!,
              style: cc.textstyle_normal,
            ),
          ),
          Positioned(
            top: 68,
            // left: 0,
            right: 40,
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: cc.container_color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.notification_add,
                color: cc.white_color,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5.4,
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                color: cc.container_color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            left: MediaQuery.of(context).size.width / 7,
            child: Text(
              "Total Balance",
              style: cc.textstyle_normal_white_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4.3,
            left: MediaQuery.of(context).size.width / 6.7,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(user.email!)
                    .doc(user.uid)
                    .snapshots(),
                builder: (cx, chatsnap) {
                  if (chatsnap.connectionState == ConnectionState.waiting) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  if (!chatsnap.hasData) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  if (chatsnap.hasError) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  final loadedmsg = chatsnap.data!;
                  final chatmessage = loadedmsg["total"];
                  return Text(
                    "₹ $chatmessage",
                    style: cc.textstyle_normal_white_text,
                  );
                }),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.7,
            left: MediaQuery.of(context).size.width / 6.7,
            child: Text(
              "Income",
              style: cc.textstyle_normal_white_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.7,
            right: MediaQuery.of(context).size.width / 6.7,
            child: Text(
              "Expense",
              style: cc.textstyle_normal_white_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.3,
            left: MediaQuery.of(context).size.width / 6.7,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(user.email!)
                    .doc(user.uid)
                    .snapshots(),
                builder: (cx, chatsnap) {
                  if (chatsnap.connectionState == ConnectionState.waiting) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  if (!chatsnap.hasData) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  if (chatsnap.hasError) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  final loadedmsg = chatsnap.data!;
                  final chatmessage = loadedmsg["income"];
                  return Text(
                    "₹ $chatmessage",
                    style: cc.textstyle_normal_white_text,
                  );
                }),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.3,
            right: MediaQuery.of(context).size.width / 6.7,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(user.email!)
                    .doc(user.uid)
                    .snapshots(),
                builder: (cx, chatsnap) {
                  if (chatsnap.connectionState == ConnectionState.waiting) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  if (!chatsnap.hasData) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  if (chatsnap.hasError) {
                    return Text(
                      "₹ 0",
                      style: cc.textstyle_normal_white_text,
                    );
                  }
                  final loadedmsg = chatsnap.data!;
                  final chatmessage = loadedmsg["expense"];
                  return Text(
                    "₹ $chatmessage",
                    style: cc.textstyle_normal_white_text,
                  );
                }),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.6,
            left: 10,
            bottom: 50,
            child: Text(
              "Expense History",
              style: cc.textstyle_normal_black,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.36,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(user.uid)
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
                  builder: (cx, chatsnap) {
                    if (chatsnap.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    }
                    if (!chatsnap.hasData || chatsnap.data!.docs.isEmpty) {
                      return Center(
                        child: Text("No Expense Found.",
                            style: cc.textstyle_normal_black_text),
                      );
                    }
                    if (chatsnap.hasError) {
                      return Center(
                        child: Text("Something Went Wrong.",
                            style: cc.textstyle_normal_black_text),
                      );
                    }
                    final loadedmsg = chatsnap.data!.docs;
                    return ListView.builder(
                      itemCount: loadedmsg.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Your existing ListTile with data from snapshot
                        final chatmessage = loadedmsg[index].data();
                        return Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Card(
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: chatmessage["type"]
                                            .toString()
                                            .toLowerCase() ==
                                        "income"
                                    ? const Icon(
                                        Icons.arrow_upward_rounded,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.arrow_downward_rounded,
                                        color: Colors.red,
                                      ),
                              ),
                              trailing: chatmessage["type"]
                                          .toString()
                                          .toLowerCase() ==
                                      "income"
                                  ? Text("+ ₹ ${chatmessage["amount"]}",
                                      style: cc.textstyle_rupees_gain)
                                  : Text("- ₹ ${chatmessage["amount"]}",
                                      style: cc.textstyle_rupees_loss),
                              title: Text(
                                chatmessage["name"].toString().toUpperCase(),
                                style: cc.textstyle_normal_black_text,
                              ),
                              subtitle: Text(
                                conversion(chatmessage["createdAt"]),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
