import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/utils.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';

class OurTransactionTile extends StatelessWidget {
  final TransActionModel transActionModel;
  const OurTransactionTile({Key? key, required this.transActionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              transActionModel.type == "Expense"
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              size: ScreenUtil().setSp(30),
              color: transActionModel.type == "Expense"
                  ? Colors.red
                  : Colors.green,
            ),
            SizedBox(
              width: ScreenUtil().setSp(10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transActionModel.remarks,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  OurSizedBox(),
                  Text(
                    Utils().customDate(transActionModel.dateTime),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            OurShimmerText(
              title: transActionModel.money.toString(),
            ),
          ],
        ),
        OurSizedBox(),
        Divider(
          color: lightlogoColor,
        ),
      ],
    );
  }
}