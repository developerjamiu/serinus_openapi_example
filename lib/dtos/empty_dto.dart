import 'package:serinus/serinus.dart';

class EmptyDto with JsonObject {
  const EmptyDto();

  @override
  Map<String, dynamic> toJson() => {};
}
