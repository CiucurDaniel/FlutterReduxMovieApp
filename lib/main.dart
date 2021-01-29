import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:movie_app/epics/app_epics.dart';
import 'package:movie_app/actions/index.dart';
import 'package:movie_app/models/index.dart';
import 'package:movie_app/data/yts_api.dart';
import 'package:movie_app/presentation/home_page.dart';
import 'package:movie_app/reducer/reducer.dart';

void main() {
  final Client client = Client();
  final YtsApi api = YtsApi(client: client);
  final AppEpics appEpics = AppEpics(ytsApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(appEpics.epics),
    ],
  );

  store.dispatch(GetMovies.start(initialState.page));
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const HomePage(),
      ),
    );
  }
}
