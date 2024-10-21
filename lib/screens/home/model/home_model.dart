class HomeModel {
  bool? status;
  Data? data;
  String? message;

  HomeModel({this.status, this.data, this.message});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  List<Stores>? stores;
  Stores? nearestStore;
  List<TrendingProducts>? trendingProducts;
  List<MainSlider>? mainSlider;
  // List<Null>? bottomSlider;
  List<Listings>? listings;
  List<Categories>? categories;

  Data(
      {this.stores,
      this.nearestStore,
      this.trendingProducts,
      this.mainSlider,
      // this.bottomSlider,
      this.listings,
      this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(Stores.fromJson(v));
      });
    }
    nearestStore = json['nearest_store'] != null
        ? Stores.fromJson(json['nearest_store'])
        : null;
    if (json['trending_products'] != null) {
      trendingProducts = <TrendingProducts>[];
      json['trending_products'].forEach((v) {
        trendingProducts!.add(TrendingProducts.fromJson(v));
      });
    }
    if (json['main_slider'] != null) {
      mainSlider = <MainSlider>[];
      json['main_slider'].forEach((v) {
        mainSlider!.add(MainSlider.fromJson(v));
      });
    }
    // if (json['bottom_slider'] != null) {
    //   bottomSlider = <Null>[];
    //   json['bottom_slider'].forEach((v) {
    //     bottomSlider!.add(Null.fromJson(v));
    //   });
    // }
    if (json['listings'] != null) {
      listings = <Listings>[];
      json['listings'].forEach((v) {
        listings!.add(Listings.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stores != null) {
      data['stores'] = stores!.map((v) => v.toJson()).toList();
    }
    if (nearestStore != null) {
      data['nearest_store'] = nearestStore!.toJson();
    }
    if (trendingProducts != null) {
      data['trending_products'] =
          trendingProducts!.map((v) => v.toJson()).toList();
    }
    if (mainSlider != null) {
      data['main_slider'] = mainSlider!.map((v) => v.toJson()).toList();
    }
    // if (this.bottomSlider != null) {
    //   data['bottom_slider'] =
    //       this.bottomSlider!.map((v) => v.toJson()).toList();
    // }
    if (listings != null) {
      data['listings'] = listings!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stores {
  int? id;
  String? name;
  String? latitude;
  String? longitude;
  double? distance;

  Stores({this.id, this.name, this.latitude, this.longitude, this.distance});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['distance'] = distance;
    return data;
  }
}

class TrendingProducts {
  int? productId;
  String? productName;
  String? productPrice;
  String? productImage;

  TrendingProducts(
      {this.productId, this.productName, this.productPrice, this.productImage});

  TrendingProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    return data;
  }
}

class MainSlider {
  int? id;
  String? image;
  int? sliderType;
  int? deviceType;

  MainSlider({this.id, this.image, this.sliderType, this.deviceType});

  MainSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    sliderType = json['slider_type'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['slider_type'] = sliderType;
    data['device_type'] = deviceType;
    return data;
  }
}

class Listings {
  int? id;
  String? title;
  List<Products>? products;

  Listings({this.id, this.title, this.products});

  Listings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  int? cuttingTypeId;
  String? type;
  String? cuttingImage;
  String? netWeight;
  String? grossWeight;
  String? originalPrice;
  String? offerPrice;
  String? offerPercentage;
  String? stock;
  List<Wishlist>? wishlist;

  Products(
      {this.productId,
      this.productName,
      this.cuttingTypeId,
      this.type,
      this.cuttingImage,
      this.netWeight,
      this.grossWeight,
      this.originalPrice,
      this.offerPrice,
      this.offerPercentage,
      this.stock,
      this.wishlist});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    cuttingTypeId = json['cutting_type_id'];
    type = json['type'];
    cuttingImage = json['cutting_image'];
    netWeight = json['net_weight'];
    grossWeight = json['gross_weight'];
    originalPrice = json['original_price'];
    offerPrice = json['offer_price'];
    offerPercentage = json['offer_percentage'];
    stock = json['stock'];
    if (json['wishlist'] != null) {
      wishlist = <Wishlist>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['cutting_type_id'] = cuttingTypeId;
    data['type'] = type;
    data['cutting_image'] = cuttingImage;
    data['net_weight'] = netWeight;
    data['gross_weight'] = grossWeight;
    data['original_price'] = originalPrice;
    data['offer_price'] = offerPrice;
    data['offer_percentage'] = offerPercentage;
    data['stock'] = stock;
    if (wishlist != null) {
      data['wishlist'] = wishlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  int? id;
  int? customerId;
  int? productId;
  int? cuttingTypeId;

  Wishlist({this.id, this.customerId, this.productId, this.cuttingTypeId});

  Wishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    cuttingTypeId = json['cutting_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['product_id'] = productId;
    data['cutting_type_id'] = cuttingTypeId;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
