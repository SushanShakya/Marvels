abstract class IOfflineService {
  Future<String> read();
  void write(String data);
}
