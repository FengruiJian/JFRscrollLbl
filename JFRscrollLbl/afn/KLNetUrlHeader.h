//
//  KLNetUrlHeader.h
//  KLShop
//
//  Created by liu on 16/2/1.
//  Copyright © 2016年 Harbin kelly network technology co., LTD. All rights reserved.
//

#ifndef KLNetUrlHeader_h
#define KLNetUrlHeader_h
#pragma mark - Account
#define KL_AccountLogin @"/member/login"
#define KL_AccountRegister_VerificationCode @"/member/reg_code"
#define KL_AccountRegister_Account @"/member/register"
#define KL_AccountRegister_CheckVerificationCode @"/member/verify"
#define KL_AccountRegister_Coupon @"/my/coupon"

#pragma KLDeliverAddress
#define KL_DeleteDeliver_Address @"/my/delete_deliver_address"
#define KL_AddDeliver_Address @"/my/add_deliver_address"
#define KL_ShowDeliver_Address @"/my/show_deliver_address"
#define KL_Deliver_Address @"/my/deliver_address"
#define KL_Edit_Deliver_Address @"/my/edit_deliver_address"
#define KL_Edit_Cutover_Deliver_Address @"/my/cutover_deliver_address"

#pragma KLCoupon
#define KL_Coupon @"/my/coupon"
#define KL_Edit_Coupon @"/my/exchange"


#define KL_exc_UrlName @"https://itunes.apple.com/cn/app/e-xiu-che/id1097759872?mt=8"
#define KL_cld_UrlName @"https://itunes.apple.com/cn/app/che-lao-da/id1086562740?mt=8"
#define KL_Account_NickName @"/member/edit_nickname"
#define KL_Account_Thumb @"/member/edit_username_thumb"
#define KL_EditAccountPwd @"/member/editpassword"


#define KL_AddOrderList @"/car/inspection_add"

#pragma mark - MyCars
#define KL_GetCarBrandList @"/car/car_brand_step1"
#define KL_CreateNewCar @"/car/car_add"
#define KL_EditCarInfo @"/car/car_edit"
#define KL_DeleteCar @"/car/car_del"
#define KL_GetCarBrandStepTwoList @"/car/car_brand_step2"
#define KL_GetCarBrandStepThreeList @"/car/car_brand_step3"


#pragma mark-MyCarOrder
#define KL_GetOrderListBackMoney @"/car/refund"
#define KL_GetOrderList @"/my/car_order"
#define KL_GetOrderShow @"/my/car_order_show"
#define KL_EditOrder @"/my/car_edit"
#define KL_DeleteCar @"/car/car_del"
#define KL_SetCarDefalut @"/car/car_default"
#define KL_GetCarList @"/car/car_lists"
#define KL_GetCheckCar @"/car/about"



#define KL_HomePage @"/car/focus"
#define KL_GetCheckStation @"/car/siteshow"



#pragma mark - Sites
#define KL_GetCheckCarStation @"/car/sitelists"

#define KL_CheckCarInfo @"/car/judgment"


#pragma mark_my
#define KL_COMMENTLISTS @"/my/evaluate"
#define KL_NOTEVALUATE @"/my/notevaluate"
#define KL_ADDVALUATE @"/car/evaluate_add"
#define KL_DELVALUATE @"/my/del_evaluate"

#define KL_GetMessageList @"/my/notice"
#define KL_GetMessageEdit @"/my/notice_edit"

#define KL_GetCarRuleList @"/illega/inquire"

#define KL_GetAnswerList @"/question/lists"
#define KL_GetAnswerAdd @"/question/add"


#define KL_GetStaff @"/my/staff"

#endif /* KLNetUrlHeader_h */
