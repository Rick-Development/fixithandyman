import 'package:fixithandyman/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:fixithandyman/views/transaction_summary_screen.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = List.generate(
    10,
    (index) => {
      'time': 'Today, 5:20pm',
      'amount': '₦20,000.00',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Client Paid',style: TextStyle(
              color: AppConstants.primaryColor
            ),),
            subtitle: Text(transactions[index]['time']!,style: TextStyle(
              color: AppConstants.primaryColor
            ),),
            trailing: Text(transactions[index]['amount']!,
            style: TextStyle(
              color: AppConstants.primaryColor
            ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionSummaryScreen(
                          amount: transactions[index]['amount']!,
                          time: transactions[index]['time']!,
                        )),
              );
            },
          );
        },
      ),
    );
  }
}
