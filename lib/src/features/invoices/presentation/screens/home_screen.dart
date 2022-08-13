import 'package:dotted_border/dotted_border.dart';
import 'package:easyinvoice/src/features/invoices/presentation/widgets/invoice_status_tag.dart';
import 'package:easyinvoice/src/features/invoices/presentation/widgets/recent_activity_tile.dart';
import 'package:easyinvoice/src/features/invoices/presentation/widgets/revenue_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest"),
        leading: const Icon(Iconsax.notification),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: const RevenueChart(),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          maxRadius: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple.withOpacity(0.2),
                          maxRadius: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple.withOpacity(0.2),
                          maxRadius: 4,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Recent Clients",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: const Text("SHOW ALL")),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          padding: const EdgeInsets.all(16),
                          strokeWidth: 2,
                          dashPattern: const [4,8],
                          strokeCap: StrokeCap.round,
                          color: Colors.grey,
                          child: const Icon(Icons.add),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: CircleAvatar(
                          minRadius: 30,
                          backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=13"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: CircleAvatar(
                          minRadius: 30,
                          backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=17"),
                        ),
                      ),
                      /*
                      Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: NetworkImage("https://i.pravatar.cc/150?img=8"))
                        ),
                      ),

                       */
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Recent Activity",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        TextButton(onPressed: () {}, child: const Text("SHOW ALL")),
                      ],
                    ),
                  ),
                  const RecentActivityTile(status: InvoiceStatus.Pending, delayInMs: 0),
                  const RecentActivityTile(status: InvoiceStatus.Pending, delayInMs: 1000),
                  const RecentActivityTile(status: InvoiceStatus.Overdue, delayInMs: 2000),
                  const RecentActivityTile(status: InvoiceStatus.Paid, delayInMs: 1500),
                ],
              )
            ],
          )),
    );
  }
}
