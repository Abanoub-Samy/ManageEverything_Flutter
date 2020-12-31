import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

//https://www.youtube.com/watch?v=zpWsedYMczM

//@DataClassName('managerTables')
class ManagerData extends Table {
  IntColumn get managerId => integer().autoIncrement()();

  TextColumn get managerFirstName => text().withLength(min: 1, max: 60)();

  TextColumn get managerLastName => text().withLength(min: 1, max: 60)();

  TextColumn get managerContact => text().withLength(min: 1, max: 12)();

  TextColumn get managerUserName => text().withLength(min: 1, max: 60)();

  TextColumn get managerPassword => text().withLength(min: 1, max: 60)();
//DateTimeColumn get date => dateTime().nullable()();
// BoolColumn get check1 => boolean().withDefault(Constant(false))();
// BoolColumn get check2 => boolean().withDefault(Constant(false))();

// @override
// Set<Column> get primaryKey => {
//       managerId,
//     };
}

@UseMoor(tables: [ManagerData])
class AppDataBase extends _$AppDataBase {
  AppDataBase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  Future<List<ManagerDataData>> getallData() => select(managerData).get();

  Stream<List<ManagerDataData>> watchallData() => select(managerData).watch();

  Future insertData(ManagerDataData managerDataData) =>
      into(managerData).insert(managerDataData);

  Future updateData(ManagerDataData managerDataData) =>
      update(managerData).replace(managerDataData);

  Future deleteData(ManagerDataData managerDataData) =>
      delete(managerData).delete(managerDataData);
}
