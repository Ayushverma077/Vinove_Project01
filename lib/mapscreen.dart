import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_map/const/name.dart';
import 'package:my_map/const/user.dart';
import 'package:my_map/screen/allmember.dart';
import 'package:my_map/screen/drawer.dart';

class MapScreen extends StatefulWidget {
  bool isMap;
  MapScreen({super.key, this.isMap = true});

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(30.1759, 78.1242),
    zoom: 16.0,
    tilt: 45.0,
    bearing: 90.0,
  );

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  List<Marker> _marker = [];

  List<Marker> _list = [
    Marker(
      markerId: MarkerId('2'),
      infoWindow: InfoWindow(
        title: UserRepo.userModels[0].name,
      ),
      position: LatLng(
          UserRepo.userModels[0].latitude, UserRepo.userModels[0].longitude),
    ),
    Marker(
      markerId: MarkerId('3'),
      infoWindow: InfoWindow(title: UserRepo.userModels[1].name),
      position: LatLng(
          UserRepo.userModels[1].latitude, UserRepo.userModels[1].longitude),
    ),
    Marker(
      markerId: MarkerId('4'),
      infoWindow: InfoWindow(title: UserRepo.userModels[2].name),
      position: LatLng(
          UserRepo.userModels[2].latitude, UserRepo.userModels[2].longitude),
    ),
  ];

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
    get();
  }

  get() {
    getCurrentLocation().then((val) async {
      _marker.add(Marker(
        markerId: MarkerId("10"),
        position: LatLng(val.latitude, val.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: "My Current Location"),
      ));
      CameraPosition cameraPosition =
          CameraPosition(target: LatLng(val.latitude, val.longitude), zoom: 16);
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getCurrentLocation().then((val) async {
            _marker.add(Marker(
              markerId: MarkerId("10"),
              position: LatLng(val.latitude, val.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              infoWindow: InfoWindow(title: "My Current Location"),
            ));
            CameraPosition cameraPosition = CameraPosition(
                target: LatLng(val.latitude, val.longitude), zoom: 16);
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: Icon(Icons.gps_fixed),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "ATTENDANCE",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: widget.isMap
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.04,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        child: Icon(
                          Icons.people,
                          size: screenWidth * 0.05,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        "All Members",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchMemberScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controler) {
                      _controller.complete(controler);
                    },
                    initialCameraPosition: MapScreen._initialCameraPosition,
                    markers: Set<Marker>.of(_marker),
                  ),
                ),
                Container(
                  height: screenHeight * 0.1,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isMap = !widget.isMap;
                          });
                        },
                        child: Text(
                          "Show List View",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchMemberScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: screenHeight * 0.03,
                          width: screenHeight * 0.03,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/four.jpg"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.04,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        child: Icon(
                          Icons.people,
                          size: screenWidth * 0.05,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        "All Members",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Change",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Expanded(
                  child: ListView.builder(
                    itemCount: ConstData.name.length,
                    itemBuilder: (context, index) {
                      return CustomCard(index);
                    },
                  ),
                ),
                Container(
                  height: screenHeight * 0.1,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isMap = !widget.isMap;
                          });
                        },
                        child: Text(
                          "Show Map View",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget CustomCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                backgroundImage: AssetImage("assets/images/saurabh.png"),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Text(
                ConstData.name[index],
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(
                Icons.calendar_month,
                size: MediaQuery.of(context).size.width * 0.07,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                },
                child: Icon(
                  Icons.gps_fixed,
                  color: Colors.purple,
                  size: MediaQuery.of(context).size.width * 0.07,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
