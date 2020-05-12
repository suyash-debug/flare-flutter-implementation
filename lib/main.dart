import 'package:flare_flutter/flare_actor.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'firstscreen.dart';

import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleHiddenDrawer(
        menu: Menu(),
        contentCornerRadius: 50.0,
        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;

          switch (position) {
            case 0:
              screenCurrent = FirstScreen();
              break;
            case 1:
              screenCurrent = Screen2();
              break;
            // case 2 : screenCurrent = Screen3(); break;
          }

          return Scaffold(
            // backgroundColor: backgroundColorContent,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    controller.toggle();
                  }),
            ),
            body: screenCurrent,
          );
        },
      ),
    );
  }
}

Widget Screen2() {
  return Scaffold(body: Container(color: Colors.green));
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: FlareActor(
                  'assets/girl.flr',
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain,
                  // animation: 'point2',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  elevation: 10,
                  splashColor: Colors.blue,
                  color: Colors.black87,
                  // shape: ShapeBorder(),

                  textColor: Colors.cyan,
                  onPressed: () {
                    SimpleHiddenDrawerProvider.of(context)
                        .setSelectedMenuPosition(0);
                  },
                  child: Text("Home"),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    elevation: 10,
                    splashColor: Colors.blue,
                    color: Colors.black87,
                    // shape: ShapeBorder(),

                    textColor: Colors.cyan,
                    onPressed: () {
                      SimpleHiddenDrawerProvider.of(context)
                          .setSelectedMenuPosition(1);
                    },
                    child: Text("Menu 2")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<ScreenHiddenDrawer> itens = new List();

//   @override
//   void initState() {
//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "Screen 1",
//           baseStyle:
//               TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
//           colorLineSelected: Colors.teal,
//         ),
//         FirstScreen()));

//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "Screen 2",
//           baseStyle:
//               TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
//           colorLineSelected: Colors.orange,
//         ),
//         SecondScreen()));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff170a55),
//       body: Stack(
//         children: <Widget>[
//           homeDrawer(),
//         ],
//       ),
//     );
//   }

//   Widget SecondScreen() {
//     return Scaffold(
//       body: Center(
//         child: Text('Second Page'),
//       ),
//     );
//   }

//   Widget homeDrawer() {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Color(0xffff170a45),
//       backgroundColorAppBar: Colors.transparent,
//       screens: itens,
//       // typeOpen: TypeOpen.FROM_RIGHT,
//       enableScaleAnimin: true,
//       enableCornerAnimin: true,
//       //    slidePercent: 80.0,
//       //    verticalScalePercent: 80.0,
//       contentCornerRadius: 50.0,
//       iconMenuAppBar: Icon(Icons.menu),
//       //  backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//       //  whithAutoTittleName: true,
//       styleAutoTittleName: TextStyle(color: Colors.red),
//       // actionsAppBar: <Widget>[],
//       backgroundColorContent: Colors.blue,
//       elevationAppBar: 4.0,
//       // tittleAppBar: Center(
//       //   child: Icon(Icons.ac_unit),
//       // ),
//       enableShadowItensMenu: true,
//       backgroundMenu: DecorationImage(
//           image: ExactAssetImage('assets/images/two.jpg'), fit: BoxFit.cover),
//     );
//   }
// }
