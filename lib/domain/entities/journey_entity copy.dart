import 'dart:ffi';

import 'package:equatable/equatable.dart';

class JourneyEntity extends Equatable {
  final String? title;
  final String? venue;
  final String? image;
  final DateTime? time;

  const JourneyEntity({
    this.image,
    this.title,
    this.venue,
    this.time,
  });

  @override
  List<Object?> get props => [title, venue, time, image];
}
