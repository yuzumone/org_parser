import 'package:org_parser/org_parser.dart';
import 'package:test/test.dart';

void main() {
  group('parser tests', () {
    var doc = '''
#+STARTUP: content
* todos[1/2]
** TODO todo1
** DONE todo2
DEADLINE: <2020-08-01 Sat> SCHEDULED: <2020-08-01 Sat>
:LOGBOOK:
CLOCK: [2020-08-01 Sat 10:00]--[2020-08-01 Sat 10:30] =>  0:30
:END:
    ''';

    test('OK: loadOrg', () {
      loadOrg(doc).then((value) {
        expect(value.headlines.length, 3);
        expect(value.headlines[0].title, 'todos[1/2]');
        expect(value.headlines[0].level, 1);
        expect(value.headlines[1].keyword, 'TODO');
        expect(value.headlines[2].name, 'todo2');
        expect(value.headlines[2].keyword, 'DONE');
        expect(value.headlines[2].scheduled, '2020-08-01 Sat');
        expect(value.headlines[2].deadline, '2020-08-01 Sat');
        expect(value.headlines[2].scheduledDateTime, DateTime(2020, 8, 1));
        expect(value.headlines[2].deadlineDateTime, DateTime(2020, 8, 1));
      });
    });

    test('OK: loadsOrg', () {
      loadsOrg(doc.split('\n')).then((value) {
        expect(value.headlines.length, 3);
        expect(value.headlines[0].title, 'todos[1/2]');
        expect(value.headlines[0].level, 1);
        expect(value.headlines[1].keyword, 'TODO');
        expect(value.headlines[2].name, 'todo2');
        expect(value.headlines[2].keyword, 'DONE');
        expect(value.headlines[2].scheduled, '2020-08-01 Sat');
        expect(value.headlines[2].deadline, '2020-08-01 Sat');
        expect(value.headlines[2].scheduledDateTime, DateTime(2020, 8, 1));
        expect(value.headlines[2].deadlineDateTime, DateTime(2020, 8, 1));
      });
    });
  });
}
