import 'package:adroit_flutter/features/authentication/data/models/req_post_auth_login.dart';
import 'package:adroit_flutter/features/new_sale/data/models/request/req_post_sale_customer.dart';
import 'package:adroit_flutter/features/new_sale/data/models/request/req_post_sale_customer_gen_otp.dart';
import 'package:adroit_flutter/features/new_sale/data/models/request/req_post_sale_customer_verify_otp.dart';
import 'package:adroit_flutter/features/new_sale/data/models/request/req_post_sale_eligibility.dart';
import 'package:adroit_flutter/features/new_sale/data/models/request/req_post_sale_member.dart';
import 'package:adroit_flutter/features/new_sale/data/models/response/res_catalog_products.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'api.g.dart';

@retrofit.RestApi()
abstract class Api {
  factory Api(Dio dio, {required String baseUrl}) = _Api;

  @retrofit.GET('/get-sample')
  Future<void> getSample({
    @retrofit.Query('something') required String something,
  });

  @retrofit.POST('/post-sample')
  Future<void> postSample({
    @retrofit.Body() required Map<String, dynamic> postBody,
  });

  @retrofit.POST('/auth/user/login/')
  Future<dynamic> postAuthUserLogin({
    @retrofit.Body() required RequestPostAuthLogin request,
  });

  @retrofit.GET('/sale/customer/canister/')
  Future<dynamic> getSaleCustomerCanister({
    @retrofit.Query('canisterId') required String canisterId,
  });

  @retrofit.GET('/sale/customer/mobile/')
  Future<dynamic> getSaleCustomerMobile({
    @retrofit.Query('mobile') required String mobile,
  });

  @retrofit.POST('/sale/customer/generateOTP/')
  Future<dynamic> postSaleCustomerGenerateOtp({
    @retrofit.Body() required RequestPostSaleGenerateOtp request,
  });

  @retrofit.POST('/sale/customer/verifyOTP/')
  Future<dynamic> postSaleCustomerVerifyOtp({
    @retrofit.Body() required RequestPostSaleVerifyOtp request,
  });

  @retrofit.POST('/sale/customer/')
  Future<dynamic> postSaleCustomer({
    @retrofit.Body() required RequestPostSaleCustomer request,
  });

  @retrofit.POST('/sale/member/')
  Future<dynamic> postSaleMember({
    @retrofit.Body() required RequestPostSaleMember request,
  });

  @retrofit.POST('/sale/eligibility/')
  Future<dynamic> postSaleEligibility({
    @retrofit.Body() required RequestPostSaleEligibility request,
  });

  // same request with eligibility
  @retrofit.POST('/sale/transaction/')
  Future<dynamic> postSaleTransaction({
    @retrofit.Body() required RequestPostSaleEligibility request,
  });

  @retrofit.GET('/coupons/')
  Future<dynamic> getCoupon({
    @retrofit.Query('limitedTo') required String limitedTo,
    @retrofit.Query('code') required String code,
  });

  @retrofit.GET('/catalog/products/')
  Future<List<CatalogProducts>> getCatalogProducts();
}
