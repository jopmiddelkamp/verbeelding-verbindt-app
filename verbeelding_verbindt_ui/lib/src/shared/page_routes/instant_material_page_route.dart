import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class InstantMaterialPageRoute extends MaterialPageRoute {
  InstantMaterialPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => 0.milliseconds;
}
