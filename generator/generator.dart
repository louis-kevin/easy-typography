import 'dart:io';
import 'package:path/path.dart' as p;

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String camelCaseToSnakeCase() {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    return replaceAllMapped(exp, (Match m) => ('_${m.group(0)}')).toLowerCase();
  }
}

const themeNames = [
  'displayLarge',
  'displayMedium',
  'displaySmall',
  'headlineMedium',
  'headlineSmall',
  'titleLarge',
  'titleMedium',
  'titleSmall',
  'bodyLarge',
  'bodyMedium',
  'bodySmall',
  'labelLarge',
  'labelSmall',
];

const folderName = 'typography';
const dummy = 'dummy_widget.txt';
const classNameKey = '{{className}}';
const attributeNameKey = '{{attributeName}}';

void main() async {
  var path = p.join('lib', folderName);
  var dummyPath = p.join('generator', dummy);
  var directory = Directory(path);
  if (directory.existsSync()) directory.deleteSync(recursive: true);
  directory.createSync();

  var dummyContent = File(dummyPath).readAsStringSync();
  var exportFile = 'library easy_typography;\n\n';
  var exportFilePath = p.join('lib', 'easy_typography.dart');

  for (var element in themeNames) {
    var className = element.capitalize();
    var contents = dummyContent
        .replaceAll(classNameKey, className)
        .replaceAll(attributeNameKey, element);
    var filename = '${element.camelCaseToSnakeCase()}_text.dart';
    var filePath = p.join(path, filename);
    File(filePath).writeAsString(contents);
    exportFile = '${exportFile}export \'typography/$filename\';\n';
  }

  exportFile = '${exportFile}export \'locale.dart\';\n';
  File(exportFilePath).deleteSync();
  File(exportFilePath).writeAsString(exportFile);
}
