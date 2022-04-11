import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  //file = File('/assets/suss.json');
  // we can also write a code to generate a bearer everytime we run the code
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer "Bearer-should-be-replaced-here-along-with-double-inverted-comas"',
  };
  var params = {
    'fields': 'name,tracks(total),followers(total)',
    //these fileds should be edited and we can added the parameters which we need to get what we want
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
  // I had added some of my playlists to get an idea
  var url1 = Uri.parse(
      'https://api.spotify.com/v1/playlists/0eYa7x9rNE3kuKve4dfOV7?$query'); //You
  var url2 = Uri.parse(
      'https://api.spotify.com/v1/playlists/1B8bcQz65Pjhd5DTc5cQaZ?$query'); //dancing with your long lost love
  var url3 = Uri.parse(
      'https://api.spotify.com/v1/playlists/23BliEjdvxhphQ1PCxNKfi?$query'); //james&alyssa
  var url4 = Uri.parse(
      'https://api.spotify.com/v1/playlists/2PpwIA5slwJAb8rFcKwtPu?$query'); //MAGNESIUM
  var url5 = Uri.parse(
      'https://api.spotify.com/v1/playlists/6xa5r0NstnF3g51MLzg5Cp?$query'); //Telugu songs
  var url6 = Uri.parse(
      'https://api.spotify.com/v1/playlists/4bW2mF404vsOdYpGq1JqM0?$query'); //Douple
  var res1 = await http.get(url1, headers: headers);
  var res2 = await http.get(url2, headers: headers);
  var res3 = await http.get(url3, headers: headers);
  var res4 = await http.get(url4, headers: headers);
  var res5 = await http.get(url5, headers: headers);
  var res6 = await http.get(url6, headers: headers);
  print(res1.statusCode);
  print(res1.body);
  print(res2.body);
  print(res3.body);
  print(res4.body);
  print(res5.body);
  print(res6.body);
  if (res1.statusCode == 200) {
    var x1 = jsonEncode(jsonDecode(res1.body));
    var x2 = jsonEncode(jsonDecode(res2.body));
    var x3 = jsonEncode(jsonDecode(res3.body));
    var x4 = jsonEncode(jsonDecode(res4.body));
    var x5 = jsonEncode(jsonDecode(res5.body));
    var x6 = jsonEncode(jsonDecode(res6.body));
    //print(x1);
    File('assets/suss.json').writeAsStringSync('{ "items": [' + '$x1');
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x2', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x3', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x4', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x5', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x6' + ']}', mode: FileMode.append);
  } else if (res1.statusCode != 401) {
    throw Exception('http.get error: statusCode= ${res1.statusCode}');
  }
}
  //print(x);
  //print(x['followers']['total']);
  //Map<String, dynamic> dat = jsonDecode(res.body);
  //songs = '${dat['total']}';
  //print(songs);
  
