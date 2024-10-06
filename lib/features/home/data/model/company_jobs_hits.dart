class CompanyJobsHits {
  final String id;
  final String location;
  final String title;

  CompanyJobsHits({
    required this.id,
    required this.location,
    required this.title,
  });

  factory CompanyJobsHits.fromJson(Map<String, dynamic> json) {
    return CompanyJobsHits(
      id: json['id'],
      location: json['location'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'title': title,
    };
  }
}
