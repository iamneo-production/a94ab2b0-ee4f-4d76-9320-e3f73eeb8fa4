import 'package:dotpay/helperMethods/label_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddLabel extends StatefulWidget {
  const AddLabel({super.key});

  @override
  State<AddLabel> createState() => _AddLabelState();
}

class _AddLabelState extends State<AddLabel> {
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final currentAmtController = TextEditingController();
  final limitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add a new label',
                  style: GoogleFonts.dmSans(fontSize: 18),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20,
                    ))
              ],
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: 'Label Name'),
            ),
            TextField(
              controller: typeController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: 'Debit or Savings'),
            ),
            TextField(
              controller: currentAmtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Current Amount'),
            ),
            TextField(
              controller: limitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Limit'),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              color: Colors.blue,
              child: Text(
                'Save',
                style: GoogleFonts.dmSans(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                LabelHelper.uploadLabel(
                    accountNo: 12345,
                    label_name: nameController.text,
                    label_amt: int.parse(limitController.text),
                    currentAmt: int.parse(currentAmtController.text),
                    label_type: typeController.text,
                    transaction_labels: []);
              },
            )
          ],
        ),
      ),
    );
  }
}
