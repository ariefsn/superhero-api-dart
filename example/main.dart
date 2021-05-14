import 'package:superhero_api/models/query_model.dart';
import 'package:superhero_api/superhero_api.dart';

main() async {
  String apiUrl = "";

  SuperheroApi superheroApi = SuperheroApi(apiUrl);

  void printLog(String title, String description) {
    print("[$title] $description");
  }

  // Hero

  printLog("Hero", "Get All");
  final heroes = await superheroApi.hero.getAll();
  printLog("Hero", "Found ${heroes.count} of ${heroes.total} data\n");

  printLog("Hero", "Get By ID");
  final heroById = await superheroApi.hero.getById("60963a104436092a43d76ff1");
  printLog("Hero", "Found ${heroById.data.id} with name ${heroById.data.name}\n");

  printLog("Hero", "Get By Path");
  final heroByPath = await superheroApi.hero.getByPath("/beckett-fowl/10-29271/");
  printLog("Hero", "Found ${heroByPath.data.path} with name ${heroByPath.data.name}\n");

  printLog("Hero", "Get By Query");
  final heroesByQuery = await superheroApi.hero.getByQuery(QueryModel("appearance.gender", QueryOperator.Eq, "Male"));
  printLog("Hero", "Found ${heroesByQuery.count} of ${heroesByQuery.total} data\n");

  // Appearance

  printLog("Appearance", "Get All");
  final appearances = await superheroApi.appearance.getAll();
  printLog("Appearance", "Found ${appearances.count} of ${appearances.total} data\n");

  printLog("Appearance", "Get By ID");
  final appearanceById = await superheroApi.appearance.getById("609a4df3ad8b78561e55bc5c");
  printLog("Appearance", "Found ${appearanceById.data.id} with name ${appearanceById.data.name}\n");

  printLog("Appearance", "Get By Query");
  final appearancesByQuery = await superheroApi.appearance.getByQuery(QueryModel("type", QueryOperator.Eq, "gender"));
  printLog("Appearance", "Found ${appearancesByQuery.count} of ${appearancesByQuery.total} data\n");

  // Origin

  printLog("Origin", "Get All");
  final origins = await superheroApi.origin.getAll();
  printLog("Origin", "Found ${origins.count} of ${origins.total} data\n");

  printLog("Origin", "Get By ID");
  final originById = await superheroApi.origin.getById("609a4df2ad8b78561e55ba70");
  printLog("Origin", "Found ${originById.data.id} with name ${originById.data.name}\n");

  printLog("Origin", "Get By Query");
  final originsByQuery = await superheroApi.origin.getByQuery(QueryModel("type", QueryOperator.Eq, "universe"));
  printLog("Origin", "Found ${originsByQuery.count} of ${originsByQuery.total} data\n");

  // SuperPower

  printLog("SuperPower", "Get All");
  final superPowers = await superheroApi.superPower.getAll();
  printLog("SuperPower", "Found ${superPowers.count} of ${superPowers.total} data\n");

  printLog("SuperPower", "Get By ID");
  final superPowerById = await superheroApi.superPower.getById("609a4df2ad8b78561e55b8b5");
  printLog("SuperPower", "Found ${superPowerById.data.id} with name ${superPowerById.data.name}\n");

  printLog("SuperPower", "Get By Query");
  final superPowersByQuery = await superheroApi.superPower.getByQuery(QueryModel("name", QueryOperator.Eq, "Absorption"));
  printLog("SuperPower", "Found ${superPowersByQuery.count} of ${superPowersByQuery.total} data\n");

}