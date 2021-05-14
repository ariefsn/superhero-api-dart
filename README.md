# Superhero Api Wrapper Dart

Superhero Api Wrapper for Dart

## Usage

1. Add `superhero_api` as a dependency in your pubspec.yaml.

    ```yaml
    dependencies:
      superhero_api:
    ```

2. Install it

    ```shell
      flutter pub get
    ```

3. And import it

    ```dart
      import 'package:superhero_api/superhero_api.dart';
    ```

## API

1. Hero
     - Get All
        > returns Future of ResponseList

        ```dart
          await superhero.hero.getAll(ParamsModel params)
        ```

     - Get by ID
        > returns Future of ResponseSingle

        ```dart
          await superhero.hero.getById(String id)
        ```

     - Get by Path
        > returns Future of ResponseSingle

        ```dart
          await superhero.hero.getByPath(String path)
        ```

     - Get by Query
        > returns Future of ResponseList

        ```dart
          await superhero.hero.getByQuery(QueryModel query, { ParamsModel params })
        ```

2. Appearance
     - Get All
        > returns Future of ResponseList

        ```dart
          await superhero.appearance.getAll(ParamsModel params)
        ```

     - Get by ID
        > returns Future of ResponseSingle

        ```dart
          await superhero.appearance.getById(String id)
        ```

     - Get by Query
        > returns Future of ResponseList

        ```dart
          await superhero.appearance.getByQuery(QueryModel query, { ParamsModel params })
        ```

3. Origin
     - Get All
        > returns Future of ResponseList

        ```dart
          await superhero.origin.getAll(ParamsModel params)
        ```

     - Get by ID
        > returns Future of ResponseSingle

        ```dart
          await superhero.origin.getById(String id)
        ```

     - Get by Query
        > returns Future of ResponseList

        ```dart
          await superhero.origin.getByQuery(QueryModel query, { ParamsModel params })
        ```

4. Super Power
     - Get All
        > returns Future of ResponseList

        ```dart
          await superhero.superPower.getAll(ParamsModel params)
        ```

     - Get by ID
        > returns Future of ResponseSingle

        ```dart
          await superhero.superPower.getById(String id)
        ```

     - Get by Query
        > returns Future of ResponseList

        ```dart
          await superhero.superPower.getByQuery(QueryModel query, { ParamsModel params })
        ```

## Dependency

- [Dio](https://pub.dev/packages/dio)
