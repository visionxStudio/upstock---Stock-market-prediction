import 'package:upstock/src/common/service/repo.dart';

class ExampleRepo extends Repo {
  Future f() async {
    client.get('uri');
  }
}
