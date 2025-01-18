```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the potential for non-map JSON
      final jsonMap = jsonDecode(response.body);
      if (jsonMap is Map<String, dynamic>) {
        final name = jsonMap['name'] as String?; // Safe cast and null check
        print('Name: $name');
      } else {
        print('Error: JSON response is not a map');
      }
    } else {
      throw Exception('Failed to load data: Status code ${response.statusCode}'); // More informative exception
    }
  } on FormatException catch (e) {
    print('Error: Invalid JSON format: $e');
  } on http.ClientException catch (e) {
    print('Error: Network error: $e');
  } catch (e) {
    print('Error: Unexpected error: $e');
  }
}
```