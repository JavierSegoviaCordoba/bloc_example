import 'package:bloc_example/home/BLoC.dart';
import 'package:bloc_example/Home/PostDTO.dart';
import 'package:bloc_example/utils/ClientErrors.dart';
import 'package:bloc_example/utils/ResultResponse.dart';
import 'package:bloc_example/utils/Snackbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static Widget refreshIndicator;
  static Widget streamBuilder;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State {
    @override
  void initState() {
    super.initState();
    HomePage.refreshIndicator = HomeRefreshIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
      ),
      body: HomePage.refreshIndicator,
    );
  }
}

class HomeRefreshIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRefreshIndicator();
}

class _HomeRefreshIndicator extends State {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final bloc = BLoC();

  _HomeRefreshIndicator();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => this.refreshIndicatorKey.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshIndicatorKey,
      child: HomeStreamBuilder(bloc),
      onRefresh: () => bloc.getPosts(),
    );
  }
}

class HomeStreamBuilder extends StatelessWidget {
  final BLoC bloc;

  HomeStreamBuilder(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.posts.asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<ResultResponse<List<PostDTO>>> snapshot) {
        if (snapshot.hasData) {
          snackbar(context, "Success");
          return postsGridView(snapshot.data);
        } else if (snapshot.hasError) {
          if (snapshot.error is NotFound) {
            snackbarError(context, "Error not found");
          } else if (snapshot.error is InternetNotAvailable) {
            snackbar(context, "Error Internet not available");
          } else
            snackbar(context, "Other error");
        }
        return Container();
      },
    );
  }
}

Widget postsGridView(Success<List<PostDTO>> response) {
  if (response.value.length > 0)
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1),
            padding: const EdgeInsets.all(8),
            itemCount: response.value.length,
            itemBuilder: (BuildContext context, int index) => Container(child: postCard(context, response.value[index])),
          ),
        ),
      ],
    );
  else
    return Container();
}

Widget postCard(BuildContext context, PostDTO post) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: InkWell(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
              child: Container(
                child: Center(
                  child: Text(
                    post.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
