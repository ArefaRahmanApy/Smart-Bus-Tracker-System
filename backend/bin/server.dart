import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:backend/database_service.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/buses', _getBusesHandler)
  ..post('/update-location', _updateLocationHandler);

Response _rootHandler(Request req) {
  return Response.ok('BusTracking Server is running!\n');
}

Future<Response> _getBusesHandler(Request req) async {
  final db = DatabaseService();
  final buses = await db.getAllBuses();
  return Response.ok(jsonEncode(buses), headers: {'content-type': 'application/json'});
}

Future<Response> _updateLocationHandler(Request req) async {
  final payload = await req.readAsString();
  final data = jsonDecode(payload);

  final busId = data['busId'];
  final lat = data['latitude'];
  final lng = data['longitude'];

  if (busId == null || lat == null || lng == null) {
    return Response.badRequest(body: 'Missing busId, latitude, or longitude');
  }

  final db = DatabaseService();
  await db.updateBusLocation(busId, lat, lng);

  return Response.ok(jsonEncode({'status': 'success'}), headers: {'content-type': 'application/json'});
}

void main(List<String> args) async {
  // Use any available host or container IP (e.g. '0.0.0.0') and port 8080
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // Initialize Database
  final db = DatabaseService();
  await db.connect();

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
