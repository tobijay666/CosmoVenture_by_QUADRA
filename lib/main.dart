import 'package:cosmoventure/presentaion/pages/chat.dart';
import 'package:cosmoventure/presentaion/pages/discover.dart';
import 'package:cosmoventure/presentaion/pages/home.dart';
import 'package:cosmoventure/presentaion/pages/search.dart';
import 'package:cosmoventure/presentaion/pages/settings.dart';
import 'package:cosmoventure/presentaion/pages/splash.dart';
import 'package:cosmoventure/utils/app_colors.dart';
import 'package:cosmoventure/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            displayMedium: GoogleFonts.roboto(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
            displaySmall: GoogleFonts.roboto(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            headlineMedium: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            headlineSmall: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            titleLarge: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            bodyMedium: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            labelLarge: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        home: SplashScreen());
  }
}

class MyHomePage extends StatefulWidget {
  late int index;
  MyHomePage({Key? key, required this.index}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final screens = const [
    ChatScreen(),
    SearchScreen(),
    HomeScreen(),
    DiscoverScreen(),
    SettingScreen()
  ];
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[widget.index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
        child: CurvedNavigationBar(
          key: navigationKey,
          animationDuration: const Duration(milliseconds: 300),
          height: 60,
          color: AppColors.whiteColor,
          backgroundColor: AppColors.black2,
          buttonBackgroundColor: AppColors.outlineColor,
          items: const <Widget>[
            Icon(Icons.message, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.explore, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          index: widget.index,
          onTap: (index) {
            setState(() {
              widget.index = index;
            });
            //Handle button tap
          },
        ),
      ),
    );
  }
}
