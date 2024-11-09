import 'package:flutter/material.dart';

class SearchMemberScreen extends StatefulWidget {
  @override
  _SearchMemberScreenState createState() => _SearchMemberScreenState();
}

class _SearchMemberScreenState extends State<SearchMemberScreen> {
  final List<String> _members = ["amisha", "srishti", "sanchit"];
  List<String> _filteredMembers = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMembers = _members;
  }

  void _filterMembers(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredMembers = _members;
      });
    } else {
      setState(() {
        _filteredMembers = _members
            .where(
                (member) => member.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Search Members',
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterMembers(value);
              },
              decoration: InputDecoration(
                hintText: 'Search Member',
                prefixIcon: Icon(Icons.search, size: screenWidth * 0.07),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMembers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _filteredMembers[index],
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                    leading: CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundImage: AssetImage("assets/images/saurabh.png"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
