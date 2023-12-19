import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

//gratitude Page in stf to manage state
class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  //Constructor with the value of radioGrouValue as required
  const Gratitude({Key? key, required this.radioGroupValue}) : super(key : key);

  @override
  State<Gratitude> createState() => _GratitudeState();
}

//Gratitude page states
class _GratitudeState extends State<Gratitude> {

  List<String> gratitudeList = <String>[];
  String? _selectedGratitude;
  late int? _radioGroupValue;

  final Logger _logger = Logger('MyApp'); //Logger initialising for debuging

  //the method to call one radio was checked
  void radioOnChanged(int? index){
    setState(() {
      _radioGroupValue = index;

      //vérifier si index est non null avant d'accéder à gratitudeList[index]
      if(index != null && index < gratitudeList.length){
        _selectedGratitude = gratitudeList[index];
        _logger.info('_selectedRadioValue $_selectedGratitude');
      }
      else{
        //Gérer le cas où index est nul ou hors des limites de la liste
        _selectedGratitude = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();

    gratitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratitude'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio(
                value: 0, 
                groupValue: _radioGroupValue, 
                onChanged: (index) => radioOnChanged(index),
              ),
              const Text('Family'),
              Radio(
                value: 1, 
                groupValue: _radioGroupValue, 
                onChanged: (index) => radioOnChanged(index),
                ),
              const Text('Friends'),
              Radio(
                value: 2, 
                groupValue: _radioGroupValue, 
                onChanged: (index) => radioOnChanged(index),
                ),
              const Text('Coffee'),
            ],
          ),
          ),
        ),
    );
  }
}