
import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

///
/// Show a list of options that user can use for customize the meals that they
/// would like to see.
/// For example glutenFree, etc...
///
class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function(Map<String, bool>) applyfilter;
  final Map<String, bool> currentfilter;

   FilterScreen(this.applyfilter, this.currentfilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();

}

class _FilterScreenState extends State<FilterScreen>{

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    super.initState();
    _glutenFree = widget.currentfilter['gluten']!;
    _lactoseFree = widget.currentfilter['lactose']!;
    _vegetarian = widget.currentfilter['vegetarian']!;
    _vegan = widget.currentfilter['vegan']!;

  }

  Widget _buildSwitchListTile(String title, String description, bool currentVal, Function(bool) updateValue){

    return SwitchListTile(
      title:  Text(title),
      subtitle:  Text(description),
      value: currentVal,
      onChanged: updateValue

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
              onPressed:(){
                final selectedfilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian
    };
                widget.applyfilter(selectedfilter);
              },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
            style: Theme.of(context).textTheme.headline6
            ),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten-free',
                      'Only includes gluten-free meals.',
                      _glutenFree,
                      (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only includes lactose-free meals.',
                    _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only includes vegetarian meals.',
                    _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only includes vegan meals.',
                    _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }

}



























