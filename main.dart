//Restaurant System
import 'dart:io';

Map Order = {};
List AllOrders = [];
Map MenuPrice = {
  "Chicken Burger": 200,
  "Beef Burger": 250,
  "Zinger Burger": 300,
  "Double Beef Burger": 350,
};
List<Map> Employees = [];
int OrderNo = 0;
void main() {
  //initializing some value for testing purpose
  Employees.add({"ID": "Ali123", "Password": "123"});
  Employees.add({"ID": "Ahmed123", "Password": "1234"});
  Employees.add({"ID": "Hamza123", "Password": "12345"});
  MainMenu();
}

Login() {
  print("===Login===");
  stdout.write("Enter ID: ");
  var ID = stdin.readLineSync()!;
  stdout.write("Enter Password: ");
  var Password = stdin.readLineSync()!;
  bool isFound = false;
  for (int i = 0; i < Employees.length; i++) {
    if (ID == Employees[i]["ID"] && Password == Employees[i]["Password"]) {
      isFound = true;
      MainMenu();
    }
  }
  if (!isFound) {
    print("Invalid ID or Password");
    print("Returning to Login");
    Login();
  }
}

MainMenu() {
  print("Welcome to Restaurant System");
  print("1. Order");
  print("2. Update Price");
  print("3. Order History");
  print("4. Log out");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      OrderMenu();
      break;
    case 2:
      UpdatePrice();
      break;
    case 3:
      OrderHistory();
      break;
    case 4:
      Login();
      break;
    default:
      print("Invalid choice");
      break;
  }
}

UpdatePrice() {
  print("Update Price");
  print("1. Chicken Burger Current Price: ${MenuPrice["Chicken Burger"]}");
  print("2. Beef Burger Current Price: ${MenuPrice["Beef Burger"]}");
  print("3. Zinger Burger Current Price: ${MenuPrice["Zinger Burger"]}");
  print(
      "4. Double Beef Burger Current Price: ${MenuPrice["Double Beef Burger"]}");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    stdout.write("Enter New Price: ");
    var NewPrice = int.parse(stdin.readLineSync()!);
    MenuPrice["Chicken Burger"] = NewPrice;
  } else if (choice == 2) {
    stdout.write("Enter New Price: ");
    var NewPrice = int.parse(stdin.readLineSync()!);
    MenuPrice["Beef Burger"] = NewPrice;
  } else if (choice == 3) {
    stdout.write("Enter New Price: ");
    var NewPrice = int.parse(stdin.readLineSync()!);
    MenuPrice["Zinger Burger"] = NewPrice;
  } else if (choice == 4) {
    stdout.write("Enter New Price: ");
    var NewPrice = int.parse(stdin.readLineSync()!);
    MenuPrice["Double Beef Burger"] = NewPrice;
  } else {
    print("Invalid choice");
    print("Returning to Main Menu");
    MainMenu();
  }
  print("Price Updated");
  print("Press Enter to Continue");
  stdin.readLineSync();
  MainMenu();
}

OrderHistory() {
  print("Order History");
  print("1. All Orders");
  print("2. Search Order");
  print("3. Back to Main Menu");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      AllOrders.forEach((element) {
        print(element);
      });
      break;
    case 2:
      SearchOrder();
      break;
    case 3:
      MainMenu();
      break;
    default:
      print("Invalid choice");
      break;
  }
}

SearchOrder() {
  stdout.write("Enter Order No: ");
  var OrderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < AllOrders.length; i++) {
    if (OrderNos == AllOrders[i]["Order No"]) {
      print(AllOrders[i]);
    }
  }
}

OrderMenu() {
  print("1. Add Order");
  print("2. Edit Order");
  print("3. Delete Order");
  print("4. Back to Main Menu");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      AddOrder();
      break;
    case 2:
      EditOrder();
      break;
    case 3:
      DeleteOrder();
      break;
    case 4:
      MainMenu();
      break;
    default:
      print("Invalid choice");
      break;
  }
}

AddOrder() {
  var choice2;
  OrderNo++;
  do {
    print("Order No: $OrderNo");
    Order["Order No"] = OrderNo;
    print("Select Food");
    print("1. Chicken Burger ${MenuPrice["Chicken Burger"]}");
    print("2. Beef Burger ${MenuPrice["Beef Burger"]}");
    print("3. Zinger Burger ${MenuPrice["Zinger Burger"]}");
    print("4. Double Beef Burger ${MenuPrice["Double Beef Burger"]}");
    print("Please enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      Order["Chicken Burger"] = quantity;
    } else if (choice == 2) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      Order["Beef Burger"] = quantity;
    } else if (choice == 3) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      Order["Zinger Burger"] = quantity;
    } else if (choice == 4) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      Order["Double Beef Burger"] = quantity;
    } else {
      print("Invalid choice");
      AddOrder();
    }
    print("Do you want to add Another Item:(y/n):");
    choice2 = stdin.readLineSync()!;
    if (choice2 != 'y' ||
        choice2 != 'Y' ||
        choice2 != 'yes' ||
        choice2 != 'Yes') {
      AllOrders.add(Order);
    }
  } while (
      choice2 == 'y' || choice2 == 'Y' || choice2 == 'yes' || choice2 == 'Yes');
  BillGenerator();
}

BillGenerator() {
  double Total;
  double Tax;
  double GrandTotal;
  double Discount;
  double NetTotal;
  print("Bill Generator");
  print("1. Cash");
  print("2. Credit Card");
  print("3. Cancel Order");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    Total = 0;
    if (Order["Chicken Burger"] != null) {
      Total = Total + Order["Chicken Burger"] * MenuPrice["Chicken Burger"];
    }
    if (Order["Beef Burger"] != null) {
      Total = Total + Order["Beef Burger"] * MenuPrice["Beef Burger"];
    }
    if (Order["Zinger Burger"] != null) {
      Total = Total + Order["Zinger Burger"] * MenuPrice["Zinger Burger"];
    }
    if (Order["Double Beef Burger"] != null) {
      Total =
          Total + Order["Double Beef Burger"] * MenuPrice["Double Beef Burger"];
    }
    Tax = Total * 0.13;
    GrandTotal = Total + Tax;
    Discount = GrandTotal * 0.05;
    NetTotal = GrandTotal - Discount;
    print("Total: Rs $Total");
    print("Tax: Rs $Tax");
    print("Grand Total: Rs $GrandTotal");
    print("Discount: Rs $Discount");
    print("Net Total: Rs $NetTotal");
    stdout.write("Enter Cash Amount Recieved: ");
    var Cash = double.parse(stdin.readLineSync()!);
    print("Cash: Rs $Cash");
    print("Change: Rs ${Cash - NetTotal}");
    print("Thank you for visiting");
    print("Press Enter to Continue");
    stdin.readLineSync();
    Order.clear();
    MainMenu();
  }
  if (choice == 2) {
    print("Enter Credit Card Number: ");
    var CreditCard = stdin.readLineSync()!;
    Total = 0;
    if (Order["Chicken Burger"] != null) {
      Total = Total + Order["Chicken Burger"] * MenuPrice["Chicken Burger"];
    }
    if (Order["Beef Burger"] != null) {
      Total = Total + Order["Beef Burger"] * MenuPrice["Beef Burger"];
    }
    if (Order["Zinger Burger"] != null) {
      Total = Total + Order["Zinger Burger"] * MenuPrice["Zinger Burger"];
    }
    if (Order["Double Beef Burger"] != null) {
      Total =
          Total + Order["Double Beef Burger"] * MenuPrice["Double Beef Burger"];
    }
    Tax = Total * 0.13;
    GrandTotal = Total + Tax;
    Discount = GrandTotal * 0.05;
    NetTotal = GrandTotal - Discount;
    print("Total: Rs $Total");
    print("Tax: Rs $Tax");
    print("Grand Total: Rs $GrandTotal");
    print("Discount: Rs $Discount");
    print("Net Total: Rs $NetTotal");
    print("Credit Card Number: $CreditCard");
    print("Thank you for visiting");
    print("Press Enter to Continue");
    Order.clear();
    stdin.readLineSync();
    OrderMenu();
  }
  if (choice == 3) {
    //Cancel Order
    Order.clear();
  } else {
    print("Invalid choice");
  }
}

EditOrder() {
  stdout.write("Enter Order No: ");
  var OrderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < AllOrders.length; i++) {
    if (OrderNos == AllOrders[i]["Order No"]) {
      Order = AllOrders[i];
      print(" Re-Enter Order");
      print("Order No: ${Order["Order No"]}");
      print("1. Chicken Burger ${MenuPrice["Chicken Burger"]}");
      print("2. Beef Burger ${MenuPrice["Beef Burger"]}");
      print("3. Zinger Burger ${MenuPrice["Zinger Burger"]}");
      print("4. Double Beef Burger ${MenuPrice["Double Beef Burger"]}");
      stdout.write("Please enter your choice: ");
      var choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        stdout.write("Enter Quantity: ");
        var quantity = int.parse(stdin.readLineSync()!);
        Order["Chicken Burger"] = quantity;
      } else if (choice == 2) {
        stdout.write("Enter Quantity: ");
        var quantity = int.parse(stdin.readLineSync()!);
        Order["Beef Burger"] = quantity;
      } else if (choice == 3) {
        stdout.write("Enter Quantity: ");
        var quantity = int.parse(stdin.readLineSync()!);
        Order["Zinger Burger"] = quantity;
      } else if (choice == 4) {
        stdout.write("Enter Quantity: ");
        var quantity = int.parse(stdin.readLineSync()!);
        Order["Double Beef Burger"] = quantity;
      } else {
        print("Invalid choice");
        OrderMenu();
      }
    }
  }
}

DeleteOrder() {
  bool isDeleted = false;
  stdout.write("Enter Order No: ");
  var OrderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < AllOrders.length; i++) {
    if (OrderNos == AllOrders[i]["Order No"]) {
      AllOrders.removeAt(i);
      isDeleted = true;
    }
  }
  if (!isDeleted) {
    print("Order Not Found");
    print("Returning to MainMenu");
    OrderMenu();
  }
}
