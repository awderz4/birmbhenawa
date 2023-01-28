import 'package:geolocator/geolocator.dart';
import 'package:birmbhenawa/infastructure/models/nearby_pharmacies.dart';

abstract class NearbyPharmaciesDataSource {
  Future<NearbyPharmacies?> getNearbyPharmacies(Uri uri);

  Uri getNearbyPharmaciesUrl(Position? position);
}
