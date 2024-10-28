// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationsHash() => r'dfff78243532206b4f24fb2965cb6dce21ed01ca';

/// See also [locations].
@ProviderFor(locations)
final locationsProvider = AutoDisposeFutureProvider<LocationModel>.internal(
  locations,
  name: r'locationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$locationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationsRef = AutoDisposeFutureProviderRef<LocationModel>;
String _$locationByIdHash() => r'0c05dcba61e086068aff7e54a41071e8698a8c0e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [locationById].
@ProviderFor(locationById)
const locationByIdProvider = LocationByIdFamily();

/// See also [locationById].
class LocationByIdFamily extends Family<AsyncValue<List<LocationModel>>> {
  /// See also [locationById].
  const LocationByIdFamily();

  /// See also [locationById].
  LocationByIdProvider call(
    List<String> id,
  ) {
    return LocationByIdProvider(
      id,
    );
  }

  @override
  LocationByIdProvider getProviderOverride(
    covariant LocationByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'locationByIdProvider';
}

/// See also [locationById].
class LocationByIdProvider
    extends AutoDisposeFutureProvider<List<LocationModel>> {
  /// See also [locationById].
  LocationByIdProvider(
    List<String> id,
  ) : this._internal(
          (ref) => locationById(
            ref as LocationByIdRef,
            id,
          ),
          from: locationByIdProvider,
          name: r'locationByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationByIdHash,
          dependencies: LocationByIdFamily._dependencies,
          allTransitiveDependencies:
              LocationByIdFamily._allTransitiveDependencies,
          id: id,
        );

  LocationByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final List<String> id;

  @override
  Override overrideWith(
    FutureOr<List<LocationModel>> Function(LocationByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocationByIdProvider._internal(
        (ref) => create(ref as LocationByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LocationModel>> createElement() {
    return _LocationByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocationByIdRef on AutoDisposeFutureProviderRef<List<LocationModel>> {
  /// The parameter `id` of this provider.
  List<String> get id;
}

class _LocationByIdProviderElement
    extends AutoDisposeFutureProviderElement<List<LocationModel>>
    with LocationByIdRef {
  _LocationByIdProviderElement(super.provider);

  @override
  List<String> get id => (origin as LocationByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
