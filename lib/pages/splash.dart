import 'package:cosmoventure/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return _bodyWidget();
  }

  _bodyWidget() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image(image: AssetImage(AppImages.splashImage)),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: const [
                Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Embark on a Cosmic Journey, Beyond the Stars...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Galaxies await your touch",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Powered By Quadra_madestan",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
