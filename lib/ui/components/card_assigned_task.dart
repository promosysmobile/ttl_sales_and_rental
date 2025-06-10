import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ttl_sales_and_rental/model/get_swo_model/get_swo_model.dart';

class CardAssignedTask extends StatefulWidget {

  GetSwoModel mySwoModel;

  CardAssignedTask({super.key, required this.mySwoModel});

  @override
  State<CardAssignedTask> createState() => _CardAssignedTaskState();
}

class _CardAssignedTaskState extends State<CardAssignedTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.mySwoModel.swoNumber,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffed4747),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                      child: Center(
                        child: Text(
                          widget.mySwoModel.swoTypeName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffdddddd),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                      child: Center(
                        child: Text(
                          "EE",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                  widget.mySwoModel.equipmentNoName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )
              ),
              const SizedBox(height: 1,),
              Text(
                  widget.mySwoModel.createdAt.toString().replaceAll("T", " "),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffdddddd),
                        border: Border.all( // Add this line
                          color: const Color(0xFFFFC146), // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                        child: Center(
                          child: Text(
                            "Request Parts",
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
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        log("TaskType: ${widget.mySwoModel.swoTypeName}");
                        if(widget.mySwoModel.swoTypeName == "IQC") {

                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffdddddd),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                          child: Center(
                            child: Text(
                              "New Task",
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

