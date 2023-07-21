//Restaurant System
import 'dart:io';

int attempt = 0;
List AllOrders = [];
Map<String, int> MenuPrice = {
  "Chicken Burger": 200,
  "Beef Burger": 250,
  "Zinger Burger": 300,
  "Double Beef Burger": 350,
};
List Employees = [];
int OrderNo = 0;
void main() {
  //initializing some value for testing purpose
  Employees.add({
    "ID": "Ali123",
    "Password": "123",
    "name": "Ali",
    "designation": "Manager"
  });
  Employees.add({
    "ID": "Ahmed123",
    "Password": "1234",
    "name": "Ahmed",
    "designation": "Chef"
  });
  Employees.add({
    "ID": "Hamza123",
    "Password": "12345",
    "name": "Hamza",
    "designation": "Waiter"
  });
  Map Order1 = {
    "Order No": 1,
    "Chicken Burger": 2,
    "Beef Burger": 1,
    "Zinger Burger": 1,
    "Double Beef Burger": 1,
  };
  Map Order2 = {
    "Order No": 2,
    "Chicken Burger": 2,
    "Beef Burger": 2,
    "Zinger Burger": 2,
    "Double Beef Burger": 1,
  };
  AllOrders.add(Order1);
  AllOrders.add(Order2);
  Login();
}

Login() {
  while (attempt < 4) {
    attempt++;
    print("===Login===");
    stdout.write("Enter ID: ");
    var ID = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
    stdout.write("Enter Password: ");
    var Password = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
    bool isFound = false;
    for (int i = 0; i < Employees.length; i++) {
      if (ID == Employees[i]["ID"] && Password == Employees[i]["Password"]) {
        isFound = true;
        MainMenu(i);
      }
    }
    if (!isFound) {
      print("Invalid ID or Password");
      print("Returning to Login");
      Login();
    }
  }
  if (attempt == 4) {
    print(" => You have exceeded the maximum number of attempts");
    print("Please try again later");
    exit(0);
  }
}

MainMenu(int index) {
  print(" ==> Welcome ${Employees[index]["name"]} to Restaurant System <==");
  print("1. Order");
  print("- - - - - - - - - ");
  print("2. Update Price");
  print("- - - - - - - - - ");
  print("3. Order History");
  print("- - - - - - - - - ");
  print("4. Log out");
  print("- - - - - - - - - ");
  print("5. Exit");
  print("- - - - - - - - - ");
  stdout.write("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  print("- - - - - - - - - ");
  if (choice == 1) {
    OrderMenu(index);
  } else if (choice == 2) {
    UpdatePrice(index);
  } else if (choice == 3) {
    OrderHistory(index);
  } else if (choice == 4) {
    Login();
  } else if (choice == 5) {
    exit(0);
  } else {
    print("Invalid choice");
    MainMenu(index);
  }
}

UpdatePrice(int index) {
  if (Employees[index]["designation"] != "Manager") {
    print("You are not authorized to update price");
    print("Returning to Main Menu");
    MainMenu(index);
  }
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
    MainMenu(index);
  }
  print("Price Updated");
  print("Press Enter to Continue");
  stdin.readLineSync();
  MainMenu(index);
}

OrderHistory(int index) {
  print("==> Order History <== ");
  print("1. All Orders");
  print("- - - - - - - - - ");
  print("2. Search Order");
  print("- - - - - - - - - ");
  print("3. Back to Main Menu");
  print("- - - - - - - - - ");
  stdout.write("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  print("- - - - - - - - - ");
  if (choice == 1) {
    AllOrders.forEach((element) {
      print(element);
    });
    MainMenu(index);
  } else if (choice == 2) {
    SearchOrder(index);
  } else if (choice == 3) {
    MainMenu(index);
  } else {
    print("Invalid choice");
    OrderHistory(index);
  }
}

SearchOrder(int index) {
  bool isFound = false;
  stdout.write("Enter Order No: ");
  var OrderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < AllOrders.length; i++) {
    if (OrderNos == AllOrders[i]["Order No"]) {
      print(AllOrders[i]);
      isFound = true;
    }
  }
  if (!isFound) {
    print("Order Not Found");
    print("Returning to Order History");
    OrderHistory(index);
  }
  MainMenu(index);
}

OrderMenu(int index) {
  print("1. Add Order");
  print("2. Edit Order");
  print("3. Delete Order");
  print("4. Back to Main Menu");
  print("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    AddOrder(index);
  } else if (choice == 2) {
    EditOrder(index);
  } else if (choice == 3) {
    DeleteOrder(index);
  } else if (choice == 4) {
    MainMenu(index);
  } else {
    print("Invalid choice");
    OrderMenu(index);
  }
}

AddOrder(int index) {
  Map order = {};
  var choice2;
  OrderNo++;
  do {
    print("Order No: $OrderNo");
    order['Order No'] = OrderNo;
    print("=======> Menu <=======");
    print("1. Chicken Burger ${MenuPrice["Chicken Burger"]}");
    print("- - - - - - - - - - - - - - -");
    print("2. Beef Burger ${MenuPrice["Beef Burger"]}");
    print("- - - - - - - - - - - - - - -");
    print("3. Zinger Burger ${MenuPrice["Zinger Burger"]}");
    print("- - - - - - - - - - - - - - -");
    print("4. Double Beef Burger ${MenuPrice["Double Beef Burger"]}");
    print("- - - - - - - - - - - - - - -");
    stdout.write("Please enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);
    print("- - - - - - - - - - - - - - -");
    if (choice == 1) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Chicken Burger'] = quantity;
    } else if (choice == 2) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Beef Burger'] = quantity;
    } else if (choice == 3) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Zinger Burger'] = quantity;
    } else if (choice == 4) {
      stdout.write("Enter Quantity: ");
      var quantity = int.parse(stdin.readLineSync()!);
      order['Double Beef Burger'] = quantity;
    } else {
      print("Invalid choice");
      print("- - - - - - - - - - - - - - -");
      AddOrder(index);
    }
    stdout.write("Do you want to add Another Item:(y/n):");
    choice2 = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
  } while (
      choice2 == 'y' || choice2 == 'Y' || choice2 == 'yes' || choice2 == 'Yes');
  AllOrders.add(Map.from(order));
  BillGenerator(index, order);
}

BillGenerator(int index, Map Order) {
  double Total;
  double Tax;
  double GrandTotal;
  double Discount;
  double NetTotal;
  print("==> Select Payment Method <==");
  print("1. Cash");
  print("- - - - - -");
  print("2. Credit Card");
  print("- - - - - -");
  print("3. Cancel Order");
  print("- - - - - -");
  stdout.write("Please enter your choice: ");
  var choice = int.parse(stdin.readLineSync()!);
  print("- - - - - - - - - - - - - - -");
  print("=======> Bill <=======");
  if (choice == 1) {
    Total = 0;
    if (Order["Chicken Burger"] != null) {
      Total = Total + Order["Chicken Burger"] * MenuPrice["Chicken Burger"];
      print(
          "Chicken Burger: ${Order["Chicken Burger"]} x ${MenuPrice["Chicken Burger"]} = ${Order["Chicken Burger"] * MenuPrice["Chicken Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    if (Order["Beef Burger"] != null) {
      Total = Total + Order["Beef Burger"] * MenuPrice["Beef Burger"];
      print(
          "Beef Burger: ${Order["Beef Burger"]} x ${MenuPrice["Beef Burger"]} = ${Order["Beef Burger"] * MenuPrice["Beef Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    if (Order["Zinger Burger"] != null) {
      Total = Total + Order["Zinger Burger"] * MenuPrice["Zinger Burger"];
      print(
          "Zinger Burger: ${Order["Zinger Burger"]} x ${MenuPrice["Zinger Burger"]} = ${Order["Zinger Burger"] * MenuPrice["Zinger Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    if (Order["Double Beef Burger"] != null) {
      Total =
          Total + Order["Double Beef Burger"] * MenuPrice["Double Beef Burger"];
      print(
          "Double Beef Burger: ${Order["Double Beef Burger"]} x ${MenuPrice["Double Beef Burger"]} = ${Order["Double Beef Burger"] * MenuPrice["Double Beef Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    Tax = Total * 0.13;
    GrandTotal = Total + Tax;
    Discount = GrandTotal * 0.05;
    NetTotal = GrandTotal - Discount;
    print("Total: Rs $Total");
    print("- - - - - - - - - - - - - - -");
    print("Tax: Rs $Tax");
    print("- - - - - - - - - - - - - - -");
    print("Grand Total: Rs $GrandTotal");
    print("- - - - - - - - - - - - - - -");
    print("Discount: Rs $Discount");
    print("- - - - - - - - - - - - - - -");
    print("Net Total: Rs $NetTotal");
    print("================================");
    stdout.write("Enter Cash Amount Recieved: ");
    var Cash = double.parse(stdin.readLineSync()!);
    print("Cash: Rs $Cash");
    print("Change: Rs ${Cash - NetTotal}");
    print("Thank you for visiting");
    print("- - - - - - - - - - - - - - -");
    print("Press Enter to Continue");
    stdin.readLineSync();
    Order.clear();
    MainMenu(index);
  }
  if (choice == 2) {
    stdout.write("Enter Credit Card Number: ");
    var CreditCard = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
    Total = 0;
    if (Order["Chicken Burger"] != null) {
      Total = Total + Order["Chicken Burger"] * MenuPrice["Chicken Burger"];
      print(
          "Chicken Burger: ${Order["Chicken Burger"]} x ${MenuPrice["Chicken Burger"]} = ${Order["Chicken Burger"] * MenuPrice["Chicken Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    if (Order["Beef Burger"] != null) {
      Total = Total + Order["Beef Burger"] * MenuPrice["Beef Burger"];
      print(
          "Beef Burger: ${Order["Beef Burger"]} x ${MenuPrice["Beef Burger"]} = ${Order["Beef Burger"] * MenuPrice["Beef Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    if (Order["Zinger Burger"] != null) {
      Total = Total + Order["Zinger Burger"] * MenuPrice["Zinger Burger"];
      print(
          "Zinger Burger: ${Order["Zinger Burger"]} x ${MenuPrice["Zinger Burger"]} = ${Order["Zinger Burger"] * MenuPrice["Zinger Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    if (Order["Double Beef Burger"] != null) {
      Total =
          Total + Order["Double Beef Burger"] * MenuPrice["Double Beef Burger"];
      print(
          "Double Beef Burger: ${Order["Double Beef Burger"]} x ${MenuPrice["Double Beef Burger"]} = ${Order["Double Beef Burger"] * MenuPrice["Double Beef Burger"]}");
      print("- - - - - - - - - - - - - - -");
    }
    Tax = Total * 0.13;
    GrandTotal = Total + Tax;
    Discount = GrandTotal * 0.05;
    NetTotal = GrandTotal - Discount;
    print("Total: Rs $Total");
    print("- - - - - - - - - - - - - - -");
    print("Tax: Rs $Tax");
    print("- - - - - - - - - - - - - - -");
    print("Grand Total: Rs $GrandTotal");
    print("- - - - - - - - - - - - - - -");
    print("Discount: Rs $Discount");
    print("- - - - - - - - - - - - - - -");
    print("Net Total: Rs $NetTotal");
    print("- - - - - - - - - - - - - - -");
    print("Credit Card Number: $CreditCard");
    print("- - - - - - - - - - - - - - -");
    print("Thank you for visiting");
    print("==============================");
    print("Press Enter to Continue");
    Order.clear();
    stdin.readLineSync();
    OrderMenu(index);
  }
  if (choice == 3) {
    Order.clear();
    print("Order Cancelled Sucessfully");
    AllOrders.removeAt(AllOrders.length - 1);
    MainMenu(index);
  } else {
    print("Invalid choice");
    BillGenerator(index, Order);
  }
}

EditOrder(int index) {
  var choice2;
  Map orderEdit = {};
  stdout.write("Enter Order No: ");
  var OrderNos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < AllOrders.length; i++) {
    if (OrderNos == AllOrders[i]["Order No"]) {
      orderEdit = AllOrders[i];
      do {
        print("==> Re-Enter Order <==");
        print("Order No: ${orderEdit["Order No"]}");
        print("- - - - - - - - - - - - - - -");
        print("1. Chicken Burger ${MenuPrice["Chicken Burger"]}");
        print("- - - - - - - - - - - - - - -");
        print("2. Beef Burger ${MenuPrice["Beef Burger"]}");
        print("- - - - - - - - - - - - - - -");
        print("3. Zinger Burger ${MenuPrice["Zinger Burger"]}");
        print("- - - - - - - - - - - - - - -");
        print("4. Double Beef Burger ${MenuPrice["Double Beef Burger"]}");
        print("- - - - - - - - - - - - - - -");
        stdout.write("Please enter your choice: ");
        var choice = int.parse(stdin.readLineSync()!);
        print("- - - - - - - - - - - - - - -");
        if (choice == 1) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Chicken Burger"] = quantity;
        } else if (choice == 2) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Beef Burger"] = quantity;
        } else if (choice == 3) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Zinger Burger"] = quantity;
        } else if (choice == 4) {
          stdout.write("Enter Quantity: ");
          var quantity = int.parse(stdin.readLineSync()!);
          orderEdit["Double Beef Burger"] = quantity;
        } else {
          print("Invalid choice");
          OrderMenu(index);
        }
        stdout.write("Do you want to add Another Item:(y/n):");
        choice2 = stdin.readLineSync()!;
        print("- - - - - - - - - - - - - - -");
      } while (choice2 == 'y' ||
          choice2 == 'Y' ||
          choice2 == 'yes' ||
          choice2 == 'Yes');
      AllOrders.add(Map.from(orderEdit));
      BillGenerator(index, orderEdit);
    }
  }
}

DeleteOrder(int index) {
  bool isDeleted = false;
  print("==> Delete Order <==");
  stdout.write("Enter Order No: ");
  var OrderNos = int.parse(stdin.readLineSync()!);
  print("- - - - - - - - - - - - - - -");
  for (int i = 0; i < AllOrders.length; i++) {
    if (OrderNos == AllOrders[i]["Order No"]) {
      AllOrders.removeAt(i);
      isDeleted = true;
    }
  }
  if (!isDeleted) {
    print("- - - - - - - - - - - - - - -");
    print("Order Not Found");
    print("Returning to MainMenu");
    print("- - - - - - - - - - - - - - -");
    OrderMenu(index);
  }
}
