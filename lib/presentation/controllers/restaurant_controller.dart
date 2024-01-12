import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/data/models/review/review_params.dart';
import 'package:get/get.dart';

import '../../data/models/review/review_model.dart';
import '../../domain/repositories/restaurant_repository.dart';

// Controller for handling restaurants
class RestaurantController extends GetxController {
  final RxBool _isFetching = false.obs;
  final RxBool _isOrdering = false.obs;
  final RxInt _tabIndex = 0.obs;

  final List<RestaurantModel> _restaurant = <RestaurantModel>[].obs;
  final List<ReviewModel> _review = <ReviewModel>[].obs;

  final RxMap<String, List<RestaurantModel>> _categories =
      <String, List<RestaurantModel>>{}.obs;

  bool get isFetching => _isFetching.value;

  bool get isOrdering => _isOrdering.value;

  List<RestaurantModel>? get restaurant => _restaurant;
  List<ReviewModel>? get review => _review;

  int get tabIndex => _tabIndex.value;

  Map<String, List<RestaurantModel>> get categories => _categories;

  void setIsOrdering(bool value) {
    _isOrdering.value = value;
  }

  void setIsFetching(bool value) {
    _isFetching.value = value;
  }

  void setTabIndex(int value) {
    _tabIndex.value = value;
  }

  void setRestaurant(List<RestaurantModel> value) {
    _restaurant.addAll(value);
  }

  @override
  void onInit() {
    super.onInit();
    fetchRestaurant();
  }

  // Categorize Restaurant from API
  void categorizeRestaurant(List<RestaurantModel> restos) {
    for (var element in restos) {
      if (_categories.containsKey(element.category)) {
        _categories[element.category]!.add(element);
      } else {
        _categories[element.category] = [element];
      }
    }
  }

  // Get All Restaurant
  void fetchRestaurant() {
    setIsFetching(true);
    _categories.clear();
    _restaurant.clear();

    RestaurantRepository.fetchRestaurant().then((value) {
      setIsFetching(false);

      value.fold((error) => Snackbar.error(error.message), (result) {
        categorizeRestaurant(result);
        setRestaurant(result);
      });
    });
  }

  // Get Review from Restaurant
  void fetchReview(int restoId) {
    setIsFetching(true);
    _review.clear();
    RestaurantRepository.fetchReview(restoId).then((value) {
      setIsFetching(false);
      value.fold((error) => Snackbar.error(error.message), (result) {
        _review.addAll(result);
      });
    });
  }

  // Add Review to Restaurant
  void addReview(int rating, String review, String restoId, String orderId) {
    setIsFetching(true);
    final String email = Storage.getString('email')!;
    final ReviewParams params = ReviewParams(
      rating: rating,
      comment: review,
      menu_rate: [{}],
      user_email: email,
    );
    RestaurantRepository.addReview(params, email, orderId, restoId)
        .then((value) {
      setIsFetching(false);
      value.fold((error) => Snackbar.error(error.message), (result) {
        Snackbar.success('Review added');
        Get.back();
      });
    });
  }

  // Get Restaurant by ID
  RestaurantModel? getRestaurantById(int id) {
    for (final RestaurantModel resto in restaurant ?? []) {
      if (resto.id == id) {
        return resto;
      }
    }
    return null;
  }
}
