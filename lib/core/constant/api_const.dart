class ApiConst {
  static const String baseUrl = "http://192.168.1.28:5279";

  static const String login = "/api/Auth/login";
  static const String createSupplier = "/api/Auth/register-supplier";
  static const String refreshToken = "/api/Auth/refresh-token";
  static const String logout = "/api/Auth/logout";
  static const String profile = "/api/Auth/profile";

  static const String medicine = "/api/Medicine";
  static String medicineById(int id) => "/api/Medicine/$id";

  static String order(int id) => "/api/Order/$id";
  static const String updateStatus =  "/api/Order/update-status";
  static const String supplierOrder = "/api/Order/supplier-orders";

  static const String addMedicineInInventory = "/api/Inventory/main";
  static const String transferOrder = "/api/Inventory/transfer";
  static const String mainInventory = "/api/Inventory/main-Inventory";

  static const String dashboard = "/api/Dashboard";
}