import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id, url;
  final int height, width;

  const Cat({required this.id, required this.url, required this.height, required this.width});

  @override
  List<Object?> get props => [id, url, width, height];
}
