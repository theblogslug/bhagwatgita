import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceChangeNotifier =
    ChangeNotifierProvider<StorageService>((ref) => StorageService());

class StorageService extends ChangeNotifier {}
