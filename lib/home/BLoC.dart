import 'package:bloc_example/Home/PostDTO.dart';
import 'package:bloc_example/Home/Repo.dart';
import 'package:bloc_example/utils/ResultResponse.dart';
import 'package:rxdart/rxdart.dart';

class BLoC {
  final _repository = Repo();
  final _publishSubject = PublishSubject<ResultResponse<List<PostDTO>>>();

  Observable<ResultResponse<List<PostDTO>>> get posts => _publishSubject.stream;

  getPosts() async {
    try {
      ResultResponse<List<PostDTO>> dto = await _repository.getPosts();
      dto is Success ? _publishSubject.sink.add(dto) : _publishSubject.sink.addError(dto);
    } catch (e) {
      print(e.toString());
    }
  }

  dispose() => _publishSubject.close();
}
