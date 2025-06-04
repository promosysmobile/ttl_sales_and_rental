import 'model/get_swo_model/get_swo_model.dart';

String accessToken = "";
String userName = "";
String userEmail = "";
String userType = "";
String userUuid = "";

int intSwoCompleted = 0;
int intSwoInProgress = 0;

String strTaskAssignedCode = "2311b611-a65a-4a96-beb9-1b9c395e1c54";
String strTaskInProgressCode = "f2fac6b6-4b13-4468-84ef-0cae163f2f0d";
String strTaskPendingCode = "5e010fb8-101d-4a5d-97d6-ddae3624aedb";
String strTaskCompletedCode = "352ec1c0-1d1b-43bb-aa3b-849b859aa6a6";

List<GetSwoModel> allSwoTasks = [];
List<GetSwoModel> pendingSwoTasks = [];
List<GetSwoModel> inProgressSwoTasks = [];
List<GetSwoModel> assignedSwoTasks = [];
List<GetSwoModel> completedSwoTasks = [];