import 'dart:convert';
import 'package:http/http.dart' as http;

class UserFetcher {
  List<Map<String, dynamic>> users = [];

  Future<void> fetchUser() async {
    print("fetch user data");
    final url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final List<dynamic> results = json["results"];

    users.clear();

    results.forEach((result) {
      final Map<String, dynamic> user = {
        "name": {
          "first": result["name"]["first"],
          "last": result["name"]["last"],

        },
        "picture": {
          "thumbnail": result["picture"]["thumbnail"],
        },
        // Add a selected option property with a default value
        "selectedOption": "Default Option",
      };

      users.add(user);
    });

    print("Fetch Data Completed");
  }

    // Method to update the selected option for a user
  void updateSelectedOption(int index, String option) {
    if (index >= 0 && index < users.length) {
      users[index]["selectedOption"] = option;
    }
  }
}
