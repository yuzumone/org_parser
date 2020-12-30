import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser_example/data/model/preference_view_type.dart';
import 'package:org_parser_example/ui/preference/preference_view_state.dart';

class PreferenceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewType = context.select<PreferenceViewState, PreferenceViewType>(
        (state) => state.viewType);
    return WillPopScope(
      onWillPop: () async {
        if (viewType == PreferenceViewType.Main) {
          Navigator.of(context).pop();
        } else {
          context
              .read<PreferenceViewStateNotifier>()
              .setViewType(PreferenceViewType.Main);
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preference'),
          leading: viewType == PreferenceViewType.Main
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context
                        .read<PreferenceViewStateNotifier>()
                        .setViewType(PreferenceViewType.Main);
                  }),
        ),
        body: Container(
          child: viewType == PreferenceViewType.Main
              ? _MainPreferenceView()
              : _PreferenceInputView(),
        ),
      ),
    );
  }
}

Future<String> _buildInputDialog(BuildContext context, String title) async {
  var result = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                onChanged: (value) => result = value,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(result),
          ),
          FlatButton(
            child: Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop(null),
          )
        ],
      );
    },
  );
}

class _MainPreferenceView extends StatelessWidget {
  static const fontFaces = [
    'Myrica',
    'Cica',
    'SourceHanCodeJP',
    'HackGen',
  ];
  static const fontSize = [
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Org File'),
            subtitle: Text('OrgファイルのURL'),
            onTap: () {
              context
                  .read<PreferenceViewStateNotifier>()
                  .setViewType(PreferenceViewType.OrgUrl);
            },
          ),
          ListTile(
            title: Text('TODO Keyword'),
            subtitle: Text('完了のTODOと認識するキーワード'),
            onTap: () {
              context
                  .read<PreferenceViewStateNotifier>()
                  .setViewType(PreferenceViewType.Todo);
            },
          ),
          ListTile(
            title: Text('DONE Keyword'),
            subtitle: Text('未完了のTODOと認識するキーワード'),
            onTap: () {
              context
                  .read<PreferenceViewStateNotifier>()
                  .setViewType(PreferenceViewType.Done);
            },
          ),
          ListTile(
            title: Text('Font face'),
            trailing: DropdownButton(
              value: context.select<PreferenceViewState, String>(
                  (state) => state.fontFace),
              onChanged: (String newValue) {
                context
                    .read<PreferenceViewStateNotifier>()
                    .setFontFace(newValue);
              },
              items: fontFaces
                  .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                  .toList(),
            ),
          ),
          ListTile(
            title: Text('Font size'),
            trailing: DropdownButton(
              value: context
                  .select<PreferenceViewState, int>((state) => state.fontSize)
                  .toString(),
              onChanged: (String newValue) {
                context
                    .read<PreferenceViewStateNotifier>()
                    .setFontSize(int.parse(newValue));
              },
              items: fontSize
                  .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(
                            value: e.toString(),
                            child: Text(e.toString()),
                          ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _viewType = context.select<PreferenceViewState, PreferenceViewType>(
        (state) => state.viewType);
    var _items = <String>[];
    switch (_viewType) {
      case PreferenceViewType.OrgUrl:
        _items = context
            .select<PreferenceViewState, List<String>>((state) => state.urls);
        break;
      case PreferenceViewType.Todo:
        _items = context.select<PreferenceViewState, List<String>>(
            (state) => state.todoKeywords);
        break;
      case PreferenceViewType.Done:
        _items = context.select<PreferenceViewState, List<String>>(
            (state) => state.doneKeywords);
        break;
      default:
        _items = [];
    }
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(_items[index]),
            onLongPress: () {
              switch (_viewType) {
                case PreferenceViewType.OrgUrl:
                  context
                      .read<PreferenceViewStateNotifier>()
                      .setUrls(List.from(_items)..removeAt(index));
                  break;
                case PreferenceViewType.Todo:
                  context
                      .read<PreferenceViewStateNotifier>()
                      .setTodoKeywords(List.from(_items)..removeAt(index));
                  break;
                case PreferenceViewType.Done:
                  context
                      .read<PreferenceViewStateNotifier>()
                      .setDoneKeywords(List.from(_items)..removeAt(index));
                  break;
                default:
                  null;
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await _buildInputDialog(context, 'Input File Url');
          if (result != null) {
            switch (_viewType) {
              case PreferenceViewType.OrgUrl:
                context
                    .read<PreferenceViewStateNotifier>()
                    .setUrls(List.from(_items)..add(result));
                break;
              case PreferenceViewType.Todo:
                context
                    .read<PreferenceViewStateNotifier>()
                    .setTodoKeywords(List.from(_items)..add(result));
                break;
              case PreferenceViewType.Done:
                context
                    .read<PreferenceViewStateNotifier>()
                    .setDoneKeywords(List.from(_items)..add(result));
                break;
              default:
                null;
            }
          }
        },
      ),
    );
  }
}
