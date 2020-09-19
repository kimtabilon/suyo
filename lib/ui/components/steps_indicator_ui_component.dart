import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart' as SI;
import 'package:suyo/ui/components/constants_ui_component.dart';

class StepsIndicator extends StatelessWidget {
   final int selectedStep;
   final int nbSteps;

   StepsIndicator({this.selectedStep, this.nbSteps});

  @override
  Widget build(BuildContext context) {
    return SI.StepsIndicator(
      selectedStep: selectedStep,
      nbSteps: nbSteps,
      selectedStepColorOut: themeColorMeds,
      selectedStepColorIn: Colors.transparent,
      doneStepColor: themeColorMart,
      unselectedStepColor: themeColorGo,
      doneLineColor: themeColorMart,
      undoneLineColor: themeColorEats,
      isHorizontal: true,
      lineLength: 40,
      lineThickness: 2,
      doneStepSize: 10,
      unselectedStepSize: 10,
      selectedStepSize: 14,
      selectedStepBorderSize: 1,
      /*doneStepWidget: Container(child: Text('DoS'),), // Custom Widget
      unselectedStepWidget: Container(child: Text('UnS'),), // Custom Widget
      selectedStepWidget: Container(child: Text('SeS'),), // Custom Widget*/
    );
  }
}
