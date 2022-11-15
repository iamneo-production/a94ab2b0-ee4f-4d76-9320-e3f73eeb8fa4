// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Category {
  String id;
  int acctn;
  String name;
  int currentAmt;
  DateTime? createdTime;
  bool isVisible = true;
  String label_type;
  int label_amt;
  List<String> transaction_labels;
  Category({
    required this.id,
    required this.acctn,
    required this.name,
    required this.currentAmt,
    required this.createdTime,
    required this.isVisible,
    required this.label_type,
    required this.label_amt,
    required this.transaction_labels,
  });

  Category copyWith({
    String? id,
    int? acctn,
    String? name,
    int? currentAmt,
    DateTime? createdTime,
    bool? isVisible,
    String? label_type,
    int? label_amt,
    List<String>? transaction_labels,
  }) {
    return Category(
      id: id ?? this.id,
      acctn: acctn ?? this.acctn,
      name: name ?? this.name,
      currentAmt: currentAmt ?? this.currentAmt,
      createdTime: createdTime ?? this.createdTime,
      isVisible: isVisible ?? this.isVisible,
      label_type: label_type ?? this.label_type,
      label_amt: label_amt ?? this.label_amt,
      transaction_labels: transaction_labels ?? this.transaction_labels,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      '_acctn': acctn.toString(),
      'label_name': name,
      'currentAmt': currentAmt,
      'createdTime': createdTime?.millisecondsSinceEpoch,
      'visibility': isVisible,
      'label_type': label_type,
      'labelAmt': label_amt,
      'transaction_labels': transaction_labels,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['_id'] as String,
      acctn: int.parse(map['_acctn']),
      name: map['label_name'] as String,
      currentAmt: map['currentAmt'] as int,
      createdTime: map['createdTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdTime'] as int)
          : null,
      isVisible: map['visibility'] == 1 ? true : false,
      label_type: map['label_type'] as String,
      label_amt: map['labelAmt'] as int,
      transaction_labels: List<String>.from((map['transaction_labels'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, acctn: $acctn, name: $name, currentAmt: $currentAmt, createdTime: $createdTime, isVisible: $isVisible, label_type: $label_type, label_amt: $label_amt, transaction_labels: $transaction_labels)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.acctn == acctn &&
        other.name == name &&
        other.currentAmt == currentAmt &&
        other.createdTime == createdTime &&
        other.isVisible == isVisible &&
        other.label_type == label_type &&
        other.label_amt == label_amt &&
        listEquals(other.transaction_labels, transaction_labels);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        acctn.hashCode ^
        name.hashCode ^
        currentAmt.hashCode ^
        createdTime.hashCode ^
        isVisible.hashCode ^
        label_type.hashCode ^
        label_amt.hashCode ^
        transaction_labels.hashCode;
  }
}
