import 'package:movie_app/actions/index.dart';
import 'package:movie_app/models/index.dart';
import 'package:movie_app/data/yts_api.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesStart>(_getMoviesStart),
    ]);
  }

  Stream<dynamic> _getMoviesStart(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart event) => _ytsApi.getMovies(
              event.page,
              store.state.quality,
              store.state.genres.asList(),
              store.state.orderBy,
              store.state.sortBy,
            ))
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((dynamic error) => GetMovies.error(error));
  }
}
