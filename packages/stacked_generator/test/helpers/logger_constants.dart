const String kloggerClassContent = '''
// ignore_for_file: avoid_print

/// Maybe this should be generated for the user as well?
///
/// import 'package:customer_app/services/stackdriver/stackdriver_service.dart';
import 'package:logger/logger.dart';

import 'importOne';
import 'importTwo';



const bool _isReleaseMode = bool.fromEnvironment("dart.vm.product");

class SimpleLogPrinter extends LogPrinter {
  final String className;
  final bool printCallingFunctionName;
  final bool printCallStack;
  final List<String> exludeLogsFromClasses;
  final String? showOnlyClass;

  SimpleLogPrinter(
    this.className, {
    this.printCallingFunctionName = true,
    this.printCallStack = false,
    this.exludeLogsFromClasses = const [],
    this.showOnlyClass,
  });

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    var methodName = _getMethodName();

    var methodNameSection =
        printCallingFunctionName && methodName != null ? ' | \$methodName ' : '';
    var stackLog = event.stackTrace.toString();
    var output =
        '\$emoji \$className\$methodNameSection - \${event.message}\${printCallStack ? '\\nSTACKTRACE:\\n\$stackLog' : ''}';

    if (exludeLogsFromClasses
            .any((excludeClass) => className == excludeClass) ||
        (showOnlyClass != null && className != showOnlyClass)) return [];

    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    List<String> result = [];

    for (var line in output.split('\\n')) {
      result.addAll(pattern.allMatches(line).map((match) {
        if (_isReleaseMode) {
          return match.group(0)!;
        } else {
          return color!(match.group(0)!);
        }
      }));
    }

    return result;
  }

  String? _getMethodName() {
    try {
      var currentStack = StackTrace.current;
      var formattedStacktrace = _formatStackTrace(currentStack, 3);

      var realFirstLine = formattedStacktrace
          ?.firstWhere((line) => line.contains(className), orElse: () => "");

      var methodName = realFirstLine?.replaceAll('\$className.', '');
      return methodName;
    } catch (e) {
      // There's no deliberate function call from our code so we return null;
      return null;
    }
  }
}

final stackTraceRegex = RegExp(r'#[0-9]+[\\s]+(.+) \\(([^\\s]+)\\)');

List<String>? _formatStackTrace(StackTrace stackTrace, int methodCount) {
  var lines = stackTrace.toString().split('\\n');

  var formatted = <String>[];
  var count = 0;
  for (var line in lines) {
    var match = stackTraceRegex.matchAsPrefix(line);
    if (match != null) {
      if (match.group(2)!.startsWith('package:logger')) {
        continue;
      }
      var newLine = ("\${match.group(1)}");
      formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
      if (++count == methodCount) {
        break;
      }
    } else {
      formatted.add(line);
    }
  }

  if (formatted.isEmpty) {
    return null;
  } else {
    return formatted;
  }
}

class MultipleLoggerOutput extends LogOutput {
  final List<LogOutput> logOutputs;
  MultipleLoggerOutput(this.logOutputs);

  @override
  void output(OutputEvent event) {
    for (var logOutput in logOutputs) {
      try {
        logOutput.output(event);
      } catch (e) {
        print('Log output failed');
      }
    }
  }
}

Logger ebraLogger(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallstack = false,
  List<String> exludeLogsFromClasses = const [],
  String? showOnlyClass,
}) {
  return Logger(
    printer: SimpleLogPrinter(
      className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallstack,
      showOnlyClass: showOnlyClass,
      exludeLogsFromClasses: exludeLogsFromClasses,
    ),
    output: MultipleLoggerOutput([
      if(!_isReleaseMode)
      ConsoleOutput(),
       if(_isReleaseMode) outputOne(), if(_isReleaseMode) outputTwo(),
    ]),
  );
}
''';
const String kloggerClassContentWithDisableReleaseConsoleOutput = '''
// ignore_for_file: avoid_print

/// Maybe this should be generated for the user as well?
///
/// import 'package:customer_app/services/stackdriver/stackdriver_service.dart';
import 'package:logger/logger.dart';

import 'importOne';
import 'importTwo';



const bool _isReleaseMode = bool.fromEnvironment("dart.vm.product");

class SimpleLogPrinter extends LogPrinter {
  final String className;
  final bool printCallingFunctionName;
  final bool printCallStack;
  final List<String> exludeLogsFromClasses;
  final String? showOnlyClass;

  SimpleLogPrinter(
    this.className, {
    this.printCallingFunctionName = true,
    this.printCallStack = false,
    this.exludeLogsFromClasses = const [],
    this.showOnlyClass,
  });

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    var methodName = _getMethodName();

    var methodNameSection =
        printCallingFunctionName && methodName != null ? ' | \$methodName ' : '';
    var stackLog = event.stackTrace.toString();
    var output =
        '\$emoji \$className\$methodNameSection - \${event.message}\${printCallStack ? '\\nSTACKTRACE:\\n\$stackLog' : ''}';

    if (exludeLogsFromClasses
            .any((excludeClass) => className == excludeClass) ||
        (showOnlyClass != null && className != showOnlyClass)) return [];

    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    List<String> result = [];

    for (var line in output.split('\\n')) {
      result.addAll(pattern.allMatches(line).map((match) {
        if (_isReleaseMode) {
          return match.group(0)!;
        } else {
          return color!(match.group(0)!);
        }
      }));
    }

    return result;
  }

  String? _getMethodName() {
    try {
      var currentStack = StackTrace.current;
      var formattedStacktrace = _formatStackTrace(currentStack, 3);

      var realFirstLine = formattedStacktrace
          ?.firstWhere((line) => line.contains(className), orElse: () => "");

      var methodName = realFirstLine?.replaceAll('\$className.', '');
      return methodName;
    } catch (e) {
      // There's no deliberate function call from our code so we return null;
      return null;
    }
  }
}

final stackTraceRegex = RegExp(r'#[0-9]+[\\s]+(.+) \\(([^\\s]+)\\)');

List<String>? _formatStackTrace(StackTrace stackTrace, int methodCount) {
  var lines = stackTrace.toString().split('\\n');

  var formatted = <String>[];
  var count = 0;
  for (var line in lines) {
    var match = stackTraceRegex.matchAsPrefix(line);
    if (match != null) {
      if (match.group(2)!.startsWith('package:logger')) {
        continue;
      }
      var newLine = ("\${match.group(1)}");
      formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
      if (++count == methodCount) {
        break;
      }
    } else {
      formatted.add(line);
    }
  }

  if (formatted.isEmpty) {
    return null;
  } else {
    return formatted;
  }
}

class MultipleLoggerOutput extends LogOutput {
  final List<LogOutput> logOutputs;
  MultipleLoggerOutput(this.logOutputs);

  @override
  void output(OutputEvent event) {
    for (var logOutput in logOutputs) {
      try {
        logOutput.output(event);
      } catch (e) {
        print('Log output failed');
      }
    }
  }
}

Logger ebraLogger(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallstack = false,
  List<String> exludeLogsFromClasses = const [],
  String? showOnlyClass,
}) {
  return Logger(
    printer: SimpleLogPrinter(
      className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallstack,
      showOnlyClass: showOnlyClass,
      exludeLogsFromClasses: exludeLogsFromClasses,
    ),
    output: MultipleLoggerOutput([
      
      ConsoleOutput(),
       if(_isReleaseMode) outputOne(), if(_isReleaseMode) outputTwo(),
    ]),
  );
}
''';
const String kLogHelperNameKey = 'logHelperName';
const String kMultiLoggerImports = 'MultiLoggerImport';
const String kMultipleLoggerOutput = 'MultiLoggerList';
const String kDisableConsoleOutputInRelease = 'MultiLoggerList';

const String kloggerClassNameAndOutputs = '''
Logger $kLogHelperNameKey(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallstack = false,
  List<String> exludeLogsFromClasses = const [],
  String? showOnlyClass,
}) {
  return Logger(
    printer: SimpleLogPrinter(
      className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallstack,
      showOnlyClass: showOnlyClass,
      exludeLogsFromClasses: exludeLogsFromClasses,
    ),
    output: MultipleLoggerOutput([
      $kDisableConsoleOutputInRelease
      ConsoleOutput(),
      $kMultipleLoggerOutput
    ]),
  );
}
''';
const String kCustomizedloggerClassNameAndOutputs = '''
Logger ebraLogger(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallstack = false,
  List<String> exludeLogsFromClasses = const [],
  String? showOnlyClass,
}) {
  return Logger(
    printer: SimpleLogPrinter(
      className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallstack,
      showOnlyClass: showOnlyClass,
      exludeLogsFromClasses: exludeLogsFromClasses,
    ),
    output: MultipleLoggerOutput([
      
      ConsoleOutput(),
       if(_isReleaseMode) outputOne(), if(_isReleaseMode) outputTwo(),
    ]),
  );
}
''';
