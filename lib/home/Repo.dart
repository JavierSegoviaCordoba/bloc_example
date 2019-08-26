import 'package:bloc_example/Home/PostDTO.dart';
import 'package:bloc_example/home/Service.dart';
import 'package:bloc_example/utils/ResultResponse.dart';

class Repo {
  final _service = Service();

  Future<ResultResponse<List<PostDTO>>> getPosts() => _service.getPosts();
}
