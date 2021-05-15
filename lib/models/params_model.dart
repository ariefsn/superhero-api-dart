import 'package:superhero_api/models/query_model.dart';

class ParamsModel {
  List<QueryModel> queries;
  String sortField, sortBy;
  int limit, skip;

  ParamsModel({
    this.queries = const [],
    this.limit,
    this.skip,
    this.sortBy,
    this.sortField
  });

  String build() {
    List<String> params = [], fields = [], opr = [], val = [];
    
    for (var q in queries) {
      if (q.field != "" && q.opr.value() != "") {
        fields.add(q.field);
        opr.add(q.opr.value());
        val.add(q.value);
      }
    }

    if (fields.length > 0) {
      params.add("fields=" + fields.join("**"));
    }

    if (opr.length > 0) {
      params.add("operators=" + opr.join("**"));
    }

    if (val.length > 0) {
      params.add("values=" + val.join("**"));
    }

    if (["", null, "null"].indexOf(limit.toString()) < 0) {
      params.add("limit=$limit");
    }

    if (["", null, "null"].indexOf(skip.toString()) < 0) {
      params.add("skip=$skip");
    }

    if (["", null].indexOf(sortField) < 0) {
      params.add("sort=$sortField");
    }

    if (["", null].indexOf(sortBy) < 0) {
      params.add("by=$sortBy");
    }

    return params.length > 0 ? "?" + params.join("&") : "";
  }
}