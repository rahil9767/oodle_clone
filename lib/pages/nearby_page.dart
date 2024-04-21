import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oodle/utils/colour.dart';
import '../reusable_widgets/interest_options.dart';
import '../reusable_widgets/mood_options.dart';
import '../test_api_req/api_request.dart';


class NearbyPage extends StatefulWidget {
  const NearbyPage({Key? key}) : super(key: key);

  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  final UserFetcher _userFetcher = UserFetcher();
  bool switchValue = true;
  List<Map<String, dynamic>> users = [];
  String? _selectedDropdownOption;
  List<Interest> selectedInterests = [];

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget initializes
  }

  Future<void> _fetchUserData() async {
    await _userFetcher.fetchUser();
    setState(() {
      users = _userFetcher.users;
    });
  }

  void addSelectedInterest(Interest interest) {
    setState(() {
      selectedInterests.add(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _fetchUserData,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: MyColors.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "OodLe",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          CupertinoIcons.bell_circle_fill,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Show my card',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          CupertinoSwitch(
                            value: switchValue,
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            },
                            trackColor: Colors.amber,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: switchValue,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.9,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: MyColors.gradientColors,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "What's your mood ? \n Share whats on your mind",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: moodoptions.length,
                                            itemBuilder: (context, index) {
                                              final option = moodoptions[index];
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color:Colors.white.withOpacity(0.3)
                                                  ),
                                                  child: ListTile(
                                                    title: Text(
                                                      option.name,
                                                      style: const TextStyle(color: Colors.white),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedDropdownOption = option.name;
                                                      });
                                                      Navigator.pop(context);
                                                      _userFetcher.updateSelectedOption(index, option.name);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ).then((value) {
                            setState(() {
                              // Update UI based on the selected option or any other logic
                            });
                          });
                        },
                        child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "What's your mood",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    CupertinoIcons.chevron_down,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: switchValue,
                    child: Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _userFetcher.users.length,
                          itemBuilder: (context, index) {
                            final user = _userFetcher.users[index];
                            final name = user['name']['first'];
                            final imageUrl = user['picture']['thumbnail'];
                            final selectedOption = user['selectedOption'];
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 60,
                                left: 10,
                                right: 10,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.width * 0.8,
                                    width: MediaQuery.of(context).size.width * 2.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.transparent,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 100,
                                            padding: EdgeInsets.symmetric(vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              '$selectedOption',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 100),
                                            child: Wrap(
                                              spacing: 8.0,
                                              runSpacing: 8.0,
                                              children: selectedInterests.map((interest) {
                                                return Chip(
                                                  label: Text(interest.name),
                                                  // Customize Chip appearance as needed
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -50,
                                    left: 10,
                                    child: CircleAvatar(
                                      radius: 75,
                                      backgroundImage: NetworkImage(
                                        imageUrl, // Placeholder image
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 110,
                                    left: 25,
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}