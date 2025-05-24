class AppStrings {
  ///====================== Initial ========================
  static const String appName = "Groc Shopy";
  static const String appTagLine = "Track items, \nCalculate, Together";
  static const String getStarted = "Get Started";
  static const String welcome = "Welcome";

  ///====================== Auth ========================
  static const String signUp = "Sign Up";
  static const String signIn = "Sign In";
  static const String adminSignUp = "Admin Sign up";
  static const String or = "Or";
  static const String email = "Email";
  // static const String screen = "screen";
  static const String fullName = "Full Name";
  static const String employee = "Employee";
  static const String admin = "Admin";

  static const String enterYourEmailHint = "Enter your email";
  static const String enterYourFullName = "Enter your full name";
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String password = "Password";
  static const String passwordHint = "********";
  static const String passWordMustBeAtLeast =
      "Password must contain at least one uppercase letter, one lowercase letter, one number";
  static RegExp passRegexp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  static const fieldCantNotBeEmpty = "Field can't be empty";
  static const String passwordLengthAndContain =
      "Password must be at least 8 characters long and at least one uppercase letter, one lowercase letter, one number";
  static const String forgotPassword = "Forget password?";
  static const String doYouHaveAnAccount = "Do you have an account?";
  static const String rememberMe = "Remember me";
  static const String dontHaveAAccount = "Don’t have a account? ";

  ///====================== SubsCription ========================
  static const String subscribe = "Subscribe";
  static const String skip = "Skip";
  static const String getUnlimitedAccess =
      "Get unlimited access to our programs.";
  static const String takeTheFirstStep =
      "Take the first step towards a healthier and happier life.";
  static const String popular = "POPULAR";
  static const String forMoreScan = "For more scan";
  static const String sixtyPointNoneNine = "\$60.99";
  static const String forOneYear = "For 1 year";
  static const String unlimitedAccessTosSan = "Unlimited access to scan";
  static const String viewMonthlyRecord = "View monthly record";
  static const String youWillBe =
      "You will be charged \$9.99 (monthly plan) or \n \$60.99 (annual plan) through your iTunes \n account. You can cancel at any time if your \n not satisfied.";
  static const String appleStorePay = "Apple Store pay";
  static const String completeYourPurchase = "Complete your Purchase";
  static const String paymentMethod = "Payment Method";
  static const String paymentMethodHint = "MasterCard 13345***44";
  static const String payWithApplePayAndGetOffers =
      "Pay with Apple pay and get offers \n and discount in your next purchase";
  static const String pay = "Pay";
  static const String payNow = "Pay now";

  ///====================== Home ========================
  static const String yourGroceryExpensesAtAGlance =
      "Your grocery expenses at a glance";
  static const String monthlyReport = "Monthly Report";
  static const String monthlyGrocerySpending = "Monthly Grocery Spending";
  static const String viewBreakdown = "View Breakdown";
  static const String totalSpent = "Total Spent";
  static const String trackTotalSpent = "Track total spent";
  static const String budgetLimit = "Budget Limit";
  static const String underBudget = "Under budget";
  static const String add = "Add";
  static const String recentPurchases = "Recent Purchases";
  static const String purchaseHistory = "Purchase History";
  static const String itemsYouveBought = "Items you've bought";
  static const String viewAll = "View All";

  ///====================== Scanner ========================
  static const String scanner = "Scanner";
  static const String groceryItems = "Grocery Items";
  static const String recentScans = "Recent Scans";
  static const String edit = "Edit";
  static const String save = "Save";
  static const String processed = "Processed";

  ///====================== Transaction History ========================
  static const String transactionHistory = "Transaction History";
  static const String totalSpending = "Total Spending";
  static const String export = "Export";
  static const String download = "Download";

  ///====================== Profile ========================
  static const String profile = "Profile";
  static const String unlockExclusiveFeatures =
      "Unlock exclusive features and supercharge your dating experience.";
  static const String upgradeFrom = "Upgrade from \$9.99";
  static const String manager = "Manager";
  static const String addedReceipt = "Added Receipt";
  static const String recently = "Recently";
  static const String total = "Total";

  ///====================== Report ========================
  static const String report = "Report";
}
