import 'package:bloc_example/Home/PostDTO.dart';
import 'package:bloc_example/utils/ResultResponse.dart';
import 'package:bloc_example/utils/ResultResponseHandler.dart';
import 'package:http/http.dart';

class Service {
  final Client _client = Client();

  Future<ResultResponse<List<PostDTO>>> getPosts() {
    Future<Response> future = _client.get("https://jsonplaceholder.typicode.com/posts/").timeout(Duration(seconds: 10));
    return resultResponse<List<PostDTO>, PostDTO>(future, PostDTO.toDTO);
  }
}
