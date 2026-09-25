import 'package:venuze_app/core/utils/json_reader.dart';
import 'package:venuze_app/features/auth/domain/entities/user_profile.dart';

class UserProfileModel {
  const UserProfileModel({
    required this.id,
    required this.userId,
    required this.totalBookings,
    required this.averageBookingRating,
    required this.createdAt,
  });

  final String id;
  final String userId;
  final int totalBookings;
  final double? averageBookingRating;
  final DateTime createdAt;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: JsonReader.nonEmptyString(json, 'id'),
      userId: JsonReader.nonEmptyString(json, 'user_id'),
      totalBookings: JsonReader.integer(json, 'total_bookings'),
      averageBookingRating: JsonReader.nullableDouble(
        json,
        'average_booking_rating',
      ),
      createdAt: JsonReader.dateTime(json, 'created_at'),
    );
  }

  factory UserProfileModel.fromEntity(UserProfile entity) {
    return UserProfileModel(
      id: entity.id,
      userId: entity.userId,
      totalBookings: entity.totalBookings,
      averageBookingRating: entity.averageBookingRating,
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'total_bookings': totalBookings,
      'average_booking_rating': averageBookingRating,
      'created_at': createdAt.toUtc().toIso8601String(),
    };
  }

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      userId: userId,
      totalBookings: totalBookings,
      averageBookingRating: averageBookingRating,
      createdAt: createdAt,
    );
  }
}
