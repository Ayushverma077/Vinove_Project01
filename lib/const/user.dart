import 'package:my_map/const/userModel.dart';

class UserRepo {
  static List<UserModel> userModels = [
    UserModel(
      name: 'Amisha',
      lastSeen: "6:40 PM",
      firstSeen: "9:30 AM",
      isActive: true,
      latitude: 30.1916476176493,
      longitude: 78.16277353323018,
    ),
    UserModel(
      name: 'Srishti',
      lastSeen: "3:40 PM",
      firstSeen: "11:30 AM",
      isActive: false,
      latitude: 30.191010367823722,
      longitude: 78.16143213249892,
    ),
    UserModel(
      name: 'Sanchit',
      lastSeen: "8:40 PM",
      firstSeen: "10:30 AM",
      isActive: true,
      latitude: 30.192734585015735,
      longitude: 78.16017582122551,
    ),
  ];
}
