// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/datasources/home_data_sources.dart' as _i6;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i7;
import '../../features/home/data/repositories/home_data_repo.dart' as _i9;
import '../../features/home/domain/repositories/home_domain_repo.dart' as _i8;
import '../../features/home/domain/usecases/get_all_products_use_case.dart'
    as _i10;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i4;
import '../api/api_service.dart' as _i5;
import 'injection_container.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.HomeCubit>(() => registerModule.homeCubit);
    gh.lazySingleton<_i5.ApiService>(() => _i5.ApiService(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.HomeDataSources>(
        () => _i7.HomeRemoteDataSource(apiService: gh<_i5.ApiService>()));
    gh.lazySingleton<_i8.HomeDomainRepo>(
        () => _i9.HomeDataRepo(homeDataSources: gh<_i6.HomeDataSources>()));
    gh.lazySingleton<_i10.GetAllProductsUseCase>(() =>
        _i10.GetAllProductsUseCase(homeDomainRepo: gh<_i8.HomeDomainRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
