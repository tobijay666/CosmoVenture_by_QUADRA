import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmoventure/data/repositories/booking_repository_impl.dart';
import 'package:cosmoventure/domain/repositories/destination_repository.dart';
import 'package:cosmoventure/domain/usecases/get_user_details.dart';
import 'package:cosmoventure/presentaion/bloc/booking/booking_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/booking_confirmation/booking_confirmation_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/destination/destination_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/discover/discover_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/home/home_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/login/login_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/payment/payment_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/register/register_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/settings/settings_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/splash/splash_bloc.dart';
import 'package:cosmoventure/presentaion/bloc/transaction/transaction_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasoruces/firebase_remote_data_source_Ipml.dart';
import 'data/datasoruces/firebase_remote_data_source_impl.dart';
import 'data/repositories/destination_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/booking_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/booking_usecase.dart';
import 'domain/usecases/get_booking_details.dart';
import 'domain/usecases/get_destination_usecase.dart';
import 'domain/usecases/get_journey_usecase copy.dart';
import 'domain/usecases/payment_usecase.dart';
import 'domain/usecases/signIn_usecase.dart';
import 'domain/usecases/signUp_usecase.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  /// Blocs/cubit
  //auth
  sl.registerFactory<LoginBloc>(() => LoginBloc(signInUseCase: sl.call()));
  sl.registerFactory<BookingConfirmationBloc>(() => BookingConfirmationBloc());
  sl.registerFactory<TransactionBloc>(() => TransactionBloc());
  sl.registerFactory<PaymentBloc>(() => PaymentBloc(
      getBookingDetailsUseCase: sl.call(), paymentUseCase: sl.call()));

  sl.registerFactory<RegisterBloc>(
      () => RegisterBloc(signUpUseCase: sl.call()));
  sl.registerFactory<SplashBloc>(() => SplashBloc());
  sl.registerFactory<BookingBloc>(() => BookingBloc(bookingUseCase: sl.call()));
  sl.registerFactory<HomeBloc>(() =>
      HomeBloc(getDestinationUseCase: sl.call(), getJourneyUseCase: sl.call()));
  sl.registerFactory<DiscoverBloc>(
      () => DiscoverBloc(getDestinationUseCase: sl.call()));
  sl.registerFactory<SettingsBloc>(
      () => SettingsBloc(getUserDetailsUseCase: sl.call()));

  /// Storage Related

  /// useCase
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUserDetailsUseCase>(
      () => GetUserDetailsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetDestinationUseCase>(
      () => GetDestinationUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetJourneyUseCase>(
      () => GetJourneyUseCase(repository: sl.call()));
  sl.registerLazySingleton<BookingUseCase>(
      () => BookingUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetBookingDetailsUseCase>(
      () => GetBookingDetailsUseCase(repository: sl.call()));
  sl.registerLazySingleton<PaymentUseCase>(
      () => PaymentUseCase(repository: sl.call()));

  /// repository
  //auth
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  //destination
  sl.registerLazySingleton<DestinationRepository>(
      () => DestinationRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(remoteDataSource: sl.call()));

  /// Firebase
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          auth: sl.call(), firestore: sl.call(), firebaseStorage: sl.call()));

  ///External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => firebaseStorage);
  sl.registerLazySingleton(() => http.Client());
}
