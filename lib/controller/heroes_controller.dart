import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

class HeroesController extends ResourceController {
  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @Operation.get()
  Future<Response> getAllHeroes() async => Response.ok(_heroes);

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final hero =
        _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
    return (hero == null) ? Response.notFound() : Response.ok(hero);
  }
}
