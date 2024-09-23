import 'package:flutter/material.dart';
import 'package:modern_smart_home/util/smart_device.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner

      title: 'Smart Home App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // padding constant
  final double paddingHorizontal = 40.0;
  final double paddingVertical = 25.0;

  List mySmartDevices = [
    ["Smart Light", "lib/icons/Smart_light.png", false],
    ["Smart AC", "lib/icons/Smart_ac.png", false],
    ["Smart TV", "lib/icons/Smart_tv.png", false],
    ["Smart fan", "lib/icons/smart_fan.png", false]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal, vertical: paddingVertical),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal, vertical: paddingVertical),
                child: const Column(
                  children: [
                    Text('Welcome Home'),
                    Text(
                      "Youcef",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Divider(
                  color: Colors.grey[800],
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal),
                child: const Text("Smart Devices "),
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                itemBuilder: (BuildContext context, int index) {
                  return SmartDeviceBox(
                    deviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    func: (value) {
                      setState(() {
                        mySmartDevices[index][2] = value;
                      });
                    },
                  );
                },
              ))
            ]),
      ),
    );
  }
}
