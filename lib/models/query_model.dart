enum QueryOperator {
  Eq, Ne, Gt, Gte, Lt, Lte, In, Nin, StartWith, EndWith, Contains, Between, BetweenEqual, ElementMatch
}

extension asString on QueryOperator {
  String value() => this.toString().split('.').last.toLowerCase();
}

class QueryModel {
  String field;
  QueryOperator opr;
  dynamic value;

  QueryModel(this.field, this.opr, this.value);
}
