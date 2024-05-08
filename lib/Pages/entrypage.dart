import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/Pages/homepage.dart';
import 'package:spendwise/Pages/personalpage.dart';
import 'package:spendwise/Pages/walletpage.dart';
import 'package:spendwise/constant/constant.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  final cc = Colorclass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: const [HomePage(), WalletPage(), PersonPage()],
      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(
            Icons.home,
            color: cc.white_color,
            size: 34,
          ),
          Icon(
            Icons.wallet,
            color: cc.white_color,
            size: 34,
          ),
          Icon(
            Icons.person,
            color: cc.white_color,
            size: 34,
          ),
        ],
        inactiveIcons: [
          Icon(
            Icons.home,
            color: cc.blackcolor,
            size: 34,
          ),
          Icon(
            Icons.wallet,
            color: cc.blackcolor,
            size: 34,
          ),
          Icon(
            Icons.person,
            color: cc.blackcolor,
            size: 34,
          ),
        ],
        color: cc.container_color,
        height: 70,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        elevation: 10,
      ),
    );
  }
}
