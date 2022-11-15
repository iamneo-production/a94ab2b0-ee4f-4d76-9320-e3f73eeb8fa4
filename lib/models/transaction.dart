// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TransactionModel {
  String id;
  String acctn;
  String name;
  int Amt;
  String transaction_type;
  String label_type;
  Map logo;
  TransactionModel({
    required this.id,
    required this.acctn,
    required this.name,
    required this.Amt,
    required this.transaction_type,
    required this.label_type,
    required this.logo,
  });

  TransactionModel copyWith({
    String? id,
    String? acctn,
    String? name,
    int? Amt,
    String? transaction_type,
    String? label_type,
    Map? logo,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      acctn: acctn ?? this.acctn,
      name: name ?? this.name,
      Amt: Amt ?? this.Amt,
      transaction_type: transaction_type ?? this.transaction_type,
      label_type: label_type ?? this.label_type,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'acctn': acctn,
      'name': name,
      'Amt': Amt,
      'transaction_type': transaction_type,
      'label_type': label_type,
      'logo': logo,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['_id'] as String,
      acctn: map['_acctn'] as String,
      name: map['name'] as String,
      Amt: map['Amt'] as int,
      transaction_type: map['transaction_type'] as String,
      label_type: map['label_type'] as String,
      logo: Map.from((map['logo'] as Map)),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(id: $id, acctn: $acctn, name: $name, Amt: $Amt, transaction_type: $transaction_type, label_type: $label_type, logo: $logo)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.acctn == acctn &&
        other.name == name &&
        other.Amt == Amt &&
        other.transaction_type == transaction_type &&
        other.label_type == label_type &&
        mapEquals(other.logo, logo);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        acctn.hashCode ^
        name.hashCode ^
        Amt.hashCode ^
        transaction_type.hashCode ^
        label_type.hashCode ^
        logo.hashCode;
  }
}
