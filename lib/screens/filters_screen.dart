import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function savFilters;
  Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.savFilters, {Key key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan  = false;
  var _lactose = false;

  Widget buildSwitchList (String state, bool val, String substate, Function updateValue) {
    return SwitchListTile(
      title: Text(state),
      value: val,
      subtitle: Text(substate),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactose = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactose,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };widget.savFilters(selectedFilters);
            },
            icon: const Icon(Icons.save)
            ),
        ],
        ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal Selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              buildSwitchList(
                "Gluten-Free",
                _glutenFree,
                "Only Include Gluten Free Food",
                (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }
              ),
              buildSwitchList(
                "Vegetarian",
                _vegetarian,
                "Only Include Vegetarian Food",
                (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }
              ),
              buildSwitchList(
                "Vegan",
                _vegan,
                "Only Include Vegan Food",
                (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }
              ),
              buildSwitchList(
                "Lactose-Free",
                _lactose,
                "Only Include Lactose Free Food",
                (newValue) {
                setState(() {
                  _lactose = newValue;
                });
              }
              ),
            ],
          ))
      ]),
    );
  }
}