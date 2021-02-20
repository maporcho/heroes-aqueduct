import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

class HeroesController extends Controller {
  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    if(request.path.variables.containsKey('id')) {
      final id = int.parse(request.path.variables['id']);
      final hero = _heroes.firstWhere((hero) => hero['id'] == id);
      return (hero == null) ? Response.notFound() : Response.ok(hero);
    }
    return Response.ok(_heroes);
  }

}