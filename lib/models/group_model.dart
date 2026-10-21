class GroupModel {
  final String groupId;   // 'semester3_boys'
  final String name;      // 'Semester 3 Boys'
  final int semester;     // 3
  final String gender;    // 'male'

  const GroupModel({
    required this.groupId,
    required this.name,
    required this.semester,
    required this.gender,
  });

  factory GroupModel.fromMap(Map<String, dynamic> map, String groupId) {
    return GroupModel(
      groupId: groupId,
      name: map['name'] ?? '',
      semester: map['semester'] ?? 0,
      gender: map['gender'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'semester': semester,
      'gender': gender,
    };
  }
}