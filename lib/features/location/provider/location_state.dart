import '../../../product/models/location/location_model.dart';

class LocationState {
  final List<Location> location;
  bool isLoading;
  bool isError;
  final bool hasNextPage;
  final bool isSearch;
  final int currentPage;

  LocationState({
    required this.location,
    this.isLoading = false,
    this.isError = false,
    this.hasNextPage = true,
    this.isSearch = false,
    required this.currentPage,
  });

  LocationState copyWith({
    List<Location>? location,
    bool? isLoading,
    bool? isError,
    bool? hasNextPage,
    bool? isSearch,
    int? currentPage,
  }) {
    return LocationState(
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isSearch: isSearch ?? this.isSearch,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
