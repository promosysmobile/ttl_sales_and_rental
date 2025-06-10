import 'package:flutter/material.dart';

import '../model/get_swo_model/checklist_item.dart';

class ScreenTestChecklistSubItem extends StatefulWidget {

  List<ChecklistSubItem> myChecklistSubItem;
  int checklistIndex;
  Function checkIfChecklistItemAllChecked;

  ScreenTestChecklistSubItem({super.key, required this.myChecklistSubItem, required this.checklistIndex, required this.checkIfChecklistItemAllChecked});

  @override
  State<ScreenTestChecklistSubItem> createState() => _ScreenTestChecklistSubItemState();
}

class _ScreenTestChecklistSubItemState extends State<ScreenTestChecklistSubItem> {

  @override
  void initState() {
    super.initState();
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
              itemCount: widget.myChecklistSubItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {

                        widget.myChecklistSubItem[index].checklistSubItemStatus = 1;
                        widget.checkIfChecklistItemAllChecked(widget.checklistIndex);

                      });

                    },
                    child: Container(
                      color:
                      widget.myChecklistSubItem[index].checklistSubItemStatus == 1
                      ? Colors.green
                      : Colors.blueGrey,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.myChecklistSubItem[index].checklistSubItem,
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
