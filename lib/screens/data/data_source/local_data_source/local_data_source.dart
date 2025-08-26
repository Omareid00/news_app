
abstract class LocalDataSource{

Future<void> saveSources(Map sources);
Future<Map> getSources();
}