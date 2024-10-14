class CompanyInfo {
  final String? logoUrl;
  final String name;
  final String? hqLocation;
  final int? founded;
  final String? employees;
  final double? rating;
  final String? revenue;
  final int? reviewCount;
  final List<String>? sectors;
  final String? description;

  CompanyInfo({
    required this.description,
    required this.employees,
    required this.founded,
    required this.hqLocation,
    required this.logoUrl,
    required this.name,
    required this.rating,
    required this.revenue,
    required this.reviewCount,
    required this.sectors,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      description: json['description'],
      employees: json['employees'],
      founded: json['founded'],
      hqLocation: json['hq_location'],
      logoUrl: json['logo_url'],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      revenue: json['revenue'],
      reviewCount: json['review_count'],
      sectors: List<String>.from(json['sectors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'employees': employees,
      'founded': founded,
      'hq_location': hqLocation,
      'logo_url': logoUrl,
      'name': name,
      'rating': rating,
      'revenue': revenue,
      'review_count': reviewCount,
      'sectors': sectors,
    };
  }
}
