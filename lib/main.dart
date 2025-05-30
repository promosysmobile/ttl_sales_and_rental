import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttl_sales_and_rental/app_data.dart';
import 'package:ttl_sales_and_rental/ui/screen01_login.dart';
import 'package:ttl_sales_and_rental/ui/screen02_dashboard.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales & Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            primary: const Color(0xFF01264A),
            secondary: const Color(0xFF0031A5),
            tertiary: const Color(0xFFE2F1FF),
            outline: Colors.grey.shade400
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late SharedPreferences prefs;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    if(prefs.getString('access_token') == null){
      prefs.setString('access_token', '');
    }

    setState(() {
      accessToken = prefs.getString('access_token')!;
    });
  }

  //logout function called from dashboard screen
  logout(){
    setState(() {
      prefs.setString("access_token", "");
      prefs.setString("user_name", "");
      prefs.setString("user_email", "");
      prefs.setString("user_type", "");

      accessToken = prefs.getString("access_token")!;
      userName = prefs.getString("user_name")!;
      userEmail = prefs.getString("user_email")!;
      userType = prefs.getString("user_type")!;
    });

  }

  @override
  Widget build(BuildContext context) {

    //Check if accessToken value is empty, then navigate to login screen
    //If already has value, navigate to dashboard (means user already logged in)
    return accessToken == ""
        ? LoginScreen(logout: logout,)
        : DashboardScreen(logout: logout,);
  }
}
