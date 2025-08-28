import 'package:e_commercehybrid/Model/issues_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IssueViewModel extends StateNotifier<List<IssuesModel>> {
  IssueViewModel()
    : super([
        IssuesModel(
          issue: "Order Issues",
          subissue: {
            "Late Delivery": [
              "Courier delayed",
              "Weather issues",
              "High order volume",
            ],
            "Wrong Item": [
              "Different product shipped",
              "Color mismatch",
              "Size mismatch",
            ],
            "Missing Item": [
              "Out of stock not updated",
              "Item lost in transit",
              "Packed incorrectly",
            ],
            "Damaged Package": [
              "Broken on arrival",
              "Packaging torn",
              "Water damage",
            ],
            "No Delivery Update": [
              "Tracking not updating",
              "Courier didn’t scan package",
              "System error",
            ],
          },
        ),
        IssuesModel(
          issue: "Item Quality",
          subissue: {
            "Defective Product": [
              "Not functioning",
              "Scratched/dented",
              "Expired warranty",
            ],
            "Wrong Size": [
              "Clothing size mismatch",
              "Shoes don’t fit",
              "Incorrect labeling",
            ],
            "Low Quality Material": [
              "Feels cheap",
              "Not durable",
              "Not as advertised",
            ],
            "Expired Product": [
              "Past expiration date",
              "Spoiled on delivery",
              "Incorrect storage",
            ],
            "Not as Described": [
              "Different color",
              "Fewer features",
              "Fake/replica item",
            ],
          },
        ),
        IssuesModel(
          issue: "Payment Issues",
          subissue: {
            "Refund Not Received": [
              "Bank delay",
              "Refund not processed",
              "Payment gateway error",
            ],
            "Double Charge": [
              "Charged twice on card",
              "Duplicate payment in app",
              "Error in checkout",
            ],
            "Payment Declined": [
              "Card expired",
              "Insufficient funds",
              "Incorrect card details",
            ],
            "Promo Code Not Working": [
              "Expired promo",
              "Not eligible",
              "Technical error",
            ],
            "Overcharged": [
              "Incorrect bill calculation",
              "Hidden fees",
              "Tax misapplied",
            ],
          },
        ),
        IssuesModel(
          issue: "Technical Assistance",
          subissue: {
            "App Crash": [
              "Crash on startup",
              "Crash during payment",
              "Crash after update",
            ],
            "Login Issues": [
              "Forgot password",
              "Account locked",
              "Two-factor issue",
            ],
            "Unable to Update App": [
              "Storage full",
              "App store issue",
              "Version not available",
            ],
            "Slow Performance": [
              "App freezing",
              "Loading too long",
              "Laggy navigation",
            ],
            "Feature Not Working": [
              "Search not functioning",
              "Notifications not working",
              "Checkout error",
            ],
          },
        ),
        IssuesModel(
          issue: "Other",
          subissue: {
            "Account Deletion Request": [
              "Privacy concerns",
              "User no longer interested",
              "Switching to competitor",
            ],
            "Feedback & Suggestions": [
              "New feature request",
              "App design improvement",
              "Better customer support",
            ],
            "Privacy Concerns": [
              "Data sharing worry",
              "Unauthorized access",
              "Too many permissions",
            ],
            "Unclear Policies": [
              "Refund policy unclear",
              "Warranty not specified",
              "Hidden shipping fees",
            ],
            "General Inquiry": [
              "Business partnership",
              "How to use feature",
              "App availability in region",
            ],
          },
        ),
      ]);
}

final chatIssueProvider =
    StateNotifierProvider<IssueViewModel, List<IssuesModel>>((ref) {
      return IssueViewModel();
    });
