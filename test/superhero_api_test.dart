import 'package:superhero_api/superhero_api.dart';
import 'package:test/test.dart';

void main() {
  String apiUrl = "";

  final SuperheroApi superheroApi = SuperheroApi(apiUrl);

  test('get heroes by default limit', () async {
    var res = await superheroApi.hero.getAll();

    expect(res.count, 100);
  });

  test('get hero by id', () async {
    var id = "60963a104436092a43d76ff1";

    var res = await superheroApi.hero.getById(id);

    expect(res.data.id, id);
  });
}
