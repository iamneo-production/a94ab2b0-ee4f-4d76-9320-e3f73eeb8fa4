// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String name;
  String phone;
  String email;
  String bank_name;
  bool kyc;
  String pin;
  String account_no;
  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.bank_name,
    required this.kyc,
    required this.pin,
    required this.account_no,
  });

  User copyWith({
    String? name,
    String? phone,
    String? email,
    String? bank_name,
    bool? kyc,
    String? pin,
    String? account_no,
  }) {
    return User(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      bank_name: bank_name ?? this.bank_name,
      kyc: kyc ?? this.kyc,
      pin: pin ?? this.pin,
      account_no: account_no ?? this.account_no,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'bank_name': bank_name,
      'kyc': kyc,
      'pin': pin,
      'account_no': account_no,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      bank_name: map['bank_name'] as String,
      kyc: map['kyc'] as bool,
      pin: map['pin'] as String,
      account_no: map['account_no'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, phone: $phone, email: $email, bank_name: $bank_name, kyc: $kyc, pin: $pin, account_no: $account_no)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.bank_name == bank_name &&
        other.kyc == kyc &&
        other.pin == pin &&
        other.account_no == account_no;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        bank_name.hashCode ^
        kyc.hashCode ^
        pin.hashCode ^
        account_no.hashCode;
  }
}
