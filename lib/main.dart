import 'package:basic_provider/gender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // TODO: lock device screen orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: add state provider
    return ChangeNotifierProvider<GenderProvider>(
      create: (_) => GenderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<GenderProvider>(
                    builder: (BuildContext context, genderProvider, _) => Text(
                      'Gender Picker',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: genderProvider.color,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Consumer<GenderProvider>(
                          builder: (BuildContext context, genderProvider, _) =>
                              GestureDetector(
                            onTap: () {
                              genderProvider.isMale = true;
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: genderProvider.maleColor,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icon_male.png",
                                    height: 80,
                                    color: genderProvider.maleColor,
                                  ),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: genderProvider.maleColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Consumer<GenderProvider>(
                          builder: (BuildContext context, genderProvider, _) =>
                              GestureDetector(
                            onTap: () {
                              genderProvider.isMale = false;
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: genderProvider.femaleColor,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icon_female.png",
                                    height: 80,
                                    color: genderProvider.femaleColor,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: genderProvider.femaleColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
