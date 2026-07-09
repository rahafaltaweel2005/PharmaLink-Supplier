import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_link_supplier/features/auth/domain/entity/user_role.dart';
import 'package:pharma_link_supplier/features/dashboard/presentation/dashboard/view/dashboard_screen.dart';
import 'package:pharma_link_supplier/features/inventory/presentation/getMainInventory/view/get_main_inventory_screen.dart';

import '../../../../core/constant/color_const.dart';
import '../../../../core/constant/svg_const.dart';
import '../../../auth/presentation/profile/view/profile_screen.dart';
import '../../../auth/presentation/register/view/register_screen.dart';
import '../../../medicine/presentation/getMedicine/view/get_medicines_screen.dart';
import '../../../order/presentation/getMyOrder/view/get_my_order_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserRole role;

  const HomeScreen({super.key, required this.role});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Widget> pages;
  late final List<BottomNavigationBarItem> items;
  int currentIndex = 0;

  @override
  void initState() {
    widget.role == UserRole.admin
        ? {
            pages = [
              const GetMainInventoryScreen(),
              const GetMedicinesScreen(),
              const RegisterScreen(),
              const DashboardScreen(),
            ],
            items = [
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_outlined),
                label: 'inventory',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medication_outlined),
                label: 'Medicine',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1_outlined),
                label: 'Create Supplier',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.space_dashboard_outlined),
                label: 'Dashboard',
              ),
            ],
          }
        : {
            pages = [const GetMyOrderScreen(), const ProfileScreen()],
            items = const [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(SvgConst.pharmaLinkLogo, width: 28, height: 28),
            const SizedBox(width: 10),
            const Text("PharmaLink"),
          ],
        ),
        centerTitle: false,
      ),

      body: IndexedStack(index: currentIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        selectedItemColor: ColorConst.primary,
        unselectedItemColor: ColorConst.neutral,
        showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}
