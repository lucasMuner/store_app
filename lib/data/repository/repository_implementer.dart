import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_app/data/mapper/mapper.dart';
import 'package:flutter_advanced_app/data/network/error_handler.dart';
import 'package:flutter_advanced_app/data/network/failure.dart';
import 'package:flutter_advanced_app/data/request/request.dart';
import 'package:flutter_advanced_app/domain/model/model.dart';
import 'package:flutter_advanced_app/domain/repository/repository.dart';

import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImplementer extends Repository {
  RemoteDataSource _remoteDataSouce;
  NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSouce, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSouce.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          //return data (success)
          return Right(response.toDomain());
        } else {
          //return biz logic error
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      //return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
