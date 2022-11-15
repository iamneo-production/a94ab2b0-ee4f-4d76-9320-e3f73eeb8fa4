import 'dart:convert';

import 'package:dotpay/models/categories.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class LabelHelper {
  static uploadLabel(
      {required int accountNo,
      required String label_name,
      required int label_amt,
      String? description,
      required int currentAmt,
      required String label_type,
      required List<String> transaction_labels}) async {
    final url = "https://tokenbalance-production.up.railway.app/api/labels/";
    var data = jsonEncode({
      "_acctn": accountNo.toString(),
      "description": description,
      "label_name": label_name,
      "label_amt": label_amt,
      "currentAmt": currentAmt,
      "label_type": label_type,
      "transaction_labels": transaction_labels
    });
    print(data);
    final res = await http.post(Uri.parse(url), headers: {}, body: data);
    final data1 = jsonDecode(res.body);
    print(data1);
    if (data1['message'] == 'successfully created label') {}
    return data;
  }

  static Future<List<Category>> getLabels(int accountNo) async {
    final url =
        "https://tokenbalance-production.up.railway.app/api/labels/$accountNo";
    final res = await http.get(Uri.parse(url));
    var resp = jsonDecode(res.body)['labelData'];
    List<Category> categories = [];
    for (var data in resp as List) {
      Category category = Category.fromMap(data);
      categories.add(category);
    }
    return categories;
  }
}
