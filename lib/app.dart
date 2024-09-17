import 'package:flutter/material.dart';
import 'package:search_insta/models/user.dart';
import 'package:search_insta/utiles/colors.dart';
import 'package:search_insta/utiles/fake_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        img: 'assets/logo/logo.png',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.img,
  });
  final String img;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _users = FakeData.generateFakeUser();
  List<User> _userFilter = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _userFilter = _users;
    });
  }

  void _toogleFollowBtn(User user) {
    setState(() {
      user.isFollowed = !user.isFollowed;
    });
  }

  void _filtredList(String value) {
    setState(() {
      _userFilter = _users
          .where(
              (user) => user.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 155, 155),
        centerTitle: true,
        title: const SizedBox(
          width: 100,
          child: Image(
            image: AssetImage("assets/logo/logo.png"),
          ),
        ),
        elevation: 8,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 90,
              decoration:
                  const BoxDecoration(color: Color(MyColors.primaryColor)),
              child: TextField(
                onChanged: (value) => _filtredList(value),
                decoration: InputDecoration(
                  hintText: "Tap to search ...",
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 65, 64, 64),
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(71, 221, 221, 221),
                ),
              ),
            ),
            const Text(
              'Friends you may know',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _userFilter.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FreindsCard(
                    user: _userFilter[index],
                    onPressed: () => _toogleFollowBtn(_userFilter[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FreindsCard extends StatelessWidget {
  const FreindsCard({
    super.key,
    required this.user,
    required this.onPressed,
  });
  final User user;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 246, 245),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(user.profile),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  user.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * .2,
              decoration: BoxDecoration(
                color: user.isFollowed ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    user.isFollowed ? "UnFollow" : "Follow",
                    style: TextStyle(
                        color: user.isFollowed ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
