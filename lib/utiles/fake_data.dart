import 'package:search_insta/models/user.dart';

class FakeData {
  static List<User> generateFakeUser() {
    return [
      User("Fatane Rahimi", "@fatan", "assets/imgs/1.jpg", true),
      User("Jordi Esppinosa", "@Jordi", "assets/imgs/2.jpg", false),
      User("Pavel kosove", "@Pavel", "assets/imgs/3.jpg", false),
      User("Kimsone Doave", "@kimson", "assets/imgs/4.jpg", false),
      User("Kiril Banbalov", "@k_banbalov", "assets/imgs/5.jpg", false),
      User("Ayo Ogunseinde", "@ayo", "assets/imgs/6.jpg", false),
      User("Michael Dam", "@M.dam", "assets/imgs/7.jpg", false),
      User("Androw Tova", "@androw.tovar", "assets/imgs/8.jpg", false),
      User("Yoan Boyer", "@y_boyer", "assets/imgs/9.jpg", false),
      User("Elena Zhukova", "@elena_zh", "assets/imgs/10.jpg", false),
      User("Mark Wallace", "@mark_w", "assets/imgs/11.jpg", false),
      User("Sophia Loren", "@soph_l", "assets/imgs/12.jpg", false),
      User("John Doe", "@john_d", "assets/imgs/13.jpg", false),
      User("Alexandra Johnson", "@alex_j", "assets/imgs/14.jpg", false),
      User("Oliver Smith", "@oliver_s", "assets/imgs/15.jpg", false),
    ];
  }
}
