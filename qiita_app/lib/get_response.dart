import 'dart:convert';
import 'package:http/http.dart' as http;

Future main() async {
  const String apiUrl = 'https://qiita.com/api/v2/items';

  final response = await http.get(
    Uri.parse(apiUrl),
  );

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    final List<dynamic> limitedData = responseData.take(5).toList();

    // ignore: avoid_print
    print('取得結果: $limitedData');
  } else {
    // ignore: avoid_print
    print('リクエストに失敗しました。ステータスコード: ${response.statusCode}');
  }
}
