import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextButton(
            child: Text('Show Modal Bottom Sheet'),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                barrierColor: Colors.black.withOpacity(.3),
                context: context,
                builder: (_) {
                  return Container(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 20),
                        Container(
                          height: 6,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Sort By",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 200),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
