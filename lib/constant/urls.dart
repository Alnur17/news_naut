


class Urls{
 // static const String apiKey = 'a84f185b98954f73bfadede65e6e435f';b534a9f07b044a3ea133b2c90712c7f5
  static const String apiKey = '9e92677796a64e58a96b99d897200d90';
  static const String baseUrl = 'https://newsapi.org/v2';
  static const String everything = '$baseUrl/everything?q=all&sortBy=publishedAt&apiKey=$apiKey';
  static const String relevancy = '$baseUrl/everything?q=all&sortBy=relevancy&apiKey=$apiKey';
  static String searching(String query) => '$baseUrl/everything?q=$query&sortBy=publishedAt&apiKey=$apiKey';
}





