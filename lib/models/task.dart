import 'package:equatable/equatable.dart';
// ignore : must_be_immutable
class Task  extends Equatable{
  final String id;
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.id,
    required this.title,
    this.isDone,
    this.isDeleted,
  }){
   isDone = isDone ?? false;
   isDeleted = isDeleted ?? false;
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted, id: id,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,title, isDone, isDeleted
  ];
}
