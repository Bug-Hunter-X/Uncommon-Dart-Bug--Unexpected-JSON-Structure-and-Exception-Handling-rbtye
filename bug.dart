```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response body is a JSON string
      final jsonData = jsonDecode(response.body);
      // Access data, but what if jsonData is not a map?
      final name = jsonData['name']; // potential error: jsonData might not be a Map
      print('Name: $name');
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e'); // Catches the exception, but what kind of exception?
  }
}
```