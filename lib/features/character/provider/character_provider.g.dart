// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$characterByIdHash() => r'27800ac048b4ce043b3d506d7a2c2c5cb17b34df';

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

/// See also [characterById].
@ProviderFor(characterById)
const characterByIdProvider = CharacterByIdFamily();

/// See also [characterById].
class CharacterByIdFamily extends Family<AsyncValue<List<CharacterModel>>> {
  /// See also [characterById].
  const CharacterByIdFamily();

  /// See also [characterById].
  CharacterByIdProvider call(
    List<String> id,
  ) {
    return CharacterByIdProvider(
      id,
    );
  }

  @override
  CharacterByIdProvider getProviderOverride(
    covariant CharacterByIdProvider provider,
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
  String? get name => r'characterByIdProvider';
}

/// See also [characterById].
class CharacterByIdProvider
    extends AutoDisposeFutureProvider<List<CharacterModel>> {
  /// See also [characterById].
  CharacterByIdProvider(
    List<String> id,
  ) : this._internal(
          (ref) => characterById(
            ref as CharacterByIdRef,
            id,
          ),
          from: characterByIdProvider,
          name: r'characterByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterByIdHash,
          dependencies: CharacterByIdFamily._dependencies,
          allTransitiveDependencies:
              CharacterByIdFamily._allTransitiveDependencies,
          id: id,
        );

  CharacterByIdProvider._internal(
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
    FutureOr<List<CharacterModel>> Function(CharacterByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterByIdProvider._internal(
        (ref) => create(ref as CharacterByIdRef),
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
  AutoDisposeFutureProviderElement<List<CharacterModel>> createElement() {
    return _CharacterByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterByIdProvider && other.id == id;
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
mixin CharacterByIdRef on AutoDisposeFutureProviderRef<List<CharacterModel>> {
  /// The parameter `id` of this provider.
  List<String> get id;
}

class _CharacterByIdProviderElement
    extends AutoDisposeFutureProviderElement<List<CharacterModel>>
    with CharacterByIdRef {
  _CharacterByIdProviderElement(super.provider);

  @override
  List<String> get id => (origin as CharacterByIdProvider).id;
}

String _$charactersHash() => r'7cb0124a0dde87113ec475e640072a794516522e';

/// See also [Characters].
@ProviderFor(Characters)
final charactersProvider =
    AutoDisposeNotifierProvider<Characters, CharactersState>.internal(
  Characters.new,
  name: r'charactersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$charactersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Characters = AutoDisposeNotifier<CharactersState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
