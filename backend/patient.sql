# Host: localhost  (Version 5.1.37-community-log)
# Date: 2025-02-14 11:22:43
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "2017"
#

DROP TABLE IF EXISTS `2017`;
CREATE TABLE `2017` (
  `year( ``tbtreatmentheader``.``treatmentdate``)` int(4) DEFAULT NULL,
  `month( ``tbtreatmentheader``.``treatmentdate``)` int(2) DEFAULT NULL,
  `dn` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bdate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "2018"
#

DROP TABLE IF EXISTS `2018`;
CREATE TABLE `2018` (
  `year( ``tbtreatmentheader``.``treatmentdate``)` int(4) DEFAULT NULL,
  `month( ``tbtreatmentheader``.``treatmentdate``)` int(2) DEFAULT NULL,
  `dn` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bdate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "appoint_line"
#

DROP TABLE IF EXISTS `appoint_line`;
CREATE TABLE `appoint_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DisplayName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IDcard` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dn` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `treatment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `day_use` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `time_use` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opd` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `period` int(1) NOT NULL DEFAULT '0',
  `tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `priv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `officeId` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logadd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=430 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "drug_catalog"
#

DROP TABLE IF EXISTS `drug_catalog`;
CREATE TABLE `drug_catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hospdcode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prodcat` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmtid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specprep` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tradename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsfcode` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `dosefm` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `strength` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `content` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `unitprice` decimal(9,2) DEFAULT NULL,
  `distrb` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `manuf` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ised` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `ncd24` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `packsize` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `packprice` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `updateflag` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datechange` date DEFAULT NULL,
  `dateupdate` time DEFAULT NULL,
  `dateeffect` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "lab_catalog"
#

DROP TABLE IF EXISTS `lab_catalog`;
CREATE TABLE `lab_catalog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LCCode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'treatmentcode',
  `billgroup` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หมวดการรักษา เฉพาะหมวด7',
  `cscode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รหัส กบช กลาง',
  `tmlt` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loinc` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `panel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'treatmentName',
  `sflag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chargeCat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitPrice` decimal(9,2) DEFAULT '0.00',
  `benefitPlan` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reimbPrice` decimal(9,2) DEFAULT '0.00',
  `updateFlag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatebeg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateEnd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpdateBeg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpdateEnd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateUpd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listchartborrowperiod"
#

DROP TABLE IF EXISTS `listchartborrowperiod`;
CREATE TABLE `listchartborrowperiod` (
  `periodId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `periodName` varchar(50) NOT NULL,
  PRIMARY KEY (`periodId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=tis620;

#
# Structure for table "listchartborrowstatus"
#

DROP TABLE IF EXISTS `listchartborrowstatus`;
CREATE TABLE `listchartborrowstatus` (
  `statusId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statusName` varchar(50) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=tis620;

#
# Structure for table "listchartborrowsupply"
#

DROP TABLE IF EXISTS `listchartborrowsupply`;
CREATE TABLE `listchartborrowsupply` (
  `supplyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplyName` varchar(50) NOT NULL,
  `clinicId` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เทียบกับ tbclinic',
  PRIMARY KEY (`supplyId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=tis620;

#
# Structure for table "listchartborrowtype"
#

DROP TABLE IF EXISTS `listchartborrowtype`;
CREATE TABLE `listchartborrowtype` (
  `typeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=tis620;

#
# Structure for table "listchartborrowtypeemer"
#

DROP TABLE IF EXISTS `listchartborrowtypeemer`;
CREATE TABLE `listchartborrowtypeemer` (
  `typeEmerId` int(11) NOT NULL AUTO_INCREMENT,
  `typeEmerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`typeEmerId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listhospital"
#

DROP TABLE IF EXISTS `listhospital`;
CREATE TABLE `listhospital` (
  `hospitalId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hospitalName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `provinceId` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hospitalId`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listicd10"
#

DROP TABLE IF EXISTS `listicd10`;
CREATE TABLE `listicd10` (
  `icd10Id` int(5) NOT NULL AUTO_INCREMENT,
  `icd10Code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd10Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`icd10Id`)
) ENGINE=MyISAM AUTO_INCREMENT=39221 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listicd10_old_notused"
#

DROP TABLE IF EXISTS `listicd10_old_notused`;
CREATE TABLE `listicd10_old_notused` (
  `icd10Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icd10Code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd10Name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`icd10Id`)
) ENGINE=MyISAM AUTO_INCREMENT=39046 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listicd9"
#

DROP TABLE IF EXISTS `listicd9`;
CREATE TABLE `listicd9` (
  `icd9Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icd9Code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd9Name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`icd9Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4022 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listnugoldcardtype"
#

DROP TABLE IF EXISTS `listnugoldcardtype`;
CREATE TABLE `listnugoldcardtype` (
  `typeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listpatientmaritalstatus"
#

DROP TABLE IF EXISTS `listpatientmaritalstatus`;
CREATE TABLE `listpatientmaritalstatus` (
  `maritalStatusID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `maritalStatusName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`maritalStatusID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=tis620;

#
# Structure for table "listpatientoccupation"
#

DROP TABLE IF EXISTS `listpatientoccupation`;
CREATE TABLE `listpatientoccupation` (
  `occupationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `occupationName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`occupationID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=tis620;

#
# Structure for table "listpatientright"
#

DROP TABLE IF EXISTS `listpatientright`;
CREATE TABLE `listpatientright` (
  `rightID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rightName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`rightID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=tis620;

#
# Structure for table "listpatientsex"
#

DROP TABLE IF EXISTS `listpatientsex`;
CREATE TABLE `listpatientsex` (
  `sexID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sexName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sexID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=tis620;

#
# Structure for table "listpaystatus"
#

DROP TABLE IF EXISTS `listpaystatus`;
CREATE TABLE `listpaystatus` (
  `payStatusId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payStatusName` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payStatusId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=tis620;

#
# Structure for table "listproject"
#

DROP TABLE IF EXISTS `listproject`;
CREATE TABLE `listproject` (
  `projectID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1 =active',
  PRIMARY KEY (`projectID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "listreferrighttype"
#

DROP TABLE IF EXISTS `listreferrighttype`;
CREATE TABLE `listreferrighttype` (
  `referRightTypeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referRightTypeName` char(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`referRightTypeId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=tis620;

#
# Structure for table "listrefertreatstatus"
#

DROP TABLE IF EXISTS `listrefertreatstatus`;
CREATE TABLE `listrefertreatstatus` (
  `treatStatusId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treatStatusName` char(50) NOT NULL,
  PRIMARY KEY (`treatStatusId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=tis620;

#
# Structure for table "listtreatmentlistapprovestatus"
#

DROP TABLE IF EXISTS `listtreatmentlistapprovestatus`;
CREATE TABLE `listtreatmentlistapprovestatus` (
  `approveId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `approveName` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`approveId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=tis620;

#
# Structure for table "listtreatmentpaytype"
#

DROP TABLE IF EXISTS `listtreatmentpaytype`;
CREATE TABLE `listtreatmentpaytype` (
  `payTypeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payTypeName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "officehours"
#

DROP TABLE IF EXISTS `officehours`;
CREATE TABLE `officehours` (
  `officeHoursId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `officeHoursName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`officeHoursId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "queueinfo"
#

DROP TABLE IF EXISTS `queueinfo`;
CREATE TABLE `queueinfo` (
  `time` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `dn` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nameTh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surnameTh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleEn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nameEn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surnameEn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maritalStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneHome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneOffice` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emerNotify` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emerAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentPhone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tempVar` float DEFAULT NULL,
  `bloodtopVar` smallint(6) DEFAULT NULL,
  `bloodbottomVar` smallint(6) DEFAULT NULL,
  `hearrateVar` smallint(6) DEFAULT NULL,
  `checkbox1Var` smallint(6) DEFAULT NULL,
  `checkbox2Var` smallint(6) DEFAULT NULL,
  `checkbox3Var` smallint(6) DEFAULT NULL,
  `checkbox4Var` smallint(6) DEFAULT NULL,
  `checkbox5Var` smallint(6) DEFAULT NULL,
  `checkbox6Var` smallint(6) DEFAULT NULL,
  `checkbox7Var` smallint(6) DEFAULT NULL,
  `checkbox8Var` smallint(6) DEFAULT NULL,
  `checkbox9Var` smallint(6) DEFAULT NULL,
  `checkbox10Var` smallint(6) DEFAULT NULL,
  `checkbox11Var` smallint(6) DEFAULT NULL,
  `checkbox12Var` smallint(6) DEFAULT NULL,
  `checkbox13Var` smallint(6) DEFAULT NULL,
  `checkbox14Var` smallint(6) DEFAULT NULL,
  `checkbox15Var` smallint(6) DEFAULT NULL,
  `checkbox15inputVar` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkbox16Var` smallint(6) DEFAULT NULL,
  `checkbox17Var` smallint(6) DEFAULT NULL,
  `checkbox18Var` smallint(6) DEFAULT NULL,
  `checkbox19Var` smallint(6) DEFAULT NULL,
  `checkbox20Var` smallint(6) DEFAULT NULL,
  `checkbox21Var` smallint(6) DEFAULT NULL,
  `checkbox22Var` smallint(6) DEFAULT NULL,
  `checkbox23Var` smallint(6) DEFAULT NULL,
  `checkbox24Var` smallint(6) DEFAULT NULL,
  `checkbox25Var` smallint(6) DEFAULT NULL,
  `checkbox26Var` smallint(6) DEFAULT NULL,
  `checkbox27Var` smallint(6) DEFAULT NULL,
  `checkbox28Var` smallint(6) DEFAULT NULL,
  `checkbox29Var` smallint(6) DEFAULT NULL,
  `checkbox30Var` smallint(6) DEFAULT NULL,
  `checkbox30inputVar` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "t_member"
#

DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `privilege` varchar(45) DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=tis620;

#
# Structure for table "t_patient"
#

DROP TABLE IF EXISTS `t_patient`;
CREATE TABLE `t_patient` (
  `dn` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `titleTh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'คำนำหน้า',
  `nameTh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อ',
  `surnameTh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'สกุล',
  `titleEn` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nameEn` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `surnameEn` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `maritalStatus` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หมายเลขบัตรประชาชน',
  `age` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ที่อยู่',
  `phoneHome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เบอร์โทร',
  `phoneOffice` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `emerNotify` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `emerAddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `parentPhone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `physician` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `physicianOffice` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `physicianPhone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `regDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'วันเกิด',
  `priv` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherAddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'หอพัก',
  `rdate` date DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `fromHospital` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateByUserId` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "t_webusercounter"
#

DROP TABLE IF EXISTS `t_webusercounter`;
CREATE TABLE `t_webusercounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT '1',
  `dateTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=249501 DEFAULT CHARSET=tis620;

#
# Structure for table "tb_appointment"
#

DROP TABLE IF EXISTS `tb_appointment`;
CREATE TABLE `tb_appointment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `aDate` date NOT NULL DEFAULT '0000-00-00',
  `aTimeId` tinyint(2) NOT NULL DEFAULT '0',
  `atime` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'เวลานัด',
  `endTimeId` tinyint(3) NOT NULL DEFAULT '0',
  `endTime` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'เวลาจบ',
  `DN` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `patientName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `dentistUserId` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'คำนำหน้านาม',
  `dentistName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ชื่อหมอ',
  `treatment` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `statusId` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `patientStatusId` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patientStatusName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `whoConfirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้คอนเฟิม',
  `sequence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ลำดับนัดในวันเดียวกัน',
  `lineRowId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `aDate` (`aDate`),
  KEY `dentistUserId` (`dentistUserId`)
) ENGINE=MyISAM AUTO_INCREMENT=44587 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointmentdentiststatus"
#

DROP TABLE IF EXISTS `tb_appointmentdentiststatus`;
CREATE TABLE `tb_appointmentdentiststatus` (
  `dentistStatusId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dentistStatusName` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dentistStatusId`(2))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointmentnote"
#

DROP TABLE IF EXISTS `tb_appointmentnote`;
CREATE TABLE `tb_appointmentnote` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointmentpatientstatus"
#

DROP TABLE IF EXISTS `tb_appointmentpatientstatus`;
CREATE TABLE `tb_appointmentpatientstatus` (
  `patientstatusId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `patientstatusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`patientstatusId`(2))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointmentsetting"
#

DROP TABLE IF EXISTS `tb_appointmentsetting`;
CREATE TABLE `tb_appointmentsetting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dentistUserId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dentist` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `DateOn` date NOT NULL DEFAULT '0000-00-00',
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statusId` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 on : 0 off',
  `statusName` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'On' COMMENT 'ON OFF',
  `assistantUserId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้ช่วย',
  `assistant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้ช่วย',
  `unitId` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `unitName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assistantUserId2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้ช่วย',
  `assistant2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้ช่วย',
  PRIMARY KEY (`Id`,`dentistUserId`,`DateOn`,`statusId`)
) ENGINE=MyISAM AUTO_INCREMENT=12242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointmentstatus"
#

DROP TABLE IF EXISTS `tb_appointmentstatus`;
CREATE TABLE `tb_appointmentstatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `statusId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statusName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointmenttime"
#

DROP TABLE IF EXISTS `tb_appointmenttime`;
CREATE TABLE `tb_appointmenttime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aTimeId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='เวลานัดหมายคลินิกพิเศษ';

#
# Structure for table "tb_appointstatus"
#

DROP TABLE IF EXISTS `tb_appointstatus`;
CREATE TABLE `tb_appointstatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `statusId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `statusName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_appointtime"
#

DROP TABLE IF EXISTS `tb_appointtime`;
CREATE TABLE `tb_appointtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aTimeId` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='เวลานัดหมายคลินิกพิเศษ';

#
# Structure for table "tb_bookunit"
#

DROP TABLE IF EXISTS `tb_bookunit`;
CREATE TABLE `tb_bookunit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patientName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookingDate` date DEFAULT NULL,
  `bookingUpdate` datetime DEFAULT NULL,
  `periodId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `timeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workStepId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workStepName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workStepOther` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `examinerInstructorId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examinerInstructorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateInstructorId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateInstructorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `educationYear` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unitId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workStatusId` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `workStatusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noteId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noteName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noteOther` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'หมายเหตุอื่น',
  `chartBorrowId` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'จองชาร์ต',
  `tools` text COLLATE utf8_unicode_ci,
  `disease` mediumtext COLLATE utf8_unicode_ci,
  `statusId` varchar(5) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '1จอง 2ยกเลิก',
  `statusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'จอง',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=26189 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_course"
#

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `clinicId` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clinic from patient db',
  `courseId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clinic+order',
  `courseId_2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ของจริง มีข้อมูลซ้ำ ต้องใช้ตัวอื่น',
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT 'active=1, inactive=0',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='ใช้ติดตามจองยูนิต';

#
# Structure for table "tb_course_old"
#

DROP TABLE IF EXISTS `tb_course_old`;
CREATE TABLE `tb_course_old` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `clinicId` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseShortName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT 'active=1, inactive=0',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ใช้ติดตามจองยูนิต';

#
# Structure for table "tb_courseregister"
#

DROP TABLE IF EXISTS `tb_courseregister`;
CREATE TABLE `tb_courseregister` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `educationYear` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=557 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_drugalert"
#

DROP TABLE IF EXISTS `tb_drugalert`;
CREATE TABLE `tb_drugalert` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'เดิมเป็น varchar แต่ไม่พอ',
  `writer` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ถ้าเป็นตอนลบ บันทึกแต่ชื่อ ไม่ได้บันทึก id',
  `writerUserId` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT 'active:1 inactive:0 ;waiting:2',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2825 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ประวัติการแพ้ยา';

#
# Structure for table "tb_host"
#

DROP TABLE IF EXISTS `tb_host`;
CREATE TABLE `tb_host` (
  `hostId` int(11) NOT NULL AUTO_INCREMENT,
  `hostName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hostId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_icd10tm"
#

DROP TABLE IF EXISTS `tb_icd10tm`;
CREATE TABLE `tb_icd10tm` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codeSet` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'descp  ต้อนฉบับคือ desc',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=40172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ของสกส';

#
# Structure for table "tb_icd10tm_only_codeset_tt"
#

DROP TABLE IF EXISTS `tb_icd10tm_only_codeset_tt`;
CREATE TABLE `tb_icd10tm_only_codeset_tt` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codeSet` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=40172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='ของสกส';

#
# Structure for table "tb_instructor"
#

DROP TABLE IF EXISTS `tb_instructor`;
CREATE TABLE `tb_instructor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_medicalhistory"
#

DROP TABLE IF EXISTS `tb_medicalhistory`;
CREATE TABLE `tb_medicalhistory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiseaseId` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `DiseaseName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `writer` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ถ้าเป็นตอนลบ บันทึกแต่ชื่อ ไม่ได้บันทึก id',
  `writerUserId` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT 'active:1 inactive:0,wait 2',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=14150 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_offdentist"
#

DROP TABLE IF EXISTS `tb_offdentist`;
CREATE TABLE `tb_offdentist` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dentist` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offDate` date NOT NULL DEFAULT '0000-00-00',
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tb_period"
#

DROP TABLE IF EXISTS `tb_period`;
CREATE TABLE `tb_period` (
  `periodId` int(5) NOT NULL AUTO_INCREMENT,
  `periodName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`periodId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_station"
#

DROP TABLE IF EXISTS `tb_station`;
CREATE TABLE `tb_station` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `stationId` smallint(6) DEFAULT '0',
  `stationName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ที่ตั้งการเงิน';

#
# Structure for table "tb_systemicdisease"
#

DROP TABLE IF EXISTS `tb_systemicdisease`;
CREATE TABLE `tb_systemicdisease` (
  `DiseaseId` int(11) NOT NULL AUTO_INCREMENT,
  `DiseaseName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 active , 0 incative',
  PRIMARY KEY (`DiseaseId`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_treatment_icd10"
#

DROP TABLE IF EXISTS `tb_treatment_icd10`;
CREATE TABLE `tb_treatment_icd10` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `treatmentdate` date DEFAULT NULL,
  `treatmentTime` time DEFAULT NULL,
  `clinicId` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerId` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ใช้ค่าว่างตรวจสอบง่ายกว่า',
  `icd10_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd10_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=150310 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_unit"
#

DROP TABLE IF EXISTS `tb_unit`;
CREATE TABLE `tb_unit` (
  `unitId` int(5) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitOrder` int(6) DEFAULT NULL,
  `courseId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายวิชา',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`unitId`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_unitbooking_status"
#

DROP TABLE IF EXISTS `tb_unitbooking_status`;
CREATE TABLE `tb_unitbooking_status` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `statusId` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminNote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_workstatus"
#

DROP TABLE IF EXISTS `tb_workstatus`;
CREATE TABLE `tb_workstatus` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tb_workstep"
#

DROP TABLE IF EXISTS `tb_workstep`;
CREATE TABLE `tb_workstep` (
  `stepId` int(11) NOT NULL AUTO_INCREMENT,
  `stepName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stepId`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbassistant_spclinic"
#

DROP TABLE IF EXISTS `tbassistant_spclinic`;
CREATE TABLE `tbassistant_spclinic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbchartborrow"
#

DROP TABLE IF EXISTS `tbchartborrow`;
CREATE TABLE `tbchartborrow` (
  `chartBorrowId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `borrowDate` date NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `supplyId` int(10) unsigned NOT NULL,
  `periodId` int(10) unsigned NOT NULL,
  `typeId` int(10) unsigned DEFAULT NULL COMMENT '1 ล่วงหน้า 2 ฉุกเฉิน',
  `returnDate` date DEFAULT NULL,
  `dn` int(10) unsigned NOT NULL,
  `updateByUserId` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เหตุผลการเบิกชาร์ต',
  `elderlyAssignId` int(11) NOT NULL DEFAULT '0',
  `bookingTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'เวลาที่จอง',
  `returnTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'เวลาคืน',
  `approveBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ผู้อนุมัติเบิกเพิ่มเติม',
  `patient` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อผูู้ป่วย',
  `statusId` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '''1 ยืม 2 คืน''',
  `statusName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseId` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'courseId จากจองยูนิต',
  PRIMARY KEY (`chartBorrowId`)
) ENGINE=MyISAM AUTO_INCREMENT=829169 DEFAULT CHARSET=tis620;

#
# Structure for table "tbclass"
#

DROP TABLE IF EXISTS `tbclass`;
CREATE TABLE `tbclass` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `classId` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `className` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='สิทธิข้าราชการ';

#
# Structure for table "tbclinic"
#

DROP TABLE IF EXISTS `tbclinic`;
CREATE TABLE `tbclinic` (
  `clinicID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clinicName` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`clinicID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbdentalrecorduser"
#

DROP TABLE IF EXISTS `tbdentalrecorduser`;
CREATE TABLE `tbdentalrecorduser` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `license` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลขที่ใบประกอบวิชาชีพ',
  `fName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentID` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleID` int(2) unsigned NOT NULL DEFAULT '0',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 active o inactive',
  `users` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passw` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` decimal(3,0) DEFAULT NULL COMMENT 'for lab',
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'for lab',
  `clinicid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เฉพาะ ป โท',
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=1795 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbdrugprescript"
#

DROP TABLE IF EXISTS `tbdrugprescript`;
CREATE TABLE `tbdrugprescript` (
  `DrugPrescriptId` int(10) unsigned NOT NULL COMMENT 'เท่ากับ tbTreatmentListId',
  `perTime` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ครั้งละ ระบุหน่วยเอง',
  `perDay` char(5) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'วันละ',
  `beforeMeals` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ก่อนอาหาร',
  `afterMeals` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หลังอาหาร',
  `morning` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เช้า',
  `noon` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'กลางวัน',
  `evening` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เย็น',
  `night` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ก่อนนอน',
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'หมายเหตุ',
  `hourly` varchar(45) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ทุก กี่ ชม',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DrugPrescriptId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tboralmedicineclinic"
#

DROP TABLE IF EXISTS `tboralmedicineclinic`;
CREATE TABLE `tboralmedicineclinic` (
  `id` int(10) unsigned NOT NULL,
  `studentID` int(13) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `dn` int(10) unsigned DEFAULT NULL,
  `case` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caseX` int(1) unsigned DEFAULT NULL,
  `ccpi` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccpiFull` int(2) unsigned DEFAULT NULL,
  `eo` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eoFull` int(1) unsigned DEFAULT NULL,
  `ioSoftTissue` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ioSoftTissueFull` int(1) unsigned DEFAULT NULL,
  `ioToothPeriodontium` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ioToothPeriodontiumFull` int(1) unsigned DEFAULT NULL,
  `ioDiagram` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ioDiagramFull` int(1) unsigned DEFAULT NULL,
  `clinicalDiagnosis` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinicalDiagnosisFull` int(1) unsigned DEFAULT NULL,
  `xrayRequest` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xrayRequestFull` int(1) unsigned DEFAULT NULL,
  `xrayInterpretation` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xrayInterpretationFull` int(1) unsigned DEFAULT NULL,
  `txPlanRefer` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txPlanReferFull` int(1) unsigned DEFAULT NULL,
  `total1` int(1) unsigned DEFAULT NULL,
  `total1Full` int(1) unsigned DEFAULT NULL,
  `sterileTechniqe` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sterileTechniqeFull` int(1) unsigned DEFAULT NULL,
  `behavior` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `behaviorFull` int(1) unsigned DEFAULT NULL,
  `knowledge` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `knowledgeFull` int(1) unsigned DEFAULT NULL,
  `total2` int(2) unsigned DEFAULT NULL,
  `total2Full` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbpayment"
#

DROP TABLE IF EXISTS `tbpayment`;
CREATE TABLE `tbpayment` (
  `paymentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HeaderId` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `bookId` int(5) unsigned DEFAULT '0',
  `numberId` int(5) unsigned DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateBy` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เป็นผู้รับเงินด้วย',
  `payDate` date DEFAULT NULL,
  `paytime` time DEFAULT NULL,
  `officeHoursId` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `total` double(10,2) DEFAULT '0.00',
  PRIMARY KEY (`paymentId`)
) ENGINE=MyISAM AUTO_INCREMENT=291974 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbprovince"
#

DROP TABLE IF EXISTS `tbprovince`;
CREATE TABLE `tbprovince` (
  `provinceId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provinceName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`provinceId`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbrole"
#

DROP TABLE IF EXISTS `tbrole`;
CREATE TABLE `tbrole` (
  `roleId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=tis620;

#
# Structure for table "tbstatus"
#

DROP TABLE IF EXISTS `tbstatus`;
CREATE TABLE `tbstatus` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Structure for table "tbstudent"
#

DROP TABLE IF EXISTS `tbstudent`;
CREATE TABLE `tbstudent` (
  `studentID` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

#
# Structure for table "tbtreatmentcost"
#

DROP TABLE IF EXISTS `tbtreatmentcost`;
CREATE TABLE `tbtreatmentcost` (
  `id` int(10) unsigned NOT NULL,
  `orderTocompare` tinyint(2) NOT NULL DEFAULT '0',
  `treatmentName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `baseCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `treatmentCode` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'รหัสที่กำหนดเอง',
  `active` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1=ใช้งาน,0=ไม่ใช้งาน',
  `adminNote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bachelorCost` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `masterCost` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorCost` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseCost` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Class` varchar(5) COLLATE utf8_unicode_ci DEFAULT 'EC' COMMENT 'ประเภทบริการ (จ่ายตรง)',
  `className` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'การตรวจรักษา' COMMENT 'ความหมาย',
  `listId` smallint(3) DEFAULT '0' COMMENT 'ลำดับ',
  `treatmentTypeId` int(10) unsigned DEFAULT NULL COMMENT 'for order',
  `drugCondition` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ข้อบ่งใช้',
  `drugDirection` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'วิธีใช้',
  `drugPertime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'default ยา',
  `drugPerDay` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'default',
  `drugBeforeMeals` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugAfterMeals` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugMorning` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugNoon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugEvening` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugNight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drugNote` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'ค่า default เฉพาะยา',
  `drugHourly` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `drugInteraction` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'ชื่อยาที่มีปฏิกริยาต่อกัน',
  `drug_nationalList` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'บัญชียาหลักแห่งชาติ',
  `icd9cm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billMuad` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'สิทธิข้าราชการ',
  `note` varchar(45) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ไว้แสดงกรณีพิเศษในโปรแกรม ไม่แสดงในรายงาน',
  `STDCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เฉพาะ bill muad 3,7',
  KEY `id` (`id`,`treatmentCode`,`treatmentTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbtreatmentheader"
#

DROP TABLE IF EXISTS `tbtreatmentheader`;
CREATE TABLE `tbtreatmentheader` (
  `headerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treatmentdate` date DEFAULT NULL COMMENT 'วันที่เริ่มทำ',
  `treatmenttime` time DEFAULT NULL COMMENT 'เวลาเริ่มทำ',
  `clinicId` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settingId` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'สถานที่ทำคลินิก ใช้กรณีบริการในเวลาแต่ไปทำที่คลินิกตัวเอง code = clinicId',
  `drugStatus` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `dn` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentId` char(10) COLLATE utf8_unicode_ci DEFAULT '',
  `instructorId` int(10) unsigned DEFAULT '0' COMMENT 'บันทึกทั้งอาจารย์ ,นิสิต',
  `approveStatusId` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '2=รอการเงินตรวจเอกสาร',
  `payStatusId` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=ยังไม่จ่าย',
  `approveTime` time DEFAULT NULL COMMENT 'เวลาอาจารย์ตรวจ',
  `approveDate` date DEFAULT NULL COMMENT 'วันที่อาจารย์ตรวจ',
  `payTypeID` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icd10` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupId` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'เอาไว้แยกกลุ่ม',
  `payDate` date DEFAULT NULL COMMENT 'วันที่การเงิน',
  `payTime` time DEFAULT NULL COMMENT 'เวลาการเงิน',
  `amountNuGoldCardCost` float(10,2) DEFAULT '0.00' COMMENT 'ราคาไม่เกิน 200',
  `amountCost` float(10,2) DEFAULT '0.00' COMMENT 'ราคารวมต่อบิล',
  `amountCostRefer` float(10,2) DEFAULT '0.00' COMMENT 'รวมเงินทุก header ในรอบเดียวกันของ Refer',
  `amountClaim` float(10,2) DEFAULT '0.00',
  `amountNoClaim` float(10,2) DEFAULT '0.00',
  `billGroupId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'สำหรับแยกบิล',
  `bookId` int(4) unsigned DEFAULT '0' COMMENT 'บิลเล่มที่',
  `numberId` int(4) unsigned DEFAULT '0' COMMENT 'บิลเลขที่',
  `hospitalId` int(10) unsigned DEFAULT '0',
  `projectId` int(10) unsigned DEFAULT '0',
  `referRightTypeId` int(10) unsigned DEFAULT '0',
  `referOpenDate` date DEFAULT NULL COMMENT 'เริ่มรักษาครั้งแรก',
  `referExpireDate` date DEFAULT NULL,
  `referTreatStatusId` int(10) unsigned DEFAULT '0' COMMENT 'นัด เสร็จ',
  `referLastUpdate` date DEFAULT NULL,
  `nuGoldCardTypeId` int(10) unsigned DEFAULT '0' COMMENT 'ประเภทของบัตรทอง',
  `upDateBy` int(10) unsigned DEFAULT '0' COMMENT 'ผู้บันทึก ผู้ตรวจเอกสาร',
  `officeHoursId` char(1) COLLATE utf8_unicode_ci DEFAULT '1',
  `studentName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เอาไว้โชว์เฉยๆ',
  `instructorName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เอาไว้โชว์เฉยๆ',
  `billCancelUserId` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้ยกเลิกบิล',
  `billCancelNote` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT 'ยกเลิกบิลเพราะ',
  `payeeUserId` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT 'ผู้รับเงิน',
  `paymentId` int(10) unsigned DEFAULT '0' COMMENT 'id ตารางบิล ',
  `comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หมายเหตุ',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `billCancelDate` date DEFAULT NULL,
  `billCancelTime` time DEFAULT NULL,
  `hostId` varchar(5) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT 'ที่รับเงิน',
  `hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'โรงพยาบาล' COMMENT 'ที่รับเงิน',
  `ssBalance` int(11) NOT NULL DEFAULT '0' COMMENT 'social security balance ยอด ปกส ยกมา',
  `ssSum` int(11) NOT NULL DEFAULT '0' COMMENT 'ปกส ที่ใช้ในครั้งนี้',
  `csrStatus` int(1) NOT NULL DEFAULT '0' COMMENT 'คะแนนบริการวิชาการ',
  `vercode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รหัสจากเครื่อง edc',
  `icd10Desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`headerId`) USING BTREE,
  KEY `dn` (`dn`),
  KEY `paymentId` (`paymentId`),
  KEY `studentId` (`studentId`),
  KEY `treatmentDate` (`treatmentdate`),
  KEY `instructorId` (`instructorId`)
) ENGINE=MyISAM AUTO_INCREMENT=409754 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbtreatmentlist"
#

DROP TABLE IF EXISTS `tbtreatmentlist`;
CREATE TABLE `tbtreatmentlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `headerId` int(10) unsigned DEFAULT '0',
  `treatmentdate` date DEFAULT NULL,
  `treatmentTime` time DEFAULT NULL,
  `clinicId` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dn` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studentID` char(10) COLLATE utf8_unicode_ci DEFAULT '',
  `payStatusId` char(1) COLLATE utf8_unicode_ci DEFAULT '1',
  `approveStatusId` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '1=ยังไม่ส่งอาจารย์',
  `instructorId` char(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `treatmentCode` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costPerUnit` float(10,2) DEFAULT '0.00',
  `quantity` int(10) unsigned DEFAULT '0',
  `amountPerUnit` float(10,2) DEFAULT '0.00',
  `claim` float(10,2) DEFAULT '0.00',
  `noClaim` float(10,2) DEFAULT '0.00',
  `ss_begin` float(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ยอด ปกส ตั้งต้นของรายการนี้',
  `ss_net` float(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ยอดใช้ ปกส',
  `claimAfterSS` float(10,2) NOT NULL DEFAULT '0.00' COMMENT 'เบิก ขรก หลังหัก ปกส แล้ว',
  `noClaimAfterSS` float(10,2) NOT NULL DEFAULT '0.00',
  `approveTime` time DEFAULT NULL,
  `approveDate` date DEFAULT NULL,
  `payTypeId` char(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `payDetailName` char(100) COLLATE utf8_unicode_ci DEFAULT '0',
  `icd10` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupId` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `hospitalId` varchar(5) COLLATE utf8_unicode_ci DEFAULT '0',
  `projectId` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officeHoursId` char(1) COLLATE utf8_unicode_ci DEFAULT '1',
  `drugStatus` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `csrStatus` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dn` (`dn`),
  KEY `treatmentCode` (`treatmentCode`),
  KEY `headerId` (`headerId`),
  KEY `studentid` (`studentID`),
  KEY `instructorId` (`instructorId`)
) ENGINE=MyISAM AUTO_INCREMENT=764274 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbtreatmenttype"
#

DROP TABLE IF EXISTS `tbtreatmenttype`;
CREATE TABLE `tbtreatmenttype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `orderNo` int(10) unsigned NOT NULL,
  `orderFinance` int(2) unsigned DEFAULT NULL,
  `listId` tinyint(2) DEFAULT NULL COMMENT 'ลำดับ',
  PRIMARY KEY (`typeId`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbunit_spclinic"
#

DROP TABLE IF EXISTS `tbunit_spclinic`;
CREATE TABLE `tbunit_spclinic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitId` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbuser"
#

DROP TABLE IF EXISTS `tbuser`;
CREATE TABLE `tbuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `privilege` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tbxml_log"
#

DROP TABLE IF EXISTS `tbxml_log`;
CREATE TABLE `tbxml_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dateBegin` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `sessionId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `writer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tempstudent"
#

DROP TABLE IF EXISTS `tempstudent`;
CREATE TABLE `tempstudent` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=813 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ไว้หารายได้ปโท';

#
# Structure for table "test_1"
#

DROP TABLE IF EXISTS `test_1`;
CREATE TABLE `test_1` (
  `headerId` int(10) unsigned DEFAULT NULL,
  `treatmentdate` date DEFAULT NULL,
  `dn` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `age` decimal(7,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "test_2"
#

DROP TABLE IF EXISTS `test_2`;
CREATE TABLE `test_2` (
  `treatmentdate` date DEFAULT NULL,
  `count` bigint(21) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwchartperiod1allsupply"
#

DROP TABLE IF EXISTS `vwchartperiod1allsupply`;
CREATE TABLE `vwchartperiod1allsupply` (
  `chartBorrowId` int(10) unsigned DEFAULT NULL,
  `borrowDate` date DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `supplyId` int(10) unsigned DEFAULT NULL,
  `periodId` int(10) unsigned DEFAULT NULL,
  `statusId` int(10) unsigned DEFAULT NULL,
  `typeId` int(10) unsigned DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `dn` int(10) unsigned DEFAULT NULL,
  `updateByUserId` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count(*)` bigint(21) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwchartperiodid1"
#

DROP TABLE IF EXISTS `vwchartperiodid1`;
CREATE TABLE `vwchartperiodid1` (
  `chartBorrowId` int(10) unsigned DEFAULT NULL,
  `borrowDate` date DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `supplyId` int(10) unsigned DEFAULT NULL,
  `periodId` int(10) unsigned DEFAULT NULL,
  `statusId` int(10) unsigned DEFAULT NULL,
  `typeId` int(10) unsigned DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `dn` int(10) unsigned DEFAULT NULL,
  `updateByUserId` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count(*)` bigint(21) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwchartperiodid2"
#

DROP TABLE IF EXISTS `vwchartperiodid2`;
CREATE TABLE `vwchartperiodid2` (
  `chartBorrowId` int(10) unsigned DEFAULT NULL,
  `borrowDate` date DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `supplyId` int(10) unsigned DEFAULT NULL,
  `periodId` int(10) unsigned DEFAULT NULL,
  `statusId` int(10) unsigned DEFAULT NULL,
  `typeId` int(10) unsigned DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `dn` int(10) unsigned DEFAULT NULL,
  `updateByUserId` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count(*)` bigint(21) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwchatperiod2allsupply"
#

DROP TABLE IF EXISTS `vwchatperiod2allsupply`;
CREATE TABLE `vwchatperiod2allsupply` (
  `chartBorrowId` int(10) unsigned DEFAULT NULL,
  `borrowDate` date DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `supplyId` int(10) unsigned DEFAULT NULL,
  `periodId` int(10) unsigned DEFAULT NULL,
  `statusId` int(10) unsigned DEFAULT NULL,
  `typeId` int(10) unsigned DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `dn` int(10) unsigned DEFAULT NULL,
  `updateByUserId` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count(*)` bigint(21) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwpaymentamount"
#

DROP TABLE IF EXISTS `vwpaymentamount`;
CREATE TABLE `vwpaymentamount` (
  `headerid` int(10) unsigned DEFAULT NULL,
  `amount` double(19,2) DEFAULT NULL,
  `amountClaim` double(19,2) DEFAULT NULL,
  `amountNoClaim` double(19,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwsumamountcostperunitgroupbyheaderid"
#

DROP TABLE IF EXISTS `vwsumamountcostperunitgroupbyheaderid`;
CREATE TABLE `vwsumamountcostperunitgroupbyheaderid` (
  `headerid` int(10) unsigned DEFAULT NULL,
  `total` double(19,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "vwtotalperheaderid"
#

DROP TABLE IF EXISTS `vwtotalperheaderid`;
CREATE TABLE `vwtotalperheaderid` (
  `headerid` int(10) unsigned DEFAULT NULL,
  `totalPerHeaderId` double(19,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# View "test"
#

DROP VIEW IF EXISTS `test`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `test`
  AS
SELECT
  `Id`,
  `aDate`,
  `aTimeId`,
  `atime`,
  `endTimeId`,
  `endTime`,
  `DN`,
  `patientName`,
  `contact`,
  `dentistUserId`,
  `tName`,
  `dentistName`,
  `treatment`,
  `note`,
  `statusId`,
  `statusName`,
  `editor`,
  `patientStatusId`,
  `patientStatusName`,
  `whoConfirm`
FROM
  `tb_appointment`
WHERE
  (((`aDate` >= CURDATE()) AND (`patientStatusId` <> 2)) OR ((`statusId` <> 3) AND (`statusId` <> 6) AND (`statusId` <> 7)));

#
# View "v_1"
#

DROP VIEW IF EXISTS `v_1`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_1`
  AS
SELECT
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`treatmenttime`,
  `tbtreatmentheader`.`treatmentdate`,
  `tbtreatmentheader`.`clinicId`,
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'patient',
  `tbtreatmentheader`.`instructorId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`approveTime`,
  `tbtreatmentheader`.`approveDate`,
  `listtreatmentpaytype`.`payTypeName`,
  `tbtreatmentheader`.`payTypeID`,
  `tbtreatmentheader`.`nuGoldCardTypeId`,
  `tbtreatmentheader`.`icd10`,
  `tbtreatmentheader`.`hospitalId`,
  `listhospital`.`hospitalName`,
  `tbtreatmentheader`.`projectId`,
  `listproject`.`projectName`,
  `tbtreatmentheader`.`approveStatusId`,
  `vwtotalperheaderid`.`totalPerHeaderId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentheader`.`studentName`,
  `tbtreatmentheader`.`instructorName`,
  'ยังไม่จ่าย' AS 'paystatusName',
  'รอตรวจ' AS 'approveName'
FROM
  ((((((`tbtreatmentheader`
    LEFT JOIN `vwtotalperheaderid` ON ((`tbtreatmentheader`.`headerId` = `vwtotalperheaderid`.`headerid`)))
    LEFT JOIN `listproject` ON ((`tbtreatmentheader`.`projectId` = `listproject`.`projectID`)))
    LEFT JOIN `listhospital` ON ((`tbtreatmentheader`.`hospitalId` = `listhospital`.`hospitalId`)))
    LEFT JOIN `listtreatmentpaytype` ON ((`tbtreatmentheader`.`payTypeID` = `listtreatmentpaytype`.`payTypeId`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbclinic`.`clinicID` = `tbtreatmentheader`.`clinicId`)))
WHERE
  ((`tbtreatmentheader`.`payStatusId` IN (1, 4)) AND (`tbtreatmentheader`.`approveStatusId` = 2))
ORDER BY `tbtreatmentheader`.`approveDate`, `tbtreatmentheader`.`approveTime`;

#
# View "v_2"
#

DROP VIEW IF EXISTS `v_2`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_2`
  AS
SELECT
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`treatmenttime`,
  `tbtreatmentheader`.`treatmentdate`,
  `tbtreatmentheader`.`clinicId`,
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'patient',
  `tbtreatmentheader`.`instructorId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`approveTime`,
  `tbtreatmentheader`.`approveDate`,
  `listtreatmentpaytype`.`payTypeName`,
  `tbtreatmentheader`.`payTypeID`,
  `tbtreatmentheader`.`nuGoldCardTypeId`,
  `tbtreatmentheader`.`icd10`,
  `tbtreatmentheader`.`hospitalId`,
  `listhospital`.`hospitalName`,
  `tbtreatmentheader`.`projectId`,
  `listproject`.`projectName`,
  `tbtreatmentheader`.`approveStatusId`,
  `vwtotalperheaderid`.`totalPerHeaderId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentheader`.`studentName`,
  `tbtreatmentheader`.`instructorName`,
  'ยังไม่จ่าย' AS 'paystatusName',
  'รอตรวจ' AS 'approveName'
FROM
  ((((((`tbtreatmentheader`
    LEFT JOIN `vwtotalperheaderid` ON ((`tbtreatmentheader`.`headerId` = `vwtotalperheaderid`.`headerid`)))
    LEFT JOIN `listproject` ON ((`tbtreatmentheader`.`projectId` = `listproject`.`projectID`)))
    LEFT JOIN `listhospital` ON ((`tbtreatmentheader`.`hospitalId` = `listhospital`.`hospitalId`)))
    LEFT JOIN `listtreatmentpaytype` ON ((`tbtreatmentheader`.`payTypeID` = `listtreatmentpaytype`.`payTypeId`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbclinic`.`clinicID` = `tbtreatmentheader`.`clinicId`)))
WHERE
  ((`tbtreatmentheader`.`payStatusId` IN (1, 4)) AND (`tbtreatmentheader`.`approveStatusId` = 3))
ORDER BY `tbtreatmentheader`.`approveDate` DESC, `tbtreatmentheader`.`approveTime` DESC
LIMIT 500;

#
# View "v_dentalrecorduser"
#

DROP VIEW IF EXISTS `v_dentalrecorduser`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_dentalrecorduser`
  AS
SELECT
  `userId`,
  `fName`,
  `lName`,
  `roleID`,
  `status`,
  `users`,
  `passw`,
  `tName`,
  `type`
FROM
  `tbdentalrecorduser`
WHERE
  (((`status` = 1) AND (`roleID` = 5)) OR (`type` = 'admin') OR (`type` = 'member'));

#
# View "v_dentist"
#

DROP VIEW IF EXISTS `v_dentist`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_dentist`
  AS
SELECT
  `userId`,
  `fName`,
  `lName`,
  `studentID`,
  `roleID`,
  `status`,
  `users`,
  `passw`,
  `tName`,
  `type`,
  `clinicid`
FROM
  `tbdentalrecorduser`
WHERE
  (((`roleID` = 5) AND (`status` = '1'))
    OR (`userId` = 773)
    OR (`userId` = 666)
    OR (`userId` = 984)
    OR (`userId` = 988)
    OR (`userId` = 664)
    OR (`userId` = 1724)
    OR (`userId` = 1730));

#
# View "v_drugremain"
#

DROP VIEW IF EXISTS `v_drugremain`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_drugremain`
  AS
SELECT
  `drug_ID`,
  `drug_Name`,
  `recive`,
  `quantity`,
  `remain`,
  `unitName`
FROM
  `drug`.`v_drugremain1`;

#
# View "v_drugremain0"
#

DROP VIEW IF EXISTS `v_drugremain0`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_drugremain0`
  AS
SELECT
  `drug_ID`,
  `drug_Name`,
  `recive`,
  `quantity`,
  `remain`,
  `unitName`
FROM
  `drug`.`v_drugremain0`;

#
# View "v_druguse"
#

DROP VIEW IF EXISTS `v_druguse`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_druguse`
  AS
SELECT
  `tbtreatmentlist`.`treatmentCode`, `tbtreatmentcost`.`treatmentName`, SUM(`tbtreatmentlist`.`quantity`) AS 'sum'
FROM
  (`tbtreatmentlist`
    JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
WHERE
  (((`tbtreatmentlist`.`approveStatusId` = 3) OR (`tbtreatmentlist`.`approveStatusId` = 5)) AND (`tbtreatmentcost`.`treatmentTypeId` = 20))
GROUP BY
  `tbtreatmentlist`.`treatmentCode`;

#
# View "v_patient"
#

DROP VIEW IF EXISTS `v_patient`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_patient`
  AS
SELECT
  `dn`,
  `titleTh`,
  `nameTh`,
  `surnameTh`,
  `titleEn`,
  `nameEn`,
  `surnameEn`,
  `sex`,
  `maritalStatus`,
  `idNo`,
  `age`,
  `occupation`,
  `address`,
  `phoneHome`,
  `phoneOffice`,
  `emerNotify`,
  `emerAddress`,
  `parent`,
  `parentPhone`,
  `physician`,
  `physicianOffice`,
  `physicianPhone`,
  `regDate`,
  `birthDate`,
  `priv`,
  `otherAddress`,
  `rdate`,
  `bdate`,
  `fromHospital`,
  `updateByUserId`,
  `updateTime`
FROM
  `t_patient`;

#
# View "v_paytype"
#

DROP VIEW IF EXISTS `v_paytype`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_paytype`
  AS
SELECT
  `tbtreatmentheader`.`dn`,
  `tbtreatmentheader`.`clinicId`,
  `tbtreatmentheader`.`treatmentdate`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payTypeID`,
  `listtreatmentpaytype`.`payTypeName`
FROM
  (`tbtreatmentheader`
    LEFT JOIN `listtreatmentpaytype` ON ((`tbtreatmentheader`.`payTypeID` = `listtreatmentpaytype`.`payTypeId`)))
WHERE
  ((`tbtreatmentheader`.`clinicId` = 11) AND ((`tbtreatmentheader`.`approveStatusId` = 3) OR (`tbtreatmentheader`.`approveStatusId` = 5)) AND (`tbtreatmentheader`.`treatmentdate` BETWEEN '2023-09-26' AND NOW()));

#
# View "v_test1"
#

DROP VIEW IF EXISTS `v_test1`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_test1`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentlist`.`instructorId`,
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'thName',
  `tbtreatmentlist`.`clinicId`,
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentcost`.`treatmentTypeId`,
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`amountPerUnit`,
  `tbtreatmentcost`.`treatmentName`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentheader`.`csrStatus`
FROM
  ((((`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON (((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`) AND (`tbtreatmentheader`.`instructorId` = `tbtreatmentlist`.`instructorId`))))
    LEFT JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbtreatmentheader`.`clinicId` = `tbclinic`.`clinicID`)))
WHERE
  ((`tbtreatmentheader`.`clinicId` = 11)
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '20')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '22')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '23')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '26')
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2021-04-01' AND NOW())
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = '')
    AND (`tbtreatmentheader`.`csrStatus` = '1'))
ORDER BY `tbtreatmentheader`.`headerId`, `tbtreatmentlist`.`id`, `tbtreatmentheader`.`approveDate`, `tbtreatmentlist`.`treatmentCode`;

#
# View "v_test2"
#

DROP VIEW IF EXISTS `v_test2`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_test2`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`instructorId` AS 'header_instructorId',
  `tbtreatmentlist`.`instructorId`,
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'thName',
  `tbtreatmentheader`.`clinicId`,
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentcost`.`treatmentTypeId`,
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`amountPerUnit`,
  `tbtreatmentcost`.`treatmentName`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentheader`.`csrStatus`
FROM
  ((((`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
    LEFT JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbtreatmentheader`.`clinicId` = `tbclinic`.`clinicID`)))
WHERE
  ((`tbtreatmentheader`.`clinicId` = 11)
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '20')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '22')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '23')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '26')
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2021-04-01' AND NOW())
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = ''))
ORDER BY `tbtreatmentlist`.`headerId`, `tbtreatmentlist`.`approveDate`, `tbtreatmentcost`.`treatmentCode`;

#
# View "v_test3"
#

DROP VIEW IF EXISTS `v_test3`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_test3`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`instructorId` AS 'header_instructorId',
  `tbtreatmentlist`.`instructorId` AS 'list_instructorId',
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'thName',
  `tbtreatmentheader`.`clinicId`,
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentcost`.`treatmentTypeId`,
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`amountPerUnit`,
  `tbtreatmentcost`.`treatmentName`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentheader`.`csrStatus`
FROM
  ((((`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
    LEFT JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbtreatmentheader`.`clinicId` = `tbclinic`.`clinicID`)))
WHERE
  ((`tbtreatmentheader`.`clinicId` = 11)
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '20')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '22')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '23')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '26')
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2021-04-01' AND NOW())
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`instructorId` <> `tbtreatmentlist`.`instructorId`))
ORDER BY `tbtreatmentlist`.`instructorId`, `tbtreatmentlist`.`approveDate`;

#
# View "v_treatment"
#

DROP VIEW IF EXISTS `v_treatment`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_treatment`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`instructorId` AS 'header_instrucId',
  `tbtreatmentlist`.`instructorId`,
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'thName',
  `tbtreatmentlist`.`clinicId`,
  `tbtreatmentheader`.`clinicId` AS 'head_cliicID',
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentcost`.`treatmentTypeId`,
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`amountPerUnit`,
  `tbtreatmentcost`.`treatmentName`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentlist`.`csrStatus`
FROM
  ((((`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
    LEFT JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbtreatmentheader`.`clinicId` = `tbclinic`.`clinicID`)))
WHERE
  ((`tbtreatmentlist`.`clinicId` = 11)
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '20')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '22')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '23')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '26')
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2021-04-01' AND NOW())
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = ''))
ORDER BY `tbtreatmentheader`.`headerId`, `tbtreatmentlist`.`id`, `tbtreatmentheader`.`approveDate`, `tbtreatmentlist`.`treatmentCode`;

#
# View "v_treatment_sum_clinic11_status0"
#

DROP VIEW IF EXISTS `v_treatment_sum_clinic11_status0`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_treatment_sum_clinic11_status0`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentlist`.`instructorId`,
  `tbtreatmentlist`.`clinicId`,
  `tbtreatmentheader`.`approveDate`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentlist`.`treatmentCode`,
  SUM(`tbtreatmentlist`.`amountPerUnit`) AS 'sumAmount',
  (CASE
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 1) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 500)) THEN 2
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 500) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 2000)) THEN 3
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 2000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 5000)) THEN 4
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 5000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 10000)) THEN 5
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 10000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 20000)) THEN 6
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 20000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 35000)) THEN 7
    ELSE 8
  END) AS 'score',
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentlist`.`csrStatus`
FROM
  (`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
WHERE
  ((`tbtreatmentlist`.`clinicId` = 11)
    AND (IF((LENGTH(`tbtreatmentlist`.`treatmentCode`) > 4), LEFT(`tbtreatmentlist`.`treatmentCode`, 2), LEFT(`tbtreatmentlist`.`treatmentCode`, 1)) NOT IN ('20', '22', '23', '26'))
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2021-04-01' AND '2023-09-13')
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = '')
    AND (`tbtreatmentlist`.`csrStatus` = '0'))
GROUP BY
  `tbtreatmentlist`.`instructorId`, `tbtreatmentheader`.`approveDate`, IF((HOUR(`tbtreatmentheader`.`approveTime`) > 13), 'บ่าย', 'เช้า')
ORDER BY `tbtreatmentlist`.`approveDate`, `tbtreatmentlist`.`instructorId`;

#
# View "v_treament_sumall_clinic11"
#

DROP VIEW IF EXISTS `v_treament_sumall_clinic11`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_treament_sumall_clinic11`
  AS
SELECT
  `instructorId`,
  `clinicId`,
  `budget`,
  SUM(`score`) AS 'sumScore',
  `approveStatusId`,
  `payStatusId`,
  `csrStatus`
FROM
  `v_treatment_sum_clinic11_status0`
GROUP BY
  `instructorId`, `budget`
ORDER BY `instructorId`, `budget`;

#
# View "v_treatmentheader"
#

DROP VIEW IF EXISTS `v_treatmentheader`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_treatmentheader`
  AS
SELECT
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`instructorId`,
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'thName',
  `tbtreatmentheader`.`clinicId`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`csrStatus`
FROM
  (`tbtreatmentheader`
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
WHERE
  ((`tbtreatmentheader`.`clinicId` = 11)
    AND (`tbtreatmentheader`.`approveDate` >= CAST('2021-04-01' AS date))
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = ''))
ORDER BY `tbtreatmentheader`.`headerId`, `tbtreatmentheader`.`approveDate`;

#
# View "v_treatmentlist_type_20"
#

DROP VIEW IF EXISTS `v_treatmentlist_type_20`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_treatmentlist_type_20`
  AS
SELECT
  `tbtreatmentlist`.`id` AS 'listId',
  `tbtreatmentlist`.`treatmentdate`,
  `tbtreatmentlist`.`treatmentTime`,
  `tbtreatmentlist`.`clinicId`,
  `tbtreatmentlist`.`dn`,
  `tbtreatmentlist`.`approveStatusId`,
  `tbtreatmentcost`.`treatmentTypeId`
FROM
  (`tbtreatmentlist`
    LEFT JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
WHERE
  ((`tbtreatmentcost`.`treatmentTypeId` = 20) AND (`tbtreatmentlist`.`approveStatusId` = 1));

#
# View "v_tresment_csr_old"
#

DROP VIEW IF EXISTS `v_tresment_csr_old`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_tresment_csr_old`
  AS
SELECT
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentheader`.`instructorId`,
  CONCAT(`tbdentalrecorduser`.`tName`, `tbdentalrecorduser`.`fName`, '  ', `tbdentalrecorduser`.`lName`) AS 'instructorName',
  `tbtreatmentheader`.`dn`,
  CONCAT(`t_patient`.`titleTh`, `t_patient`.`nameTh`, '  ', `t_patient`.`surnameTh`) AS 'thName',
  `tbtreatmentheader`.`clinicId`,
  `tbclinic`.`clinicName`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentcost`.`treatmentTypeId`,
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`amountPerUnit`,
  `tbtreatmentcost`.`treatmentName`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`officeHoursId`,
  `tbtreatmentheader`.`csrStatus`
FROM
  (((((`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
    LEFT JOIN `tbtreatmentcost` ON ((`tbtreatmentlist`.`treatmentCode` = `tbtreatmentcost`.`treatmentCode`)))
    LEFT JOIN `t_patient` ON ((`tbtreatmentheader`.`dn` = `t_patient`.`dn`)))
    LEFT JOIN `tbclinic` ON ((`tbtreatmentheader`.`clinicId` = `tbclinic`.`clinicID`)))
    LEFT JOIN `tbdentalrecorduser` ON ((`tbtreatmentheader`.`instructorId` = `tbdentalrecorduser`.`userId`)))
WHERE
  ((`tbtreatmentheader`.`officeHoursId` = 1)
    AND (`tbtreatmentheader`.`clinicId` <> 11)
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '20')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '22')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '23')
    AND (`tbtreatmentcost`.`treatmentTypeId` <> '26')
    AND (`tbtreatmentheader`.`approveDate` >= CAST('2021-04-01' AS date))
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = ''))
ORDER BY `tbtreatmentheader`.`headerId`, `tbtreatmentheader`.`instructorId`, `tbtreatmentheader`.`approveDate`, `tbtreatmentheader`.`approveTime`, `tbtreatmentlist`.`treatmentCode`;

#
# View "v_tretment_amount"
#

DROP VIEW IF EXISTS `v_tretment_amount`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_tretment_amount`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentlist`.`instructorId`,
  `tbtreatmentlist`.`clinicId`,
  `tbtreatmentheader`.`approveDate`,
  `tbtreatmentheader`.`approveTime`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 13), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`amountPerUnit`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`
FROM
  (`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
WHERE
  ((`tbtreatmentlist`.`clinicId` <> 13)
    AND (IF((LENGTH(`tbtreatmentlist`.`treatmentCode`) > 4), LEFT(`tbtreatmentlist`.`treatmentCode`, 2), LEFT(`tbtreatmentlist`.`treatmentCode`, 1)) NOT IN ('20', '22', '23', '26'))
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2023-09-14' AND NOW())
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = ''))
ORDER BY `tbtreatmentlist`.`approveDate`, `tbtreatmentlist`.`instructorId`, `tbtreatmentlist`.`approveTime`;

#
# View "v_tretment_sumamount"
#

DROP VIEW IF EXISTS `v_tretment_sumamount`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `v_tretment_sumamount`
  AS
SELECT
  `tbtreatmentlist`.`id`,
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`studentId`,
  `tbtreatmentlist`.`instructorId`,
  `tbtreatmentlist`.`clinicId`,
  `tbtreatmentheader`.`approveDate`,
  (IF((MONTH(`tbtreatmentheader`.`approveDate`) > 9), (YEAR(`tbtreatmentheader`.`approveDate`) + 1), YEAR(`tbtreatmentheader`.`approveDate`)) + 543) AS 'budget',
  IF((HOUR(`tbtreatmentheader`.`approveTime`) > 12), 'บ่าย', 'เช้า') AS 'period',
  `tbtreatmentlist`.`treatmentCode`,
  SUM(`tbtreatmentlist`.`amountPerUnit`) AS 'sumAmount',
  (CASE
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 1) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 500)) THEN 2
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 500) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 2000)) THEN 3
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 2000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 5000)) THEN 4
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 5000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 10000)) THEN 5
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 10000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 20000)) THEN 6
    WHEN ((SUM(`tbtreatmentlist`.`amountPerUnit`) > 20000) AND (SUM(`tbtreatmentlist`.`amountPerUnit`) <= 35000)) THEN 7
    ELSE 8
  END) AS 'score',
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentheader`.`payStatusId`
FROM
  (`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
WHERE
  ((`tbtreatmentlist`.`clinicId` <> 13)
    AND (IF((LENGTH(`tbtreatmentlist`.`treatmentCode`) > 4), LEFT(`tbtreatmentlist`.`treatmentCode`, 2), LEFT(`tbtreatmentlist`.`treatmentCode`, 1)) NOT IN ('20', '22', '23', '26'))
    AND (`tbtreatmentheader`.`approveDate` BETWEEN '2023-09-14' AND NOW())
    AND (`tbtreatmentheader`.`approveStatusId` = 3)
    AND (`tbtreatmentheader`.`payStatusId` <> 3)
    AND (`tbtreatmentheader`.`studentId` = ''))
GROUP BY
  `tbtreatmentlist`.`instructorId`, `tbtreatmentheader`.`approveDate`, IF((HOUR(`tbtreatmentheader`.`approveTime`) > 13), 'บ่าย', 'เช้า')
ORDER BY `tbtreatmentlist`.`approveDate`, `tbtreatmentlist`.`instructorId`;

#
# View "vvtest"
#

DROP VIEW IF EXISTS `vvtest`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vvtest`
  AS
SELECT
  `tbtreatmentheader`.`headerId`,
  `tbtreatmentheader`.`payStatusId`,
  `tbtreatmentheader`.`approveStatusId`,
  `tbtreatmentlist`.`treatmentCode`,
  `tbtreatmentlist`.`quantity`,
  `tbtreatmentlist`.`updateTime`,
  `tbtreatmentheader`.`clinicId`
FROM
  (`tbtreatmentheader`
    JOIN `tbtreatmentlist` ON ((`tbtreatmentheader`.`headerId` = `tbtreatmentlist`.`headerId`)))
WHERE
  ((`tbtreatmentlist`.`treatmentCode` = 20050) AND (`tbtreatmentheader`.`clinicId` <> 13));

#
# View "vw_dentalrecorduser"
#

DROP VIEW IF EXISTS `vw_dentalrecorduser`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_dentalrecorduser`
  AS
SELECT
  `userId`,
  `fName`,
  `lName`,
  `studentID`,
  `roleID`,
  `status`,
  `users`,
  `passw`,
  `tName`
FROM
  `tbdentalrecorduser`;

#
# View "vw_patient"
#

DROP VIEW IF EXISTS `vw_patient`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_patient`
  AS
SELECT
  `dn`,
  `titleTh`,
  `nameTh`,
  `surnameTh`,
  `titleEn`,
  `nameEn`,
  `surnameEn`,
  `sex`,
  `maritalStatus`,
  `idNo`,
  `age`,
  `occupation`,
  `address`,
  `phoneHome`,
  `phoneOffice`,
  `emerNotify`,
  `emerAddress`,
  `parent`,
  `parentPhone`,
  `physician`,
  `physicianOffice`,
  `physicianPhone`,
  `regDate`,
  `birthDate`,
  `priv`,
  `otherAddress`,
  `rdate`,
  `bdate`,
  `fromHospital`,
  `updateByUserId`,
  `updateTime`
FROM
  `t_patient`;

#
# View "vw_tb_elderlyassign"
#

DROP VIEW IF EXISTS `vw_tb_elderlyassign`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tb_elderlyassign`
  AS
SELECT
  `t`.`Id`,
  `t`.`dn`,
  `t`.`patientName`,
  `t`.`patientOld`,
  `t`.`clinicid`,
  `t`.`clinicName`,
  `t`.`work`,
  `t`.`periodId`,
  `t`.`periodName`,
  `t`.`assignDate`,
  `t`.`updateTime`,
  `t`.`studentId`,
  `t`.`studentName`,
  `t`.`instructorId`,
  `t`.`instructorName`
FROM
  `q`.`tb_elderlyassign` t;

#
# View "vw_tb_medicalhistory"
#

DROP VIEW IF EXISTS `vw_tb_medicalhistory`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tb_medicalhistory`
  AS
SELECT
  `Id`,
  `dn`,
  `DiseaseId`,
  `DiseaseName`,
  `detail`,
  `status`
FROM
  `tb_medicalhistory`;

#
# View "vw_tbbookunit_endo"
#

DROP VIEW IF EXISTS `vw_tbbookunit_endo`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_endo`
  AS
SELECT
  `endounitbooking`.`tb_bookunit`.`Id`,
  `endounitbooking`.`tb_bookunit`.`studentId`,
  `endounitbooking`.`tb_bookunit`.`studentName`,
  `endounitbooking`.`tb_bookunit`.`dn`,
  `endounitbooking`.`tb_bookunit`.`patientName`,
  `endounitbooking`.`tb_bookunit`.`bookingDate`,
  `endounitbooking`.`tb_bookunit`.`bookingUpdate`,
  `endounitbooking`.`tb_bookunit`.`periodId`,
  `endounitbooking`.`tb_bookunit`.`periodName`,
  `endounitbooking`.`tb_bookunit`.`workStepId`,
  `endounitbooking`.`tb_bookunit`.`workStepName`,
  `endounitbooking`.`tb_bookunit`.`note`,
  `endounitbooking`.`tb_bookunit`.`examinerInstructorId`,
  `endounitbooking`.`tb_bookunit`.`examinerInstructorName`,
  `endounitbooking`.`tb_bookunit`.`updateInstructorId`,
  `endounitbooking`.`tb_bookunit`.`updateInstructorName`,
  `endounitbooking`.`tb_bookunit`.`courseId`,
  `endounitbooking`.`tb_bookunit`.`educationYear`,
  `endounitbooking`.`tb_bookunit`.`updatetime`,
  `endounitbooking`.`tb_bookunit`.`unitId`,
  `endounitbooking`.`tb_bookunit`.`unitName`,
  `endounitbooking`.`tb_bookunit`.`workStatusId`,
  `endounitbooking`.`tb_bookunit`.`workStatusName`,
  `endounitbooking`.`tb_bookunit`.`chartBorrowId`,
  `endounitbooking`.`tb_bookunit`.`tools`,
  `endounitbooking`.`tb_bookunit`.`statusId`,
  `endounitbooking`.`tb_bookunit`.`statusName`,
  `endounitbooking`.`tb_bookunit`.`newCourseId`,
  `endounitbooking`.`tb_bookunit`.`newCourseName`
FROM
  `endounitbooking`.`tb_bookunit`;

#
# View "vw_tbbookunit_occ"
#

DROP VIEW IF EXISTS `vw_tbbookunit_occ`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_occ`
  AS
SELECT
  `occunitbooking`.`tb_bookunit`.`Id`,
  `occunitbooking`.`tb_bookunit`.`studentId`,
  `occunitbooking`.`tb_bookunit`.`studentName`,
  `occunitbooking`.`tb_bookunit`.`dn`,
  `occunitbooking`.`tb_bookunit`.`patientName`,
  `occunitbooking`.`tb_bookunit`.`bookingDate`,
  `occunitbooking`.`tb_bookunit`.`bookingUpdate`,
  `occunitbooking`.`tb_bookunit`.`periodId`,
  `occunitbooking`.`tb_bookunit`.`periodName`,
  `occunitbooking`.`tb_bookunit`.`timeId`,
  `occunitbooking`.`tb_bookunit`.`timeName`,
  `occunitbooking`.`tb_bookunit`.`workStepId`,
  `occunitbooking`.`tb_bookunit`.`workStepName`,
  `occunitbooking`.`tb_bookunit`.`workStepOther`,
  `occunitbooking`.`tb_bookunit`.`examinerInstructorId`,
  `occunitbooking`.`tb_bookunit`.`examinerInstructorName`,
  `occunitbooking`.`tb_bookunit`.`updateInstructorId`,
  `occunitbooking`.`tb_bookunit`.`updateInstructorName`,
  `occunitbooking`.`tb_bookunit`.`courseId`,
  `occunitbooking`.`tb_bookunit`.`educationYear`,
  `occunitbooking`.`tb_bookunit`.`updatetime`,
  `occunitbooking`.`tb_bookunit`.`unitId`,
  `occunitbooking`.`tb_bookunit`.`unitName`,
  `occunitbooking`.`tb_bookunit`.`workStatusId`,
  `occunitbooking`.`tb_bookunit`.`workStatusName`,
  `occunitbooking`.`tb_bookunit`.`noteId`,
  `occunitbooking`.`tb_bookunit`.`noteName`,
  `occunitbooking`.`tb_bookunit`.`noteOther`,
  `occunitbooking`.`tb_bookunit`.`chartBorrowId`,
  `occunitbooking`.`tb_bookunit`.`newCourseId`,
  `occunitbooking`.`tb_bookunit`.`newCourseName`
FROM
  `occunitbooking`.`tb_bookunit`;

#
# View "vw_tbbookunit_ohp"
#

DROP VIEW IF EXISTS `vw_tbbookunit_ohp`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_ohp`
  AS
SELECT
  `ohpunitbooking`.`tb_bookunit`.`Id`,
  `ohpunitbooking`.`tb_bookunit`.`studentId`,
  `ohpunitbooking`.`tb_bookunit`.`studentName`,
  `ohpunitbooking`.`tb_bookunit`.`dn`,
  `ohpunitbooking`.`tb_bookunit`.`patientName`,
  `ohpunitbooking`.`tb_bookunit`.`bookingDate`,
  `ohpunitbooking`.`tb_bookunit`.`bookingUpdate`,
  `ohpunitbooking`.`tb_bookunit`.`periodId`,
  `ohpunitbooking`.`tb_bookunit`.`periodName`,
  `ohpunitbooking`.`tb_bookunit`.`timeId`,
  `ohpunitbooking`.`tb_bookunit`.`timeName`,
  `ohpunitbooking`.`tb_bookunit`.`workStepId`,
  `ohpunitbooking`.`tb_bookunit`.`workStepName`,
  `ohpunitbooking`.`tb_bookunit`.`workStepOther`,
  `ohpunitbooking`.`tb_bookunit`.`examinerInstructorId`,
  `ohpunitbooking`.`tb_bookunit`.`examinerInstructorName`,
  `ohpunitbooking`.`tb_bookunit`.`updateInstructorId`,
  `ohpunitbooking`.`tb_bookunit`.`updateInstructorName`,
  `ohpunitbooking`.`tb_bookunit`.`courseId`,
  `ohpunitbooking`.`tb_bookunit`.`educationYear`,
  `ohpunitbooking`.`tb_bookunit`.`updatetime`,
  `ohpunitbooking`.`tb_bookunit`.`unitId`,
  `ohpunitbooking`.`tb_bookunit`.`unitName`,
  `ohpunitbooking`.`tb_bookunit`.`workStatusId`,
  `ohpunitbooking`.`tb_bookunit`.`workStatusName`,
  `ohpunitbooking`.`tb_bookunit`.`noteId`,
  `ohpunitbooking`.`tb_bookunit`.`noteName`,
  `ohpunitbooking`.`tb_bookunit`.`noteOther`,
  `ohpunitbooking`.`tb_bookunit`.`chartBorrowId`
FROM
  `ohpunitbooking`.`tb_bookunit`;

#
# View "vw_tbbookunit_oper"
#

DROP VIEW IF EXISTS `vw_tbbookunit_oper`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_oper`
  AS
SELECT
  `operunitbooking`.`tb_bookunit`.`Id`,
  `operunitbooking`.`tb_bookunit`.`studentId`,
  `operunitbooking`.`tb_bookunit`.`studentName`,
  `operunitbooking`.`tb_bookunit`.`dn`,
  `operunitbooking`.`tb_bookunit`.`patientName`,
  `operunitbooking`.`tb_bookunit`.`bookingDate`,
  `operunitbooking`.`tb_bookunit`.`bookingUpdate`,
  `operunitbooking`.`tb_bookunit`.`periodId`,
  `operunitbooking`.`tb_bookunit`.`periodName`,
  `operunitbooking`.`tb_bookunit`.`workStepId`,
  `operunitbooking`.`tb_bookunit`.`workStepName`,
  `operunitbooking`.`tb_bookunit`.`workStepOther`,
  `operunitbooking`.`tb_bookunit`.`examinerInstructorId`,
  `operunitbooking`.`tb_bookunit`.`examinerInstructorName`,
  `operunitbooking`.`tb_bookunit`.`updateInstructorId`,
  `operunitbooking`.`tb_bookunit`.`updateInstructorName`,
  `operunitbooking`.`tb_bookunit`.`courseId`,
  `operunitbooking`.`tb_bookunit`.`educationYear`,
  `operunitbooking`.`tb_bookunit`.`updatetime`,
  `operunitbooking`.`tb_bookunit`.`unitId`,
  `operunitbooking`.`tb_bookunit`.`unitName`,
  `operunitbooking`.`tb_bookunit`.`workStatusId`,
  `operunitbooking`.`tb_bookunit`.`workStatusName`,
  `operunitbooking`.`tb_bookunit`.`noteId`,
  `operunitbooking`.`tb_bookunit`.`noteName`,
  `operunitbooking`.`tb_bookunit`.`noteOther`,
  `operunitbooking`.`tb_bookunit`.`chartBorrowId`,
  `operunitbooking`.`tb_bookunit`.`statusId`,
  `operunitbooking`.`tb_bookunit`.`statusName`,
  `operunitbooking`.`tb_bookunit`.`newCourseId`,
  `operunitbooking`.`tb_bookunit`.`newCourseName`
FROM
  `operunitbooking`.`tb_bookunit`;

#
# View "vw_tbbookunit_perio"
#

DROP VIEW IF EXISTS `vw_tbbookunit_perio`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_perio`
  AS
SELECT
  `periounitbooking`.`tb_bookunit`.`Id`,
  `periounitbooking`.`tb_bookunit`.`studentId`,
  `periounitbooking`.`tb_bookunit`.`studentName`,
  `periounitbooking`.`tb_bookunit`.`dn`,
  `periounitbooking`.`tb_bookunit`.`patientName`,
  `periounitbooking`.`tb_bookunit`.`bookingDate`,
  `periounitbooking`.`tb_bookunit`.`bookingUpdate`,
  `periounitbooking`.`tb_bookunit`.`periodId`,
  `periounitbooking`.`tb_bookunit`.`periodName`,
  `periounitbooking`.`tb_bookunit`.`timeId`,
  `periounitbooking`.`tb_bookunit`.`timeName`,
  `periounitbooking`.`tb_bookunit`.`workStepId`,
  `periounitbooking`.`tb_bookunit`.`workStepName`,
  `periounitbooking`.`tb_bookunit`.`workStepOther`,
  `periounitbooking`.`tb_bookunit`.`examinerInstructorId`,
  `periounitbooking`.`tb_bookunit`.`examinerInstructorName`,
  `periounitbooking`.`tb_bookunit`.`updateInstructorId`,
  `periounitbooking`.`tb_bookunit`.`updateInstructorName`,
  `periounitbooking`.`tb_bookunit`.`courseId`,
  `periounitbooking`.`tb_bookunit`.`educationYear`,
  `periounitbooking`.`tb_bookunit`.`updatetime`,
  `periounitbooking`.`tb_bookunit`.`unitId`,
  `periounitbooking`.`tb_bookunit`.`unitName`,
  `periounitbooking`.`tb_bookunit`.`workStatusId`,
  `periounitbooking`.`tb_bookunit`.`workStatusName`,
  `periounitbooking`.`tb_bookunit`.`noteId`,
  `periounitbooking`.`tb_bookunit`.`noteName`,
  `periounitbooking`.`tb_bookunit`.`noteOther`,
  `periounitbooking`.`tb_bookunit`.`chartBorrowId`,
  `periounitbooking`.`tb_bookunit`.`tools`,
  `periounitbooking`.`tb_bookunit`.`disease`,
  `periounitbooking`.`tb_bookunit`.`statusId`,
  `periounitbooking`.`tb_bookunit`.`statusName`,
  `periounitbooking`.`tb_bookunit`.`newCourseId`
FROM
  `periounitbooking`.`tb_bookunit`;

#
# View "vw_tbbookunit_prosth"
#

DROP VIEW IF EXISTS `vw_tbbookunit_prosth`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_prosth`
  AS
SELECT
  `prosthbookunit`.`tbbookunit`.`id`,
  `prosthbookunit`.`tbbookunit`.`studentId`,
  `prosthbookunit`.`tbbookunit`.`dn`,
  `prosthbookunit`.`tbbookunit`.`bookdate`,
  `prosthbookunit`.`tbbookunit`.`periodId`,
  `prosthbookunit`.`tbbookunit`.`stepWorkId`,
  `prosthbookunit`.`tbbookunit`.`unitId`,
  `prosthbookunit`.`tbbookunit`.`workStatusId`,
  `prosthbookunit`.`tbbookunit`.`bookUpDate`,
  `prosthbookunit`.`tbbookunit`.`updateInstructorId`,
  `prosthbookunit`.`tbbookunit`.`courseId`,
  `prosthbookunit`.`tbbookunit`.`checkUpdate`,
  `prosthbookunit`.`tbbookunit`.`note`,
  `prosthbookunit`.`tbbookunit`.`pStatusId`,
  `prosthbookunit`.`tbbookunit`.`checkerUserId`,
  `prosthbookunit`.`tbbookunit`.`courseYear`,
  `prosthbookunit`.`tbbookunit`.`chartBorrowId`,
  `prosthbookunit`.`tbbookunit`.`newCourseId`,
  `prosthbookunit`.`tbbookunit`.`newCourseName`,
  `prosthbookunit`.`tbbookunit`.`flag`
FROM
  `prosthbookunit`.`tbbookunit`;

#
# View "vw_tbbookunit_surgery"
#

DROP VIEW IF EXISTS `vw_tbbookunit_surgery`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbbookunit_surgery`
  AS
SELECT
  `surgeryunitbooking`.`tb_bookunit`.`Id`,
  `surgeryunitbooking`.`tb_bookunit`.`studentId`,
  `surgeryunitbooking`.`tb_bookunit`.`studentName`,
  `surgeryunitbooking`.`tb_bookunit`.`dn`,
  `surgeryunitbooking`.`tb_bookunit`.`patientName`,
  `surgeryunitbooking`.`tb_bookunit`.`bookingDate`,
  `surgeryunitbooking`.`tb_bookunit`.`bookingUpdate`,
  `surgeryunitbooking`.`tb_bookunit`.`periodId`,
  `surgeryunitbooking`.`tb_bookunit`.`periodName`,
  `surgeryunitbooking`.`tb_bookunit`.`timeId`,
  `surgeryunitbooking`.`tb_bookunit`.`timeName`,
  `surgeryunitbooking`.`tb_bookunit`.`endtimeId`,
  `surgeryunitbooking`.`tb_bookunit`.`endTimeName`,
  `surgeryunitbooking`.`tb_bookunit`.`workId`,
  `surgeryunitbooking`.`tb_bookunit`.`workName`,
  `surgeryunitbooking`.`tb_bookunit`.`otherWork`,
  `surgeryunitbooking`.`tb_bookunit`.`examinerInstructorId`,
  `surgeryunitbooking`.`tb_bookunit`.`examinerInstructorName`,
  `surgeryunitbooking`.`tb_bookunit`.`updateInstructorId`,
  `surgeryunitbooking`.`tb_bookunit`.`updateInstructorName`,
  `surgeryunitbooking`.`tb_bookunit`.`courseId`,
  `surgeryunitbooking`.`tb_bookunit`.`educationYear`,
  `surgeryunitbooking`.`tb_bookunit`.`updatetime`,
  `surgeryunitbooking`.`tb_bookunit`.`unitId`,
  `surgeryunitbooking`.`tb_bookunit`.`unitName`,
  `surgeryunitbooking`.`tb_bookunit`.`workStatusId`,
  `surgeryunitbooking`.`tb_bookunit`.`workStatusName`,
  `surgeryunitbooking`.`tb_bookunit`.`chartBorrowId`,
  `surgeryunitbooking`.`tb_bookunit`.`tooth`,
  `surgeryunitbooking`.`tb_bookunit`.`noteid`,
  `surgeryunitbooking`.`tb_bookunit`.`instructorColor`,
  `surgeryunitbooking`.`tb_bookunit`.`courseName`
FROM
  `surgeryunitbooking`.`tb_bookunit`;

#
# View "vw_tbrole"
#

DROP VIEW IF EXISTS `vw_tbrole`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `vw_tbrole`
  AS
SELECT
  `roleId`, `roleName`
FROM
  `tbrole`;

#
# Procedure "countUnitBooking"
#

DROP PROCEDURE IF EXISTS `countUnitBooking`;
CREATE PROCEDURE `countUnitBooking`(xStartDate date,xEndDate date)
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
    studentId varchar(50),
    studentName varchar(50)
  ) ENGINE = MEMORY;
 
  CREATE TEMPORARY TABLE IF NOT EXISTS `temp2` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
		clinicName varchar(50),
	statusId varchar(50),
    studentId varchar(50),
    bookingDate date
  ) ENGINE = MEMORY;
 
	 #count visit
	   CREATE TEMPORARY TABLE IF NOT EXISTS `temp3` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
    studentId varchar(50),
countUnitBooking int(10)
  ) ENGINE = MEMORY;
	 
	 #count status
	 	   CREATE TEMPORARY TABLE IF NOT EXISTS `temp4` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
    studentId varchar(50),
countStatus int(10)
  ) ENGINE = MEMORY;


 
 #temp = student role6
	
   INSERT INTO `temp`(studentId,studentName) SELECT studentId,concat(fname,' ',lName) as studentName FROM tbDentalrecordUser WHERE roleid = 6 AND status = 1;
 
  
  # Insert Tabl 2all clinic
  
		# perio
   INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'Perio',workStatusId,studentId, `bookingDate`   
	  FROM  vw_tbBookUnit_Perio WHERE bookingDate BETWEEN xStartDate AND xEndDate AND statusid = '1'    ;
	 
	 #OHP
	  INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'OHP',workStatusId,studentId, `bookingDate`   
	  FROM  vw_tbBookUnit_OHP WHERE bookingDate BETWEEN xStartDate AND xEndDate;
		
				 #occ
	  INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'OCC',workStatusId,studentId, `bookingDate`   
	  FROM  vw_tbBookUnit_Occ WHERE bookingDate BETWEEN xStartDate AND xEndDate;		
		
			 #endo
	  INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'Endo',workStatusId,studentId, `bookingDate`   
	  FROM  vw_tbBookUnit_Endo WHERE bookingDate BETWEEN xStartDate AND xEndDate  AND statusid = '1'    ;

 #oper
	  INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'Oper',workStatusId,studentId, `bookingDate`   
	  FROM  vw_tbBookUnit_Oper WHERE bookingDate BETWEEN xStartDate AND xEndDate  AND statusid = '1'    ;

		 #prosth
	  INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'Prosth',workStatusId,studentId, `bookDate`   
	  FROM  vw_tbBookUnit_Prosth WHERE bookDate BETWEEN xStartDate AND xEndDate  AND flag = '1'    ;
		
		 #surgery
	  INSERT INTO `temp2`(clinicName,statusId,studentId,`bookingDate`) 
	 SELECT 'Surgery',workStatusId,studentId, `bookingDate`   
	  FROM  vw_tbBookUnit_surgery WHERE bookingDate BETWEEN xStartDate AND xEndDate;

		
#insert clinic 1 2 3 4 5		
		
		
		
		#temp3 นับจำนวนการจอง
		 INSERT INTO `temp3`(studentId,countUnitBooking) SELECT studentId,count(studentId) as countUnitBooking FROM temp2 GROUP BY studentId ;


	#temp4 นับ status
		 INSERT INTO `temp4`(studentId,countStatus) SELECT studentId,count(studentId) as countStatus FROM temp2  WHERE statusId IN (1,2) GROUP BY studentId ;


 

		
  # Return Rows
 #   SELECT * FROM `temp`;

 # SELECT temp.studentId,temp.studentName,temp3.countUnitBooking from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId ;

 SELECT DISTINCT(temp.studentId),temp.studentName,temp3.countUnitBooking,temp4.countStatus from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId 
LEFT JOIN temp4 ON temp.studentId = temp4.studentId   ORDER BY temp3.countUnitBooking;



# SELECT temp.studentId,temp.studentName,temp3.countUnitBooking,temp4.countStatus from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId 
#LEFT JOIN temp4 ON temp.studentId = temp4.studentId   ORDER BY temp3.countUnitBooking;

	
#	select * from temp  ;
  
	# Drop Table
  DROP TABLE `temp`;
	 DROP TABLE `temp2`;
	 DROP TABLE `temp3`;
	  DROP TABLE `temp4`;


END;

#
# Procedure "dms_add_amoxy500"
#

DROP PROCEDURE IF EXISTS `dms_add_amoxy500`;
CREATE PROCEDURE `dms_add_amoxy500`(
  xTreatmentDate date,
  xTreatmentTime time,
  xDn varchar(10),
  xUserId varchar(10),
  xTreatmentCode varchar(10),
  xCostPerUnit double,
  xQuantity integer,
  xAmountPerUnit double,
  xClaim double,
  xNoClaim double
)
BEGIN

-- Amoxy 1x3 opc 

  INSERT
    INTO `tbTreatmentList`
    (`treatmentDate`, `treatmentTime`, `clinicId`, `dn`, `studentId`, `instructorId`, `treatmentCode`,note, `costPerUnit`, `quantity`, `amountPerUnit`, `claim`, `noClaim`, `payTypeId`, `officeHoursId`)
  VALUES
    (xTreatmentDate, xTreatmentTime, '13', -- คลินิกพิเศษ
    xDn, '', -- studnetId
    xUserId, xTreatmentCode,'', xCostPerUnit, xQuantity, xAmountPerUnit, xClaim, xNoClaim, '1', -- ชำระเงินเอง
    '2' -- คลินิกพิเศษ
    );
  SELECT @myListId := LAST_INSERT_ID(); -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentList
  INSERT
    INTO `tbDrugPreScript`
    (`perTime`, `perDay`, `beforeMeals`, `afterMeals`, `morning`, `noon`, `evening`, `night`, `note`, `hourly`, `DrugPrescriptId`)
  VALUES
    ('1 เม็ด', '3', '0', '1', '1', '1', '1', '0', '', '', @myListId);
END;

#
# Procedure "dms_add_paracet500"
#

DROP PROCEDURE IF EXISTS `dms_add_paracet500`;
CREATE PROCEDURE `dms_add_paracet500`(
  xTreatmentDate date,
  xTreatmentTime time,
  xDn varchar(10),
  xUserId varchar(10),
  xTreatmentCode varchar(10),
  xCostPerUnit double,
  xQuantity integer,
  xAmountPerUnit double,
  xClaim double,
  xNoClaim double
)
BEGIN

-- Amoxy 1x3 opc 

  INSERT
    INTO `tbTreatmentList`
    (`treatmentDate`, `treatmentTime`, `clinicId`, `dn`, `studentId`, `instructorId`, `treatmentCode`,note, `costPerUnit`, `quantity`, `amountPerUnit`, `claim`, `noClaim`, `payTypeId`, `officeHoursId`)
  VALUES
    (xTreatmentDate, xTreatmentTime, '13', -- คลินิกพิเศษ
    xDn, '', -- studnetId
    xUserId, xTreatmentCode,'', xCostPerUnit, xQuantity, xAmountPerUnit, xClaim, xNoClaim, '1', -- ชำระเงินเอง
    '2' -- คลินิกพิเศษ
    );
  SELECT @myListId := LAST_INSERT_ID(); -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentList
  INSERT
    INTO `tbDrugPreScript`
    (`perTime`, `perDay`, `beforeMeals`, `afterMeals`, `morning`, `noon`, `evening`, `night`, `note`, `hourly`, `DrugPrescriptId`)
  VALUES
    ('1 เม็ด', '', '0', '0', '0', '0', '0', '0', ' เวลาปวด', '4', @myListId);
END;

#
# Procedure "dms_insert_1"
#

DROP PROCEDURE IF EXISTS `dms_insert_1`;
CREATE PROCEDURE `dms_insert_1`(
  xApproveDate date,
  xApproveTime time,
  xTreatmentDate date,
  xTreatmentTime time,
  xClinicId varchar(10),
  xSettingId varchar(5),
  xDn varchar(10),
  xUserId varchar(10),
  xPayTypeId varchar(10),
  xHospitalId varchar(10),
  xProjectId varchar(10),
  xNuGoldCardTypeId varchar(10),
  xInstructorName varchar(200),
  xComment varchar(200),
	xIcd10Desc varchar(250), 
  xIcd10 varchar(10)
)
BEGIN
  INSERT
    INTO `patient`.`tbTreatmentHeader`
    (`approveDate`, `approveTime`, `treatmentDate`, `treatmentTime`, `clinicId`, `settingId`, `dn`, `instructorId`, `approveStatusId`, `paytypeId`, `hospitalId`, `projectId`, `nuGoldCardTypeId`, `officeHoursId`, `instructorName`, `comment`,icd10desc, `icd10`)
  VALUES
    (xApproveDate, xApproveTime, xTreatmentDate, xTreatmentTime, xClinicId, xSettingId, xDn, xUserId, '2', xPayTypeId, xHospitalId, xProjectId, xNuGoldCardTypeId, '1', xInstructorName, xComment,xIcd10Desc, xIcd10);
  SELECT @myHeaderId := LAST_INSERT_ID(); -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentHeader
  UPDATE
    `patient`.`tbTreatmentList`
  SET -- update headerId ให้ treatmentList  ที่ตรวจผ่านแล้ว
    `approveStatusId` = 2, -- รอการเงินตรวจเอกสาร
    `headerId` = @myHeaderId,
    `approveTime` = xApproveTime,
    `approveDate` = xApproveDate,
    `instructorId` = xUserId
  WHERE
    `dn` = xDn
      AND `treatmentDate` = xTreatmentDate
      AND `treatmentTime` = xTreatmentTime
      AND `clinicId` = xClinicId
      AND `headerId` = 0;
			
			
			
			
				--  copy from dms_insert_4
     	-- 6.3.67		
			 -- 29.4.65   
			 
              -- update headerId to tb_treatment_icd10 เอาไว้ใช้ในระบบสิทธิข้าราชการ เฉพาะคลินิกพิเศษ
              UPDATE tb_treatment_icd10 SET
               headerId = @myHeaderId 
              WHERE dn = xDn
            -- รวมอาจารย์กับนทพ ทำให้ค่าไม่ตรง AND instructorId = xUserId
              AND treatmentDate = xApproveDate
              AND treatmentTime = xTreatmentTime
           --   AND clinicId = '13'
					 AND clinicId = xClinicId
              AND headerId = '' ;
              
              
						   SELECT @myIcd10 := icd10_code
              FROM tb_treatment_icd10
              WHERE
              headerId = @myHeaderId ;
              
              
              UPDATE tbTreatmentHeader
              SET icd10 = @myIcd10
              WHERE  headerId = @myHeaderId ;        
			
			

			
			
			
			
			
			
END;

#
# Procedure "dms_insert_2"
#

DROP PROCEDURE IF EXISTS `dms_insert_2`;
CREATE PROCEDURE `dms_insert_2`(
xApproveDate date,
xApproveTime time, 
xTreatmentDate date, 
xTreatmentTime time, 
xClinicId varchar(10), 
xDn varchar(10),
xStudentId varchar(10), 
xInstructorId varchar(10), 
xPayTypeId varchar(10), 
xHospitalId varchar(10), 
xProjectId varchar(10), 
xNuGoldCardTypeId varchar(10), 
xStudentName varchar(200), 
xInstructorName varchar(200), 
xComment varchar(200),
xIcd10Desc varchar(250), 
xIcd10 varchar(10))
BEGIN
              INSERT INTO `patient`.tbTreatmentHeader (approveDate,  approveTime,  treatmentDate,  treatmentTime,  clinicId  , dn,  studentId,  instructorId,       approveStatusId, paytypeId,  hospitalId,  projectId,  nuGoldCardTypeId,  officeHoursId, studentName,  instructorName, comment,icd10desc, icd10)
                                     values (xApproveDate, xApproveTime, xTreatmentDate, xTreatmentTime, xClinicId , xDn, xStudentId, xInstructorId,      '2',             xPayTypeId, xHospitalId, xProjectId, xNuGoldCardTypeId,   '1',        xStudentName,  xInstructorName, xComment,xIcd10Desc , xIcd10)     ;


              SELECT @myHeaderId := LAST_INSERT_ID()    ;       -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentHeader


              UPDATE `patient`.tbTreatmentList SET        -- update headerId ให้ treatmentList  ที่ตรวจผ่านแล้ว
              approveStatusId = 2 ,             -- รอการเงินตรวจเอกสาร
              headerId = @myHeaderId ,
              approveTime = xApproveTime ,
              approveDate = xApproveDate ,
              instructorId = xInstructorId
              WHERE dn = xDn
              AND treatmentDate = xTreatmentDate
              AND treatmentTime = xTreatmentTime
              AND clinicId = xClinicId
              AND studentId = xStudentId
              AND headerId = 0 ;

 
--  copy from dms_insert_4 6.3.67
 -- 29.4.65
              -- update headerId to tb_treatment_icd10 เอาไว้ใช้ในระบบสิทธิข้าราชการ เฉพาะคลินิกพิเศษ
              UPDATE tb_treatment_icd10 SET
               headerId = @myHeaderId 
              WHERE dn = xDn
            -- รวมอาจารย์กับนทพ ทำให้ค่าไม่ตรง AND instructorId = xUserId
              AND treatmentDate = xApproveDate
              AND treatmentTime = xTreatmentTime
           --   AND clinicId = '13'
					 AND clinicId = xClinicId
              AND headerId = '' ;
              
              
             SELECT @myIcd10 := icd10_code
              FROM tb_treatment_icd10
              WHERE
              headerId = @myHeaderId ;
              
              
              UPDATE tbTreatmentHeader
              SET icd10 = @myIcd10
              WHERE  headerId = @myHeaderId ;      
 
 

  END;

#
# Procedure "dms_insert_3"
#

DROP PROCEDURE IF EXISTS `dms_insert_3`;
CREATE PROCEDURE `dms_insert_3`(xApproveDate date,xApproveTime time,  xTreatmentTime time, xDn varchar(10), xUserId varchar(10),  xInstructorName varchar(200), xComment varchar(200))
BEGIN
              INSERT INTO tbTreatmentHeader (approveDate,  approveTime,  treatmentDate,  treatmentTime,  clinicId  , dn,  instructorId, approveStatusId, paytypeId,  officeHoursId,  instructorName, comment)
                                     values (xApproveDate,
                                             xApproveTime,
                                             xApproveDate,    -- ใช้แทนค่า treatmentdate
                                             xTreatmentTime,
                                             '13' ,  -- คลินิกพิเศษ
                                             xDn,
                                             xUserId,
                                             '2',     -- รอการเงินตรวจเอกสาร
                                             '1',     -- ชำระเงินเอง
                                             '2',     -- คลินิกพิเศษ
                                             xInstructorName,
                                             xComment)   ;


              SELECT @myHeaderId := LAST_INSERT_ID()    ;       -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentHeader


              UPDATE tbTreatmentList SET        -- update headerId ให้ treatmentList  ที่ตรวจผ่านแล้ว
              approveStatusId = 2 ,             -- รอการเงินตรวจเอกสาร
              headerId = @myHeaderId ,
              approveTime = xApproveTime ,
              approveDate = xApproveDate ,
              instructorId = xUserId
              WHERE dn = xDn
              AND treatmentDate = xApproveDate
              AND treatmentTime = xTreatmentTime
              AND clinicId = '13'
              AND headerId = 0 ;
              
              
               -- 29.4.65
              -- update headerId to tb_treatment_icd10 เอาไว้ใช้ในระบบสิทธิข้าราชการ เฉพาะคลินิกพิเศษ
              UPDATE tb_treatment_icd10 SET
               headerId = @myHeaderId 
              WHERE dn = xDn
              AND instructorId = xUserId
              AND treatmentDate = xApproveDate
              AND treatmentTime = xTreatmentTime
              AND clinicId = '13'
              AND headerId = '' ;
              
              
              -- update icd10 to header
              SELECT @myIcd10 := icd10_code
              FROM tb_treatment_icd10
              WHERE
              headerId = @myHeaderId ;
              
              
              UPDATE tbTreatmentHeader
              SET icd10 = @myIcd10
              WHERE  headerId = @myHeaderId ;          



  END;

#
# Procedure "dms_insert_4"
#

DROP PROCEDURE IF EXISTS `dms_insert_4`;
CREATE PROCEDURE `dms_insert_4`(xApproveDate date,xApproveTime time,  xTreatmentTime time, xDn varchar(10), xUserId varchar(10), xPayTypeId varchar(10), xInstructorName varchar(200), xComment varchar(200))
BEGIN
              INSERT INTO tbTreatmentHeader (approveDate,  approveTime,  treatmentDate,  treatmentTime,  clinicId  , dn,  instructorId, approveStatusId, paytypeId,  officeHoursId,  instructorName, comment)
                                     values (xApproveDate,
                                             xApproveTime,
                                             xApproveDate,    -- ใช้แทนค่า treatmentdate
                                             xTreatmentTime,
                                             '13' ,  -- คลินิกพิเศษ
                                             xDn,
                                             xUserId,
                                             '2',     -- รอการเงินตรวจเอกสาร
                                            -- '1',     -- ชำระเงินเอง
                                            xPayTypeId ,
                                             '2',     -- คลินิกพิเศษ
                                             xInstructorName,
                                             xComment)   ;


              SELECT @myHeaderId := LAST_INSERT_ID()    ;       -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentHeader


              UPDATE tbTreatmentList SET        -- update headerId ให้ treatmentList  ที่ตรวจผ่านแล้ว
              approveStatusId = 2 ,             -- รอการเงินตรวจเอกสาร
              headerId = @myHeaderId ,
              approveTime = xApproveTime ,
              approveDate = xApproveDate ,
              instructorId = xUserId
              WHERE dn = xDn
              AND treatmentDate = xApproveDate							
					
            --  AND treatmentTime = xTreatmentTime 		--4.1.68 ยกเลิกเวลา
						AND   instructorId = xUserId

              AND clinicId = '13'
              AND headerId = 0 ;
              
							 
              
              -- 29.4.65
              -- update headerId to tb_treatment_icd10 เอาไว้ใช้ในระบบสิทธิข้าราชการ เฉพาะคลินิกพิเศษ
              UPDATE tb_treatment_icd10 SET
               headerId = @myHeaderId 
              WHERE dn = xDn
              AND instructorId = xUserId
              AND treatmentDate = xApproveDate
							
               --  AND treatmentTime = xTreatmentTime 		--4.1.68 ยกเลิกเวลา
									 	
							 			AND   instructorId = xUserId
										
              AND clinicId = '13'
              AND headerId = '' ;              
              
							 
              -- update icd10 to header
              SELECT @myIcd10 := icd10_code
              FROM tb_treatment_icd10
              WHERE
              headerId = @myHeaderId ;
              
							 
              
              UPDATE tbTreatmentHeader
              SET icd10 = @myIcd10
              WHERE  headerId = @myHeaderId ;             
              
            


  END;

#
# Procedure "dms_insert_5"
#

DROP PROCEDURE IF EXISTS `dms_insert_5`;
CREATE PROCEDURE `dms_insert_5`(
xApproveDate date,
xApproveTime time, 
xTreatmentDate date, 
xTreatmentTime time, 
xClinicId varchar(10), 
xDn varchar(10),
xStudentId varchar(10), 
xInstructorId varchar(10), 
xPayTypeId varchar(10), 
xHospitalId varchar(10), 
xProjectId varchar(10), 
xNuGoldCardTypeId varchar(10), 
xStudentName varchar(200), 
xInstructorName varchar(200), 
xComment varchar(200),
xIcd10Desc varchar(250), 
xIcd10 varchar(10))
BEGIN
              INSERT INTO `patient`.tbTreatmentHeader (approveDate,  approveTime,  treatmentDate,  treatmentTime,  clinicId  , dn,  studentId,  instructorId,       approveStatusId, paytypeId,  hospitalId,  projectId,  nuGoldCardTypeId,  officeHoursId, studentName,  instructorName, comment,icd10desc, icd10)
                                     values (xApproveDate, xApproveTime, xTreatmentDate, xTreatmentTime, xClinicId , xDn, xStudentId, xInstructorId,      '3',             xPayTypeId, xHospitalId, xProjectId, xNuGoldCardTypeId,   '1',        xStudentName,  xInstructorName, xComment,xIcd10Desc , xIcd10)     ;


              SELECT @myHeaderId := LAST_INSERT_ID()    ;       -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentHeader


              UPDATE `patient`.tbTreatmentList SET        -- update headerId ให้ treatmentList  ที่ตรวจผ่านแล้ว
              approveStatusId = 3 ,             -- ทันตกรรมพระราชท่านไม่ต้องผ่านการเงิน อ.mink 1jan25
              headerId = @myHeaderId ,
              approveTime = xApproveTime ,
              approveDate = xApproveDate ,
              instructorId = xInstructorId
              WHERE dn = xDn
              AND treatmentDate = xTreatmentDate
              AND treatmentTime = xTreatmentTime
              AND clinicId = xClinicId
              AND studentId = xStudentId
              AND headerId = 0 ;

 
--  copy from dms_insert_4 6.3.67
 -- 29.4.65
              -- update headerId to tb_treatment_icd10 เอาไว้ใช้ในระบบสิทธิข้าราชการ เฉพาะคลินิกพิเศษ
              UPDATE tb_treatment_icd10 SET
               headerId = @myHeaderId 
              WHERE dn = xDn
            -- รวมอาจารย์กับนทพ ทำให้ค่าไม่ตรง AND instructorId = xUserId
              AND treatmentDate = xApproveDate
              AND treatmentTime = xTreatmentTime
           --   AND clinicId = '13'
					 AND clinicId = xClinicId
              AND headerId = '' ;
              
              
             SELECT @myIcd10 := icd10_code
              FROM tb_treatment_icd10
              WHERE
              headerId = @myHeaderId ;
              
              
              UPDATE tbTreatmentHeader
              SET icd10 = @myIcd10
              WHERE  headerId = @myHeaderId ;      
 
 

  END;

#
# Procedure "dms_insert_6"
#

DROP PROCEDURE IF EXISTS `dms_insert_6`;
CREATE PROCEDURE `dms_insert_6`(
  xApproveDate date,
  xApproveTime time,
  xTreatmentDate date,
  xTreatmentTime time,
  xClinicId varchar(10),
  xSettingId varchar(5),
  xDn varchar(10),
  xUserId varchar(10),
  xPayTypeId varchar(10),
  xHospitalId varchar(10),
  xProjectId varchar(10),
  xNuGoldCardTypeId varchar(10),
  xInstructorName varchar(200),
  xComment varchar(200),
	xIcd10Desc varchar(250), 
  xIcd10 varchar(10)
)
BEGIN
  INSERT
    INTO `patient`.`tbTreatmentHeader`
    (`approveDate`, `approveTime`, `treatmentDate`, `treatmentTime`, `clinicId`, `settingId`, `dn`, `instructorId`, `approveStatusId`, `paytypeId`, `hospitalId`, `projectId`, `nuGoldCardTypeId`, `officeHoursId`, `instructorName`, `comment`,icd10desc, `icd10`)
  VALUES
    (xApproveDate, xApproveTime, xTreatmentDate, xTreatmentTime, xClinicId, xSettingId, xDn, xUserId, '3', xPayTypeId, xHospitalId, xProjectId, xNuGoldCardTypeId, '1', xInstructorName, xComment,xIcd10Desc, xIcd10);
  SELECT @myHeaderId := LAST_INSERT_ID(); -- headerId ล่าสุดโยเช็คจาก inset ด้านบน ของ tbTrearmentHeader
  UPDATE
    `patient`.`tbTreatmentList`
  SET -- update headerId ให้ treatmentList  ที่ตรวจผ่านแล้ว
    `approveStatusId` = 3, -- โครงการที่ไม่ต้องผ่านการเงิน 1jan69
    `headerId` = @myHeaderId,
    `approveTime` = xApproveTime,
    `approveDate` = xApproveDate,
    `instructorId` = xUserId
  WHERE
    `dn` = xDn
      AND `treatmentDate` = xTreatmentDate
      AND `treatmentTime` = xTreatmentTime
      AND `clinicId` = xClinicId
      AND `headerId` = 0;
			
			
			
			
				--  copy from dms_insert_4
     	-- 6.3.67		
			 -- 29.4.65   
			 
              -- update headerId to tb_treatment_icd10 เอาไว้ใช้ในระบบสิทธิข้าราชการ เฉพาะคลินิกพิเศษ
              UPDATE tb_treatment_icd10 SET
               headerId = @myHeaderId 
              WHERE dn = xDn
            -- รวมอาจารย์กับนทพ ทำให้ค่าไม่ตรง AND instructorId = xUserId
              AND treatmentDate = xApproveDate
              AND treatmentTime = xTreatmentTime
           --   AND clinicId = '13'
					 AND clinicId = xClinicId
              AND headerId = '' ;
              
              
						   SELECT @myIcd10 := icd10_code
              FROM tb_treatment_icd10
              WHERE
              headerId = @myHeaderId ;
              
              
              UPDATE tbTreatmentHeader
              SET icd10 = @myIcd10
              WHERE  headerId = @myHeaderId ;        
			
			

			
			
			
			
			
			
END;

#
# Procedure "findStudentInUnitBooking"
#

DROP PROCEDURE IF EXISTS `findStudentInUnitBooking`;
CREATE PROCEDURE `findStudentInUnitBooking`(xStartDate date,xEndDate date,xStudentId varchar(50), xCourseId varchar(10))
BEGIN




#  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
#    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
#    studentId varchar(50),
#    studentName varchar(50)
#  ) ENGINE = MEMORY;

		
		# temp รวมทุกคลินิก
  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
		clinicId varchar(3),
		clinicName varchar(50),
	statusId varchar(50),


#work status
    studentId varchar(50),
    bookingDate date,
		courseId varchar(50)
  ) ENGINE = MEMORY;

 
#temp = student role6
 #  INSERT INTO `temp`(studentId,studentName) SELECT studentId,concat(fname,' ',lName) as studentName FROM tbDentalrecordUser WHERE roleid = 6 AND status = 1;

  # Insert Tabl 2 data all clinic

  
#ใส่ข้อมูลทีละคลินิกลงใน temp
	 
		#Perio

   INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
	 SELECT '3', 'Perio',workStatusId,studentId, `bookingDate`,newCourseId   
	 FROM  vw_tbBookUnit_Perio
	  WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId
					AND statusId = '1' ; 
#statusid ตรงนี้หมายถึง active

		  #OHP
	  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
	SELECT '2', 'OHP',workStatusId,studentId, `bookingDate`,CourseId   
	  FROM  vw_tbBookUnit_OHP
		 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId;
				#	AND statusId = '1' ; 
#statusid ตรงนี้หมายถึง active
		

			 #occ
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
	SELECT '1', 'OCC',workStatusId,studentId, `bookingDate`,newCourseId   	  
	  FROM  vw_tbBookUnit_Occ
		 	 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId;
	
		

			 #endo
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
		SELECT '5', 'Endo',workStatusId,studentId, `bookingDate`,newCourseId 
			  FROM  vw_tbBookUnit_endo
		 	 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId 	AND statusId = '1' ;
				

			 #oper			 
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId)					 
		SELECT '4', 'Oper',workStatusId,studentId, `bookingDate`,newCourseId								
			  FROM  vw_tbBookUnit_Oper												
		 	 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId 	AND statusId = '1' ;
			 			
		 #prosth		 
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId)					 
		SELECT '6', 'Prosth',workStatusId,studentId, `bookDate`,newCourseId								
			  FROM  vw_tbBookUnit_Prosth												
		 	 WHERE bookDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId 	AND flag = '1' ;		
			 
			  #surgery
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId)					 
	SELECT '7', 'Surgery',workStatusId,studentId, `bookingDate`,CourseId								
	  FROM  vw_tbBookUnit_Surgery												
 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId  ;		
			
  # Return Rows
 #   SELECT * FROM `temp`;
 # SELECT temp.studentId,temp.studentName,temp3.countUnitBooking from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId ;
# SELECT temp.studentId,temp.studentName,temp3.countUnitBooking,temp4.countStatus from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId 
#LEFT JOIN temp4 ON temp.studentId = temp4.studentId   ORDER BY temp3.countUnitBooking;



 #แสดงผลไม่ต้องกำหนดเวลา
 #	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
#	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId   ;

	 
		if xCourseId IS NOT NULL THEN
	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId 
	  WHERE temp.courseId = xCourseId  ;

	ELSE
	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId 
	     ;

	END IF; 
	 
	 
	# Drop Table
	 DROP TABLE `temp`;









END;

#
# Procedure "findStudentInUnitBooking_copy"
#

DROP PROCEDURE IF EXISTS `findStudentInUnitBooking_copy`;
CREATE PROCEDURE `findStudentInUnitBooking_copy`(xStartDate date,xEndDate date,xStudentId varchar(50), xCourseId varchar(10))
BEGIN




#  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
#    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
#    studentId varchar(50),
#    studentName varchar(50)
#  ) ENGINE = MEMORY;

		
		# temp รวมทุกคลินิก
  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
		clinicId varchar(3),
		clinicName varchar(50),
	statusId varchar(50),


#work status
    studentId varchar(50),
    bookingDate date,
		courseId varchar(50)
  ) ENGINE = MEMORY;

 
#temp = student role6
 #  INSERT INTO `temp`(studentId,studentName) SELECT studentId,concat(fname,' ',lName) as studentName FROM tbDentalrecordUser WHERE roleid = 6 AND status = 1;

  # Insert Tabl 2 data all clinic

  
#ใส่ข้อมูลทีละคลินิกลงใน temp
	 
		#Perio

   INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
	 SELECT '3', 'Perio',workStatusId,studentId, `bookingDate`,newCourseId   
	 FROM  vw_tbBookUnit_Perio
	  WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId
					AND statusId = '1' ; 
#statusid ตรงนี้หมายถึง active

		  #OHP
	  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
	SELECT '2', 'OHP',workStatusId,studentId, `bookingDate`,CourseId   
	  FROM  vw_tbBookUnit_OHP
		 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId;
				#	AND statusId = '1' ; 
#statusid ตรงนี้หมายถึง active
		

			 #occ
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
	SELECT '1', 'OCC',workStatusId,studentId, `bookingDate`,newCourseId   	  
	  FROM  vw_tbBookUnit_Occ
		 	 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId;
	
		

			 #endo
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId) 
		SELECT '5', 'Endo',workStatusId,studentId, `bookingDate`,newCourseId 
			  FROM  vw_tbBookUnit_endo
		 	 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId 	AND statusId = '1' ;
				

			 #oper			 
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId)					 
		SELECT '4', 'Oper',workStatusId,studentId, `bookingDate`,newCourseId								
			  FROM  vw_tbBookUnit_Oper												
		 	 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId 	AND statusId = '1' ;
			 			
		 #prosth		 
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId)					 
		SELECT '6', 'Prosth',workStatusId,studentId, `bookDate`,newCourseId								
			  FROM  vw_tbBookUnit_Prosth												
		 	 WHERE bookDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId 	AND flag = '1' ;		
			 
			  #surgery
  INSERT INTO `temp`(clinicid,clinicName,statusId,studentId,`bookingDate`,courseId)					 
	SELECT '7', 'Surgery',workStatusId,studentId, `bookingDate`,CourseId								
	  FROM  vw_tbBookUnit_Surgery												
 WHERE bookingDate BETWEEN xStartDate AND xEndDate AND studentId = xStudentId  ;		
			
  # Return Rows
 #   SELECT * FROM `temp`;
 # SELECT temp.studentId,temp.studentName,temp3.countUnitBooking from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId ;
# SELECT temp.studentId,temp.studentName,temp3.countUnitBooking,temp4.countStatus from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId 
#LEFT JOIN temp4 ON temp.studentId = temp4.studentId   ORDER BY temp3.countUnitBooking;



 #แสดงผลไม่ต้องกำหนดเวลา
 #	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
#	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId   ;

	 
		if xCourseId IS NOT NULL THEN
	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId 
	  WHERE temp.courseId = xCourseId  ;

	ELSE
	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId 
	     ;

	END IF; 
	 
	 
	# Drop Table
	 DROP TABLE `temp`;









END;

#
# Procedure "findtest"
#

DROP PROCEDURE IF EXISTS `findtest`;
CREATE PROCEDURE `findtest`(xStartDate date, xEndDate date)
BEGIN
#  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
#    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
#    studentId varchar(50),
#    studentName varchar(50)
#  ) ENGINE = MEMORY;
# temp รวมทุกคลินิก
  CREATE TEMPORARY TABLE IF NOT EXISTS `temp` (
    `RowID` int unsigned AUTO_INCREMENT PRIMARY KEY,
    `clinicId` varchar(3),
    `clinicName` varchar(50),
    `statusId` varchar(50),
    #work status
    `studentId` varchar(50),
    `bookingDate` date,
    `courseId` varchar(50)
  ) ENGINE = MEMORY;
  #temp = student role6
  #  INSERT INTO `temp`(studentId,studentName) SELECT studentId,concat(fname,' ',lName) as studentName FROM tbDentalrecordUser WHERE roleid = 6 AND status = 1;
  # Insert Tabl 2 data all clinic
  #ใส่ข้อมูลทีละคลินิกลงใน temp
  #Perio
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '3',
      'Perio',
      `workStatusId`,
      `studentId`,
      `bookingDate`,
      `newCourseId`
    FROM
      `vw_tbBookUnit_Perio`
    WHERE
      `bookingDate` BETWEEN xStartDate AND xEndDate AND `statusId` = '1';
  #statusid ตรงนี้หมายถึง active
  #OHP
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '2',
      'OHP',
      `workStatusId`,
      `studentId`,
      `bookingDate`,
      `CourseId`
    FROM
      `vw_tbBookUnit_OHP`
    WHERE
      `bookingDate` BETWEEN xStartDate AND xEndDate;
  #	AND statusId = '1' ; 
  #statusid ตรงนี้หมายถึง active
  #occ
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '1',
      'OCC',
      `workStatusId`,
      `studentId`,
      `bookingDate`,
      `newCourseId`
    FROM
      `vw_tbBookUnit_Occ`
    WHERE
      `bookingDate` BETWEEN xStartDate AND xEndDate;
  #endo
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '5',
      'Endo',
      `workStatusId`,
      `studentId`,
      `bookingDate`,
      `newCourseId`
    FROM
      `vw_tbBookUnit_endo`
    WHERE
      `bookingDate` BETWEEN xStartDate AND xEndDate AND `statusId` = '1';
  #oper			 
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '4',
      'Oper',
      `workStatusId`,
      `studentId`,
      `bookingDate`,
      `newCourseId`
    FROM
      `vw_tbBookUnit_Oper`
    WHERE
      `bookingDate` BETWEEN xStartDate AND xEndDate AND `statusId` = '1';
  #prosth		 
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '6',
      'Prosth',
      `workStatusId`,
      `studentId`,
      `bookDate`,
      `newCourseId`
    FROM
      `vw_tbBookUnit_Prosth`
    WHERE
      `bookDate` BETWEEN xStartDate AND xEndDate AND `flag` = '1';
  #surgery
  INSERT
    INTO `temp`
    (`clinicid`, `clinicName`, `statusId`, `studentId`, `bookingDate`, `courseId`)
    SELECT
      '7',
      'Surgery',
      `workStatusId`,
      `studentId`,
      `bookingDate`,
      `CourseId`
    FROM
      `vw_tbBookUnit_Surgery`
    WHERE
      `bookingDate` BETWEEN xStartDate AND xEndDate;
  # Return Rows
  #   SELECT * FROM `temp`;
  # SELECT temp.studentId,temp.studentName,temp3.countUnitBooking from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId ;
  # SELECT temp.studentId,temp.studentName,temp3.countUnitBooking,temp4.countStatus from temp LEFT JOIN temp3  ON temp.studentId = temp3.studentId 
  #LEFT JOIN temp4 ON temp.studentId = temp4.studentId   ORDER BY temp3.countUnitBooking;
  #แสดงผลไม่ต้องกำหนดเวลา
  #	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
  #	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId   ;
  #		if xCourseId IS NOT NULL THEN
  #	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
  # from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId 
  # WHERE temp.courseId = xCourseId  ;
  #	ELSE
  #	select temp.studentId,temp.clinicName,temp.statusId,temp.bookingDate,tb_course.courseName, tb_unitbooking_status.statusName
  #	 from temp LEFT JOIN tb_course ON temp.courseId = tb_course.courseId LEFT JOIN tb_unitbooking_status ON temp.statusId = tb_unitbooking_status.statusId 
  #     ;
  #	END IF; 
  SELECT
    `temp`.`clinicName`, year(`temp`.`bookingDate`) AS 'yearr', MONTH(`temp`.`bookingDate`) AS 'monthh', COUNT(*) AS 'num'
  FROM
    `temp`
      LEFT JOIN `tb_course` ON `temp`.`courseId` = `tb_course`.`courseId`
      LEFT JOIN `tb_unitbooking_status` ON `temp`.`statusId` = `tb_unitbooking_status`.`statusId`
  GROUP BY
    `temp`.`clinicname`, MONTH(`temp`.`bookingDate`)
	order by
		 `temp`.`clinicName`, year(`temp`.`bookingDate`) asc , MONTH(`temp`.`bookingDate`) ;

		
  # Drop Table
  DROP TABLE `temp`;
END;

#
# Procedure "returnChart"
#

DROP PROCEDURE IF EXISTS `returnChart`;
CREATE PROCEDURE `returnChart`(xDn varchar(10), xUserId varchar(10),xDate varchar(20))
BEGIN


SELECT @myId := chartBorrowId  
FROM tbChartBorrow
 WHERE
   # `dn` = xDn AND `statusId` = 1 AND borrowDate <= CURDATE() 
	 `dn` = xDn AND `statusId` = 1 AND borrowDate <=date(xDate)

  LIMIT 1;


  UPDATE
    `tbChartBorrow`
  SET
    `returnDate` = CURDATE(),
    `updateByUserId` = xUserId,
    `statusId` = 2,
    `returnTime` = NOW()
 WHERE
 chartBorrowId = @myId;
 
END;
