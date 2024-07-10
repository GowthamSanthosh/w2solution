import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Country_Details/country_list_page.dart';
import 'Registration_details/registration_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {}); // Delay for 3 seconds
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showSplash
        ? const SplashScreen()
        : DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(
              child: Text(
                'COUNTRY EXPLORER',
                style: TextStyle(color: Colors.white),
              )),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Countries'),
              Tab(text: 'Registration'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.6),
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            CountryListPage(),
            RegistrationPage(),
          ],
        ),
      ),
    );
  }
}
