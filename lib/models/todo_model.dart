class TodoModel {
  final int? id;
  final int leadId;
  final String lastDate;
  final String nextDate;
  final String email;
  String? timeStamp;

  TodoModel(
      {this.id,
      required this.leadId,
      required this.lastDate,
      required this.nextDate,
      required this.email,
       this.timeStamp});

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
      id: json['id'],
      leadId: json['lead_id'],
      lastDate: json['last_date'],
      nextDate: json['next_date'],
      email: json['email'],
      timeStamp: json['time_stamp']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lead_id': leadId,
      'last_date': lastDate,
      'next_date': nextDate,
      'email': email,
      'time_stamp': timeStamp,
    };
  }
}
