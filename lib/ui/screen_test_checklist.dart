import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ttl_sales_and_rental/ui/screen_test_checklistsubitem.dart';

import '../helper.dart';
import '../model/get_swo_model/checklist_item.dart';

class ScreenTestChecklist extends StatefulWidget {
  const ScreenTestChecklist({super.key});

  @override
  State<ScreenTestChecklist> createState() => _ScreenTestChecklistState();
}

class _ScreenTestChecklistState extends State<ScreenTestChecklist> {
  List<ChecklistItem> myChecklistItem = [];

  @override
  void initState() {

    createChecklistItem1();
    createChecklistItem2();

    super.initState();
  }

  createChecklistItem1(){
    List<ChecklistSubItem> listSubItem = [];
    listSubItem.add(ChecklistSubItem(checklistSubItem: "Charging System", checklistSubItemStatus: 0));

    //ChecklistSubItem checklistSubItem2 = ChecklistSubItem(checklistSubItem: "Oil Filter", checklistSubItemStatus: 0);
    //listSubItem1.add(checklistSubItem2);

    listSubItem.add(ChecklistSubItem(checklistSubItem: "Oil Filter", checklistSubItemStatus: 0));
    listSubItem.add(ChecklistSubItem(checklistSubItem: "Air System", checklistSubItemStatus: 0));

    ChecklistItem checklistItem = ChecklistItem(
        checklistItem: "Alternator Charging (DC)",
        checklistItemStatus: 0,
        listSubItem: listSubItem
    );

    myChecklistItem.add(checklistItem);
  }

  createChecklistItem2(){
    List<ChecklistSubItem> listSubItem = [];
    listSubItem.add(ChecklistSubItem(checklistSubItem: "Belt Tension", checklistSubItemStatus: 0));
    listSubItem.add(ChecklistSubItem(checklistSubItem: "Belt Quality", checklistSubItemStatus: 0));
    listSubItem.add(ChecklistSubItem(checklistSubItem: "Battery Health", checklistSubItemStatus: 0));

    ChecklistItem checklistItem = ChecklistItem(
        checklistItem: "Change Radiator",
        checklistItemStatus: 0,
        listSubItem: listSubItem
    );

    myChecklistItem.add(checklistItem);
  }

  checkIfChecklistItemAllChecked(int checklistIndex){

    log("checklistIndex: $checklistIndex");

    setState(() {
      myChecklistItem[checklistIndex].checklistItemStatus = 1;
      for(var subItemStatus in myChecklistItem[checklistIndex].listSubItem){
        if(subItemStatus.checklistSubItemStatus == 0){
          myChecklistItem[checklistIndex].checklistItemStatus = 0;
        }
      }

      log("checklistItemStatus: ${myChecklistItem[checklistIndex].checklistItemStatus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 100,),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: myChecklistItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, Helper().createRoute(ScreenTestChecklistSubItem(
                        myChecklistSubItem: myChecklistItem[index].listSubItem,
                        checklistIndex: index,
                        checkIfChecklistItemAllChecked: checkIfChecklistItemAllChecked,
                      )
                      ));
                    },
                    child: Container(
                      color:
                      myChecklistItem[index].checklistItemStatus == 1
                      ? Colors.yellow
                      : Theme.of(context).colorScheme.primary,

                      width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              myChecklistItem[index].checklistItem,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ),
                  ),
                );
              },
            ),
          ],
        )
    );
  }
}
