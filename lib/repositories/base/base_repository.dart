import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

abstract class BaseRepository<T> {
  final Isar _isar;

  BaseRepository(this._isar);

  Future<Either<IsarError, List<T>>> queryAll() async {
    try {
      return right(await _isar
          .collection<T>()
          .buildQuery<T>(whereClauses: [const IdWhereClause.any()]).findAll());
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, T?>> queryById(Id id) async {
    try {
      return right(await _isar.collection<T>().buildQuery<T>(
          whereClauses: [IdWhereClause.equalTo(value: id)]).findFirst());
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, Id>> put(T entity) async {
    try {
      late final Id returnEntityId;
      await _isar.writeTxn(() async {
        returnEntityId = await _isar.collection<T>().put(entity);
      });

      return right(returnEntityId);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }
}
