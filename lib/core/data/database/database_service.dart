abstract class DatabaseService {
  Future<void> create({required dynamic collection, required String key, dynamic value});

  Future<Map<String, dynamic>> retrieve({required dynamic collection, String? key, required dynamic notFoundDefault});

  Future<void> update({required dynamic collection, required String key, dynamic value});

  Future<void> delete({required dynamic collection, String? key});

  Future<void> clearData();
}
