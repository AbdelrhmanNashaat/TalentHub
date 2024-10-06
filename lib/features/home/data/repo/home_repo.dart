import 'package:dartz/dartz.dart';
import 'package:hire_me/core/errors/failures.dart';
import 'package:hire_me/features/home/data/model/company_info.dart';
import 'package:hire_me/features/home/data/model/company_jobs.dart';

import '../model/job_search_reponse_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, JobSearchResponse>> searchForAJob(
      {required String query, String? locality});
  Future<Either<Failure, CompanyInfo>> searchForCompanyDetails(
      {required String companyName, String? locality});
  Future<Either<Failure, CompanyJobs>> searchForCompanyJobs(
      {required String companyName, String? locality});
}
