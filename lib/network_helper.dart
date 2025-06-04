import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttl_sales_and_rental/model/get_swo_model/checklist_model.dart';
import 'package:ttl_sales_and_rental/model/get_swo_model/get_swo_model.dart';

import 'app_data.dart';
import 'model/login_response.dart';

class NetworkHelper{

  Future<int> login(String email, String password, SharedPreferences prefs) async{
    int statusCode = 0;
    final response = await http.post(
      Uri.parse('https://stage.ttl.ciot.my/api/auth/login'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    statusCode = response.statusCode;

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var myLoginResponse = LoginResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      prefs.setString("access_token", myLoginResponse.data.accessToken);
      prefs.setString("user_name", myLoginResponse.data.user.name);
      prefs.setString("user_email", myLoginResponse.data.user.email);
      prefs.setString("user_type", myLoginResponse.data.user.userType);

      log("accessToken: ${myLoginResponse.data.accessToken}");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login.');
    }

    return statusCode;
  }

  Future<List<GetSwoModel>> getSwo(String accessToken) async {
    int statusCode = 0;
    final response = await http.get(
      Uri.parse('https://stage.ttl.ciot.my/api/swo'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken'   // Send authorization headers to the backend.
      },
    );

    statusCode = response.statusCode;
    List<GetSwoModel> mySwoTasks = [];

    if (response.statusCode == 200) {
      // Process the json individually, since the json response is complex
      var jsonResponse = jsonDecode(response.body);

      for(var jsonObj in jsonResponse['data']){

        var myTtlTask = processTtlTaskArray(jsonObj['ttl_tasks']);

        var mySwoItem = GetSwoModel(
            uuid: jsonObj['uuid'],
            id: jsonObj['id'],
            swoNumber: jsonObj['swo_no'],
            swoStatusUuid: jsonObj['swo_status_uuid'],
            swoTypeUuid: jsonObj['swo_type'],
            swoTypeName: getTaskTypeName(myTtlTask, jsonObj['ttl_swo_types']['type_name']),
            picNotes: jsonObj['pic_notes'],
            rejectRemarks: jsonObj['reject_remarks'],
            ttlTasks: myTtlTask,
            equipmentNoUuid: jsonObj['ttl_equipments']['uuid'],
            equipmentNoName:jsonObj['ttl_equipments']['equipment_no'],
            createdAt: jsonObj['created_at']

        );
        mySwoTasks.add(mySwoItem);
      }
    } else {
      log("statusCode: $statusCode");
    }

    return mySwoTasks;
  }

  String getTaskTypeName(List<TtlTaskModel> myTtlTask, String swoTypeName){
    if(myTtlTask.isEmpty){
      return swoTypeName;
    }else{
      if(myTtlTask[0].taskTypeName == "IQC"
          || myTtlTask[0].taskTypeName == "FQC"
          || myTtlTask[0].taskTypeName == "3P"
          || myTtlTask[0].taskTypeName == "DC"){
        return myTtlTask[0].taskTypeName;
      }else{
        return swoTypeName;
      }

    }
  }

  List<TtlTaskModel> processTtlTaskArray(dynamic ttlTaskArray){

    List<TtlTaskModel> myTasks = [];
    //Go through the ttl_tasks array
    for(var jsonTtlTask in ttlTaskArray){

      String taskTypeName = "";
      if(jsonTtlTask['ttl_task_types'] != null) {
        taskTypeName = jsonTtlTask['ttl_task_types']['type'];
      }

      var myTtlTask = TtlTaskModel(
          uuid: jsonTtlTask['uuid'],
          id: jsonTtlTask['id'],
          taskTypeUuid: jsonTtlTask['task_type_uuid'],
          taskTypeName: taskTypeName,
          taskStatusUuid: jsonTtlTask['task_status_uuid'],
          equipmentStatus: jsonTtlTask['equipment_uuid'],
          actualHours: jsonTtlTask['actual_hours'],
          startedAt: jsonTtlTask['started_at'],
          completedAt: jsonTtlTask['completed_at'],
          checklistModel: processChecklist(jsonTtlTask['checklist']),
          pauseTime: jsonTtlTask['pause_time'],
          pauseReason: jsonTtlTask['pause_reason']
      );

      myTasks.add(myTtlTask);
    }

    return myTasks;
  }

  ChecklistModel processChecklist(dynamic checklistObj){

    ChecklistModel myChecklistModel = ChecklistModel(
        notes: '',
        accessories: [],
        iqc_details: [],
        iqc_checklist: IqcChecklistItemModel([], []),
        swo_checklist: []
    );

    List<AccessoriesItemModel> checklistAccesories = [];
    List<IqcDetailsItemModel> checklistIqcDetails = [];
    IqcChecklistItemModel checklistIqcItem = IqcChecklistItemModel([], []);
    List<SwoChecklistItemModel> checklistSwo = [];

    if(checklistObj != null){
      myChecklistModel = ChecklistModel(
          notes: checklistObj['notes'],
          accessories: checklistAccesories,
          iqc_details: checklistIqcDetails,
          iqc_checklist: checklistIqcItem,
          swo_checklist: checklistSwo
      );
    }


    return myChecklistModel;
  }

}