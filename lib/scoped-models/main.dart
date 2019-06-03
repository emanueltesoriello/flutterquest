import 'package:scoped_model/scoped_model.dart';

import './connected_quests.dart';

class MainModel extends Model with ConnectedQuestsModel, UserModel, QuestsModel, UtilityModel {
}
