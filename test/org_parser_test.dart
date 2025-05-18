import 'package:org_parser/org_parser.dart';
import 'package:test/test.dart';

void main() {
  group('parser tests', () {
    final doc = '''
#+STARTUP: content
* todos[1/2]
** TODO todo1
** DONE todo2
DEADLINE: <2020-08-01 Sat> SCHEDULED: <2020-08-01 Sat>
:LOGBOOK:
CLOCK: [2020-08-01 Sat 10:00]--[2020-08-01 Sat 10:30] =>  0:30
:END:
    ''';

    test('OK: loadOrg', () async {
      final org = await loadOrg(doc);
      expect(org.headlines.length, 3);
      expect(org.headlines[0].title, 'todos[1/2]');
      expect(org.headlines[0].level, 1);
      expect(org.headlines[1].keyword, 'TODO');
      expect(org.headlines[2].name, 'todo2');
      expect(org.headlines[2].keyword, 'DONE');
      expect(org.headlines[2].scheduled, '2020-08-01 Sat');
      expect(org.headlines[2].deadline, '2020-08-01 Sat');
      expect(org.headlines[2].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[2].deadlineDateTime, DateTime(2020, 8, 1));
    });

    test('OK: loadsOrg', () async {
      final org = await loadsOrg(doc.split('\n'));
      expect(org.headlines.length, 3);
      expect(org.headlines[0].title, 'todos[1/2]');
      expect(org.headlines[0].level, 1);
      expect(org.headlines[1].keyword, 'TODO');
      expect(org.headlines[2].name, 'todo2');
      expect(org.headlines[2].keyword, 'DONE');
      expect(org.headlines[2].scheduled, '2020-08-01 Sat');
      expect(org.headlines[2].deadline, '2020-08-01 Sat');
      expect(org.headlines[2].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[2].deadlineDateTime, DateTime(2020, 8, 1));
    });
  });

  group('parser date', () {
    final doc = '''
* TODO todo1
SCHEDULED: <2020-08-01 Sat>
* TODO todo2
SCHEDULED: <2020-08-01 Sat 13:00>
* TODO todo3
SCHEDULED: <2020-08-01 Sat 13:00--15:00>
* TODO todo4
SCHEDULED: <2020-08-01 Sat>--<2020-08-02 Sun>
* TODO todo5
SCHEDULED: <2020-08-01 Sat 13:00>--<2020-08-02 Sun 10:00>
* TODO todo6
SCHEDULED: <2020-08-01 Sat +1d>
* TODO todo7
SCHEDULED: <2020-08-01 Sat .+1d>
* TODO todo8
SCHEDULED: <2020-08-01 Sat ++1d>
    ''';

    test('OK: sheduled', () async {
      final org = await loadOrg(doc);
      expect(org.headlines.length, 8);
      expect(org.headlines[0].title, 'TODO todo1');
      expect(org.headlines[0].scheduled, '2020-08-01 Sat');
      expect(org.headlines[0].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[0].scheduledEndDateTime, null);
      expect(org.headlines[1].title, 'TODO todo2');
      expect(org.headlines[1].scheduled, '2020-08-01 Sat 13:00');
      expect(org.headlines[1].scheduledDateTime, DateTime(2020, 8, 1, 13, 0));
      expect(org.headlines[1].scheduledEndDateTime, null);
      expect(org.headlines[2].title, 'TODO todo3');
      expect(org.headlines[2].scheduled, '2020-08-01 Sat 13:00--15:00');
      expect(org.headlines[2].scheduledDateTime, DateTime(2020, 8, 1, 13, 0));
      expect(
        org.headlines[2].scheduledEndDateTime,
        DateTime(2020, 8, 1, 15, 0),
      );
      expect(org.headlines[3].title, 'TODO todo4');
      expect(org.headlines[3].scheduled, '2020-08-01 Sat -- 2020-08-02 Sun');
      expect(org.headlines[3].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[3].scheduledEndDateTime, DateTime(2020, 8, 2));
      expect(org.headlines[4].title, 'TODO todo5');
      expect(
        org.headlines[4].scheduled,
        '2020-08-01 Sat 13:00 -- 2020-08-02 Sun 10:00',
      );
      expect(org.headlines[4].scheduledDateTime, DateTime(2020, 8, 1, 13));
      expect(
        org.headlines[4].scheduledEndDateTime,
        DateTime(2020, 8, 2, 10, 0),
      );
      expect(org.headlines[5].title, 'TODO todo6');
      expect(org.headlines[5].scheduled, '2020-08-01 Sat +1d');
      expect(org.headlines[5].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[5].scheduledEndDateTime, null);
      expect(org.headlines[6].title, 'TODO todo7');
      expect(org.headlines[6].scheduled, '2020-08-01 Sat .+1d');
      expect(org.headlines[6].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[6].scheduledEndDateTime, null);
      expect(org.headlines[7].title, 'TODO todo8');
      expect(org.headlines[7].scheduled, '2020-08-01 Sat ++1d');
      expect(org.headlines[7].scheduledDateTime, DateTime(2020, 8, 1));
      expect(org.headlines[7].scheduledEndDateTime, null);
    });
  });
}
