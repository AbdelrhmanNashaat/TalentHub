import 'company_jobs_hits.dart';

class CompanyJobs {
  final int count;
  final List<CompanyJobsHits> hits;

  CompanyJobs({
    required this.count,
    required this.hits,
  });

  factory CompanyJobs.fromJson(Map<String, dynamic> json) {
    return CompanyJobs(
      count: json['count'],
      hits: List<CompanyJobsHits>.from(
          json['hits'].map((x) => CompanyJobsHits.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'hits': hits.map((x) => x.toJson()).toList(),
    };
  }
}
