class ChecklistModel {
  final dynamic notes;
  final List<AccessoriesItemModel> accessories;
  final List<IqcDetailsItemModel> iqc_details;
  final IqcChecklistItemModel iqc_checklist;
  final List<SwoChecklistItemModel> swo_checklist;

  ChecklistModel({
    required this.notes,
    required this.accessories,
    required this.iqc_details,
    required this.iqc_checklist,
    required this.swo_checklist,
  });
}

//Model Items in Checklist Json
class AccessoriesItemModel {

  dynamic id;
  dynamic type;
  dynamic label;
  dynamic checked;

  AccessoriesItemModel(
      this.id,
      this.type,
      this.label,
      this.checked
  );
}

class IqcDetailsItemModel {

  dynamic id;
  dynamic type;
  dynamic label;
  dynamic value;
  dynamic options;

  IqcDetailsItemModel(
      this.id,
      this.type,
      this.label,
      this.value,
      this.options
      );
}

class IqcChecklistItemModel {
  List<RowsItemModel> rows;
  dynamic columns;

  IqcChecklistItemModel(
      this.rows,
      this.columns
      );
}

class RowsItemModel {
  dynamic id;
  dynamic type;
  dynamic value;
  dynamic options;
  dynamic remarks;
  dynamic task_code;
  dynamic task_checklist;

  RowsItemModel(
      this.id,
      this.type,
      this.value,
      this.options,
      this.remarks,
      this.task_code,
      this.task_checklist
      );
}

class SwoChecklistItemModel {
  dynamic id;
  dynamic type;
  dynamic label;
  dynamic checked;

  SwoChecklistItemModel(
      this.id,
      this.type,
      this.label,
      this.checked,
      );
}