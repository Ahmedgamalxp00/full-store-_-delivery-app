import 'package:delivery_app/core/utils/app_styles.dart';
import 'package:delivery_app/data/models/cart_model/cart_model.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.item});
  final CartModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text('${item.itemsImage}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleSemiBold14),
            ),
            const Spacer(),
            Text('${item.itemscounttotal}', style: AppStyles.styleSemiBold14),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Text(
                '${item.itemspricetotal}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: AppStyles.styleSemiBold14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
