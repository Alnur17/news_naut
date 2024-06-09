import '../models/profile_category.dart';

const String defaultImage =
    'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png';

List<String> categories = [
  'Technology',
  'Business',
  'Health',
  'Entertainment',
  'Sports',
  'General',
  'Science'
];

final List<ProfileCategory> items = [
  ProfileCategory(
    title: 'Security',
    subtitle: 'Check out the details here',
    image: 'assets/icons/Security.png',
  ),
  ProfileCategory(
    title: 'About',
    subtitle: 'Know more about the app',
    image: 'assets/icons/About.png',
  ),
];
