class ApiConst {
  static const String baseUrl = "http://192.168.1.144:5279";

  static const String login = "/api/Auth/login";
  static const String refreshToken = "/api/Auth/refresh-token";
  static const String logout = "/api/Auth/logout";

  static const String medicine = "/api/Medicine";
  static String medicineById(int id) => "/api/Medicine/$id";

  static String order(int id) => "/api/Order/$id";
  static const String updateStatus =  "/api/Order/update-status";
  static const String supplierOrder = "/api/Order/supplier-orders";

  static const String addMedicineInInventory = "/api/Inventory/main";
  static const String transferOrder = "/api/Inventory/transfer";
  static const String mainInventory = "/api/Inventory/main-Inventory";
}