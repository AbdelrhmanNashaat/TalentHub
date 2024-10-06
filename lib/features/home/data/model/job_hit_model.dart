class JobHit {
  final String companyName;
  final String formattedRelativeTime;
  final String id;
  final String location;
  final Map<String, dynamic> salary;
  final String title;

  JobHit({
    required this.companyName,
    required this.formattedRelativeTime,
    required this.id,
    required this.location,
    required this.salary,
    required this.title,
  });

  factory JobHit.fromJson(Map<String, dynamic> json) {
    return JobHit(
      companyName: json['company_name'],
      formattedRelativeTime: json['formatted_relative_time'],
      id: json['id'],
      location: json['location'],
      salary: json['salary'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_name': companyName,
      'formatted_relative_time': formattedRelativeTime,
      'id': id,
      'location': location,
      'salary': salary,
      'title': title,
    };
  }
}
