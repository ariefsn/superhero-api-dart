import 'package:superhero_api/models/query_model.dart';

class ParamsModel {
  List<QueryModel> queries;
  String limit, skip, sortField, sortBy;

  ParamsModel({
    this.queries,
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
      params.add("operators=" + fields.join("**"));
    }

    if (val.length > 0) {
      params.add("values=" + fields.join("**"));
    }

    if (limit != "") {
      params.add("limit=" + limit);
    }

    if (skip != "") {
      params.add("skip=" + skip);
    }

    if (sortField != "") {
      params.add("sort=" + sortField);
    }

    if (sortBy != "") {
      params.add("by=" + sortBy);
    }

    return params.length > 0 ? "?" + params.join("&") : "";
  }
}