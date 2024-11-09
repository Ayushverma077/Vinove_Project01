import 'package:flutter/material.dart';
import 'package:my_map/const/name.dart';
import 'package:my_map/screen/drawer.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "ATTENDANCE",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 56, 227),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: ConstData.name.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCard(index),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }

  Widget arrow(String image) {
    return Container(
      height: 30,
      width: 30,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image))),
    );
  }

  Widget CustomCard(int index) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              ConstData.name[index],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 150,
            ),
            Icon(
              Icons.calendar_month,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              size: 28,
              Icons.gps_fixed,
              color: Colors.purple,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    arrow(ConstData.images[0]),
                    Text(
                      "9:30 , AM",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
