import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'marquee.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

const backgroundColor = Color.fromARGB(255, 23, 126, 178);
const green_my = Color.fromARGB(255, 50, 221, 118);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '福州大学一码通'),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 主页
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  int _countdownTime = 13;

  void startCountdownTimer() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_countdownTime == 60) {
          _countdownTime = 0;
        } else {
          _countdownTime = _countdownTime + 1;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startCountdownTimer();
    initializeDateFormatting();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.black))
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          color: backgroundColor,
          width: double.infinity,
          // 宽度上撑满
          height: double.infinity,
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '姓名: 房好爽',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            Container(
                              height: 15.0,
                            ),
                            const Text(
                              '部门: 物理与信息工程学院',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                        Image.asset(
                          'logo.png',
                          width: 110.0,
                          height: 110.0,
                        )
                      ],
                    ),
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Container(
                          // color: Colors.amber,
                          color: Colors.white,
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 10.0),
                                  width: double.infinity,
                                  color: Colors.white,
                                  //3.二维码
                                  child: Column(
                                    children: [
                                      //1.条形码
                                      Image.asset(
                                        '1.png',
                                        height: 80.0,
                                      ),
                                      //2.时间
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              DateFormat('MM月dd日', "zh_CN")
                                                  .format(DateTime.now()),
                                              style: const TextStyle(
                                                  color: green_my,
                                                  fontSize: 18.0)),
                                          Container(
                                            width: 10.0,
                                          ),
                                          Text('$_countdownTime',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0,
                                                  color: green_my)),
                                          Container(
                                            width: 10.0,
                                          ),
                                          Text(
                                              DateFormat('HH:mm', "zh")
                                                  .format(DateTime.now()),
                                              style: const TextStyle(
                                                  color: green_my,
                                                  fontSize: 18.0)),
                                        ],
                                      ),
                                      //3.二维码
                                      Image.asset(
                                        '2.png',
                                        width: 180.0,
                                        height: 180.0,
                                      ),
                                    ],
                                  )),
                              //4.文字
                              MarqueeSingle(
                                  child: Container(
                                      color: Colors.green,
                                      child: const Text('文明',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 30.0)),
                                      width: double.maxFinite)),
                              Container(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    "未见异常, 允许通行, 请主动出示, 配合检查, 并\n做好自我防护, 出行前请确认.",
                                    style: TextStyle(color: Colors.green),
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                              Container(
                                height: 20.0,
                              ),
                              //5.一卡通
                              Row(
                                children: [
                                  Container(
                                    width: 10.0,
                                  ),
                                  const Icon(Icons.account_balance_wallet,
                                      color: green_my),
                                  Container(
                                    width: 5.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '一卡通',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '使用所用场景',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 25.0,
                              ),
                            ],
                          ),
                        )),
                    //每日健康填报
                    Container(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Container(
                            padding: const EdgeInsets.all(1.0),
                            color: Colors.white,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                color: const Color.fromARGB(255, 23, 126, 178),
                                child: const Text(
                                  '每日健康填报',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
