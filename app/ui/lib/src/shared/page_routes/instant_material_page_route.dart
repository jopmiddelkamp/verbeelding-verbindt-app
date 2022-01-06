import 'package:flutter/material.dart';

class InstantMaterialPageRoute extends MaterialPageRoute {
  InstantMaterialPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
