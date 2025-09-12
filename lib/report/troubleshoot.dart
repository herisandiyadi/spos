import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';

class Troubleshoot extends StatelessWidget {
  const Troubleshoot({super.key});

  Future<File> exportSelectedTables(List<String> selectedTables) async {
    // final dbPath = await getDatabasesPath();
    final dbPath = await getDatabasesPath();
    final sourcePath = join(dbPath, 'app_database.db');
    final sourceDb = await openDatabase(sourcePath);

    // buat db baru sementara
    final exportPath = join(dbPath, 'export_data.db');
    if (await File(exportPath).exists()) {
      await File(exportPath).delete();
    }
    final exportDb = await openDatabase(exportPath, version: 1,
        onCreate: (db, version) async {
      for (var table in selectedTables) {
        // ambil schema table dari source
        final schema = await sourceDb.rawQuery(
            "SELECT sql FROM sqlite_master WHERE type='table' AND name=?",
            [table]);
        if (schema.isNotEmpty) {
          await db.execute(schema.first['sql'] as String);

          // copy data
          final rows = await sourceDb.query(table);
          for (var row in rows) {
            await db.insert(table, row);
          }
        }
      }
    });

    await exportDb.close();
    // await sourceDb.close();

    return File(exportPath);
  }

  Future<void> uploadDatabase(
      BuildContext context, void Function(String, double) onProgress) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      var outletName = sharedPreferences.getString("outletName");
      var latestCompanyCode = sharedPreferences.getString("companyCode");
      // File dbFile = File(dbPath);
      File dbFile = await exportSelectedTables(
          ["TransLite", "TransDetailLite", "LogLite", "ActPOSLite"]);
      if (!dbFile.existsSync()) {
        onProgress("❌ Scan tidak berhasil", 0.0);
        return;
      }

      onProgress("Scanning...", 0.0);

      Dio dio = Dio();

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(dbFile.path,
            filename: "app_database.db"),
        "companycode": latestCompanyCode,
        "outletname": outletName,
      });

      await dio.post(
        "https://squadrasuites.io/squadrapos/api/v1/upload",
        data: formData,
        onSendProgress: (sent, total) {
          onProgress("Scanning...", sent / total);
        },
      ).then((response) {
        if (response.data is Map) {
          if (response.data['status'] == 'success') {
            onProgress("✅ Scan selesai! ${response.data['msg']}", 1.0);
          } else {
            onProgress("❌ Scan selesai! ${response.data['msg']}", 1.0);
          }
        } else {
          onProgress("⚠️ Respons bukan JSON: ${response.data}", 1.0);
        }
      });
    } catch (e) {
      onProgress("❌ Error: $e", 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = 0.0;
    String status = "";

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text("Troubleshoot Apps"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              Text(status),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
            ElevatedButton(
              onPressed: () {
                uploadDatabase(context, (msg, prog) {
                  setState(() {
                    status = msg;
                    progress = prog;
                  });
                });
              },
              child: (progress == 0.0
                  ? const Text("Scan")
                  : const Text('Scan Again')),
            ),
          ],
        );
      },
    );
  }
}

// Cara pakai dari page manapun:
void showTroubleshootDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Troubleshoot(),
  );
}
