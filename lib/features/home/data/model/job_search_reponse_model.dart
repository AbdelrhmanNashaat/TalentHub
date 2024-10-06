import 'job_hit_model.dart';

class JobSearchResponse {
  final int count;
  final List<JobHit> hits;

  JobSearchResponse({
    required this.count,
    required this.hits,
  });

  factory JobSearchResponse.fromJson(Map<String, dynamic> json) {
    return JobSearchResponse(
      count: json['count'],
      hits: List<JobHit>.from(json['hits'].map((x) => JobHit.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'hits': hits.map((x) => x.toJson()).toList(),
    };
  }
}
