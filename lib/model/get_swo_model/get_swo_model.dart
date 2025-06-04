import 'package:ttl_sales_and_rental/model/get_swo_model/checklist_model.dart';

class GetSwoModel {
  final String uuid;
  final int id;
  final dynamic swoNumber;
  final dynamic swoStatusUuid;
  final dynamic swoTypeUuid;
  final dynamic swoTypeName;
  final dynamic picNotes;
  final dynamic rejectRemarks;
  final List<TtlTaskModel> ttlTasks;
  final dynamic equipmentNoUuid;
  final dynamic equipmentNoName;
  final dynamic createdAt;

  GetSwoModel({
    required this.uuid,
    required this.id,
    required this.swoNumber,
    required this.swoStatusUuid,
    required this.swoTypeUuid,
    required this.swoTypeName,
    required this.picNotes,
    required this.rejectRemarks,
    required this.ttlTasks,
    required this.equipmentNoUuid,
    required this.equipmentNoName,
    required this.createdAt
  });
}


class TtlTaskModel {
  final String uuid;
  final int id;
  final dynamic taskTypeUuid;
  final dynamic taskTypeName;
  final dynamic taskStatusUuid;
  final dynamic equipmentStatus;
  final dynamic actualHours;
  final dynamic startedAt;
  final dynamic completedAt;
  final ChecklistModel checklistModel;
  final dynamic pauseTime;
  final dynamic pauseReason;

  TtlTaskModel({
    required this.uuid,
    required this.id,
    required this.taskTypeUuid,
    required this.taskTypeName,
    required this.taskStatusUuid,
    required this.equipmentStatus,
    required this.actualHours,
    required this.startedAt,
    required this.completedAt,
    required this.checklistModel,
    required this.pauseTime,
    required this.pauseReason
  });
}