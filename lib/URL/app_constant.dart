import 'package:intl/intl.dart';
import 'package:code_ware/Language/app_localizations.dart';
import 'package:code_ware/Language/bn.dart';
import 'package:code_ware/Language/en.dart';
import 'package:code_ware/Theme/themes.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AppConstant{
  static String AppName='mPower';
  static String font_poppins="Poppins";
  static String Share_Auth='auth';
  static String Share_Language='language';
  static String Error='error';
  static String Unauthenticated='Unauthenticated.';
  static String Android='android';
  static String iOS='ios';
  static String Default_Language='en';
  static Size defaultScreenSize = const Size(380, 720);
  static AppLocale Default_Locale=AppLocale.EN;
  static Function Default_Language_Function=EN();
  static int AnimationDelay=375;

  static var JWT='JWT';
  static String Email='email';
  static String password='password';
  static String password_confirmation='password_confirmation';
  static String device_type='device_type';
  static String salt_key='salt_key';
  static String title='title';
  static String details='details';
  static String message='message';
  static String OK="OK";
  static String NO="NO";
  static var user='user';

  static String device_token='device_token';

  static String firebase_uid='firebase_uid';

  static String contact_number='contact_number';

  static String counrty_code='country_code';

  static String country_code='country_code';

  static String email='email';

  static String status='status';

  static String phone='phone';
  static String address='address';

  static String data='data';

  static String name='name';


  static String rating='rating';
  static String comment='comment';
  static String photo='photo';

  static String current_password='current_password';
  static String new_password='new_password';
  static String renew_password='renew_password';

  static String Pending='Pending';

  static String Success='Success';

  static String lat='lat';
  static String lon='lon';

  static String free='free';
  static String working='working';

  static String details_address='details_address';

  static String level_id='level_id';
  static String package_id='package_id';
  static String days='days';
  static String off_day='off_day';
  static String hours='hours';

  static String estimation_data='estimation_data';
  static String estimation='estimation';

  static String maid_level='maid_level';

  static String hours_next='hours_next';

  static String request_id='request_id';

  static String Started='Started';
  static String Finished='Finished';
  static const String Completed='Completed';
  static String Canceled='Canceled';
  static String NoMaidZone='NoMaidZone';

  static String signature='signature';
  static String pin='pin';

  static String billing_id='billing_id';

  static String payment_method='payment_method';
  static String cash='Cash';
  static String card='card';
  static String bkash='bkash';
  static String nagad='nagad';

  static String review='review';

  static String promo_code='promo_code';

  static String referral_code='referral_code';

  static String order_id='order_id';

  static String cancellation_note='cancellation_note';

  static String newOrder='newOrder';

  static String available ='available';

  static String date='date';

  static String type='type';

  static String package='package';

  static String times='times';

  static String shift='shift';

  static String time_from='time_from';

  static String amount='amount';

  static String cash_pin='cash_pin';

  static String Paid='Paid';

  static String note='note';

  static String request_time_id ='request_time_id';
  static String reason ='reason';
  static String maid_absent ='maid_absent';
  static String others ='others';
  static String reason_detail ='reason_detail';
  static List<String> weekValue=['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
  static List<String> weekValueShort=['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

  static String payment_methods='payment_methods';

  static String instant_payment_method='instant_payment_method';

  static String url='url';

  static String redirectionUrl='redirectionUrl';

  static String isRenew='is_renew';

  static String secret_key='secret_key';

  static String otp='otp';

  static String checkbox='checkbox';
  static String linear='linear';
  static String radio='radio';

  static String other='other';

  static String question_id='question_id';

  static String answer='answer';

  static String can_back='can_back';

  static String paid='paid';

  static String called_and_confirmed='called_and_confirmed';

  static String push_id='push_id';
  static String customer_id='customer_id';
  static String level='level';
  static String app_opened='app_opened';
  static String is_received='is_received';

  static String permanent_address='permanent_address';

  static String nid='nid';

  static String nagad_account='nagad_account';

  static String refer_code='refer_code';

  static var nid_front='nid_front';
  static var nid_back='nid_back';

  static const String pending='pending';

  static const String accepted='accepted';
  static const String started='started';

  static var rejected='Rejected';

  static var maid_data='maid_data';
  static List<int> Maid_arrival_Times=[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120];

  static var time='time';

  static var maid_id='maid_id';

  static var arrived_in='arrived_in';

  static var rejection_note='rejection_note';

  static var hero_tag='hero_tag';

  static String processing='processing';

  static var is_permanent='is_permanent';

  static var shifts='shifts';

  static var Rejected='Rejected';

  static var cancellation_reason='cancellation_reason';

  static var activity_date='activity_date';

  static var shift_maids='shift_maids';
  static List<String> Document_Types=['national_id','birth_registration_number'];

  static var document_type='document_type';
  static var nid_number='nid_number';
  static var birth_certificate='birth_certificate';
  static var date_of_birth='date_of_birth';
  static var is_active='is_active';
  static var remarks='remarks';
  static var guarantor_nid_number='guarantor_nid_number';
  static var guarantor_dob='guarantor_dob';
  static var maid_type='maid_type';
  static var work_type='work_type';
  static var work_another='work_another';
  static var extra_experience='extra_experience';
  static var provide_from_village='provide_from_village';
  static var can_ride_bicycle='can_ride_bicycle';
  static var last_work='last_work';
  static var zone_id='zone_id';
  static var sourcing_zone_id='sourcing_zone_id';
  static var working_microarea_ids='working_microarea_ids';
  static var work_time='work_time';
  static var working_week_days='working_week_days';
  static var maid_categories='maid_categories';
  static var care_giving_type='care_giving_type';
  static var alternative_phone_number='alternative_phone_number';
  static var present_address='present_address';
  static var project_id='project_id';
  static var working_lat='working_lat';
  static var working_lon='working_lon';
  static var phone_number_owner='phone_number_owner';
  static var trained_from='trained_from';
  static var mobile_banking_account='mobile_banking_account';

  static var can_edit='can_edit';

  static var maid_status='maid_status';

  static var completed='completed';

  static var phones='phones';

  static var localguide_id='localguide_id';

  static var call_flow_number='call_flow_number';

  static var survey_id='survey_id';

  static var username='username';
  static var firstname='firstname';
  static var lastname='lastname';

  static var errors='errors';

  static var price='price';

  static var job='job';
}