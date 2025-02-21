import 'package:flutter/material.dart';

import '../../modules/evnent_map/event_map.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventMap(),
    );
  }
}
