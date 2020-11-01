abstract class INetworkService {
  Future<Map<String, dynamic>> get(String url,[String params]);
}
