import 'package:events_app_user/Models/event_model.dart';
import 'package:get/get.dart';
import '../IRepository/IRepositoryEvent.dart';

class RepositoryEvent implements IRepositoryEvent {
  final String baseUrl = "https://velhodalancha.onrender.com";
  final GetConnect httpClient = GetConnect();

  @override
  Future<List<EventModel>> getAllEvents() async {
    final response = await httpClient.get(
      '$baseUrl/api/v1/event/fetch',
      decoder: (body) {
        if (body is List) {
          print("CORPO DA RESPOSTA******$body");
          return body
              .map<EventModel>((item) => EventModel.fromJson(item))
              .toList();
        } else {
          throw Exception('A resposta da API não é uma lista');
        }
      },
    );

    if (response.isOk) {
      return response.body!.cast<EventModel>();
    } else {
      throw Exception('Erro ao buscar os eventos');
    }
  }

  @override
  Future<List<EventModel>> getFeaturedEvents() async {
    final response = await httpClient.get<List<dynamic>>(
      '$baseUrl/api/v1/event/fetchEventIsFeatured/true',
      decoder: (body) {
        if (body is List) {
          print("isFeatured RESPOSTA******$body");
          return body
              .map<EventModel>((item) => EventModel.fromJson(item))
              .toList();
        } else {
          throw Exception('A resposta da API não é uma lista');
        }
      },
    );

    if (response.statusCode == 200) {
      return response.body!.cast<
          EventModel>(); // Certifique-se de que o modelo seja List<EventModel> em vez de List<dynamic>
    } else {
      throw Exception('Erro ao buscar os isFeatured eventos');
    }
  }
}
