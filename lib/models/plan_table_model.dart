class PlanTableModel {
  /// Creates the employee class with required details.
  PlanTableModel(this.id, this.name, this.product, this.price, this.isCheck);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String product;

  /// Salary of an employee.
  final String price;

  bool isCheck;

 static List<PlanTableModel> getEmployeeData() {
    return [
      PlanTableModel(0, 'お手軽洗車', '---', '500円', false),
      PlanTableModel(1, 'しっかり洗車', '---', '700円', false),
      PlanTableModel(2, 'スぺシャル洗車', '---', '1000円', false),
    ];
  }
}