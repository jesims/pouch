import 'package:pouch/pouch.dart';
import 'package:test/test.dart';

void main() {
  group('Resource', () {
    group('using', () {
      test('disposes the resource', () async {
        var res = MockResource();
        await res.using((actualRes) async => expect(actualRes, res));
        expect(res.disposed, true);
      });
      test('disposes the resource after exception', () async {
        var res = MockResource();
        try {
          await res.using((_) async => throw Exception());
        } catch (_) {}
        expect(res.disposed, true);
      });
    });
  });
  group('ResourceSync', () {
    group('usingSync', () {
      test('disposes the resource', () {
        var res = MockResourceSync();
        res.usingSync((actualRes) => expect(actualRes, res));
        expect(res.disposed, true);
      });
      test('disposes the resource after exception', () {
        var res = MockResourceSync();
        try {
          res.usingSync((_) => throw Exception());
        } catch (_) {}
        expect(res.disposed, true);
      });
    });
  });
}

class MockResource with Resource {
  bool disposed = false;

  @override
  Future<void> dispose() async {
    disposed = true;
  }
}

class MockResourceSync with ResourceSync {
  bool disposed = false;

  @override
  void disposeSync() {
    disposed = true;
  }
}
