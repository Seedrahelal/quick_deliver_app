class UserProfile {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String location;
  final String profileImage;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.location,
    required this.profileImage,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone'],
      location: json['location'],
      profileImage: json['profile_picture'],
    );
  }
}
