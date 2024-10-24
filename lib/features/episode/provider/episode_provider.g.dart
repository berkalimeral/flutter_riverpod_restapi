// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$episodesHash() => r'be9295b002f9c8be1d58d7d8e4fc2f78df4da89d';

/// See also [episodes].
@ProviderFor(episodes)
final episodesProvider = AutoDisposeFutureProvider<EpisodeModel>.internal(
  episodes,
  name: r'episodesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$episodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EpisodesRef = AutoDisposeFutureProviderRef<EpisodeModel>;
String _$episodeByIdHash() => r'd3161cbb430091050d4347d64531a953b761b8bf';

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

/// See also [episodeById].
@ProviderFor(episodeById)
const episodeByIdProvider = EpisodeByIdFamily();

/// See also [episodeById].
class EpisodeByIdFamily extends Family<AsyncValue<List<EpisodeModel>>> {
  /// See also [episodeById].
  const EpisodeByIdFamily();

  /// See also [episodeById].
  EpisodeByIdProvider call(
    List<String> id,
  ) {
    return EpisodeByIdProvider(
      id,
    );
  }

  @override
  EpisodeByIdProvider getProviderOverride(
    covariant EpisodeByIdProvider provider,
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
  String? get name => r'episodeByIdProvider';
}

/// See also [episodeById].
class EpisodeByIdProvider
    extends AutoDisposeFutureProvider<List<EpisodeModel>> {
  /// See also [episodeById].
  EpisodeByIdProvider(
    List<String> id,
  ) : this._internal(
          (ref) => episodeById(
            ref as EpisodeByIdRef,
            id,
          ),
          from: episodeByIdProvider,
          name: r'episodeByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$episodeByIdHash,
          dependencies: EpisodeByIdFamily._dependencies,
          allTransitiveDependencies:
              EpisodeByIdFamily._allTransitiveDependencies,
          id: id,
        );

  EpisodeByIdProvider._internal(
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
    FutureOr<List<EpisodeModel>> Function(EpisodeByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EpisodeByIdProvider._internal(
        (ref) => create(ref as EpisodeByIdRef),
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
  AutoDisposeFutureProviderElement<List<EpisodeModel>> createElement() {
    return _EpisodeByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EpisodeByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EpisodeByIdRef on AutoDisposeFutureProviderRef<List<EpisodeModel>> {
  /// The parameter `id` of this provider.
  List<String> get id;
}

class _EpisodeByIdProviderElement
    extends AutoDisposeFutureProviderElement<List<EpisodeModel>>
    with EpisodeByIdRef {
  _EpisodeByIdProviderElement(super.provider);

  @override
  List<String> get id => (origin as EpisodeByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
