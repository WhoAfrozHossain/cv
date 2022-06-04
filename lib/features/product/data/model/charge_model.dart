class ChargeModel {
  double? bookingPrice;
  double? currentCharge;
  double? discountCharge;
  double? sellingPrice;
  double? profit;
  bool? isEvent;
  bool? highlight;
  bool? groupping;
  bool? campaignSection;
  String? message;

  ChargeModel(
      {this.bookingPrice,
      this.currentCharge,
      this.discountCharge,
      this.sellingPrice,
      this.profit,
      this.isEvent,
      this.highlight,
      this.groupping,
      this.campaignSection,
      this.message});

  ChargeModel.fromJson(Map<String, dynamic> json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];
    discountCharge = json['discount_charge'];
    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];
    highlight = json['highlight'];
    groupping = json['groupping'];
    campaignSection = json['campaign_section'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_price'] = this.bookingPrice;
    data['current_charge'] = this.currentCharge;
    data['discount_charge'] = this.discountCharge;
    data['selling_price'] = this.sellingPrice;
    data['profit'] = this.profit;
    data['is_event'] = this.isEvent;
    data['highlight'] = this.highlight;
    data['groupping'] = this.groupping;
    data['campaign_section'] = this.campaignSection;
    data['message'] = this.message;
    return data;
  }
}
