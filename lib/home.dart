import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int initMounth = DateTime.now().month;
int initYear = DateTime.now().year;
int initDay = DateTime.now().day;

int realMonth = DateTime.now().month;
int realYear = DateTime.now().year;
int realDay = DateTime.now().day;

int firstYear = 2021;
int lastYear = 2025;
int numberOfYear = lastYear - firstYear;
int numberOfMounth = numberOfYear * 12;

// Get day
int getDay(int mounth, int year) {
  int day = 0;
  switch (mounth) {
    case 1:
      day = 31;
      break;
    case 2:
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          day = 29;
        } else {
          day = 28;
        }
      } else {
        if (year % 4 == 0) {
          day = 29;
        } else {
          day = 28;
        }
      }
      break;
    case 3:
      day = 31;
      break;
    case 4:
      day = 30;
      break;
    case 5:
      day = 31;
      break;
    case 6:
      day = 30;
      break;
    case 7:
      day = 31;
      break;
    case 8:
      day = 31;
      break;
    case 9:
      day = 30;
      break;
    case 10:
      day = 31;
      break;
    case 11:
      day = 30;
      break;
    case 12:
      day = 31;
      break;
  }
  return day;
}

List<Widget> getChildrenGridView(int month, int day, int year) {
  List<Widget> children = [];

  int thu = 0;
  if (month < 10) {}
  final dateName = DateFormat('E')
      .format(DateTime.parse("$year-${month < 10 ? '0$month' : month}-01"));
  // log("$dateName=============================");
  switch (dateName.toLowerCase()) {
    case "sun":
      thu = 1;
      break;
    case "mon":
      thu = 2;
      break;
    case "tue":
      thu = 3;
      break;
    case "wed":
      thu = 4;
      break;
    case "thu":
      thu = 5;
      break;
    case "fri":
      thu = 6;
      break;
    case "sat":
      thu = 1;
      break;
  }
  // log("$thu thuuuuuuuuuuuuuuuuuuuuuuuuuuu");
  // log("$thu THU");
  day = day + thu;

  for (int i = 1; i < day; i++) {
    if (i < thu) {
      children.add(const SizedBox());
    } else {
      if (year < realYear) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '${i - thu + 1}',
                  style: const TextStyle(
                    fontSize: 16.5,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (year == realYear) {
        if (month < realMonth) {
          children.add(
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    '${i - thu + 1}',
                    style: const TextStyle(
                      fontSize: 16.5,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (month > realMonth) {
          children.add(
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
              child: Container(
                child: Center(
                  child: Text(
                    '${i - thu + 1}',
                    style: const TextStyle(
                      fontSize: 16.5,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          if (i - thu + 1 < realDay) {
            children.add(
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '${i - thu + 1}',
                      style: const TextStyle(
                        fontSize: 16.5,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (i - thu + 1 > realDay) {
            children.add(
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
                child: Container(
                  child: Center(
                    child: Text(
                      '${i - thu + 1}',
                      style: const TextStyle(
                        fontSize: 16.5,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            children.add(
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '${i - thu + 1}',
                      style: const TextStyle(
                        fontSize: 16.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }
      } else {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
            child: Container(
              child: Center(
                child: Text(
                  '${i - thu + 1}',
                  style: const TextStyle(
                    fontSize: 16.5,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
  }
  return children;
}

Widget getCircle(int thu, int day, int month, int year) {
  bool checkk = false;
  if (year > realYear) {
  } else if (year == realYear) {
    if (month > realMonth) {
    } else if (month < realMonth) {
      checkk = true;
    } else {
      if (day > realDay) {
      } else if (day < realDay) {
        checkk = true;
      } else {
        checkk = true;
      }
    }
  } else {
    checkk = true;
  }
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: checkk
          ? BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100),
            )
          : null,
      height: 32,
      width: 32,
      child: Center(
        child: Text(
          "$thu",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

List<Widget> listWidgetChild() {
  List<Widget> list = [];
  int day = getDay(initMounth, initYear);

  int thu = 0;
  final dateName = DateFormat('E').format(DateTime.parse(
      "$initYear-${initMounth < 10 ? '0$initMounth' : initMounth}-01"));
  switch (dateName.toLowerCase()) {
    case "sun":
      thu = 1;
      break;
    case "mon":
      thu = 2;
      break;
    case "tue":
      thu = 3;
      break;
    case "wed":
      thu = 4;
      break;
    case "thu":
      thu = 5;
      break;
    case "fri":
      thu = 6;
      break;
    case "sat":
      thu = 1;
      break;
  }
  day = day + thu;

  int count = 0;
  for (int i = 0; i < 5; i++) {
    List<Widget> listTmp = [];
    int count2 = 1;
    int monthBefore = 0;
    int yearBefore = 0;
    if (monthBefore == 1) {
      monthBefore = 12;
      yearBefore = initYear - 1;
    } else {
      monthBefore = initMounth - 1;
      yearBefore = initYear;
    }
    int day2 = getDay(monthBefore, yearBefore);
    for (int j = 0; j < 7; j++) {
      count++;

      if (count >= day) {
        // listTmp.add(
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: SizedBox(
        //       height: 32,
        //       width: 32,
        //       child: Center(
        //         child: Text(
        //           "$count2",
        //           style: TextStyle(
        //             color: Colors.grey.shade400,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // );
        listTmp.add(getCircle(count2, count, initMounth, initYear));
        count2++;
      } else {
        if (count < thu) {
          listTmp.add(
              getCircle(day2 - thu + count + 1, count, initMounth, initYear));
        } else {
          listTmp.add(getCircle(count - thu + 1, count, initMounth, initYear));
        }
      }
    }
    list.add(
      SizedBox(
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          children: [...listTmp],
        ),
        // child: Row(),
      ),
    );
  }
  return list;
}

List<Widget> listWidget() {
  List<Widget> list = [];
  int tmpMonth = 0;
  int tmpDay = 0;
  int tmpYear = firstYear;
  for (int i = 0; i < numberOfMounth; i++) {
    tmpMonth++;

    if (tmpMonth == 13) {
      tmpMonth = 1;
      tmpYear++;
    }

    tmpDay = getDay(tmpMonth, tmpYear);

    list.add(
      SizedBox(
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            mainAxisExtent: 53,
          ),
          children: [
            ...getChildrenGridView(tmpMonth, tmpDay, tmpYear),
          ],
        ),
        // child: Row(),
      ),
    );
  }
  return list;
}

bool check = true;
PageController controller = PageController();
PageController controllerChild = PageController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    log("VO INIT");
    super.initState();
    controller = PageController(
        initialPage: (realYear - firstYear) * 12 + realMonth - 1);
    log("${controller.initialPage} initiiiiiiiiiii");
  }

  @override
  Widget build(BuildContext context) {
    bool pinned = true;
    bool snap = false;
    bool floating = false;
    final size = MediaQuery.of(context).size;
    controller = PageController(
        initialPage: (realYear - firstYear) * 12 + realMonth - 1);
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9FC),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            titleSpacing: 0,
            elevation: 0,
            pinned: pinned,
            snap: snap,
            floating: floating,
            expandedHeight: 104.0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color(0xFF173366),
                    Color(0xFF5872A7),
                    Color(0xFFA5B8Ec),
                  ],
                ),
              ),
              child: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Thêm tiện ích',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                ),
              ),
            ),
            leading: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -1, 0),
                      height: check ? size.height * 0.57 : size.height * 0.19,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xFF173366),
                            Color(0xFF5872A7),
                            Color(0xFFA5B8Ec),
                          ],
                        ),
                        border: Border(
                          bottom: BorderSide.none,
                        ),
                      ),
                      child: Column(
                        children: [
                          check
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 18,
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (() {
                                          setState(() {
                                            if (initYear == firstYear &&
                                                initMounth == 1) {
                                            } else {
                                              initMounth--;
                                              if (initMounth < 1) {
                                                initMounth = 12;
                                                initYear--;
                                              }
                                            }
                                            // controller = PageController(
                                            //     initialPage: (initYear - 2000) * 12 +
                                            //         initMounth -
                                            //         1);

                                            controller.animateToPage(
                                              (initYear - firstYear) * 12 +
                                                  initMounth -
                                                  1,
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              curve: Curves.easeInOut,
                                            );
                                          });
                                        }),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          color: Colors.transparent,
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "Tháng $initMounth - $initYear",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: (() {
                                          setState(() {
                                            if (initYear == lastYear - 1 &&
                                                initMounth == 12) {
                                            } else {
                                              initMounth++;
                                              if (initMounth > 12) {
                                                initMounth = 1;
                                                initYear++;
                                              }
                                            }
                                            controller.animateToPage(
                                              (initYear - firstYear) * 12 +
                                                  initMounth -
                                                  1,
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              curve: Curves.easeInOut,
                                            );
                                          });
                                        }),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          color: Colors.transparent,
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                          // List thu cn, th2, th3...
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Text(
                                    "CN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T4",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T5",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T6",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T7",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          check
                              ? Container(
                                  height: size.height * 0.39,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        Color(0xFF173366),
                                        Color(0xFF5872A7),
                                        Color(0xFFA5B8Ec),
                                      ],
                                    ),
                                    border: Border(
                                      bottom: BorderSide.none,
                                    ),
                                  ),
                                  child: PageView(
                                    controller: controller,
                                    padEnds: false,
                                    onPageChanged: (int indexx) {
                                      log("$indexx index page view 2");
                                      setState(() {
                                        initMounth = indexx % 12 + 1;
                                        initYear = indexx ~/ 12 + firstYear;
                                        log("$initMounth INIT MONTH");
                                        log("$initYear INIT YEAR");
                                      });
                                    },
                                    children: <Widget>[...listWidget()],
                                  ),
                                )
                              : Container(
                                  height: size.height * 0.09,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide.none,
                                    ),
                                  ),
                                  child: PageView(
                                    controller: controllerChild,
                                    physics: const BouncingScrollPhysics(),
                                    padEnds: false,
                                    onPageChanged: (int indexxx) {
                                      // log("$index index");
                                      // setState(() {
                                      //   initMounth = index % 12 + 1;
                                      //   initYear = index ~/ 12 + firstYear;
                                      //   log(initMounth.toString());
                                      //   // log(initYear.toString());
                                      // });
                                    },
                                    children: <Widget>[...listWidgetChild()],
                                  ),
                                ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              log("$initDay init day");
                              log("$initMounth init month");
                              log("$initYear init year");
                              setState(() {
                                // controller = PageController(
                                //     initialPage: (initYear - firstYear) * 12 +
                                //         initMounth -
                                //         1);

                                // controller.animateToPage(
                                //   (initYear - firstYear) * 12 + initMounth - 1,
                                //   duration: const Duration(milliseconds: 400),
                                //   curve: Curves.easeInOut,
                                // );

                                check = !check;
                              });
                              log("${controller.initialPage} indexxxxx");
                              log("${controllerChild.initialPage} indexxxxxchild");
                            },
                            child: SizedBox(
                              width: 50,
                              // color: Colors.red,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Image.asset(
                                  check
                                      ? "assets/icons/up.png"
                                      : "assets/icons/down.png",
                                  height: 14,
                                  width: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Tiện ích",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 26,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.circle, color: Colors.blue),
                            SizedBox(width: 4),
                            Text(
                              "BBQ Group",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Thay đổi",
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Color(0xFF505E8C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Khung giờ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 28,
                            ),
                            child: Text(
                              "Không có khung giờ trống...",
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Mô tả",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 3),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Nhập nội dung",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                            ),
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Thông tin",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 19),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Căn hộ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Căn hộ x2-23",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF1C3767),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: const [
                                  Text(
                                    "Họ tên",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Pr04u",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF1C3767),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: const [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "pro4u@local.com.vn",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF1C3767),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: const [
                                  Text(
                                    "Số điện thoại",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "84907488454",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF1C3767),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Row(
                        children: [
                          const Text(
                            "Chính sách và quy tắc đặt tiện ích",
                            style: TextStyle(
                                fontSize: 15.6,
                                color: Color(0xFF505E8C),
                                fontStyle: FontStyle.italic),
                          ),
                          const Spacer(),
                          const Text(
                            "Đồng ý",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.3,
                            ),
                          ),
                          SizedBox(
                            height: 29,
                            width: 29,
                            // color: Colors.red,
                            child: Checkbox(
                              value: false,
                              onChanged: null,
                              fillColor: MaterialStateProperty.all(
                                const Color(0xFF1C3767),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 42),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDAD7DB),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1.6),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Gửi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
