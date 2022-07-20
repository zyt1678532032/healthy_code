import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(title: '玉米病害诊断应用'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatelessWidget {
  final String title;

  const MyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset('Corn_Gray_Spot.png'),
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("选择图片"),
                  style: ButtonStyle(
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(90.0)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("相机"),
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size.fromWidth(90.0)),
                    )),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 58,
                ),
                const Text(
                  '诊断结果:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                )
              ],
            ),
            Container(
              height: 20,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: 300,
                height: 130,
                padding: const EdgeInsets.all(1.0),
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: const Text(
                      '灰叶斑病: 98.3%\n锈蚀病: 4.2%\n枯萎病:6.8%\n健康:0%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 20.0,
            ),
            const Text('图片获取成功,请查看诊断结果。',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.green))
          ],
        ),
      ),
    );
  }
}
