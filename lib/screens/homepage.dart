import 'package:flutter/material.dart';

import '../components/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Text(
                    "Covid 19",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(
                    Icons.add_location,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    size: size,
                    title: "Loacal Deaths",
                    color: Colors.red,
                    value: 2256,
                  ),
                  CustomContainer(
                    size: size,
                    title: "Total Recovered",
                    color: Colors.green,
                    value: 1560,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    size: size,
                    title: "Active Cases",
                    color: Colors.blue,
                    value: 2256,
                  ),
                  CustomContainer(
                    size: size,
                    title: "Total Cases",
                    color: Colors.orange,
                    value: 1560,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
