import 'package:hive/hive.dart';
part 'database.g.dart';

@HiveType(typeId: 1)
class TFADB {
  TFADB({
    required this.isLogin,
    required this.uid,
    required this.user,
  });

  @HiveField(0)
  bool isLogin;

  @HiveField(1)
  String uid;

  @HiveField(2)
  Map user;
}
