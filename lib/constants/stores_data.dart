class StoresData {
  static List<StoreModel> stores = [
    StoreModel(
      storeName: "Amazon",
      storeUrl: "https://www.amazon.com",
      assetPath: "assets/stores/amazon_icon.webp",
      storeType: StoreType.amazon,
    ),
    StoreModel(
      storeName: "Macy's",
      storeUrl: "https://www.macys.com/",
      assetPath: "assets/stores/macys_icon.webp",
      storeType: StoreType.macys,
    ),
    StoreModel(
      storeName: "Apple",
      storeUrl: "https://www.apple.com/",
      assetPath: "assets/stores/apple_icon.webp",
      storeType: StoreType.apple,
    ),
    // StoreModel(
    //   storeName: "Bed Bath",
    //   storeUrl: "https://www.bedbathandbeyond.com/",
    //   assetPath: "assets/stores/bed_bath_icon.webp",
    //   storeType: StoreType.bedBath,
    // ),
    // StoreModel(
    //   storeName: "Dicks Sporting",
    //   storeUrl: "https://www.dickssportinggoods.com/",
    //   assetPath: "assets/stores/dicks_sporting_icon.webp",
    //   storeType: StoreType.dicksSporting,
    // ),
    StoreModel(
      storeName: "Fanatics",
      storeUrl: "https://www.fanatics.com/",
      assetPath: "assets/stores/fanatics_icon.webp",
      storeType: StoreType.fanatics,
    ),
    StoreModel(
      storeName: "Khols",
      storeUrl: "https://www.kohls.com/",
      assetPath: "assets/stores/khols_icon.webp",
      storeType: StoreType.khols,
    ),
    StoreModel(
      storeName: "Lowes",
      storeUrl: "https://www.lowes.com/",
      assetPath: "assets/stores/lowes_icon.webp",
      storeType: StoreType.lowes,
    ),
    StoreModel(
      storeName: "Nautica",
      storeUrl: "https://www.nautica.com/",
      assetPath: "assets/stores/nautica_icon.jpeg",
      storeType: StoreType.nautica,
    ),
    StoreModel(
      storeName: "Shein",
      storeUrl: "https://us.shein.com/",
      assetPath: "assets/stores/shein_icon.webp",
      storeType: StoreType.shein,
    ),
    // StoreModel(
    //   storeName: "Star Bucks",
    //   storeUrl: "https://www.starbucks.com/",
    //   assetPath: "assets/stores/star_bucks_icon.webp",
    //   storeType: StoreType.starBucks,
    // ),
    StoreModel(
      storeName: "Target",
      storeUrl: "https://www.target.com/",
      assetPath: "assets/stores/target_icon.webp",
      storeType: StoreType.target,
    ),
    StoreModel(
      storeName: "Victoria Secrets",
      storeUrl: "https://www.victoriassecret.com/us/",
      assetPath: "assets/stores/victoria_secrets_icon.webp",
      storeType: StoreType.victoriaSecret,
    ),
    StoreModel(
      storeName: "Walmart",
      storeUrl: "https://www.walmart.com/",
      assetPath: "assets/stores/walmart_icon.webp",
      storeType: StoreType.walmart,
    ),
  ];

  static List<StoreModel> giftCards = [
    StoreModel(
      storeName: "Lowes",
      storeUrl:
          "https://www.giftcards.com/lowes-gift-card?experience_type=virtual",
      assetPath: "assets/stores/lowes_icon.webp",
      storeType: StoreType.lowes,
    ),
    StoreModel(
      storeName: "Macy's",
      storeUrl:
          "https://www.giftcards.com/macys-gift-card?experience_type=virtual",
      assetPath: "assets/cards/macy_card.png",
      storeType: StoreType.macys,
    ),
    StoreModel(
      storeName: "Nautica",
      storeUrl:
          "https://www.giftcards.com/nautica-gift-card?experience_type=virtual",
      assetPath: "assets/cards/nautica_card.png",
      storeType: StoreType.nautica,
    ),
    StoreModel(
      storeName: "Spotify",
      storeUrl:
          "https://www.giftcards.com/spotify-gift-card?experience_type=virtual",
      assetPath: "assets/cards/spotify_card.png",
      storeType: StoreType.spotify,
    ),
    StoreModel(
      storeName: "Under Armor",
      storeUrl:
          "https://www.giftcards.com/under-armour-gift-card?experience_type=virtual",
      assetPath: "assets/cards/under_armor_card.jpg",
      storeType: StoreType.underArmor,
    ),
    StoreModel(
      storeName: "Wayfair",
      storeUrl:
          "https://www.giftcards.com/wayfair-gift-card?experience_type=virtual",
      assetPath: "assets/cards/wayfair_card.png",
      storeType: StoreType.wayFair,
    ),
    StoreModel(
      storeName: "Google Play",
      storeUrl:
          "https://www.giftcards.com/google-play-gift-card?experience_type=virtual",
      assetPath: "assets/cards/google_play_card.png",
      storeType: StoreType.googlePlay,
    ),
    StoreModel(
      storeName: "Restaurants",
      storeUrl:
          "https://www.giftcards.com/darden-restaurants-gift-card?experience_type=virtual",
      assetPath: "assets/cards/restraunts_card.png",
      storeType: StoreType.restaurants,
    ),
    StoreModel(
      storeName: "Marshalls",
      storeUrl:
          "https://www.giftcards.com/marshalls-gift-card?experience_type=virtual",
      assetPath: "assets/cards/marshalls_card.png",
      storeType: StoreType.marshalls,
    ),
  ];
}

enum StoreType {
  amazon,
  apple,
  appleStore,
  bedBath,
  bestBuy,
  dicksSporting,
  fanatics,
  khols,
  lowes,
  macys,
  nautica,
  shein,
  starBucks,
  target,
  victoriaSecret,
  walmart,
  spotify,
  underArmor,
  wayFair,
  googlePlay,
  restaurants,
  marshalls
}

class StoreModel {
  String storeName;
  StoreType storeType;
  String assetPath;
  String storeUrl;

  StoreModel(
      {required this.storeName,
      required this.storeUrl,
      required this.assetPath,
      required this.storeType});
}
