import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nemo_home/config.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClayContainer(
                  height: 40,
                  width: 40,
                  borderRadius: 10,
                  color: primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Living Room',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ClayContainer(
                  height: 40,
                  width: 40,
                  borderRadius: 10,
                  color: primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 140,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: ClayContainer(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.7,
                    borderRadius: 12,
                    color: primaryColor,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          activeColor1,
                          activeColor2,
                        ]),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: ListTile(
                          leading: Icon(
                            Icons.tablet,
                            color: Colors.white,
                            size: 34,
                          ),
                          title: Text(
                            'Air Conditioner',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          subtitle: Text(
                            'Panasonic CS-VC154KV',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: ClayContainer(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.7,
                    borderRadius: 12,
                    color: primaryColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: ListTile(
                          leading: Icon(
                            Icons.tv,
                            color: Colors.white,
                            size: 34,
                          ),
                          title: Text(
                            'Smart TV',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          subtitle: Text(
                            'Sony Bravia ED-45REV',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ClayContainer(
            height: 200,
            width: 200,
            color: primaryColor,
            borderRadius: 200,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      progressBarColors: gradientColors,
                      hideShadow: true,
                      shadowColor: Colors.transparent,
                    ),
                    infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                        modifier: (double value) {
                          final roundedValue =
                              value.ceil().toInt().toString();
                          return '$roundedValue \u2103';
                        }),
                  ),
                  onChange: (double value) {
                    print(value);
                  }),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Fan Speed',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 18),
          Slider(
            min: 0.0,
            max: 5.0,
            divisions: 5,
            activeColor: activeColor2,
            inactiveColor: Colors.black,
            value: _value,
            onChanged: (newValue) {
              setState(() {
                _value = newValue;
              });
            },
            label: _value.toString(),
          ),
          

          SizedBox(height: 18),
          Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.width * 0.4 + 32,
            child: StaggeredGridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              staggeredTiles: [
                StaggeredTile.count(2, 2),
                StaggeredTile.count(1, 1),
                StaggeredTile.count(1, 1),
                StaggeredTile.count(1, 1),
                StaggeredTile.count(1, 1),
                StaggeredTile.count(1, 1),
                StaggeredTile.count(1, 1),
              ],
              children: <Widget>[
                ClayContainer(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: primaryColor,
                  borderRadius: 12,
                  child: Center(
                    child: Icon(Icons.power_settings_new,
                        color: activeColor2, size: 80),
                  ),
                ),
                MenuItem(iconName: Icons.date_range),
                MenuItem(iconName: Icons.date_range),
                MenuItem(iconName: Icons.date_range),
                MenuItem(iconName: Icons.date_range),
                MenuItem(iconName: Icons.date_range),
                MenuItem(iconName: Icons.date_range),
              ],
            ),
          )
        ],
      ),
    );
  }

  String percentageModifier(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue 0x00B0 C';
  }
}

class MenuItem extends StatefulWidget {
  final IconData iconName;

  const MenuItem({Key key, this.iconName}) : super(key: key);
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: ClayContainer(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        borderRadius: 10,
        color: primaryColor,
        surfaceColor: isSelected ? activeColor2 : primaryColor,
        child: Icon(widget.iconName, color: Colors.white, size: 20),
      ),
    );
  }
}
