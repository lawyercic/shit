import 'package:get_it/get_it.dart';
import 'package:lawer/features/domain/repository/base_repository.dart';
import 'package:lawer/features/domain/usecases/login_usecase.dart';
import 'package:lawer/features/domain/usecases/signin_usecase.dart';
import 'package:lawer/features/presentation/controller/bloc/lawyerd%20bloc/lawyerd_bloc.dart';
import 'package:lawer/features/source/remoteDataSource/remote_data_source.dart';
import 'package:lawer/features/source/repository/repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton(() => LawyerdBloc(sl(), sl()));
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));
    sl.registerLazySingleton(() => LogIn(sl()));
    sl.registerLazySingleton(() => SignIn(sl()));
  }
}
