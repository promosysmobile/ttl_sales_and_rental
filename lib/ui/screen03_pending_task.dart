import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ttl_sales_and_rental/ui/components/card_assigned_task.dart';
import 'package:ttl_sales_and_rental/ui/components/card_in_progress.dart';

import '../app_data.dart';
import '../model/get_swo_model/checklist_item.dart';

class PendingTaskScreen extends StatefulWidget {
  const PendingTaskScreen({super.key});

  @override
  State<PendingTaskScreen> createState() => _PendingTaskScreenState();
}

class _PendingTaskScreenState extends State<PendingTaskScreen> {


  int whichTab = 1;

  @override
  void initState() {

    setState(() {
      whichTab = 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: const Color(0xFF01264A),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          "Pending Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),

                        const SizedBox(height: 20,),
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
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: Container(
                  color: Color(0xffececec),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  whichTab = 1;
                                });
                              },
                              child: whichTab == 0
                              ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffe1e1e1),
                                  border: Border.all( // Add this line
                                    color: const Color(0xFFFFC146), // Border color
                                    width: 2.0, // Border width
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                                  child: Center(
                                    child: Text(
                                      "Assigned",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFFFC146),
                                  border: Border.all( // Add this line
                                    color: const Color(0xFFFFC146), // Border color
                                    width: 2.0, // Border width
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                                  child: Center(
                                    child: Text(
                                      "Assigned",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 8,),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  whichTab = 0;
                                });
                              },
                              child: whichTab == 0
                                ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFFFC146),
                                  border: Border.all( // Add this line
                                    color: const Color(0xFFFFC146), // Border color
                                    width: 2.0, // Border width
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                                  child: Center(
                                    child: Text(
                                      "In Progress",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                                : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffe1e1e1),
                                  border: Border.all( // Add this line
                                    color: const Color(0xFFFFC146), // Border color
                                    width: 2.0, // Border width
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                                  child: Center(
                                    child: Text(
                                      "In Progress",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        whichTab == 1
                            ? Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: assignedSwoTasks.length,
                                itemBuilder: (context, index) {
                                  return CardAssignedTask(mySwoModel: assignedSwoTasks[index],);
                                },
                              ),
                            )

                            : Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: inProgressSwoTasks.length,
                                itemBuilder: (context, index) {
                                  return CardInProgress();
                                },
                              ),
                            ),
                      ],
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
