import 'package:flutter/material.dart';
import 'package:wasel_app/core/features/profile/custome_list_tilte.dart';
import 'package:wasel_app/core/features/profile/widget/cart_contanir.dart';

class ProfileInfoComponent extends StatelessWidget {
  const ProfileInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            CartContanir(
              child: Column(
                children: [
                  CustomeListTilte(onTap: () {}),
                  SizedBox(height: 8),
                  CustomeListTilte(
                    onTap: () {},
                    image: "assets/images/settings.svg",
                    title: "Settings",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CartContanir(
              child: Column(
                children: [
                  CustomeListTilte(
                    onTap: () {},
                    image: 'assets/images/withdrawal.svg',
                    title: 'Withdrawal History',
                  ),
                  SizedBox(height: 8),
                  CustomeListTilte(
                    onTap: () {},
                    image: "assets/images/receipt-outline.svg",
                    title: "Number of Orders",
                    icone: '29K',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CartContanir(
              child: CustomeListTilte(
                image: "assets/images/command.svg",
                title: "User Reviews",
                onTap: () {},
              ),
            ),
            SizedBox(height: 20),
            CartContanir(
              child: CustomeListTilte(
                image: "assets/images/logOut.svg",
                title: "Log Out",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
