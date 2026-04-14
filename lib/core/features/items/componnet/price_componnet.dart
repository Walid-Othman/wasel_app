import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/features/items/componnet/custome_text_form_field.dart';
import 'package:wasel_app/core/features/items/cubit/item_cubit.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class PriceComponnet extends StatelessWidget {
  PriceComponnet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        final itemCubit = context.read<ItemCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PRICE'),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: CustomeTextFormField(
                    hintText: "50",
                    icon: Icons.price_change,
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (value) => itemCubit.updateField(price: value),
                    controller: itemCubit.price,
                  ),
                ),
                SizedBox(width: 15),
                Checkbox(
                  activeColor: Colors.transparent,
                  checkColor: LightColors.orangeColor,
                  side: BorderSide(color: Color(0xFFE8EAED)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  value: state.isPicUp,
                  onChanged: (value) => itemCubit.handelisPickUp(),
                ),
                Text('Pick up'),
                Spacer(),
                Checkbox(
                  activeColor: Colors.transparent,
                  checkColor: LightColors.orangeColor,
                  side: BorderSide(color: Color(0xFFE8EAED)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  value: state.isDelivery,
                  onChanged: (value) => itemCubit.handelisDelivery(),
                ),
                Text('Delivery'),
              ],
            ),
          ],
        );
      },
    );
  }
}
