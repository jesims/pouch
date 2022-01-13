# Pouch

Generic Dart utilities and helper functions

## Usage

Update your `pubspec.yaml` file and add `pouch` as a dependency

```yaml
dependencies:
  pouch:
    git:
      url: https://github.com/jesims/pouch.git
      # ref: <tag, branch, or commit>
```

In your Dart code, add an import for `pouch`

```dart
import 'package:pouch/pouch.dart';
```

## Development

> TODO: This should be updated with chassis_forge commands

### Fetch dependencies

```bash
dart pub get
```

### Lint

```bash
dart analyze
```

### Format

```bash
dart format --fix .
```

### Test

```bash
dart test
```

## Future

- Build and Automation Tools using Chassis Forge
  - Deps
  - Test
  - Lint
  - Format
  - and update CI config
- Consider Publishing to [Pub.dev](https://pub.dev)
