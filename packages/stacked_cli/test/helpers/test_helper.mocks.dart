// Mocks generated by Mockito 5.0.17 from annotations
// in stacked_cli/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:io' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_cli/src/models/template_models.dart' as _i7;
import 'package:stacked_cli/src/services/file_service.dart' as _i2;
import 'package:stacked_cli/src/services/path_service.dart' as _i5;
import 'package:stacked_cli/src/services/template_service.dart' as _i6;
import 'package:stacked_cli/src/templates/template_helper.dart' as _i9;
import 'package:stacked_cli/src/templates/template_render_functions.dart'
    as _i8;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [FileService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileService extends _i1.Mock implements _i2.FileService {
  @override
  _i3.Future<void> writeFile(
          {_i4.File? file, String? fileContent, bool? verbose = false}) =>
      (super.noSuchMethod(
          Invocation.method(#writeFile, [],
              {#file: file, #fileContent: fileContent, #verbose: verbose}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<bool> fileExists({String? filePath}) => (super.noSuchMethod(
      Invocation.method(#fileExists, [], {#filePath: filePath}),
      returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<String> readFile({String? filePath}) => (super.noSuchMethod(
      Invocation.method(#readFile, [], {#filePath: filePath}),
      returnValue: Future<String>.value('')) as _i3.Future<String>);
  @override
  _i3.Future<List<_i4.FileSystemEntity>> getFilesInDirectory(
          {String? directoryPath}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getFilesInDirectory, [], {#directoryPath: directoryPath}),
              returnValue: Future<List<_i4.FileSystemEntity>>.value(
                  <_i4.FileSystemEntity>[]))
          as _i3.Future<List<_i4.FileSystemEntity>>);
  @override
  _i3.Future<List<String>> getFoldersInDirectory({String? directoryPath}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getFoldersInDirectory, [], {#directoryPath: directoryPath}),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i3.Future<List<String>>);
  @override
  void log(String? message, {bool? verbose = false}) => super.noSuchMethod(
      Invocation.method(#log, [message], {#verbose: verbose}),
      returnValueForMissingStub: null);
  @override
  _i3.Future<bool> isProjectRoot() =>
      (super.noSuchMethod(Invocation.method(#isProjectRoot, []),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> isStakedApplication() =>
      (super.noSuchMethod(Invocation.method(#isStakedApplication, []),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}

/// A class which mocks [PathService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPathService extends _i1.Mock implements _i5.PathService {
  @override
  String get templatesPath =>
      (super.noSuchMethod(Invocation.getter(#templatesPath), returnValue: '')
          as String);
  @override
  String join(String? part1,
          [String? part2,
          String? part3,
          String? part4,
          String? part5,
          String? part6,
          String? part7,
          String? part8]) =>
      (super.noSuchMethod(
          Invocation.method(
              #join, [part1, part2, part3, part4, part5, part6, part7, part8]),
          returnValue: '') as String);
  @override
  String basename(String? path) =>
      (super.noSuchMethod(Invocation.method(#basename, [path]), returnValue: '')
          as String);
}

/// A class which mocks [TemplateService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTemplateService extends _i1.Mock implements _i6.TemplateService {
  @override
  _i3.Future<void> compileTemplateInformation() =>
      (super.noSuchMethod(Invocation.method(#compileTemplateInformation, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> renderTemplate(
          {String? templateName,
          String? name,
          bool? verbose = false,
          bool? excludeRoute = false}) =>
      (super.noSuchMethod(
          Invocation.method(#renderTemplate, [], {
            #templateName: templateName,
            #name: name,
            #verbose: verbose,
            #excludeRoute: excludeRoute
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> writeOutTemplateFiles(
          {_i7.StackedTemplate? template,
          String? templateName,
          String? name}) =>
      (super.noSuchMethod(
          Invocation.method(#writeOutTemplateFiles, [],
              {#template: template, #templateName: templateName, #name: name}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String getTemplateOutputPath({String? inputTemplatePath, String? name}) =>
      (super.noSuchMethod(
          Invocation.method(#getTemplateOutputPath, [],
              {#inputTemplatePath: inputTemplatePath, #name: name}),
          returnValue: '') as String);
  @override
  String renderContentForTemplate(
          {String? content, String? templateName, String? name}) =>
      (super.noSuchMethod(
          Invocation.method(#renderContentForTemplate, [],
              {#content: content, #templateName: templateName, #name: name}),
          returnValue: '') as String);
  @override
  Map<String, String> getTemplateRenderData(
          {String? templateName,
          String? name,
          Map<String, _i8.RenderFunction>? testRenderFunctions}) =>
      (super.noSuchMethod(
          Invocation.method(#getTemplateRenderData, [], {
            #templateName: templateName,
            #name: name,
            #testRenderFunctions: testRenderFunctions
          }),
          returnValue: <String, String>{}) as Map<String, String>);
  @override
  _i3.Future<void> modifyExistingFiles(
          {_i7.StackedTemplate? template,
          String? templateName,
          String? name}) =>
      (super.noSuchMethod(
          Invocation.method(#modifyExistingFiles, [],
              {#template: template, #templateName: templateName, #name: name}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String templateModificationFileContent(
          {String? fileContent,
          String? modificationTemplate,
          String? modificationIdentifier,
          String? name,
          String? templateName}) =>
      (super.noSuchMethod(
          Invocation.method(#templateModificationFileContent, [], {
            #fileContent: fileContent,
            #modificationTemplate: modificationTemplate,
            #modificationIdentifier: modificationIdentifier,
            #name: name,
            #templateName: templateName
          }),
          returnValue: '') as String);
}

/// A class which mocks [TemplateHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockTemplateHelper extends _i1.Mock implements _i9.TemplateHelper {
  @override
  String get templatesPath =>
      (super.noSuchMethod(Invocation.getter(#templatesPath), returnValue: '')
          as String);
  @override
  List<_i4.FileSystemEntity> getFilesWithExtension(
          {List<_i4.FileSystemEntity>? filePaths, String? extension}) =>
      (super.noSuchMethod(
          Invocation.method(#getFilesWithExtension, [],
              {#filePaths: filePaths, #extension: extension}),
          returnValue: <_i4.FileSystemEntity>[]) as List<_i4.FileSystemEntity>);
  @override
  List<_i4.FileSystemEntity> getFilesThatContainSection(
          {List<_i4.FileSystemEntity>? files, String? section}) =>
      (super.noSuchMethod(
          Invocation.method(#getFilesThatContainSection, [],
              {#files: files, #section: section}),
          returnValue: <_i4.FileSystemEntity>[]) as List<_i4.FileSystemEntity>);
  @override
  String getTemplateFileNameOnly({_i4.FileSystemEntity? templateFilePath}) =>
      (super.noSuchMethod(
          Invocation.method(#getTemplateFileNameOnly, [],
              {#templateFilePath: templateFilePath}),
          returnValue: '') as String);
  @override
  String getTemplateFolderName({String? templateFilePath}) =>
      (super.noSuchMethod(
          Invocation.method(#getTemplateFolderName, [],
              {#templateFilePath: templateFilePath}),
          returnValue: '') as String);
  @override
  _i3.Future<List<_i4.FileSystemEntity>> getFilesForTemplate(
          {String? templateName, String? extension = r'.stk'}) =>
      (super.noSuchMethod(
              Invocation.method(#getFilesForTemplate, [],
                  {#templateName: templateName, #extension: extension}),
              returnValue: Future<List<_i4.FileSystemEntity>>.value(
                  <_i4.FileSystemEntity>[]))
          as _i3.Future<List<_i4.FileSystemEntity>>);
  @override
  _i3.Future<List<_i7.CompiledFileModification>>
      getTemplateModificationsToApply({String? templateName}) =>
          (super.noSuchMethod(
                  Invocation.method(#getTemplateModificationsToApply, [],
                      {#templateName: templateName}),
                  returnValue: Future<List<_i7.CompiledFileModification>>.value(
                      <_i7.CompiledFileModification>[]))
              as _i3.Future<List<_i7.CompiledFileModification>>);
  @override
  _i3.Future<List<_i7.CompliledTemplateFile>> getTemplateItemsToRender(
          {String? templateName}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getTemplateItemsToRender, [], {#templateName: templateName}),
              returnValue: Future<List<_i7.CompliledTemplateFile>>.value(
                  <_i7.CompliledTemplateFile>[]))
          as _i3.Future<List<_i7.CompliledTemplateFile>>);
}
