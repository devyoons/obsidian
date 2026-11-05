---
별칭:
  - "업무 - ocpp-file-tree"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/c90997e2e6e944e9b80c4584254cab20
주제:
  - "[[00 - 대시보드/주제/OCPP·EV 충전|OCPP·EV 충전]]"
  - "[[00 - 대시보드/주제/소프트웨어 설계|소프트웨어 설계]]"
---

# 업무: ocpp-file-tree

## 내용

```
📦src
 ┣ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂net
 ┃ ┃ ┃ ┗ 📂ez
 ┃ ┃ ┃ ┃ ┣ 📂api
 ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferCurrentTransactionInfoController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferGetParkingFeeController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMacAddressController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferParkingFeeController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferPayInfoParkingController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferPhoneNumberController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPriceController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfileController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartbeatController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValueController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancelController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransactionController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStopTransactionController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransactionController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StopTransactionController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CommonMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoamingMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SubscriptionMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserVehicleMapper.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂authorize
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Authorize16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Authorize16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Authorize20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Authorize20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂bootNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotification16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotification16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotification20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BootNotification20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dataTransfer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂currentTransactionInfo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfo16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfo16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CurrentTransactionInfo20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getParkingFee
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFee16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFee16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFee20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetParkingFee20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂MacAddress
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MacAddress16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MacAddress16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MacAddress20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MacAddress20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂parkingFee
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFee16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFee16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFee20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ParkingFee20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂payInfoParking
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParking16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParking16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParking20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PayInfoParking20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂phoneNumber
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumber16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumber16serviceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumber20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PhoneNumber20serviceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firmwareStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotification16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotification16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotification20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FirmwareStatusNotification20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getPrice
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPrice16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPrice16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPrice20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetPrice20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getPricingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfile16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfile16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfile20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetPricingProfile20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂heartBeat
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeat16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeat16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeat20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜HeartBeat20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂meterValues
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂meterValue
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulatedMeterValuesEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulatedMeterValuesManager.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulatedMeterValuesManagerUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AccumulatedMeterValuesRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PersonalFareProfileDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValues16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValues16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValues20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MeterValues20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂partialCancel
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancel16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancel16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancel20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PartialCancel20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂payInfo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfo16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfo16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfo20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PayInfo20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remoteStart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransaction16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStartTransaction16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remoteStop
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStopTransaction16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStopTransaction16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setChargingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfile16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfile16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfile20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetChargingProfile20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂startTransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransaction16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransaction16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransaction20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StartTransaction20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂statusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotification16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotification16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotification20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StatusNotification20ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂stopTransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StopTransaction16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StopTransaction16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransaction20Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂updateFirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareUpdateRequestInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareUpdateResponseInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MultipleUpdateFirmwareApiRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MultipleUpdateFirmwareApiResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmware16Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmware16ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmware21Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmware21ServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂vo
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointConnectorStateVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointFirmwareVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointSpeedInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointStateVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerFaresVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingCompletionInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingStationInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CommonCodeVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CreditCardInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DefaultChargingProfileInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberCard.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MobUserVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PGOrderVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PointOrderVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RealtimeChargingProfileInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RealtimeChargingVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoamingCardVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoamingChargingInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SubscriptionInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SubscriptionUseHistoryVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserVehicleInfoVo.java
 ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┣ 📂aop
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂logging
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoggingAspect.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LoggingDataType.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂component
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPServer.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SMSServer.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂constant
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ApplicationConstant.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DateUtil.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂handler
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ControllerExceptionHandler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂redis
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RedisService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RedisDataType.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CryptoUtil.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DateUtil.java
 ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┣ 📂appConfig
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AppConfig.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dbconfig
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBatisDataSourceProperties.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SSHTunnelProperties.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LowerKeyMap.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MyBatisConfig.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂redisConfig
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RedisConfig.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂springSecurityConfig
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityConfig.java
 ┃ ┃ ┃ ┃ ┣ 📂core
 ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂classType
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Fare.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂enumType
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CardStateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CardTypeCodeEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointSpeedTypeEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingState.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FareImpoTypeCodeEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayMethodTypeEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PgRequestTypeCodeEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PointOrderStateEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PointOrderTypeEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SeasonalFareEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnPayStateEnum.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserType.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂payment
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂nicepayment
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂rest
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BillingApproveResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BillingCancelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CardRemoveResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NiceDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelContext.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ErrorContext.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderContext.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PgOrderResultEumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RegistContext.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂scheduler
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PgScheduler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PrePayedScheduled.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoveBillKeyScheduled.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂userTypePayment
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MemberStatePayment.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoneMemberStatePayment.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentUserTypeState.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoamingMemberStatePayment.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂vo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoamingInfoVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentModule.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PaymentModuleUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂phoneNumberAuthRepository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumberAuthEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumberAuthRedisService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumberAuthRedisServiceUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PhoneNumberAuthRepository.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂smartCharging
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileResultDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SmartChargingTypeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargingProfileSetter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sms
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SmsFormat.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SmsMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SmsSendEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SmsTemplateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SmsTemplateMessageIdEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SmsUserEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SmsSender.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂_db
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DbAccessPoint.java
 ┃ ┃ ┃ ┃ ┣ 📂ocpp
 ┃ ┃ ┃ ┃ ┃ ┣ 📂datatypes
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dataTransfer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂currentTransactionInfo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfoFor20Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CurrentTransactionInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessageIdEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PriceType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getParkingFee
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFeeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFeeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ParkingTimeUnitEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getPrice
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPriceFor20Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPriceRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetPriceResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getPricingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PricingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PricingScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂macAddress
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MacAddressRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MacAddressResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂parkingFee
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFeeFor20Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFeeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ParkingFeeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂partialCancel
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancelFor20Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancelRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PartialCancelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂payInfo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoFor20Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PayInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂payInfoParking
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParkingFor20Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParkingRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PayInfoParkingResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂phoneNumber
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumberRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PhoneNumberResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OCPPChargerVendorIdEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulateMembershipPointsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AppPaymentRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AutoChargingAuthorizeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerSettingInfoDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorUnplugNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessageTrigger.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeviceInfoDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DisplayMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ErrorInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagPriceRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainboardStatusDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MembershipPointDataRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentResultRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentSettingInfoDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PowerBankStatusDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveChargerRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendSmsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetUserReservationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPartialCancelRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPaymentAuthInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionSubInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulateMembershipResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdditionalAuthorizeMethod.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AppPaymentResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AutoChargingAuthorizeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSessionProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorUnplugNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ErrorInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagPriceResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LimitChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentResultResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveChargerResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendSmsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetUserReservationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPartialCancelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPaymentAuthInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionSubInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferTypeData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferTypeRequestData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DataTransferTypeResponseData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CommonStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Response.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RpcErrorResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂v1_6
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂classes
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateHashData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSchedule.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSchedulePeriod.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTagInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdToken.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜KeyValue.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogParameters.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValue.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SampledValue.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AvailabilityStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AvailabilityType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateUse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileKindType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfilePurposeType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingRateUnitType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CompositeScheduleStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConfigurationKey.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConfigurationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DiagnosticsStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GenericStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HashAlgorithm.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Location.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Log.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Measurand.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageTrigger.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayMethodCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayStateCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayTypeCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Phase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReadingContext.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Reason.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RecurrencyKindType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegistrationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartStopStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecureFirmwareStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecureMessageTrigger.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnitOfMeasure.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UploadLogStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ValueFormat.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂authorize
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AuthorizeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂bootnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BootNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂cancelreservation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CancelReservationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂certificatesigned
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CertificateSignedResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂changeavailability
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChangeAvailabilityResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂changeconfiguration
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeConfigurationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChangeConfigurationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearcache
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearCacheResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearchargingprofile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂deletecertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DeleteCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂diagnosticsstatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DiagnosticsStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DiagnosticsStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂extendedtriggermessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ExtendedTriggerMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ExtendedTriggerMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firmwarestatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getcompositeschedule
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCompositeScheduleRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetCompositeScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getconfiguration
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetConfigurationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetConfigurationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getdiagnostics
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDiagnosticsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetDiagnosticsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getinstalledcertificateIds
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateIdsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetInstalledCertificateIdsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getlocallistversion
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLocalListVersionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getlog
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLogRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLogResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂heartBeat
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeatRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜HeartBeatResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂installcertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜InstallCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂logstatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LogStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂metervalues
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValuesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MeterValuesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remotestarttransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStartTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remotestoptransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStopTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStopTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reservenow
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReserveNowResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reset
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂securityeventnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecurityEventNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityEventNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sendlocallist
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SendLocalListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setchargingprofile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂signcertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂signedfirmwarestatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignedFirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignedFirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂signedupdatefirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignedUpdateFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignedUpdateFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂startTransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StartTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂statusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂stopTransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StopTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂triggermessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TriggerMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂unlockconnector
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UnlockConnectorResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂updatefirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂v2_0_1
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂classes
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ACChargingParametersType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdditionalInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜APNType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateHashDataChainType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateHashDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingLimitType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingNeedsType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileCriterionType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSchedulePeriodType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingScheduleType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingStationType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearMonitoringResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentVariableType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CompositeScheduleType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConsumptionCostType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CostType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DCChargingParametersType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EVSEType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariableDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariableResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTokenInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTokenType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogParametersType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageContentType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValueType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ModemType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MonitoringDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NetworkConnectionProfileType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCSPRequestDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RelativeTimeIntervalType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReportDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SalesTariffEntryType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SalesTariffType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SampledValueType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignedMeterValueType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnitOfMeasureType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableAttributeType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableCharacteristicsType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableMonitoringType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜VPNType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜APNAuthenticationEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AttributeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootReasonEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateActionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSigningUseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingLimitSourceEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileKindEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfilePurposeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingRateUnitEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingStateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearMessageStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearMonitoringStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentCriterionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentVariableType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CostKindEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CustomerInformationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DisplayMessageStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EnergyTransferModeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventNotificationEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventTriggerEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GenericDeviceModelStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GenericStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCertificateIdUseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetChargingProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDisplayMessagesStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariableStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HashAlgorithmEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTokenEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateUseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Iso15118EVCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LocationEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeasurandEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageFormatEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessagePriorityEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageStateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageTriggerEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MonitoringCriterionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MonitoringEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MutabilityEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingNeedsStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPInterfaceEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPTransportEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPVersionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OperationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhaseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReadingContextEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReasonEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RecurrencyKindEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegistrationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReportBaseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStartStopStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationUpdateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetNetworkProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerReasonEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UploadLogStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜VPNEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂authorize
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AuthorizeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂bootNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BootNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂cancelReservation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CancelReservationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂certificateSigned
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CertificateSignedResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂changeAvailability
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChangeAvailabilityResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearCache
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearCacheResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearChargingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearDisplayMessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearDisplayMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearDisplayMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearedChargingLimit
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearedChargingLimitRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearedChargingLimitResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearVariableMonitoring
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearVariableMonitoringRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearVariableMonitoringResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂costUpdated
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CostUpdatedRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CostUpdatedResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂customerInformation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CustomerInformationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CustomerInformationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂deleteCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DeleteCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firmwareStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂get15118EVCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Get15118EVCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Get15118EVCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getBaseReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜getBaseReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜getBaseReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getCertificateStatus
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCertificateStatusRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetCertificateStatusResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getChargingProfiles
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetChargingProfilesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetChargingProfilesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getCompositeSchedule
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCompositeScheduleRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetCompositeScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetDisplayMessages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDisplayMessagesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetDisplayMessagesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetInstalledCertificateIds
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateIdsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetInstalledCertificateIdsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetLocalListVersion
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLocalListVersionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetLog
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLogRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLogResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getMonitoringReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetMonitoringReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetMonitoringReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getTransactionStatus
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetTransactionStatusRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetTransactionStatusResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getVariables
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariablesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetVariablesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂heartBeat
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeatRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜HeartBeatResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂InstallCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜InstallCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂logStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LogStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂MeterValues
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValuesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MeterValuesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyChargingLimit
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyChargingLimitRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyChargingLimitResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notifyCustomerInformation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyCustomerInformationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyCustomerInformationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notifyDisplayMessages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyDisplayMessagesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyDisplayMessagesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyEVChargingNeeds
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingNeedsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyEVChargingNeedsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyEVChargingSchedule
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingScheduleRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyEVChargingScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyEvent
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEventRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyEventResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyMonitoringReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyMonitoringReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyMonitoringReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂PublishFirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PublishFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂publishFirmwareStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PublishFirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂requestStartTransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStartTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestStartTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂requestStopTransactions
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStopTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestStopTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reservationStatusUpdate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationStatusUpdateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReservationStatusUpdateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reserveNow
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReserveNowResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reset
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂securityEventNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecurityEventNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityEventNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sendLocalList
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SendLocalListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setChargingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setDisplayMessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetDisplayMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetDisplayMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setMonitoringLevel
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringLevelRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetMonitoringLevelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setNetworkProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetNetworkProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetNetworkProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setVariableMonitoring
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableMonitoringRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetVariableMonitoringResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setVariables
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariablesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetVariablesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂SignCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂statusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂transactionEvent
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TransactionEventResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂triggermessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TriggerMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂unlockconnector
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UnlockConnectorResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂updateFirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OCPPDatatype.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂rpc
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂error
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CIStringError.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPError.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPIntegerError.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RpcError.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CallErrorException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InvalidCIStringException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InvalidOCPPIntegerException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPSecurityException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RpcExceptionHandler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂scheduler
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargerStatusScheduler.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂CiStringValidChecker
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CIStringType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CIStringValidChecker.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂OCPPIntegerValidChecker
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OCPPIntegerValidChecker.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CoreUtil.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CryptoUtil.java
 ┃ ┃ ┃ ┃ ┗ 📜OcppApiApplication.java
 ┃ ┗ 📂resources
 ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┣ 📜application-almond.yml
 ┃ ┃ ┃ ┣ 📜application-dev.yml
 ┃ ┃ ┃ ┣ 📜application-jslocal.yml
 ┃ ┃ ┃ ┣ 📜application-local.yml
 ┃ ┃ ┃ ┣ 📜application-prod.yml
 ┃ ┃ ┃ ┣ 📜application.yml
 ┃ ┃ ┃ ┣ 📜log4j2-dev.yml
 ┃ ┃ ┃ ┣ 📜log4j2-local.yml
 ┃ ┃ ┃ ┗ 📜log4j2-prod.yml
 ┃ ┃ ┣ 📂keys
 ┃ ┃ ┃ ┣ 📜pub
 ┃ ┃ ┃ ┗ 📜ssh_tunnel.pem
 ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┣ 📜charger.xml
 ┃ ┃ ┃ ┣ 📜common.xml
 ┃ ┃ ┃ ┣ 📜payment.xml
 ┃ ┃ ┃ ┣ 📜roaming.xml
 ┃ ┃ ┃ ┣ 📜sbuscription.xml
 ┃ ┃ ┃ ┣ 📜transaction.xml
 ┃ ┃ ┃ ┣ 📜user.xml
 ┃ ┃ ┃ ┗ 📜uservehicle.xml
 ┃ ┃ ┣ 📂static
 ┃ ┃ ┃ ┗ 📂docs
 ┃ ┃ ┃ ┃ ┣ 📜BootNotification.html
 ┃ ┃ ┃ ┃ ┗ 📜index.html
 ┃ ┃ ┗ 📜log4jdbc.log4j2.properties
 ┗ 📂test
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂net
 ┃ ┃ ┃ ┗ 📂ez
 ┃ ┃ ┃ ┃ ┣ 📂api
 ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RestDocsConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RestDocsTest.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationControllerTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransactionControllerTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareControllerTest.java
 ┃ ┃ ┃ ┃ ┗ 📜OcppApiApplicationTests.java
 ┃ ┗ 📂resources
 ┃ ┃ ┗ 📂org
 ┃ ┃ ┃ ┗ 📂springframework
 ┃ ┃ ┃ ┃ ┗ 📂restdocs
 ┃ ┃ ┃ ┃ ┃ ┗ 📂templates
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜query-parameters.snippet
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜request-fields.snippet
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜response-fields.snippet
```

#### ocpp-ws

```
📦main
 ┣ 📂java
 ┃ ┗ 📂net
 ┃ ┃ ┗ 📂ez
 ┃ ┃ ┃ ┣ 📂api
 ┃ ┃ ┃ ┃ ┣ 📂clearCache
 ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearCacheController.java
 ┃ ┃ ┃ ┃ ┣ 📂configuration
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜GetConfigurationController.java
 ┃ ┃ ┃ ┃ ┣ 📂dataTransfer
 ┃ ┃ ┃ ┃ ┃ ┗ 📜DisplayMessageController.java
 ┃ ┃ ┃ ┃ ┣ 📂firmware
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareUpdateRequestInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareUpdateResponseInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MultipleFirmwareUpdateApiRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MultipleFirmwareUpdateApiResponse.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDiagnosticsController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareController.java
 ┃ ┃ ┃ ┃ ┣ 📂mock
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MockController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜MockControllerAdvice.java
 ┃ ┃ ┃ ┃ ┣ 📂remoteTransaction
 ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransactionController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStopTransactionController.java
 ┃ ┃ ┃ ┃ ┣ 📂reservation
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationController.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜ReserveNowController.java
 ┃ ┃ ┃ ┃ ┣ 📂reset
 ┃ ┃ ┃ ┃ ┃ ┗ 📜ResetController.java
 ┃ ┃ ┃ ┃ ┗ 📂setChargingProfile
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SetChargingProfileController.java
 ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┣ 📂apiserver
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ApiServer.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜ApiServerConfig.java
 ┃ ┃ ┃ ┃ ┣ 📂error
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CIStringError.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPError.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPIntegerError.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RpcError.java
 ┃ ┃ ┃ ┃ ┣ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CallErrorException.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ControllerExceptionHandler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPP4xxErrorException.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPP5xxErrorException.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPSecurityException.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RpcExceptionHandler.java
 ┃ ┃ ┃ ┃ ┣ 📂jsonmapper
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CSMSObjectMapper.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜JsonObjectMapper.java
 ┃ ┃ ┃ ┃ ┣ 📂redis
 ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RedisConfig.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RedisService.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RedisDataType.java
 ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┗ 📜CryptoUtil.java
 ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┣ 📂apiSecurityConfiguration
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityConfiguration.java
 ┃ ┃ ┃ ┃ ┣ 📂dbconfig
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBatisDataSourceProperties.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SSHTunnelProperties.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜LowerKeyMap.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜MyBatisConfig.java
 ┃ ┃ ┃ ┃ ┣ 📂websocketConfig
 ┃ ┃ ┃ ┃ ┃ ┗ 📜WebSockConfig.java
 ┃ ┃ ┃ ┃ ┣ 📜OCPPChargerVendorIdEnumType.java
 ┃ ┃ ┃ ┃ ┗ 📜OCPPConfig.java
 ┃ ┃ ┃ ┣ 📂core
 ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┣ 📂chargePoint
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂session
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointManagerService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointRedisServiceUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargePointRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂vo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargePointVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargePointEntity.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂messagetype
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CallErrorMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CallMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CallResultMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RPCMessage.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂serializer
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageSerializer.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MessageSerializerUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜MEChargePointInfo.java
 ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CpUri.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPVersionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜RPCMessageEnumType.java
 ┃ ┃ ┃ ┃ ┣ 📂ocpp
 ┃ ┃ ┃ ┃ ┃ ┣ 📂datatypes
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dataTransfer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂currentTransactionInfo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CurrentTransactionInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getParkingFee
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFeeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFeeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ParkingTimeUnitEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂macAddress
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MacAddressRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MacAddressResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂parkingFee
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFeeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ParkingFeeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂payInfoParking
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParkingRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PayInfoParkingResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂phoneNumber
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumberRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PhoneNumberResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulateMembershipPointsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AppPaymentRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AutoChargingAuthorizeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerSettingInfoDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorUnplugNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessageTrigger.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeviceInfoDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DisplayMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ErrorInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagPriceRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPriceRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainboardStatusDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MembershipPointDataRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancelRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentResultRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentSettingInfoDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PowerBankStatusDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveChargerRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendSmsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetUserReservationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPartialCancelRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPaymentAuthInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionSubInfoRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AccumulateMembershipResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdditionalAuthorizeMethod.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AppPaymentResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AutoChargingAuthorizeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargerInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSessionProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorUnplugNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ErrorInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagPriceResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPriceResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LimitChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentResultResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PricingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PricingScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveChargerResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendSmsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetUserReservationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPartialCancelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignetPaymentAuthInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionSubInfoResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessageIdEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferTypeData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferTypeRequestData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DataTransferTypeResponseData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DataTransferResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CommonStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Request.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Response.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RpcErrorResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂v1_6
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂classes
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateHashData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSchedule.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSchedulePeriod.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTagInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdToken.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜KeyValue.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogParameters.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValue.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SampledValue.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AvailabilityStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AvailabilityType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateUse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileKindType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfilePurposeType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingRateUnitType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CompositeScheduleStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConfigurationKey.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConfigurationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DiagnosticsStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GenericStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HashAlgorithm.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Location.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Log.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Measurand.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageTrigger.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Phase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReadingContext.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Reason.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RecurrencyKindType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegistrationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartStopStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecureFirmwareStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecureMessageTrigger.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnitOfMeasure.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UploadLogStatus.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ValueFormat.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂authorize
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AuthorizeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂bootnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BootNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂cancelreservation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CancelReservationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂certificatesigned
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CertificateSignedResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂changeavailability
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChangeAvailabilityResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂changeconfiguration
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeConfigurationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChangeConfigurationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearcache
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearCacheResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearchargingprofile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂datatransfer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferMessage.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PriceType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜VendorConst.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂deletecertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DeleteCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂diagnosticsstatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DiagnosticsStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DiagnosticsStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂extendedtriggermessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ExtendedTriggerMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ExtendedTriggerMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firmwarestatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getcompositeschedule
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCompositeScheduleRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetCompositeScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getconfiguration
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetConfigurationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetConfigurationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getdiagnostics
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDiagnosticsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetDiagnosticsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getinstalledcertificateIds
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateIdsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetInstalledCertificateIdsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getlocallistversion
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLocalListVersionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getlog
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLogRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLogResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂heartbeat
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartbeatRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜HeartbeatResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂installcertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜InstallCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂logstatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LogStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂metervalues
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValuesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MeterValuesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remotestarttransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStartTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remotestoptransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStopTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RemoteStopTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reservenow
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReserveNowResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reset
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂securityeventnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecurityEventNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityEventNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sendlocallist
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SendLocalListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setchargingprofile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂signcertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂signedfirmwarestatusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignedFirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignedFirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂signedupdatefirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignedUpdateFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignedUpdateFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂starttransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StartTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂statusnotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂stoptransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StopTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂triggermessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TriggerMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂unlockconnector
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UnlockConnectorResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂updatefirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂v2_0_1
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂classes
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ACChargingParametersType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdditionalInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜APNType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateHashDataChainType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateHashDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingLimitType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingNeedsType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileCriterionType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingSchedulePeriodType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingScheduleType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingStationType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearMonitoringResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentVariableType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CompositeScheduleType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConsumptionCostType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CostType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DCChargingParametersType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EVSEType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariableDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariableResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTokenInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTokenType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogParametersType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageContentType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValueType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ModemType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MonitoringDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NetworkConnectionProfileType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCSPRequestDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RelativeTimeIntervalType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReportDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SalesTariffEntryType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SalesTariffType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SampledValueType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableDataType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableResultType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignedMeterValueType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusInfoType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnitOfMeasureType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableAttributeType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableCharacteristicsType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableMonitoringType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜VariableType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜VPNType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜APNAuthenticationEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AttributeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootReasonEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateActionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSigningUseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingLimitSourceEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileKindEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfilePurposeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingRateUnitEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargingStateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearMessageStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearMonitoringStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentCriterionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ComponentVariableType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ConnectorStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CostKindEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CustomerInformationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DataTransferStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DisplayMessageStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EnergyTransferModeEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventNotificationEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventTriggerEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GenericDeviceModelStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GenericStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCertificateIdUseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetChargingProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDisplayMessagesStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariableStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HashAlgorithmEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜IdTokenEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateUseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Iso15118EVCertificateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LocationEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeasurandEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageFormatEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessagePriorityEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageStateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageTriggerEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MonitoringCriterionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MonitoringEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MutabilityEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingNeedsStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPInterfaceEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPTransportEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPVersionEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OperationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhaseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReadingContextEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReasonEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RecurrencyKindEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegistrationStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReportBaseEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStartStopStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationUpdateStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetNetworkProfileStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerReasonEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UploadLogStatusEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜VPNEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂authorize
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜AuthorizeResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂bootNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BootNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂cancelReservation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CancelReservationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂certificateSigned
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CertificateSignedResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂changeAvailability
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChangeAvailabilityResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearCache
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearCacheResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearChargingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearDisplayMessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearDisplayMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearDisplayMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearedChargingLimit
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearedChargingLimitRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearedChargingLimitResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂clearVariableMonitoring
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearVariableMonitoringRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ClearVariableMonitoringResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂costUpdated
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CostUpdatedRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CostUpdatedResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂customerInformation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CustomerInformationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CustomerInformationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂deleteCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DeleteCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firmwareStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂get15118EVCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜Get15118EVCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Get15118EVCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getBaseReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜getBaseReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜getBaseReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getCertificateStatus
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCertificateStatusRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetCertificateStatusResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getChargingProfiles
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetChargingProfilesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetChargingProfilesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getCompositeSchedule
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetCompositeScheduleRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetCompositeScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getconfiguration
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetConfigurationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetConfigurationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetDisplayMessages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDisplayMessagesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetDisplayMessagesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetInstalledCertificateIds
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateIdsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetInstalledCertificateIdsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetLocalListVersion
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLocalListVersionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂GetLog
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLogRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetLogResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getMonitoringReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetMonitoringReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetMonitoringReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getTransactionStatus
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetTransactionStatusRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetTransactionStatusResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂getVariables
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetVariablesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GetVariablesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂heartBeat
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeatRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜HeartBeatResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂InstallCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜InstallCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂logStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LogStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜LogStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂MeterValues
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValuesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MeterValuesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyChargingLimit
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyChargingLimitRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyChargingLimitResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notifyCustomerInformation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyCustomerInformationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyCustomerInformationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notifyDisplayMessages
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyDisplayMessagesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyDisplayMessagesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyEVChargingNeeds
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingNeedsRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyEVChargingNeedsResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyEVChargingSchedule
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingScheduleRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyEVChargingScheduleResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyEvent
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyEventRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyEventResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyMonitoringReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyMonitoringReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyMonitoringReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂NotifyReport
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotifyReportRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NotifyReportResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂PublishFirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PublishFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂publishFirmwareStatusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareStatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PublishFirmwareStatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂requestStartTransaction
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStartTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestStartTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂requestStopTransactions
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStopTransactionRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestStopTransactionResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reservationStatusUpdate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationStatusUpdateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReservationStatusUpdateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reserveNow
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReserveNowResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reset
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂securityEventNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecurityEventNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityEventNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sendLocalList
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SendLocalListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setChargingProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetChargingProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setDisplayMessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetDisplayMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetDisplayMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setMonitoringLevel
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringLevelRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetMonitoringLevelResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setNetworkProfile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetNetworkProfileRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetNetworkProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setVariableMonitoring
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariableMonitoringRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetVariableMonitoringResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂setVariables
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetVariablesRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SetVariablesResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂SignCertificate
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SignCertificateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SignCertificateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂statusNotification
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StatusNotificationResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂transactionEvent
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TransactionEventResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂triggermessage
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TriggerMessageResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂unlockconnector
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UnlockConnectorResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂updateFirmware
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OCPPDatatype.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂rpc
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂component
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂responsefactory
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResponseFactory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResponseFactoryUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂rpcmessagefactory
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RPCMessageFactory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RPCMessageFactoryUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InvalidCIStringException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜InvalidOCPPIntegerException.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂security
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂profile
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityProfile.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityProfile.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂CiStringValidChecker
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CIStringType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CIStringValidChecker.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂OCPPIntegerValidChecker
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OCPPIntegerValidChecker.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CoreUtil.java
 ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┣ 📂messagetype
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageTypeRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MessageTypeRepositoryUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂requesthistory
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestHistoryEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestHistoryRedisService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestHistoryRedisServiceUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RequestHistoryRepository.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂resultHistory
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResultMessageEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResultMessageHistoryRedisService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResultMessageHistoryRedisServiceUseCase.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ResultMessageHistoryRepository.java
 ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂chargePoint
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargePointMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂usecase
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChargePointRdbService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChargePointServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂messageLogging
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂datatype
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MessageLogVo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MessageLoggingMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂usecase
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageLoggingService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MessageLoggingServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂security
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂datatype
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityProfileEnumType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂usecase
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SecurityService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityServiceImpl.java
 ┃ ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┃ ┣ 📂endpoint
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ApiEndpointV16EnumType.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂v20
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ApiEndpointV20EnumType.java
 ┃ ┃ ┃ ┃ ┣ 📂ocppMessageHandler
 ┃ ┃ ┃ ┃ ┃ ┣ 📂commonDataTransfer
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dataTransfer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dataHandler
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CurrentTransactionInfoHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DisplayMessageHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FromChargerDataTypeHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FromCSMSDataTypeHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetIdTagProfileHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetParkingFeeHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPriceHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetPricingProfileHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MacAddressHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ParkingFeeHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PartialCancelHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInfoParkingHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentInfoHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PhoneNumberHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StopTransactionSubInfoHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DataTransferCommonHandler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16Core
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeConfigurationV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetConfigurationV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeatV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MeterValueV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StartTransactionV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StopTransactionV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V16Core.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16FirmwareManagement
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DiagnosticStatusNotificationV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationStatusV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetDiagnosticsV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V16FirmwareManagement.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16LocalAuthList
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SendLocalListV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V16LocalAuthList.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16RemoteControl
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStartTransactionV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RemoteStopTransactionV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V16RemoteControl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16Reservation
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CancelReservationV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReserveNowV16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V16Reservation.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v16SmartCharging
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfile16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V16SmartCharging.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v20Core
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AuthorizeV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BootNotificationV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeConfigurationV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ClearCacheV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GetConfigurationV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HeartBeatV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ResetV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventStartTransactionV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventStopTransactionV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventUpdateTransactionValuesV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TransactionEventV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V20Core.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v20RemoteControl
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStartTransactionV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RequestStopTransactionV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageV20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜V20RemoteControl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂v21FirmwareManagement
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareV21Handler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜FromChargePointMessageProcessor.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜FromCSMSMessageProcessor.java
 ┃ ┃ ┃ ┃ ┗ 📂rpcMessageHandler
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Message16Handler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Message20Handler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MessageHandler.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜MessageSender.java
 ┃ ┃ ┃ ┣ 📂ws
 ┃ ┃ ┃ ┃ ┣ 📂chargingstation
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SessionRepository.java
 ┃ ┃ ┃ ┃ ┣ 📂interceptor
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SecurityInterceptor.java
 ┃ ┃ ┃ ┃ ┗ 📂websockethandler
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BaseWebSocketHandler.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OCPPWebSocketHandler.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜WebSocketSessionHandler.java
 ┃ ┃ ┃ ┗ 📜OcppWsApplication.java
 ┗ 📂resources
 ┃ ┣ 📂config
 ┃ ┃ ┣ 📜application-almond.yml
 ┃ ┃ ┣ 📜application-dev.yml
 ┃ ┃ ┣ 📜application-jslocal.yml
 ┃ ┃ ┣ 📜application-local.yml
 ┃ ┃ ┣ 📜application-prod.yml
 ┃ ┃ ┣ 📜application.yml
 ┃ ┃ ┣ 📜log4j2-dev.yml
 ┃ ┃ ┣ 📜log4j2-local.yml
 ┃ ┃ ┗ 📜log4j2-prod.yml
 ┃ ┣ 📂keys
 ┃ ┃ ┣ 📜pub
 ┃ ┃ ┗ 📜ssh_tunnel.pem
 ┃ ┣ 📂mapper
 ┃ ┃ ┣ 📂chargePoint
 ┃ ┃ ┃ ┗ 📜charge_point_mapper.xml
 ┃ ┃ ┣ 📂messageLogging
 ┃ ┃ ┃ ┗ 📜message_logging_mapper.xml
 ┃ ┃ ┗ 📂security
 ┃ ┃ ┃ ┗ 📜security_mapper.xml
 ┃ ┣ 📂ocpp-jsonvalue
 ┃ ┃ ┣ 📂ocpp16
 ┃ ┃ ┃ ┣ 📜Authorize.json
 ┃ ┃ ┃ ┣ 📜AuthorizeResponse.json
 ┃ ┃ ┃ ┣ 📜BootNotification.json
 ┃ ┃ ┃ ┣ 📜BootNotificationResponse.json
 ┃ ┃ ┃ ┣ 📜CancelReservation.json
 ┃ ┃ ┃ ┣ 📜CancelReservationResponse.json
 ┃ ┃ ┃ ┣ 📜ChangeAvailability.json
 ┃ ┃ ┃ ┣ 📜ChangeAvailabilityResponse.json
 ┃ ┃ ┃ ┣ 📜ChangeConfiguration.json
 ┃ ┃ ┃ ┣ 📜ChangeConfigurationResponse.json
 ┃ ┃ ┃ ┣ 📜ClearCache.json
 ┃ ┃ ┃ ┣ 📜ClearCacheResponse.json
 ┃ ┃ ┃ ┣ 📜ClearChargingProfile.json
 ┃ ┃ ┃ ┣ 📜ClearChargingProfileResponse.json
 ┃ ┃ ┃ ┣ 📜DataTransfer.json
 ┃ ┃ ┃ ┣ 📜DataTransferResponse.json
 ┃ ┃ ┃ ┣ 📜DiagnosticsStatusNotification.json
 ┃ ┃ ┃ ┣ 📜DiagnosticsStatusNotificationResponse.json
 ┃ ┃ ┃ ┣ 📜FirmwareStatusNotification.json
 ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationResponse.json
 ┃ ┃ ┃ ┣ 📜GetCompositeSchedule.json
 ┃ ┃ ┃ ┣ 📜GetCompositeScheduleResponse.json
 ┃ ┃ ┃ ┣ 📜GetConfiguration.json
 ┃ ┃ ┃ ┣ 📜GetConfigurationResponse.json
 ┃ ┃ ┃ ┣ 📜GetDiagnostics.json
 ┃ ┃ ┃ ┣ 📜GetDiagnosticsResponse.json
 ┃ ┃ ┃ ┣ 📜GetLocalListVersion.json
 ┃ ┃ ┃ ┣ 📜GetLocalListVersionResponse.json
 ┃ ┃ ┃ ┣ 📜Heartbeat.json
 ┃ ┃ ┃ ┣ 📜HeartbeatResponse.json
 ┃ ┃ ┃ ┣ 📜MeterValues.json
 ┃ ┃ ┃ ┣ 📜MeterValuesResponse.json
 ┃ ┃ ┃ ┣ 📜RemoteStartTransaction.json
 ┃ ┃ ┃ ┣ 📜RemoteStartTransactionResponse.json
 ┃ ┃ ┃ ┣ 📜RemoteStopTransaction.json
 ┃ ┃ ┃ ┣ 📜RemoteStopTransactionResponse.json
 ┃ ┃ ┃ ┣ 📜ReserveNow.json
 ┃ ┃ ┃ ┣ 📜ReserveNowResponse.json
 ┃ ┃ ┃ ┣ 📜Reset.json
 ┃ ┃ ┃ ┣ 📜ResetResponse.json
 ┃ ┃ ┃ ┣ 📜SendLocalList.json
 ┃ ┃ ┃ ┣ 📜SendLocalListResponse.json
 ┃ ┃ ┃ ┣ 📜SetChargingProfile.json
 ┃ ┃ ┃ ┣ 📜SetChargingProfileResponse.json
 ┃ ┃ ┃ ┣ 📜StartTransaction.json
 ┃ ┃ ┃ ┣ 📜StartTransactionResponse.json
 ┃ ┃ ┃ ┣ 📜StatusNotification.json
 ┃ ┃ ┃ ┣ 📜StatusNotificationResponse.json
 ┃ ┃ ┃ ┣ 📜StopTransaction.json
 ┃ ┃ ┃ ┣ 📜StopTransactionResponse.json
 ┃ ┃ ┃ ┣ 📜TriggerMessage.json
 ┃ ┃ ┃ ┣ 📜TriggerMessageResponse.json
 ┃ ┃ ┃ ┣ 📜UnlockConnector.json
 ┃ ┃ ┃ ┣ 📜UnlockConnectorResponse.json
 ┃ ┃ ┃ ┣ 📜UpdateFirmware.json
 ┃ ┃ ┃ ┗ 📜UpdateFirmwareResponse.json
 ┃ ┃ ┗ 📂ocpp201
 ┃ ┃ ┃ ┗ 📂jsonMessages
 ┃ ┃ ┃ ┃ ┣ 📜AuthorizeRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜AuthorizeResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜BootNotificationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜BootNotificationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜CancelReservationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜CancelReservationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜CertificateSignedResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ChangeAvailabilityResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearCacheRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearCacheResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearChargingProfileResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearDisplayMessageRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearDisplayMessageResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearedChargingLimitRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearedChargingLimitResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearVariableMonitoringRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ClearVariableMonitoringResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜CostUpdatedRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜CostUpdatedResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜CustomerInformationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜CustomerInformationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜DataTransferRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜DataTransferResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜DeleteCertificateResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜FirmwareStatusNotificationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜Get15118EVCertificateRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜Get15118EVCertificateResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetBaseReportRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetBaseReportResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetCertificateStatusRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetCertificateStatusResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetChargingProfilesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetChargingProfilesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetCompositeScheduleRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetCompositeScheduleResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetDisplayMessagesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetDisplayMessagesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateIdsRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetInstalledCertificateIdsResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetLocalListVersionResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetLogRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetLogResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetMonitoringReportRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetMonitoringReportResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetReportRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetReportResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetTransactionStatusRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetTransactionStatusResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜GetVariablesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜GetVariablesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜HeartbeatRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜HeartbeatResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜InstallCertificateResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜LogStatusNotificationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜LogStatusNotificationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜MeterValuesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜MeterValuesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyChargingLimitRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyChargingLimitResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyCustomerInformationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyCustomerInformationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyDisplayMessagesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyDisplayMessagesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingNeedsRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingNeedsResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingScheduleRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyEVChargingScheduleResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyEventRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyEventResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyMonitoringReportRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyMonitoringReportResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyReportRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜NotifyReportResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareStatusNotificationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜PublishFirmwareStatusNotificationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ReportChargingProfilesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ReportChargingProfilesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜RequestStartTransactionRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜RequestStartTransactionResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜RequestStopTransactionRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜RequestStopTransactionResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ReservationStatusUpdateRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ReservationStatusUpdateResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ReserveNowRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ReserveNowResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜ResetRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜ResetResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SecurityEventNotificationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SecurityEventNotificationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SendLocalListRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SendLocalListResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetChargingProfileResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetDisplayMessageRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetDisplayMessageResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringBaseRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringBaseResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringLevelRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetMonitoringLevelResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetNetworkProfileRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetNetworkProfileResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetVariableMonitoringRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetVariableMonitoringResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SetVariablesRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SetVariablesResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜SignCertificateRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜SignCertificateResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜StatusNotificationResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜TransactionEventRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜TransactionEventResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜TriggerMessageResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜UnlockConnectorResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜UnpublishFirmwareRequest.json
 ┃ ┃ ┃ ┃ ┣ 📜UnpublishFirmwareResponse.json
 ┃ ┃ ┃ ┃ ┣ 📜UpdateFirmwareRequest.json
 ┃ ┃ ┃ ┃ ┗ 📜UpdateFirmwareResponse.json
 ┃ ┣ 📜banner.txt
 ┃ ┗ 📜log4jdbc.log4j2.properties
```

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
