import 'package:covid_19/models/covid_data_model.dart';
import 'package:covid_19/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: service.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          CovidDataModel data = snapshot.data!;
          return SafeArea(
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
                        value: data.totalDeaths!.toInt(),
                      ),
                      CustomContainer(
                        size: size,
                        title: "Total Recovered",
                        color: Colors.green,
                        value: data.totalRecoverd!.toInt(),
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
                        value: data.activeCases!.toInt(),
                      ),
                      CustomContainer(
                        size: size,
                        title: "Total Cases",
                        color: Colors.orange,
                        value: data.totalCases!.toInt(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CupertinoActivityIndicator());
      },
    ));
  }
}
