import 'package:prob/db/category_model.dart';

import 'sqflite_control.dart';
import 'consum_hist_model.dart';

class UseSqflite {
  Future<void> insertTestData() async {
    for (var category in CategoryModel.defaultCategories) {
      await SqfliteControl.insertCategory(category);
    }

    ConsumHistModel testData1 = ConsumHistModel(
      date: '2023-07-15',
      receiver: 'Alice',
      amount: 100,
      categoryId: 1,
    );

    ConsumHistModel testData2 = ConsumHistModel(
      date: '2023-07-16',
      receiver: 'Bob',
      amount: 150,
      categoryId: 2,
    );

    ConsumHistModel testData3 = ConsumHistModel(
      date: '2023-07-16',
      receiver: 'Ewwq',
      amount: 350,
      categoryId: 1,
    );

    await SqfliteControl.insertQuery(testData1);
    await SqfliteControl.insertQuery(testData2);
    await SqfliteControl.insertQuery(testData3);
  }

  Future<List<ConsumHistModel>> getAllData() async {
    return await SqfliteControl.getAllConsumHis();
  }
}
