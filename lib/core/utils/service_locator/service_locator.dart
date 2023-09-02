import 'package:bookly_app_tharwat/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_tharwat/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_tharwat/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));

  //getIt.registerSingleton<HomeRepoImpl>( HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}
