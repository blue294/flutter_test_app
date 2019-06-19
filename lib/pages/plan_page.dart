import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test_app/model/plan_meals.dart';
import 'package:flutter_test_app/utils/ColorExt.dart';
import 'package:firebase_database/firebase_database.dart';

class PlanPage extends StatefulWidget
{
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>
{
  List<PlanMeals> plans = [];
  final PlanMeals currentlyPan = null;
  final databaseReference = FirebaseDatabase.instance.reference().child('plans');

  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      PlanMeals plan = new PlanMeals.fromSnapshot(snapshot);
      debugPrint("XXXXX LLLLL" + plan.name);
      plans.add(plan);
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint("XXXXX LLLLL");
    plans = new List();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    debugPrint("XXXXX LLLLL");
    return Scaffold
      (
        appBar: AppBar
          (
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('Plans', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
          actions: <Widget>
          [
            Container
              (
              margin: EdgeInsets.only(right: 8.0),
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Text('beclothed.com', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14.0)),
                  Icon(Icons.arrow_drop_down, color: Colors.black54)
                ],
              ),
            )
          ],
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            Container
            (
              child: Text('Your plan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            _buildCurrentlyPlan(
              PlanMeals("Balanced", "The classic healthy balanced diet", "", "", "Meaty plans", null, "#eb4f5e", " ", "", ""),
            ),
            Container
              (
              child: Text('High protein', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            _buildPlansSection(
               PlanMeals("High protein", "Plenty of protein-rich foods", "", "", "Meaty plans", null, "#eb4f5e", " ", "", ""),
            ),
            _buildPlansSection(
              PlanMeals("High protein", "Plenty of protein-rich foods", "", "", "Meaty plans", null, "#eb4f5e", " ", "", ""),
            ),
            _buildPlansSection(
              PlanMeals("High protein", "Plenty of protein-rich foods", "", "", "Meaty plans", null, "#eb4f5e", " ", "", ""),
            ),
            Container
              (
              child: Text('High protein', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            _buildPlansSection(
              PlanMeals("High protein", "Plenty of protein-rich foods", "", "", "Meaty plans", null, "#eb4f5e", " ", "", ""),
            ),
            _buildPlansSection(
              PlanMeals("High protein", "Plenty of protein-rich foods", "", "", "Meaty plans", null, "#eb4f5e", " ", "", ""),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 20.0),
            StaggeredTile.extent(2, 160.0),
            StaggeredTile.extent(2, 20.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(2, 20.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(1, 200.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

  Widget _buildTileWithBackgroundColor(Widget child, Color backgroundColor, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        color: backgroundColor,
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

  Widget _buildCurrentlyPlan(PlanMeals plan, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        color: Color.fromARGB(255, 247, 115, 171),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child:
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text(plan.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0)),
                        Text(plan.description, style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 13.0)),
                        new RaisedButton(
                            child: new Text("View plan"),
                            color: Colors.white,
                            onPressed: _onPressViewPlan,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                        )
                      ],
                    ),
                    Image.asset(
                      'images/meat.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ]
              ),
            ),
        )
    );
  }

  Widget _buildPlansSection(PlanMeals plan, {Function() onTap}) {
    return Material (
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        color: HexColor(plan.backgroundColor),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child:
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Text(plan.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0), textAlign: TextAlign.center,),
                    Text(plan.description, style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 13.0), textAlign: TextAlign.center),
                    Image(
                      image: new AssetImage("images/meat.png"),
                      width: 72,
                      height: 72,
                      color: null,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    )
                  ]
              ),
            ),
        )
    );
  }
  void _onPressViewPlan () {

  }
}