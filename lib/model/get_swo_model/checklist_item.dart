class ChecklistItem {
  String checklistItem;
  int checklistItemStatus;
  List<ChecklistSubItem> listSubItem;

  ChecklistItem({
    required this.checklistItem,
    required this.checklistItemStatus,
    required this.listSubItem
  });

}

class ChecklistSubItem {
  String checklistSubItem;
  int checklistSubItemStatus;

  ChecklistSubItem({
    required this.checklistSubItem,
    required this.checklistSubItemStatus,
  });

}