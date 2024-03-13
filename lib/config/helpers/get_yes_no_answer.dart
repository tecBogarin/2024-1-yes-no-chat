import 'package:dio/dio.dart';
import 'package:yes_no_chat/domain/entities/message.dart';
import 'package:yes_no_chat/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('http://yesno.wtf/api');
    final YesNoModel ynmodel = YesNoModel.fromJson(response.data);
    return ynmodel.toMessageEntity();
  }
}
