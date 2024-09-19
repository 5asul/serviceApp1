import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class AddCommentSection extends StatelessWidget {
  const AddCommentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddOrderProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.height(context) * 0.025),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:  EdgeInsets.only(bottom: AppSize.height(context)*0.02),
              child: Text(
                "Comment",
                style: TextStyle(
                  fontSize: AppSize.width(context) * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme().primary.withOpacity(0.8),
                ),
              ),
            ),
          ),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter your comment here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                )),
            onChanged: (value) {
              provider.comment = value;
            },
          ),
          
        ],
      ),
    );
  }
}
