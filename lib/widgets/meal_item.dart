import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  }) : super(key: key);

  String get complexityText {
    if (complexity == Complexity.Simple){
      return 'Simple';
    }
    if (complexity == Complexity.Challenging){
      return 'Challenging';
    }
    if (complexity == Complexity.Hard){
      return 'Hard';
    }
    else {
      return 'Unknown';
    }
  }

  String get affordabilityText {
    switch(affordability) {
      case Affordability.Affordable:
      return 'Affordable';
      break;
      case Affordability.Pricey:
      return 'Pricey';
      break;
      case Affordability.Luxurious:
      return 'Luxurious';
      break;
      default:
      return 'Unknown';
      break;
    }
  }

  void selectMeal (BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(title, style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ] ,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Row(children: <Widget>[
                    const Icon(Icons.schedule,),
                    const SizedBox(width: 6,),
                    Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    const Icon(Icons.work,),
                    const SizedBox(width: 6,),
                    Text('$complexity'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    const Icon(Icons.attach_money,),
                    const SizedBox(width: 6,),
                    Text('$affordability'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}