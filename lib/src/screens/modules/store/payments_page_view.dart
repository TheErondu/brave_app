import 'package:brave/src/components/custom_bottom_sheet.dart';
import 'package:brave/src/components/default_appbar.dart';
import 'package:brave/src/screens/modules/store/bills_payment_screen.dart';
import 'package:brave/src/screens/modules/store/levies_screen.dart';
import 'package:flutter/material.dart';

class PaymentsPageView extends StatefulWidget {
  const PaymentsPageView({super.key});

  @override
  State<PaymentsPageView> createState() => _PaymentsPageViewState();
}

class _PaymentsPageViewState extends State<PaymentsPageView>
    with TickerProviderStateMixin {
  final List<Widget> payments = [
    const LeviesPaymentScreen(),
    const BillsPaymentScreen()
  ];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: payments.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: "Payments",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(40),
                    shape: BoxShape.rectangle),
                labelColor: Theme.of(context).colorScheme.onSecondary,
                unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                labelStyle: Theme.of(context).textTheme.displayMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.displayMedium,
                controller: _tabController,
                overlayColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent;
                  }
                  if (states.contains(MaterialState.focused)) {
                    return Colors.transparent;
                  } else if (states.contains(MaterialState.hovered)) {
                    return Colors.transparent;
                  }
                  return Colors.transparent;
                }),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Tab(
                      text: "Levies",
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Tab(text: "Bills"))
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: payments),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const SizedBox(
            child: Icon(Icons.add),
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CustomBotttomSheet();
                });
          }),
    );
  }
}
