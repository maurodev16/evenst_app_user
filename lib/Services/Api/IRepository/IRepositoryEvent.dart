import 'package:events_app_user/Models/event_model.dart';

abstract class IRepositoryEvent {
  Future<List<EventModel>> getAllEvents();
  Future<List<EventModel>> getFeaturedEvents();
  // Future<void> getPartyById(String id);
  // Future<void> deleteParty(String id);
  // Future<ModelParty> editParty(ModelParty tblParty);
  // Future<ModelParty> addParty(ModelParty tblParty);
}
