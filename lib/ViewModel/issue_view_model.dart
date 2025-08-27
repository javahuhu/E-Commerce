import 'package:e_commercehybrid/Model/issues_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IssueViewModel extends StateNotifier<List<IssuesModel>> {
  IssueViewModel()
    : super([
        IssuesModel(
          issue: "Order Issues",
          subissue: ["Late Delivery", "Wrong Item", "Missing Item"],
        ),
        IssuesModel(
          issue: "item Quality",
          subissue: [
            "Refund Not Received",
            "Double Charge",
            "Payment Declined",
          ],
        ),
        IssuesModel(
          issue: "Payment Issues",
          subissue: ["App Crash", "Login Issues", "Other Errors"],
        ),

        IssuesModel(
          issue: "technical Assistance",
          subissue: ["Late Delivery", "Wrong Item", "Missing Item"],
        ),
        IssuesModel(
          issue: "Other",
          subissue: ["Late Delivery", "Wrong Item", "Missing Item"],
        ),
        
      ]);
}

final chatIssueProvider =
    StateNotifierProvider<IssueViewModel, List<IssuesModel>>((ref) {
      return IssueViewModel();
    });
