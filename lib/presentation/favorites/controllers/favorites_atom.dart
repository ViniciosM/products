import 'package:flutter/material.dart';
import 'package:products/presentation/favorites/controllers/favorites_state.dart';

// Atom
final favoritesState =
    ValueNotifier<FavoritesState>(const StartFavoritesState());

// Actions
final getFavoritesAction = ValueNotifier(Object());
