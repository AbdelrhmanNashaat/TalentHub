import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hire_me/core/errors/failures.dart';
import 'package:hire_me/core/services/api_services.dart';
import 'package:hire_me/features/home/data/model/company_info.dart';
import 'package:hire_me/features/home/data/model/company_jobs.dart';
import 'package:hire_me/features/home/data/repo/home_repo.dart';

import '../model/job_search_response_model.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation({required this.apiServices});
  @override
  Future<Either<Failure, JobSearchResponse>> searchForAJob(
      {required String query, String? locality}) async {
    try {
      String loc = locality ?? 'eg';
      var data = await apiServices.get(
          ednPoint:
              'https://indeed12.p.rapidapi.com/jobs/search?query=$query&locality=$loc&sort=date');
      JobSearchResponse jobSearchResponse = JobSearchResponse.fromJson(data);
      return Right(jobSearchResponse);
    } catch (e) {
      if (e is DioException) {
        final serverFailure = ServerFailure.fromDioError(e);
        log(serverFailure.errorMessage);
        return Left(serverFailure);
      }
      log(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyInfo>> searchForCompanyDetails(
      {required String companyName, String? locality}) async {
    try {
      String loc = locality ?? 'eg';
      var data = await apiServices.get(
          ednPoint:
              'https://indeed12.p.rapidapi.com/company/$companyName?locality=$loc');
      CompanyInfo companyInfo = CompanyInfo.fromJson(data);
      return Right(companyInfo);
    } catch (e) {
      if (e is DioException) {
        final serverFailure = ServerFailure.fromDioError(e);
        log(serverFailure.errorMessage);
        return Left(serverFailure);
      }
      log(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyJobs>> searchForCompanyJobs(
      {required String companyName, String? locality}) async {
    try {
      String loc = locality ?? 'eg';
      var data = await apiServices.get(
          ednPoint:
              'https://indeed12.p.rapidapi.com/company/$companyName/jobs?locality=$loc');
      CompanyJobs companyJobs = CompanyJobs.fromJson(data);
      return Right(companyJobs);
    } catch (e) {
      if (e is DioException) {
        final serverFailure = ServerFailure.fromDioError(e);
        log(serverFailure.errorMessage);
        return Left(serverFailure);
      }
      log(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
