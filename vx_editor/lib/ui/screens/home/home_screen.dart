import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawerHeader(
                  child: Center(
                child: Text('Editor App '),
              )),
              Expanded(
                child: ListView(
                  children: const [
                    Text(
                      'Quản lý Sớ',
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Text(
                      'Khách hàng',
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                  ],
                ),
              ),
              Container(
                height: 40,
                color: Colors.amber.shade50,
                alignment: const Alignment(0.8, 0),
                child: const Text('Account'),
              )
            ],
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        Expanded(
          flex: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Quản lý sớ'),
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    showDetails = !showDetails;
                  });
                },
                icon: const Icon(Icons.directions_walk_sharp),
              ),
            ),
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        if (showDetails)
          Expanded(
            flex: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Sớ cầu an'),
              ),
            ),
          ),
      ],
    );
  }
}
