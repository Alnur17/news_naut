import '../models/profile_category.dart';

const defaultImage = 'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png';

final List<ProfileCategory> items = [
 ProfileCategory(
  title: 'Profile',
  subtitle: 'Edit your profile here!',
  image: 'assets/icons/Edit.png',
 ),

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