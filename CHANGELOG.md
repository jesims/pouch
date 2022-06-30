# 1.5.1

Changed:

- `RequireFile.exists` now takes the more generic `FileSystemEntity`

# 1.5.0

Added:

- `StringUtil` static helpers:
  - `isNotBlank`
  - `isBlank`
  - `equalsIgnoreCase`
  - `containsIgnoreCase`
  - `ensureEndsWith`

Deprecated:

- String helpers in favour of `StringUtil` methods:
  - `isNotBlank(v)`
  - `isBlank(v)`
  - `equalsIgnoreCase(v)`
  - `containsIgnoreCase(v)`

# 1.4.0

Added:

- `Time` and `Date` models

Fixed:

- Lint and Analysis warnings for:
  - `IterableExtensions`
  - `MapExtensions`
  - `PathUtil`
  - `Wait`
- Added missing `file` and `collection` dependencies

# 1.3.0

Added to `pouch_io`:

- `FileSystemEntityUtil.delete`
- `FileSystemEntityExtensions.forceDelete`

Change:

- `deleteFiles` to use `FileSystemEntityUtil.delete`

# 1.2.1

Fixed:

- `RequireException` now outputs the `message` in `toString()`

# 1.2.0

Added:

- `NullableStringExtensions.isEmpty` and `.isNotEmpty`

# 1.1.0

Added:

- `NullableIterableExtensions.isEmpty` and `.isNotEmpty`
- `NullableMapExensions.isEmpty` and `.isNotEmpty`

# 1.0.0

Breaking:

- Require at least Dart SDK 2.15
- Removed functions not inline with the Dart way:
  - `CollectionUtil.getIn`
  - `IterableExtensions.getIn`
  - `ListExtensions.getIn`
  - `isNotEmpty`
  - `isEmpty`
- Use `Object` rather than `dynamic` in:
  - `KeyNotFoundException`
  - `isNull`
  - `isNotNull`
  - `cast`
  - `toString`

Fixed:

- type parameter for `NestedIterableExtensions.flatten`

Added:

- `FutureIterableExtensions`
- `FutureOrBoolExtensions`
- `IterableExtensions.groupBy`
- `NullableBoolExtensions`
- `Resource` with:
  - `ResourceUtils`
  - `ResourceSync`

# 0.7.0

Added:

- `BoolExtenstions`
- `FutureBoolExtensions`
- `NullableObjectExtensions`
- `NullableStringExtensions`
- `RequireFile` to `pouch_io.dart`
- `Require` and `RequireException`

# 0.6.0

Added:

- `IterableExtentions.partition` for splitting an iterable into multiple sub-lists

# 0.5.1

Fixed:

- `CollectionUtil.getIn` when dealing with `Iterables`, now correctly uses `int` indexes

# 0.5.0

Added:

- `CollectionUtil.getIn` function
- `getIn` extension to `Map`, `List`, & `Iterable`
- `KeyNotFoundException`

# 0.4.0

Added:

- `package:pouch/pouch.dart`
  - `MapExtentions.removeNullValues`
  - `MapUtil.removeNullValues`
  - `Wait.until`
- `package:pouch/pouch_io.dart`
  - `PathUtil.relativeToCurrent`

# 0.3.0

Added:

- `Predicates.eq`
- `Predicates.ne`

# 0.2.0

Added:

- `Iterable.filterWhen`

# 0.1.0

Added:

- `containsIgnoreCase`
- `equalsIgnoreCase`

# 0.0.1

- Initial version.
