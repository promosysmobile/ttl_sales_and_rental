import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttl_sales_and_rental/app_data.dart';
import 'package:ttl_sales_and_rental/helper.dart';
import 'package:ttl_sales_and_rental/network_helper.dart';
import 'package:ttl_sales_and_rental/ui/screen03_pending_task.dart';
import 'package:ttl_sales_and_rental/ui/screen_test_checklist.dart';

class DashboardScreen extends StatefulWidget {

  Function logout;

  DashboardScreen({super.key, required this.logout});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late SharedPreferences prefs;

  int intCompletedTask = 0;
  int intInProgressTask = 0;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      accessToken = prefs.getString("access_token")!;
      userName = prefs.getString("user_name")!;
      userEmail = prefs.getString("user_email")!;
      userType = prefs.getString("user_type")!;

    });

    allSwoTasks = await NetworkHelper().getSwo(accessToken);

    setState(() {
      intInProgressTask = 0;
      intCompletedTask = 0;

      for(var swoTask in allSwoTasks){

        for(var theTask in swoTask.ttlTasks){
          if(theTask.taskStatusUuid == strTaskAssignedCode){
            assignedSwoTasks.add(swoTask);
            intInProgressTask += 1;
            break;
          }else if(theTask.taskStatusUuid == strTaskInProgressCode){
            inProgressSwoTasks.add(swoTask);
            intInProgressTask += 1;
            break;
          }else if(theTask.taskStatusUuid == strTaskPendingCode){
            pendingSwoTasks.add(swoTask);
            intInProgressTask += 1;
            break;
          }else if(theTask.taskStatusUuid == strTaskCompletedCode){
            completedSwoTasks.add(swoTask);
            intCompletedTask += 1;
            break;
          }

        }
      }
    });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
           color: Theme.of(context).colorScheme.primary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hi, ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),

                              TextSpan(
                                text: userName,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xffd6950d),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            widget.logout();
                          },
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6,),
                    Text(
                      "Welcome back, work safe..",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,),
                      ),
                    ),
                    Text(
                      "Service Work Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10,),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.push(context, Helper().createRoute(const PendingTaskScreen()));
                              Navigator.push(context, Helper().createRoute(const ScreenTestChecklist()));
                              /*
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const PendingTaskScreen()),
                              );
                              */
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffd6950d),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Completed",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      intCompletedTask.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, Helper().createRoute(const PendingTaskScreen()));

                              /*
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const PendingTaskScreen()),
                              );
                              */
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffd6950d),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "In Progress",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      intInProgressTask.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Text(
                            "Current Task",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffbdbbbb),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                              child: Text(
                                "SWO-ES-000120",
                                style: TextStyle(
                                  color: Color(0xff5c5a5a),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Assigned Date: -",
                                  style: TextStyle(
                                    color: Color(0xff8c8a8a),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Equipment Number: -",
                                  style: TextStyle(
                                    color: Color(0xff8c8a8a),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Time Start: -",
                                  style: TextStyle(
                                    color: Color(0xff8c8a8a),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Duration: -",
                                  style: TextStyle(
                                    color: Color(0xff8c8a8a),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Pause Time: -",
                                  style: TextStyle(
                                    color: Color(0xff8c8a8a),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Pause Reason: -",
                                  style: TextStyle(
                                    color: Color(0xff8c8a8a),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAE9E9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Service Work Order - WIP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextField(
                              onChanged: (val) {
                              },
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                                suffixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20,),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFCFCFCF),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "No Data",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
