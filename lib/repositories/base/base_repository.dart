import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

abstract class BaseRepository<T> {
  final Isar isar;

  BaseRepository(this.isar);

  Future<Either<IsarError, List<T>>> queryAll() async {
    try {
      return right(await isar
          .collection<T>()
          .buildQuery<T>(whereClauses: [const IdWhereClause.any()]).findAll());
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, T?>> queryById(Id id) async {
    try {
      return right(await isar.collection<T>().buildQuery<T>(
          whereClauses: [IdWhereClause.equalTo(value: id)]).findFirst());
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, List<T>?>> queryFilter(
      Id id, FilterOperation filters) async {
    try {
      return right(await isar.collection<T>().buildQuery<T>(
          whereClauses: [const IdWhereClause.any()],
          filter: filters).findAll());
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, Id>> put(T entity) async {
    try {
      late final Id returnEntityId;
      await isar.writeTxn(() async {
        returnEntityId = await isar.collection<T>().put(entity);
      });

      return right(returnEntityId);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, List<Id>>> putAll(List<T> entities) async {
    try {
      late final List<Id> returnEntityIds;
      await isar.writeTxn(() async {
        returnEntityIds = await isar.collection<T>().putAll(entities);
      });

      return right(returnEntityIds);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }
}
