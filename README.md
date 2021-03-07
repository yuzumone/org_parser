# org_parser
[![test and lint](https://github.com/yuzumone/org_parser/actions/workflows/test.yml/badge.svg)](https://github.com/yuzumone/org_parser/actions/workflows/test.yml)

org file parser for dart.

## Usage
```dart
var text = '''
#+STARTUP: content
* todos
** TODO todo1
** DONE todo2
DEADLINE: <2020-08-01 Sat> SCHEDULED: <2020-08-01 Sat>
:LOGBOOK:
CLOCK: [2020-08-01 Sat 10:00]--[2020-08-01 Sat 10:30] =>  0:30
:END:
''';
var org = await loadOrg(text);
org.headlines.forEach((x) => print(x.title));
// todos
// todo1
// todo2
```

## LICENSE
MIT
