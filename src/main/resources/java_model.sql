-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 192.168.197.128    Database: java_model
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACT_EVT_LOG`
--

DROP TABLE IF EXISTS `ACT_EVT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_EVT_LOG`
--

LOCK TABLES `ACT_EVT_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_EVT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_EVT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('17502',1,'test1.bpmn20.xml','17501',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <userTask id=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" name=\"ä¸»ç®¡å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" sourceRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"609.0\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"795.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"960.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"831.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" id=\"BPMNShape_sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"74.99831278471224\" y=\"52.22497469177069\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"54.25\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"629.5\" y=\"71.5\"/>\n        <omgdi:waypoint x=\"629.5\" y=\"116.92970092290889\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"648.5441860465116\" y=\"52.455813953488374\"/>\n        <omgdi:waypoint x=\"795.0\" y=\"52.11600928074246\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" id=\"BPMNEdge_sid-AAEE5013-74E6-4835-933E-07312A14B86B\">\n        <omgdi:waypoint x=\"310.0\" y=\"55.0\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"55.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"845.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"845.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" id=\"BPMNEdge_sid-911C3373-8840-490E-81A1-DCCE9D636DCA\">\n        <omgdi:waypoint x=\"895.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"960.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" id=\"BPMNEdge_sid-5F14346F-77BF-4773-8014-AA2502CA4612\">\n        <omgdi:waypoint x=\"520.0\" y=\"54.056603773584904\"/>\n        <omgdi:waypoint x=\"609.3703703703703\" y=\"52.37037037037037\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('17503',1,'test1.test_process.png','17501',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\æ\0\0\0­\0\0\0=e\0\0&*IDATx\Ú\í\Ý	tT\Õ\Çñ\ÔZK­µÖ¶Zk-µVk­µ\ÚªµV±\ÖÖ¥V«Ái&‰¢¬ÅºŠ\Ð\0‚AP±ÑŠ©+HÅ¥‚Š\Ò([ƒ;Š  !‚! k2·÷÷ú^\ÎËIf’™\Éd\æû9\çžÌ–dò2ÿ{\ßÿ\Ýÿ»/+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cL·U«VU¼ò\Ê+f\îÜ¹fö\ìÙ´$·9sæ˜—^z)d\Û$>‘\0\0\0\0a””/X°ÀTWW›;w\Ò:©mÜ¸Ñ”••…l’~+ŸJ\0\0\0\0\È š)\')O\ä|ö\ì\Ù;ùTH[”iQ¦\âˆ8€=©?\')N¦¾žO%€´E™eZ Žˆ#\0Ø“AúVs\0H\nÊ´(\ÓqD@ûó­uŸ˜Uo<h–\Í\í4\Ý\Öcô\É$\æ\05Ê´t@G\0Ð¾Ä¼¾¶Ò¼ûü³ä¹¡Íš\Ósô\Éô\í\0×£Á4G\Ä\0úö\æ­b\Ù3{$\å^[·l&}2};\0\Ä7¡ L‹A\Äq€¾½y{þ-s=GŸL\ß\0qt(\Ób\ÐqD oß³½;{d\Ä\Ä\\\Ï\Ñ\'Ó·@\ÜÊ´t@G\0\è\ÛI\Ì\é\Û Ê´t@G\0\è\Û÷l:-)Rß®\ç\è“\é\Û€£Á: Žˆ#\0H`ß¾¢ü®ˆ}»ž£O¦o\0\nG\Ä\0$°o¯©\\j\Þ}¡p\Ï~\Ý>¦\ç\è“\é\Û nƒeZ: Žˆ#\0ô\í-·\ÕoNÙ£_\×cô\Çô\í\0\×A‡2-G\Ä\0úöÚŽf\Å\ÂI{ö\ëö1=GŸL\ß\0qt(\Ób\ÐqD o\ßó2˜\Ë\Ë\ïŒx\ÐU\Ïq9Lúv\0ˆ\ß\Ñ`Ê´t@G\0\èÛ›f\É?Y1Ï¼SzcÄ¤\Ükz^\Ë\ì9};\0t<¡ L‹A\Äq€¾½\ÍYrf\Ï\é\Û !	eZ: Žˆ#$Aw6ºB\ß\Í,yk³\çô\Ñô\í\0[BA™ƒˆ#\â\É1\Ü6\ã~RºoooR\î5úhúv\0ˆzÐ¡L‹A\Äq„$¹Ö¶m‹Ü¯£\Ø$Hùƒ®4úv\0HÆ C™ƒˆ#\âILÊ½d\\3\æ$\ç 1§Ñ·`Ð¡L‹A\Äq„\ä\'\åm=˜Ó·Ó·`Ð¡1\è€8\"Ž\'\Ã\ÛH¾½\ç9\çô\í4úvtc\ÌK—.:eÊ”ºq\ãÆ…®º\ê*Ó»woó\ç?ÿ\Ù\ä\å\å™Aƒ™aÃ†\í¾\å–[V?þ,¶tt@Ñˆ£.–”·•t3súv\Z}{;\ä\æ\æö\ÛÜ±\"\'\'g—ý\ZR\é¶Ý¶­·m¦^\Ç\Öj%!ò\É\'?ºé¦›\Ì5\×\\cJJJÌ«¯¾j*++\Íö\íÛ\èkuuµyë­·\Ì\äÉ“\Í\ÕW_m¼»ÿþ±Á Ã \âˆF¥°k³b›	õõ\0};}{Æ²Ix‘M¸k\ìW\ãK\Ä[möµµÁ`p[\Ï\Ç&\àŽ3\Æ:\ÔIº\Z\ZL´/^l®¿þz3`À€\Ù\Ù\Ùg°5Á Ã \âˆ8BŠ&\å£\Úù}$\ç o§o§oo9!?Å¶\Ñ&\ã\Ú\æŒ\Ï#m^\Ý\íé§Ÿ®8p ™9sfL	y¸\Ò\ÒRÓ§O\Ã\ì9tt@GHƒ¤<^\ßÐ·Ó·§¥@ Pý¥\ê&77\×™yóæ™µk×š-[¶8¹\âgŸ}\æTb———›‰\'šüüüð\ä<”±³\çJ\Ê\çÏŸ¿õ\Ê+¯4Ë—/7ñ°f\Í\Z£$¿oß¾ñQƒƒˆ#\â¬­…Þ’ýs\0úvúötI\ÊGù\ËÖ•O:\Õ9\í9\Zµµµ\Î\ëõ}a\å\í“3ncj¦\\Iy´/Zúyýúõq¾\0tt@GH¤<^e\èÌœƒ¾¾ÿOÊ‹ýIyAA3;\Þú>N\íO\Î3*\Ô9\åšÙŽ\×LyK3\çùùùJ\Î\Ï\á£G\Ä’,ü\Üð½l»\×ý\Z‹ð\ï\ãœsÐ·Ó·g4S\î/_/,,l*Wo/•¹;6¼¬=ýóH­¾>zôh\çœòDš5kV(77·ž/tt@Gè„¤|”/¹þP»@\î\×h“óH\ßGrúvúöLN\Ìkü3\åM\Êý\Éy\Ø\Ìù\æ´ß˜Ó§O_­?z×®]&\Ñ\r\Z\ÔHI;tt@Gè¤¤\\\îu“kCr\îOÊ½V\â{žs\ÎA\ßNßž‰Iy‘ÿœòö–¯·V\Ö\î?\ç<­óHÍ–\ë:\åº$Z2,Y²\Ä0kG\Ä’ R²\ÜR’\ÝZr\í\ë9\çô\íô\íMzö\ì\Ù-\Ý?“ºN¹—4k\á¶D˜6mZfÌš/]ºtª|\ë\Èe\Ñbuù\å—7\ê\\ºW0\èP€8\"Ž\ÉE]tœ\Ý	›c÷\î@R>¼ƒ\Év¬I<e\íhWrc?\çƒ\è\ÛÓ£o·\é\Îq•••õºØˆ#ž\éŠ	z4Ÿ\É\Ü\Ü\ÜÞ‚ošÕ®©©IH\î¨\Õ\Úý—RK\Û<rÊ”)u÷\ÝwŸI¦‰\'n³u&\Ýpf‰¶Sb\Ð!¡\0‰9q\ÑÎ—v\Â@È¶RÛŽŠò[£MŽ\ÛJºcM\Êý¿¿1‹™sDŸyIGýœ÷¥o\ïº}{EE\Å\Ü\íÛ·7\å=;v\ìÐŒ\ï®+®¸\âütûL\Ú\Ç÷^7~üøD\çþYóô\Ì#Çzõ\ÕW“š˜/\\¸p·Ý Ut\Ã7\èlV\0÷\î\Ýû\0\n\n˜Gˆ\"1?\Ø¹·½~ñ\Å_ERmR)ùÞ»I¹‡s\ÎÑž$\Èk[š­¤oOÝ¾½¾¾¾Wuuõ\îHùÏªU«LQQ\Ñ{m\íw¥Ï¤}¬\Â{¾¬¬,¡ù£ª|\ï%=óÈ«®º\Ê|ò\É\'IMÌ«ªª\Z\ím Î¸Ag·[~¢ÿÿ#‘:&\n´\ZG”;G™ž°x\í\ãôöž\ã\ÝRr¾³IyG\ßøœ7\ÍVúû|úö\Ô\ëÛµ^\×ÚµkW566¶™…B!SZZ\Z*((ŸIûu—÷x¼}WYY\é\é™G\Ú\ä\Èø\Ë-’A¿O•n8\ãf>\Z\Ã{·Vr$¡ ¡@»J\Ê‰£LOXšfq\ÜX\è\èuK\ÉyG’òð\äœs\Î\Ñ\á\Ïy\"úv\í—û¿FjŸ~ú©Y´h‘s	«\Ö^§óŒÙŸ*|þù\ç#>¿m\Û6\çÐ›6mjzlÍš5fñ\â\Åq/¯¿þº©««Åš\é½Mš4iS§\ç¤\äg\Ò?^—Hk\í\Òiþß—¶Agÿ\ç\êü1]8\Þ6g6Ý]UÓ‘˜¶m·M\ç¦oµ­^e\Ñ6©«uwNõÁ\Ø`\Û\'öö:ûu­m«\íó+\í\×m{Ï¶w\ís‹\í×·\ì\ã¯Ù¯m[`\Û|ûølûu–}ü\Ûf¸\çK<boO¶_\ï³÷\ï±_\ï¼ø\â‹o·_\Ç\Ù\Ç\ÇƒÁB{ÿ{{ˆ}þJ{{ }\îr{?\Ï\Þ\ïeŸ?ß¶s²³³\Ï\Ð9rZA‹\Ø\Øvt~~þ\á^x\á!½zõ:°ÿþûŽ9r\ïtô?NBABv\Å\åŽ\ÄQB\Ø1jU6]r\É%‡j\ç\Ñ~\ÖN\È\Ë\Ë;\Ù~\Þ\Î\Ô—ó—\éó§±Pý¸}ü&\Û&hÌ´Ý«q\Ô\ÞTc«m\Ïi¼µ__´Ï¿b¿¾©qÙ¶eöör\Û4n«,r½}¬\Ú]\é·.ŠCo?B\ÛxQÿl\Ç\á3\å;\Ý\Ç;bQ´\ÖZ‹w\ß~ÿý÷›¯}\íkNÒ­\Ïûœ9s\"¾ö²\Ë.3_ý\êW\Í3\Ï<\ã¼N\í¥—^\Ú#\Éÿ\Îw¾c&Ož\ì\Ü8p`\Ó{·û¾\æñ\Çw¿ë®»\ÌYge\Î9\çs\Æg8{w\Üq\æ§?ýiSûñl>üðC§\Ý~û\í\Î9\Æjgžy¦\éÖ­›¹\í¶Ûš\Óó|ðA\Ó{\Ðß¢\ïó\Þ×¸q\ãÌ¯ý\ë¸n;\Í\à;“µg13}o:}6“?¦\åNÞ¥—^šôómÛ¶93§\Zô\Ï>û\ìým0\äüG\Øö\rþööI6\Ù=U;\0öþ¹v`¿P{\0öv¾Žº;\×\Ø\×\\kŸ»\Ñ>>Ò¶›µC`Ÿho\ße_Wbo?`o?loO³·Ÿ°·Ÿ²\ßó¬ýú¼Vzµ­Ì¶—µ“`_ó†m\Z<—hGÁ¶\ì\í¶}d\Û\Zw‡¡\Ò>^¥{ÿS{“v\ì\í\Í:``ÿL\ìWL\Ø\é–x\è\0CƒfŒ\ÝYc\ï D¤w\È=Pá½¾Á\ÞwR\Øû;ÝŸ­ƒú][\íc[Ü½½§j½G½W÷=l\ï¯\Òß¢¿\ÉýÛ–\Ú\ç\Þ\Öß¬¿Ý¶rwgi®¶¶‘mO\Û\ÛOj§J\ÛP\ÛR;Zö{\î¶_\ïpw¾n¶÷Gi‡LÿýOô¿±÷û\Ùû—\ê¦ÿþ‡Q\ìT\éï¹™„‚„+-#1O\Í8²c\Þ~\Z\ïtp\Ööw\Ç\ÚÿÙ‰övš\â\Ú\Û\Ù\Z\ß\Ôw\Úv•m\×i\\SU‘\Æ4]·\Õíƒ§j,Ódõ\Õö\ç\Ì\Ó¦\ÎnŸþŽúy÷À´úþuî˜¥8\Z#4Vmµ÷·¹½w¹\ãK£»ÀZ(Âófc‘o\Ú\êþ\ÌM\îŒ^•{€|m+\Ý1G\ïi‘m¯\ê½\ê=k!71\î\ß2\ÕÞ¾\ß[&\êov~_\ën‹HŸy¯\Ùv˜rgµ½\n;3\æè’“\Ú\ÏòÐwß®Dù ƒrf;õY\ã7öx\Í\æÍ›\Í_þò\çù\îÝ»›_ý\êWN;\à€ÌhÖ¯_\ßô\Ú\éÓ§;)\Ñ\×ý	&˜‘#Gšë®»\Î\ì³\Ï>\æšk®q_°`\Ñ\é´|°ù×¿þe~û\Ûßš!C†˜«¯¾Úœt\ÒI\æ¹\çžs~\ßò\å\Ë\Í/¼\à|¯VÿV\ÓA¸?ü\á\Þ\ê\ÜNû\â¿hþû\ßÿšÕ«W;¯\×÷\ê\Ò]¿ø\Å/\ÌW¾ò\'‘ÿü\ç?oö\ß³\ß~û™¾}û\Æeû=õ\ÔS\Æö?.\\\ØmTWW·\Æ~&×§ò\ê\â\Ñ|&ýù3\æqð×¿þ5\é\ç˜\Û\0\Þ\É9\æ{\îh\ÇB³\èšM\ïÓ§Ow\ÍPh–]³íš¥°;)§\Û\ç\Ï\ÒL…f\å\í6º³4k\ï\ÎXhgn„f-4»¯Y~û\\±v\ê4û\ïV<¢û\Ütw\çn–f1\Ü¼—TM\à\î\ä½iok6\ã·\ê@\Õ+5«\á\íð©JA0¸\å,5nƒy\Û\â\î°ms«vt\Ö\Ñ\àhš-*¡•3cù¾\r68ï·¾¾¾\Í\×VWW·ùZujþûo¾ùf‹ƒ$‰9;oQ\îK\Ó\"0­•;ê€°f]ü¥†úž•+Wv™\ÆXZøÁW_u˜’Ën?©-¶ÕºYU	¶^U`\îÁ\Õ\Ý«‹Ýƒª\ê«_Tÿ\íL\î\ÎNOÖi·\ïŸ\à\Îb\ßhŸ\ìÔ¾ÌŽ+{ÿ<ü\ÖøbŸ?¾w\ï\ÞG\ê ¹f\ÉS©’\Ë\ÝV\Í\èoŒ°N	\ç˜#]úöf	y¼ºžz\ê©fÖ¬Y\æ‰\'žh–˜k¿CÉ¦\íœ\×ifW3×š0`€3»®X³Õš=Ÿ;wn³}˜Ÿý\ìg\æ\æ›ovfÊ•¤{ý²iýÿ~Ž~Ï‘G\é\Ü\Ö,ø‰\'žhzô\èa¾ý\ío\Û?9\ïGc\ÂÒ¥K\Ý/vnô\ÑG\Î \ç\Þz\ë-\ç¾\ï×¯Ÿ\Ó\Ï\ë@\ÃøC\çù£>Ú¼÷\Þ{\Î~ŒûG}\ÔüóŸÿt~žb‹\ç>’(Ž\Z5ªÁn¯\ÆV\Î/\ßQRR¢§»Z:•³+~&9\Ç<\ÎFŒ±+Ù«²Û€ªfUvßµk5\ÓÞ™3}*\Å\Ú{ï½\Ûû\Ûßœâ¨£Žjj½zõj:o\ê\ã?vf©•––:ÿŠ+šS\Ç\Ô\ÒùU¯½öšóÚªªªßƒ‹\Ã?Ü¼üòËºæ¥±¼s¤Wƒ”nëˆ³¡NN(hZ\îK\ÓL\È!‡b¾ù\Ío:Ÿ\å–F©„Oñ 7Íš\èó¯§\ßÿþ÷Î¬‰\Ú\ÓO?²%Œ\àJ\êØ±\Û÷\Ù.Ó\ë8\ÏP³*;Ri©^I[¤K\ÌÆ«oWYºÖ™ú\Ïþ³Gb®>ù‚.hz\í»\ï¾\ë\à|ö\Ùgrs/4\ë¬}MRx\å\é^B¬¤ýw\Þ1º$³ò\ï~÷»f\ß}÷5úÓŸœ}š\éþú×¿n\î¼óN§o\×lùW\\\á\ìûÌ˜1£)1\×\ÏÖ˜ð¥/}©il\Ñs\ßúÖ·œû\Zô¼÷~UF¯\çÇŽk\n\n\n\Ì7¾ñ\r\'q\×A[Íž/[¶,!}»®\"‘——·ø\É\'Ÿl_\ÎþË‚Á\àUEÑ‡u™\Ï$«²\ÇÙ„	>Löu\Ìm‚Q\Íu\Ì3‹f6ZHÖ§Â¹±JªKJJœ¤@	ºŽ«D\ë\ïÿ»\Ó\Î=÷\\§\ÄJ¯U¬dµ\\\æØ¬\é\ç\éõü\ã\Ío~ó§i \Ñs§vZ\Óc:\ß\Ê{š\á;ýôÓR%_\ZLN8\ásüñ\Ç;ŽÊ¿tä—„‚·\Î(wŒfñ -\n¤8µ%K–˜n¸Á9¨¥û\ÚAóª?4K£,%\í*-\ÔÁ°\ïÿûÎŽ\à\É\'Ÿ\ìÌ¸\èz¨úR¹„‘8J\Úg~§[\n\Ë\"I\Ñ\ÎT\'\ê:\æùY\\\Ç±}\Î[œ!O\Ô>’f\Ê53ž˜«Ÿ\Ö\äÄ¤I“šöM´/²\×^{™Ÿü\ä\'NB¯£:7]û8*[ÿ\Ü\ç>\ç$eš¸\Ð÷©ÏµÉ©Y·nùÑ~\ä\ìK\é\çkv[}¶\ÄÎŸ?\ßI\Òõý·\Þz«sž¹ jÿ\ë°\Ã3:\Õ6\Ë-e\×û\Ðx¢·:p ™x=§ƒº¯}4=\ïýmgŸ}¶óü÷¾÷=3o\Þ<§4^?[tÀ÷\á‡ns»Žô\í:-\É\î\Ãm_µjUƒ\ë†\r¶\Ö]+?\Ý>“\\\Ç<\Îl°œ®rö†††¤%\æÁ`pW*ŸSø\Óÿ\ÛW†øAkÿÿd\'ÿø\Ç?œ-\r,Gq„“˜«Wr¬¦ÀK\Ì\ë\êêœ’t¾\ä’KœD^³\ã:²«\ÄY·õ¼^§\×kpQðÀ8³\Þ\Z(4h\é¾ý¾ðó¸TN¯„E‹¢\è³šnŸw\Þy\Ìô!\é\åŽ\Ñ6\í¼\éó­8òZøý/|\á\Îkµ³¦øQ,(¶¼s5k¢“‹.º\È\Ü}÷\Ý\ÎM*—0G\ÉÑÙ¥¶f¬£MºcMÎ½ƒEü÷oñ\ê\ÛU¬Ï²*Šü‰¹úaõ™ê§½\×\ê1\í+i&ZûHJÒ•˜\ëþC=\ä<§×©RI}°y›Œ:	´q%\à^S2¯òøðRöiÓ¦9‰—J\Ø5\Ã~\Çw8\ÕP^•¡o%\Ö\Ú?\Ó\Âpz¯ª(\Ô}=\î%\æ*­?\æ˜cœƒú\Ûôw\èý\ëõ\Zt[3\îªnLdß®1Y‹^º‘g´uÀ¥«\Ò\é¶\Þþˆ½\í\ì\'‚>3yyyþj\Ûô\Í#¼K;9I*c\×ùÉ›\éZ3‹¸+¢	¤\Î(ÁUyŒf\Ýtûò\Ë/wfó´¨‰Ú—¿üec;\Ôf\ç°\ê5‡zh\ÓÀ¥@¥RJ0üe»Jª•€k0¸ñ\ÆAƒ\î\ëü-/1¿é¦›œß¥\Ù=›¥òy\rn:—KM·\Õü¥Z$Ÿ˜\'¥\Ü1–¦\Øð—³\ëó®\Ó;¼Ç¼\n•\ë9•KFjŠAÍ¨¤r	#q\Ô%Dš95ÙŽöõ$\å\è‰¹šf\ËU]\äO\ÌU\Ñô\ïÿ»\Ù\ë´o£ƒ¨j\êG\Õ{÷\Õ\Çþ\îw¿s^÷\Ê+¯8‰¶\ïß¿¿3¨\ÒPý±~ö=÷\Üã”»{ûIJ\ÌÕ—«¯V\å”w%õzL·\Ï?ÿ|£\Óm½\Ä\\U…Z	^ôó´@œ\î«\ÑKÌµ¥™[=¯Ê­_þò—\Î\ä‹&P¦L™\â¼Í´\'«oO×„<l¿¤\Æ\Û7\Ñ\ç)t\àÆ·ÿ“\ÞydŸ>}n×ŽMf\ÍC6Ù¦…\È\èZ‘J‰¹:w\Ö\ÑW•\\=ºY+,,4/¾ø¢3;§òX®ó 4\àx—\ÑL\ß~ðgPzû\í·›s\r2š\í\ÖÀ¡B—\Ñ}ñõó÷\ß\ß<ò\È#\Îó:Š«u%\ZØ¼¦y’CB‘±‰yR\Ëci7nt>¿\Î\Ânú<k†Z÷Uf\î­Ò«™n-<¤™x\ÒN˜\×t€J¾#º>l*—0G]†f\Î\Ã\Ë\Ê\ïÍŠ½<½¥\ä¼$\ì÷pN9º\Ô>’J\Î\Ã\Ï1o\éuª\æSÉ¹ö•Ô—zk_F‰»ÿµ\ê\ï\ÕW{—^ó\Æú¯“®ƒ:UOW\r\Z\ä<U\â¬Ry=®\ÛJÀõ³ôú¡C‡:+¸«\ÏW¹»~žu\Ý\×û\×ó\ÞB»š]\ÕóªŽz\ì±ÇœIU«rK§KyUô\íñ¡Iÿ¬y¼\Ó\Ï\Ó\Ïõ~GF\ä‘Ø® H$Ï®£™pô]\'1¿\å–[œ\\\ç j \Ð\0¡#·\êø5K­Ûƒv:_uöº­Rv•\á\êÈ«\×N¿\Î+W9¯Ž\ÖzGƒ•˜«$W¥=*{\×\ï\Ñ\0¡û*\Ùò—²+\é\×ó\Z0Tv\ì±Çšk¯½\Öi\êˆ\Â\Ë\ÞI(j‰¹>\ÓYQ¬½\à5S®*UŒx\í”SNqsÿ\ëRµ„‘8\êrÉ¹A8’Ë‚n‘¾K¢¡\Ëô\í>ø ³Îfº5y \Òuõ\Åú\\+q\Õ\ãz^¯Sr«hõ­:ªý$\àT¯\Å;•\ìz«¯kGý¯~Ž\Î_\×†ö¡4¹ \Çt[š)\×Ìªf\ÒUR¯…tu\ê\àõ\×_ïœº§I\Ý\Öcú]ú\Ù:P\ë]3]\ë–\è\çy%ñš8ñ\äzM\Ïk\Ñ]]®MŽ\Z;´\íôw\êo\Ñz$ô\íqM\Îk½\ÄYñºtš¤\ë3\ãŸ-Ïˆ<R%\Æ\Ú\Ò\"‰°t\é\ÒOtMn]¯•/R)¡\Ðg^¥¼Rv-.¥A« «¤\\3\á\Z|\Â/¥¦ûšýÖ ¤r«–~¶Ê§ZKT´\àUxb®\ä^ƒ‘]:DM‹§˜#\ÕsTÒ¬¹v–\ÜÏ³S§ûú\\‡_\ÐK\ÌÇŒ\ÓÔ”œ«\Ý?³’ª%Œ\ÄQ—^Ö®¤º$+öK …_G¯Ÿ$µo\×Bm\ê+½+[´\Ôô¼· ›’e%¸^ÕžÊŠµx­%\ïür\ïsÍ¦«JÊ»\ZNMRÅŸ×´O\å%ò^\Ó>˜÷¿\Î{­*\Ãß¿\Z\ÕAYÿõ\Ó\Ã\Ç\"U_©jJ\ZtPx\ëÖ­M•>¼Ù¬?}{|òHÿ¥-Ui\Ú\Ñ\ä\\I¹öü—\ZÍ¨<2//\ïn-\ê 2x²º\Ùþ\ÃvSÂŽTM(¼sÌµøšVnÖ€£Y\ëŸÿü\ç\ÎùPZ€ÄŸ˜\ë\\Z\r\\ºH÷\îÝþ¢¢¢=-p¥G%¼:¢«„A–\îk`ò\Ïjux=¯•Ióóó\Ä\\‰…šŽî’˜#\Õ\ã(ü’iYaç˜‡7%\æ:O\\36^S¥HV\ØeSµ„‘8J‹ä¼£Z*“Ò¶o§Ñ·GŠý‹\Ójæ¼½e\íú¾°™r“‘y¤M\Î\è×¯_(^3\ç\îLùnû\Ï*\å#‹Tt´p›Ê©”˜kõg\ÍP«ŒK\×\Û\ÔyN*\Õ5—u9&\'¥|«\ÄY¥X\Þe\Ôt\É%õ\Ù\Ù\Ù-\Î\Ê\é$Y¾Ò«ð\æ\Íôi\ÕI•¯\ë\à€fÑ•\Ø\ëÈ±f\ïtªq¤X\ÐùÝªQ\Ó9\äú<û\Óm/f\Ôô˜D\éŠ^\Ó@¬\ïó\ÎGO\åF\â(\ã“óx\'ù\0‰9‰y—f\èûüÉ´\Î\r×¸¯1;\Ú\Õ\×U‘\á?§Ü½¢S\æ\æ‘:\âa“ƒ\ÐSO=\êÀ‚p¡\Ûn»M«p«¬\á>>ªH\ÕAG3\×:—\\Ž¨#\Ðe—T\ê¤\ÒW]\êL	²Ê¸4û¦2-¯,*<ÁV©®\Êl•\Ô+yÿ=Z­TÉ¼&\Ð\ßô{½¤E¥;:\'K·µŠ©œÓ¢+:H\Õ8RY¹Nÿð—¥‡7]\Ðÿ¾tÚˆ.\ã/Ÿ\Ôb‹:ð©D1•J‰£.­£\åç”¯ƒÄœF\ß!´-ž {§Gh6\Ü+sW¹º\ÖP\åª&Át%£°KÂ†\È#³þ®@0\Ü4p\àÀF­0û!ý\Ø&ö[u‚>ç”ƒA‡A\ÄqD¥pr\ëŒ7½¾F\ß\ÞFé¿ŒZ;ydG=nU‚Þ»w\ï\Æq\ã\Æ\íxù\å—Ö­[× ™Ù¶m[\ãúõ\ëwÎ™3g\ÃÈ‘#7\Ú\×\îÖ†\Ô\Ñ\rV_ƒƒˆ#\Zq”\Âb-G§|ô\í4úöò\Èv$\è\ä‘m\É\Í\Íí‘““3\Ãn¨\n\Ûv‡mÀÛªl›©#$l-0\è0\è€8¢Gi–œç»¯+b“¾F\ßN	0\è\Ðt@Gˆ¯¶\Î÷V_\')};¾\0ƒA\Äq„‰4sNù:\è\Ûiô\í\0th: Žˆ#tRrNRúv\Z};\0\Zƒˆ#\â”œ/\")};¾\0ƒA\Äq„\Î1\\‹eqI4Ð·\Ó\è\Û0\è\Ðt@G\ènbÐ·\Ó\è\Û0\è\Ðt@G 1\è\Û\é\Û€A‡A\Ä8\"1\è\Ûiô\í\0th: Žˆ#˜ƒ¾>•¾\0tt@Ñˆ#s€¾F\ß€A‡Æ \âˆ8‰9\è\Ûiô\í\0À Ã \âˆF‘˜ô\íô\í\0À Cc\ÐqD\Äô\í4úv\0`\Ða\ÐqD#ŽH\Ìúvúv\0`Ð¡1\è€8\"Ž@búv\Z};\00\è0\è€8¢G$\æ\0};};\00\è\Ðtˆ#>¿\ÄH\ÌA\ßN£o\0G4\âˆ\Ä o§o\0\ZƒqD#Ž@búv\Z};\00\è0\è€8\"Ž@bÐ·Ó·\0ƒA‡8¢G 1};¾\0tt@G 1b2w\î\\úTúv\0 ¡`\ÐqD#ŽHÌÎ²`Á‚\Æ\ê\êjú\Õh\ëÖ­û\Øö\í;ùT ¡ ‘P€8\"Ž@bŽ2oÞ¼›\Ë\Ê\ÊB6l\è\Ò}beee—O\Ê\çÌ™³Û¶[ùTH[”i‘P€8\"Ž@b´\Ì&ƒ£lŸ²UýJWl¯¿þº)..63f\Ì0]õo\ÐL9I9€´G™eZ Žˆ#˜\é\ÇsÀ¦M›Bµµµ¦ÿþ\Ø\"\0\ÂÒ¥L+’	Ê´ˆ#\ZqDb ^Ö®]»Ê¸.\\Ø““S\ÄV€\Ö\ÕË´Ò¤Q¦EÑˆ#s\0qQ__ß«±±\Ñø;¶¡OŸ>\Ý\Ù:\0\0\0\0HÌ«ªª\Úm\Â\Ô\Õ\Õ5\æ\å\å-f\ë\0\0\0\0 1¨¢¢b®‰`úô\é6\Þò\ÙJ\0\0\0\0HÌ°¹÷qÛ·o”—›P(d\n\n\n¶÷\ìÙ³[\0\0\0\0‰9g•••õ¦\r«W¯\ÖBp3\ØZ\0\0\0\0HÌ8+//o+/7;v\ì¨U\Ìõ\î\Ýû\0¶\0\0\0\0s Ž\n³‰w«‰ù°a\Ã\Ö2c\0\0\0€\ÄHG}tg¤¤|\åÊ•\Ël¼\ÕsŽ9\0\0\0\0s A²³³Ï°	xK¿\íƒ;X•\0\0\0\0‰9`\ãÇ_¢\Øý\î¿ÿþ\å@`[\0\0\0\0‰9`*U/--mô’òººº5999»úô\éÓ­\0\0\0€\ÄH‚+¯¼rÈ¦M›Lmm­\éß¿MÌ‹\Ø*\0\0\0\0HÌ$*))\ÙX\\\\llŒ­gk\0\0\0\0 1’L¥\ëŠ/-\Ç\Ö\0\0\0\0@b_\0\0\0\0H\0\â\0\0\0\0H\0\â\0\0\0\0‰@|\0\0\0\0‰@|\0\0\0 q\0ˆ/\0\0\0\0$\0ˆ/\0\0\0\0$\0ñ\0\0\0€\Ä\0ñ\0\0\0€\Ä ¾\0\0\0\08\0 ¾\0\0\0\08\0\Ä\0\0\0\0\0\Ä\0\0\0\0€ø\0\0\0@\â\0€ø\0\0\0@\â\0_\0\0\0\0ºN’P¥D¡¶•-_\0\0\0\0“8ä·•8Ql)€ø\0\0\0¸\äac+‰C}Ïž=»±•\0\â\0\0\0@\â‡ˆ³z999El!€ø\0\0\0øä¡¥sa·2›_\0\0\0\0’“8\äs\î+@|\0\0\0\è\Ü\äa=³y\0ñ\0\0\0 “¾¾\Äa8[ ¾\0\0\0\0$™w.,³y\0ñ\0\0\0 	rss{\Çm²P‘““³+\ì<\Ø\Ýnù\íL½Ž­_\0\0\0\0\âD—i²	AýjZ¹\Ærø¥jƒÁ\à$¶@|\0\0\0h\ÂpŠm£M\"´\Í\Ù\Ù\Ùg°5\â\0\0\0@@q0ù“€\Ü\Ü\\STTd\æÍ›gÖ®]k¶l\Ùb\ä³\Ï>3•••¦¼¼\ÜLœ8\Ñ\ä\ç\ç‡\'!f÷\0\â\0\0\0@ôI\Ã(Y­†©S§š\ê\êj\Ú\ÚZ\çõú¾°ò\Û\Él]_\Ä\0\0\0€Ö“†b\ÒPPP\à\ÌÞµ‡¾o\èÐ¡Í’fö@|_\0\0\0\0\"\Ð9¯þò\Ú\Â\ÂÂ¦r\ÚöR\îØ±c\Ã\Ën\Ïakƒø\"¾\0\0\0\0\ì™8\Ôøgò:š4ø“‡°™½\Ílm_\Ä\0\0\0€\æIC‘ÿœ\×ö–×¶Vv\ë?\'–’[_\Ä\0\0\0\0]G\ÙÛ©\×\ÂR‰0m\Ú4fõ@|_\0\0\0\0\Â\å\æ\æöð¤Ò¬[MMMB­&\í¿Ô“Î¹e\ëƒø\"¾\0\0\0€Œ÷v\æÇoI\×aö\Í\ê\Íd\ëƒø\"¾\0\0\0€Œgw\à+¼ù²²²„&\å\å\åþÄ¡Š­\â‹ø\0\0\02^NN\Î.og>Þ‹R…«¬¬ô\'\rl}_\Ä\0\0\0ñt\ícog>^—pj\í\ÒN¾\ÄÁ°õA|_\0\0\0\0‰ƒoG>H@|_\0\0\0\0š\'\Ì\è\Ä\0\0\0€\Î\Â9°\0ñ\0\0\0 ±j4@|\0\0\0\èD\\g ¾\0\0\0\0t¢\Ü\Ü\Ü\ÞÎ¼½mjjj’4\Ô\ÖÖš¼¼¼¦\Ä!\'\'\ç¶>ˆ/\â\0\0\0@–Sn[\ã\í\ÐO:5!‰Ã´i\Óü³y›\Ù\ê ¾ˆ/\0\0\0\0®œœœ\"ÿ¬^¼©\Ò\Ï\Ó\Ïõ~G0œ\ÄVñE|\0\0\0hž<\Ôz;öq»´“.\á4dÈf³y={ö\ì\ÆñE|\0\0\0hž8œbw\ê½ü\Â\Â\Â\'J\ZÆŒ\ãO\ZBÁ`ð¶6ˆ/\â\0\0\0@@±o\'ß™\ÙkoÙ­¾/l&[_\Ä\0\0\0€¶\Øüûü;û:wUVi\Õ\çhW‡\ÖBTþs^\ÕlRR\Ê\ÖñE|\0\0\0ˆ‚föl…\'ºsYY™3[\ç•áªœ¶²²Ò”——›\â\âbsé¥—6KT^«d„­\n_\0\0\0\0b\àž[–\Ä\Ú6s\Î+@|\0\0\0\è€@ pk;ˆÍš\Åcuh€ø\0\0\0\'¹¹¹=rrrfØ„ Â¶\Ýa‰BƒmU¶\Í\ÔL [ ¾\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\É÷?$\ÌÍ’\Ú\Ð.\0\0\0\0IEND®B`‚',1),('2',12,'source',NULL,_binary '{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"test_process\",\"name\":\"\",\"documentation\":\"miaoshu\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¼€å§‹\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\"}],\"bounds\":{\"lowerRight\":{\"x\":75,\"y\":67},\"upperLeft\":{\"x\":45,\"y\":37}},\"dockers\":[]},{\"resourceId\":\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\",\"properties\":{\"overrideid\":\"\",\"name\":\"æäº¤ç”³è¯·\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":null,\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":false,\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${agent}\",\"candidateGroups\":[{\"value\":\"canWrite\",\"$$hashKey\":\"0B5\"}]}},\"formkeydefinition\":\"${formId}\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":null,\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\"}],\"bounds\":{\"lowerRight\":{\"x\":310,\"y\":95},\"upperLeft\":{\"x\":210,\"y\":15}},\"dockers\":[]},{\"resourceId\":\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"}],\"bounds\":{\"lowerRight\":{\"x\":209.7813624810192,\"y\":54.24672043721529},\"upperLeft\":{\"x\":75.06238751898081,\"y\":52.22593581278471}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"}},{\"resourceId\":\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\"},{\"resourceId\":\"sid-ED19277B-278A-406C-9A55-548256184583\"}],\"bounds\":{\"lowerRight\":{\"x\":649,\"y\":72},\"upperLeft\":{\"x\":609,\"y\":32}},\"dockers\":[]},{\"resourceId\":\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\",\"properties\":{\"overrideid\":\"\",\"name\":\"ä¸šåŠ¡ç»ç†å®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${agent}\"}},\"formkeydefinition\":\"${formId}\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\"},{\"resourceId\":\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\"}],\"bounds\":{\"lowerRight\":{\"x\":895,\"y\":92},\"upperLeft\":{\"x\":795,\"y\":12}},\"dockers\":[]},{\"resourceId\":\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":988,\"y\":66},\"upperLeft\":{\"x\":960,\"y\":38}},\"dockers\":[]},{\"resourceId\":\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":859,\"y\":163},\"upperLeft\":{\"x\":831,\"y\":135}},\"dockers\":[]},{\"resourceId\":\"sid-976F7F72-C689-48FE-997A-D82A66F57287\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":643,\"y\":163},\"upperLeft\":{\"x\":615,\"y\":135}},\"dockers\":[]},{\"resourceId\":\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\",\"properties\":{\"overrideid\":\"\",\"name\":\"ä¸»ç®¡å®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${agent}\",\"candidateGroups\":[{\"value\":\"canAudit\",\"$$hashKey\":\"0B5\"}]}},\"formkeydefinition\":\"${formId}\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":95},\"upperLeft\":{\"x\":420,\"y\":15}},\"dockers\":[]},{\"resourceId\":\"sid-ED19277B-278A-406C-9A55-548256184583\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¤±è´¥\",\"documentation\":\"\",\"conditionsequenceflow\":\"${flag==\'false\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-976F7F72-C689-48FE-997A-D82A66F57287\"}],\"bounds\":{\"lowerRight\":{\"x\":629.5,\"y\":131.4297009229089},\"upperLeft\":{\"x\":629.5,\"y\":72.615786942267}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":14.5,\"y\":-3.570299077091107}],\"target\":{\"resourceId\":\"sid-976F7F72-C689-48FE-997A-D82A66F57287\"}},{\"resourceId\":\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¤±è´¥\",\"documentation\":\"\",\"conditionsequenceflow\":\"${flag==\'false\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\"}],\"bounds\":{\"lowerRight\":{\"x\":845,\"y\":134.359375},\"upperLeft\":{\"x\":845,\"y\":92.40625}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\"}},{\"resourceId\":\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"${flag==\'true\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"}],\"bounds\":{\"lowerRight\":{\"x\":959.8984375,\"y\":52},\"upperLeft\":{\"x\":895.3828125,\"y\":52}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"}},{\"resourceId\":\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\",\"properties\":{\"overrideid\":\"\",\"name\":\"æˆåŠŸ\",\"documentation\":\"\",\"conditionsequenceflow\":\"${flag==\'true\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\"}],\"bounds\":{\"lowerRight\":{\"x\":794.3339870666198,\"y\":52.45471107063021},\"upperLeft\":{\"x\":649.0195285583802,\"y\":52.11755455436979}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\"}},{\"resourceId\":\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"}],\"bounds\":{\"lowerRight\":{\"x\":608.1251779517764,\"y\":54.04363543305239},\"upperLeft\":{\"x\":520.6873220482236,\"y\":52.39386456694761}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"}},{\"resourceId\":\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\"}],\"bounds\":{\"lowerRight\":{\"x\":419.78125,\"y\":55},\"upperLeft\":{\"x\":310.21875,\"y\":55}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('25005',1,'test1.bpmn20.xml','25004',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"${agent}\" activiti:candidateGroups=\"canWrite\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <userTask id=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" name=\"ä¸»ç®¡å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" sourceRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"609.0\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"795.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"960.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"831.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" id=\"BPMNShape_sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"74.99831278471224\" y=\"52.22497469177069\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"54.25\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"629.5\" y=\"71.5\"/>\n        <omgdi:waypoint x=\"629.5\" y=\"116.92970092290889\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"648.5441860465116\" y=\"52.455813953488374\"/>\n        <omgdi:waypoint x=\"795.0\" y=\"52.11600928074246\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" id=\"BPMNEdge_sid-AAEE5013-74E6-4835-933E-07312A14B86B\">\n        <omgdi:waypoint x=\"310.0\" y=\"55.0\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"55.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"845.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"845.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" id=\"BPMNEdge_sid-911C3373-8840-490E-81A1-DCCE9D636DCA\">\n        <omgdi:waypoint x=\"895.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"960.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" id=\"BPMNEdge_sid-5F14346F-77BF-4773-8014-AA2502CA4612\">\n        <omgdi:waypoint x=\"520.0\" y=\"54.056603773584904\"/>\n        <omgdi:waypoint x=\"609.3703703703703\" y=\"52.37037037037037\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('25006',1,'test1.test_process.png','25004',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\æ\0\0\0­\0\0\0=e\0\0&*IDATx\Ú\í\Ý	tT\Õ\Çñ\ÔZK­µÖ¶Zk-µVk­µ\ÚªµV±\ÖÖ¥V«Ái&‰¢¬ÅºŠ\Ð\0‚AP±ÑŠ©+HÅ¥‚Š\Ò([ƒ;Š  !‚! k2·÷÷ú^\ÎËIf’™\Éd\æû9\çžÌ–dò2ÿ{\ßÿ\Ýÿ»/+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cL·U«VU¼ò\Ê+f\îÜ¹fö\ìÙ´$·9sæ˜—^z)d\Û$>‘\0\0\0\0a””/X°ÀTWW›;w\Ò:©mÜ¸Ñ”••…l’~+ŸJ\0\0\0\0\È š)\')O\ä|ö\ì\Ù;ùTH[”iQ¦\âˆ8€=©?\')N¦¾žO%€´E™eZ Žˆ#\0Ø“AúVs\0H\nÊ´(\ÓqD@ûó­uŸ˜Uo<h–\Í\í4\Ý\Öcô\É$\æ\05Ê´t@G\0Ð¾Ä¼¾¶Ò¼ûü³ä¹¡Íš\Ósô\Éô\í\0×£Á4G\Ä\0úö\æ­b\Ù3{$\å^[·l&}2};\0\Ä7¡ L‹A\Äq€¾½y{þ-s=GŸL\ß\0qt(\Ób\ÐqD oß³½;{d\Ä\Ä\\\Ï\Ñ\'Ó·@\ÜÊ´t@G\0\è\ÛI\Ì\é\Û Ê´t@G\0\è\Û÷l:-)Rß®\ç\è“\é\Û€£Á: Žˆ#\0H`ß¾¢ü®ˆ}»ž£O¦o\0\nG\Ä\0$°o¯©\\j\Þ}¡p\Ï~\Ý>¦\ç\è“\é\Û nƒeZ: Žˆ#\0ô\í-·\ÕoNÙ£_\×cô\Çô\í\0\×A‡2-G\Ä\0úöÚŽf\Å\ÂI{ö\ëö1=GŸL\ß\0qt(\Ób\ÐqD o\ßó2˜\Ë\Ë\ïŒx\ÐU\Ïq9Lúv\0ˆ\ß\Ñ`Ê´t@G\0\èÛ›f\É?Y1Ï¼SzcÄ¤\Ükz^\Ë\ì9};\0t<¡ L‹A\Äq€¾½\ÍYrf\Ï\é\Û !	eZ: Žˆ#$Aw6ºB\ß\Í,yk³\çô\Ñô\í\0[BA™ƒˆ#\â\É1\Ü6\ã~RºoooR\î5úhúv\0ˆzÐ¡L‹A\Äq„$¹Ö¶m‹Ü¯£\Ø$Hùƒ®4úv\0HÆ C™ƒˆ#\âILÊ½d\\3\æ$\ç 1§Ñ·`Ð¡L‹A\Äq„\ä\'\åm=˜Ó·Ó·`Ð¡1\è€8\"Ž\'\Ã\ÛH¾½\ç9\çô\í4úvtc\ÌK—.:eÊ”ºq\ãÆ…®º\ê*Ó»woó\ç?ÿ\Ù\ä\å\å™Aƒ™aÃ†\í¾\å–[V?þ,¶tt@Ñˆ£.–”·•t3súv\Z}{;\ä\æ\æö\ÛÜ±\"\'\'g—ý\ZR\é¶Ý¶­·m¦^\Ç\Öj%!ò\É\'?ºé¦›\Ì5\×\\cJJJÌ«¯¾j*++\Íö\íÛ\èkuuµyë­·\Ì\äÉ“\Í\ÕW_m¼»ÿþ±Á Ã \âˆF¥°k³b›	õõ\0};}{Æ²Ix‘M¸k\ìW\ãK\Ä[möµµÁ`p[\Ï\Ç&\àŽ3\Æ:\ÔIº\Z\ZL´/^l®¿þz3`À€\Ù\Ù\Ùg°5Á Ã \âˆ8BŠ&\å£\Úù}$\ç o§o§oo9!?Å¶\Ñ&\ã\Ú\æŒ\Ï#m^\Ý\íé§Ÿ®8p ™9sfL	y¸\Ò\ÒRÓ§O\Ã\ì9tt@GHƒ¤<^\ßÐ·Ó·§¥@ Pý¥\ê&77\×™yóæ™µk×š-[¶8¹\âgŸ}\æTb———›‰\'šüüüð\ä<”±³\çJ\Ê\çÏŸ¿õ\Ê+¯4Ë—/7ñ°f\Í\Z£$¿oß¾ñQƒƒˆ#\â¬­…Þ’ýs\0úvúötI\ÊGù\ËÖ•O:\Õ9\í9\Zµµµ\Î\ëõ}a\å\í“3ncj¦\\Iy´/Zúyýúõq¾\0tt@GH¤<^e\èÌœƒ¾¾ÿOÊ‹ýIyAA3;\Þú>N\íO\Î3*\Ô9\åšÙŽ\×LyK3\çùùùJ\Î\Ï\á£G\Ä’,ü\Üð½l»\×ý\Z‹ð\ï\ãœsÐ·Ó·g4S\î/_/,,l*Wo/•¹;6¼¬=ýóH­¾>zôh\çœòDš5kV(77·ž/tt@Gè„¤|”/¹þP»@\î\×h“óH\ßGrúvúöLN\Ìkü3\åM\Êý\Éy\Ø\Ìù\æ´ß˜Ó§O_­?z×®]&\Ñ\r\Z\ÔHI;tt@Gè¤¤\\\îu“kCr\îOÊ½V\â{žs\ÎA\ßNßž‰Iy‘ÿœòö–¯·V\Ö\î?\ç<­óHÍ–\ë:\åº$Z2,Y²\Ä0kG\Ä’ R²\ÜR’\ÝZr\í\ë9\çô\íô\íMzö\ì\Ù-\Ý?“ºN¹—4k\á¶D˜6mZfÌš/]ºtª|\ë\Èe\Ñbuù\å—7\ê\\ºW0\èP€8\"Ž\ÉE]tœ\Ý	›c÷\î@R>¼ƒ\Év¬I<e\íhWrc?\çƒ\è\ÛÓ£o·\é\Îq•••õºØˆ#ž\éŠ	z4Ÿ\É\Ü\Ü\ÜÞ‚ošÕ®©©IH\î¨\Õ\Úý—RK\Û<rÊ”)u÷\ÝwŸI¦‰\'n³u&\Ýpf‰¶Sb\Ð!¡\0‰9q\ÑÎ—v\Â@È¶RÛŽŠò[£MŽ\ÛJºcM\Êý¿¿1‹™sDŸyIGýœ÷¥o\ïº}{EE\Å\Ü\íÛ·7\å=;v\ìÐŒ\ï®+®¸\âütûL\Ú\Ç÷^7~üøD\çþYóô\Ì#Çzõ\ÕW“š˜/\\¸p·Ý Ut\Ã7\èlV\0÷\î\Ýû\0\n\n˜Gˆ\"1?\Ø¹·½~ñ\Å_ERmR)ùÞ»I¹‡s\ÎÑž$\Èk[š­¤oOÝ¾½¾¾¾Wuuõ\îHùÏªU«LQQ\Ñ{m\íw¥Ï¤}¬\Â{¾¬¬,¡ù£ª|\ï%=óÈ«®º\Ê|ò\É\'IMÌ«ªª\Z\ím Î¸Ag·[~¢ÿÿ#‘:&\n´\ZG”;G™ž°x\í\ãôöž\ã\ÝRr¾³IyG\ßøœ7\ÍVúû|úö\Ô\ëÛµ^\×ÚµkW566¶™…B!SZZ\Z*((ŸIûu—÷x¼}WYY\é\é™G\Ú\ä\Èø\Ë-’A¿O•n8\ãf>\Z\Ã{·Vr$¡ ¡@»J\Ê‰£LOXšfq\ÜX\è\èuK\ÉyG’òð\äœs\Î\Ñ\á\Ïy\"úv\í—û¿FjŸ~ú©Y´h‘s	«\Ö^§óŒÙŸ*|þù\ç#>¿m\Û6\çÐ›6mjzlÍš5fñ\â\Åq/¯¿þº©««Åš\é½Mš4iS§\ç¤\äg\Ò?^—Hk\í\Òiþß—¶Agÿ\ç\êü1]8\Þ6g6Ý]UÓ‘˜¶m·M\ç¦oµ­^e\Ñ6©«uwNõÁ\Ø`\Û\'öö:ûu­m«\íó+\í\×m{Ï¶w\ís‹\í×·\ì\ã¯Ù¯m[`\Û|ûølûu–}ü\Ûf¸\çK<boO¶_\ï³÷\ï±_\ï¼ø\â‹o·_\Ç\Ù\Ç\ÇƒÁB{ÿ{{ˆ}þJ{{ }\îr{?\Ï\Þ\ïeŸ?ß¶s²³³\Ï\Ð9rZA‹\Ø\Øvt~~þ\á^x\á!½zõ:°ÿþûŽ9r\ïtô?NBABv\Å\åŽ\ÄQB\Ø1jU6]r\É%‡j\ç\Ñ~\ÖN\È\Ë\Ë;\Ù~\Þ\Î\Ô—ó—\éó§±Pý¸}ü&\Û&hÌ´Ý«q\Ô\ÞTc«m\Ïi¼µ__´Ï¿b¿¾©qÙ¶eöör\Û4n«,r½}¬\Ú]\é·.ŠCo?B\ÛxQÿl\Ç\á3\å;\Ý\Ç;bQ´\ÖZ‹w\ß~ÿý÷›¯}\íkNÒ­\Ïûœ9s\"¾ö²\Ë.3_ý\êW\Í3\Ï<\ã¼N\í¥—^\Ú#\Éÿ\Îw¾c&Ož\ì\Ü8p`\Ó{·û¾\æñ\Çw¿ë®»\ÌYge\Î9\çs\Æg8{w\Üq\æ§?ýiSûñl>üðC§\Ý~û\í\Î9\Æjgžy¦\éÖ­›¹\í¶Ûš\Óó|ðA\Ó{\Ðß¢\ïó\Þ×¸q\ãÌ¯ý\ë¸n;\Í\à;“µg13}o:}6“?¦\åNÞ¥—^šôómÛ¶93§\Zô\Ï>û\ìým0\äüG\Øö\rþööI6\Ù=U;\0öþ¹v`¿P{\0öv¾Žº;\×\Ø\×\\kŸ»\Ñ>>Ò¶›µC`Ÿho\ße_Wbo?`o?loO³·Ÿ°·Ÿ²\ßó¬ýú¼Vzµ­Ì¶—µ“`_ó†m\Z<—hGÁ¶\ì\í¶}d\Û\Zw‡¡\Ò>^¥{ÿS{“v\ì\í\Í:``ÿL\ìWL\Ø\é–x\è\0CƒfŒ\ÝYc\ï D¤w\È=Pá½¾Á\ÞwR\Øû;ÝŸ­ƒú][\íc[Ü½½§j½G½W÷=l\ï¯\Òß¢¿\ÉýÛ–\Ú\ç\Þ\Öß¬¿Ý¶rwgi®¶¶‘mO\Û\ÛOj§J\ÛP\ÛR;Zö{\î¶_\ïpw¾n¶÷Gi‡LÿýOô¿±÷û\Ùû—\ê¦ÿþ‡Q\ìT\éï¹™„‚„+-#1O\Í8²c\Þ~\Z\ïtp\Ööw\Ç\ÚÿÙ‰övš\â\Ú\Û\Ù\Z\ß\Ôw\Úv•m\×i\\SU‘\Æ4]·\Õíƒ§j,Ódõ\Õö\ç\Ì\Ó¦\ÎnŸþŽúy÷À´úþuî˜¥8\Z#4Vmµ÷·¹½w¹\ãK£»ÀZ(Âófc‘o\Ú\êþ\ÌM\îŒ^•{€|m+\Ý1G\ïi‘m¯\ê½\ê=k!71\î\ß2\ÕÞ¾\ß[&\êov~_\ën‹HŸy¯\Ùv˜rgµ½\n;3\æè’“\Ú\ÏòÐwß®Dù ƒrf;õY\ã7öx\Í\æÍ›\Í_þò\çù\îÝ»›_ý\êWN;\à€ÌhÖ¯_\ßô\Ú\éÓ§;)\Ñ\×ý	&˜‘#Gšë®»\Î\ì³\Ï>\æšk®q_°`\Ñ\é´|°ù×¿þe~û\Ûßš!C†˜«¯¾Úœt\ÒI\æ¹\çžs~\ßò\å\Ë\Í/¼\à|¯VÿV\ÓA¸?ü\á\Þ\ê\ÜNû\â¿hþû\ßÿšÕ«W;¯\×÷\ê\Ò]¿ø\Å/\ÌW¾ò\'‘ÿü\ç?oö\ß³\ß~û™¾}û\Æeû=õ\ÔS\Æö?.\\\ØmTWW·\Æ~&×§ò\ê\â\Ñ|&ýù3\æqð×¿þ5\é\ç˜\Û\0\Þ\É9\æ{\îh\ÇB³\èšM\ïÓ§Ow\ÍPh–]³íš¥°;)§\Û\ç\Ï\ÒL…f\å\í6º³4k\ï\ÎXhgn„f-4»¯Y~û\\±v\ê4û\ïV<¢û\Ütw\çn–f1\Ü¼—TM\à\î\ä½iok6\ã·\ê@\Õ+5«\á\íð©JA0¸\å,5nƒy\Û\â\î°ms«vt\Ö\Ñ\àhš-*¡•3cù¾\r68ï·¾¾¾\Í\×VWW·ùZujþûo¾ùf‹ƒ$‰9;oQ\îK\Ó\"0­•;ê€°f]ü¥†úž•+Wv™\ÆXZøÁW_u˜’Ën?©-¶ÕºYU	¶^U`\îÁ\Õ\Ý«‹Ýƒª\ê«_Tÿ\íL\î\ÎNOÖi·\ïŸ\à\Îb\ßhŸ\ìÔ¾ÌŽ+{ÿ<ü\ÖøbŸ?¾w\ï\ÞG\ê ¹f\ÉS©’\Ë\ÝV\Í\èoŒ°N	\ç˜#]úöf	y¼ºžz\ê©fÖ¬Y\æ‰\'žh–˜k¿CÉ¦\íœ\×ifW3×š0`€3»®X³Õš=Ÿ;wn³}˜Ÿý\ìg\æ\æ›ovfÊ•¤{ý²iýÿ~Ž~Ï‘G\é\Ü\Ö,ø‰\'žhzô\èa¾ý\ío\Û?9\ïGc\ÂÒ¥K\Ý/vnô\ÑG\Î \ç\Þz\ë-\ç¾\ï×¯Ÿ\Ó\Ï\ë@\ÃøC\çù£>Ú¼÷\Þ{\Î~ŒûG}\ÔüóŸÿt~žb‹\ç>’(Ž\Z5ªÁn¯\ÆV\Î/\ßQRR¢§»Z:•³+~&9\Ç<\ÎFŒ±+Ù«²Û€ªfUvßµk5\ÓÞ™3}*\Å\Ú{ï½\Ûû\Ûßœâ¨£Žjj½zõj:o\ê\ã?vf©•––:ÿŠ+šS\Ç\Ô\ÒùU¯½öšóÚªªªßƒ‹\Ã?Ü¼üòËºæ¥±¼s¤Wƒ”nëˆ³¡NN(hZ\îK\ÓL\È!‡b¾ù\Ío:Ÿ\å–F©„Oñ 7Íš\èó¯§\ßÿþ÷Î¬‰\Ú\ÓO?²%Œ\àJ\êØ±\Û÷\Ù.Ó\ë8\ÏP³*;Ri©^I[¤K\ÌÆ«oWYºÖ™ú\Ïþ³Gb®>ù‚.hz\í»\ï¾\ë\à|ö\Ùgrs/4\ë¬}MRx\å\é^B¬¤ýw\Þ1º$³ò\ï~÷»f\ß}÷5úÓŸœ}š\éþú×¿n\î¼óN§o\×lùW\\\á\ìûÌ˜1£)1\×\ÏÖ˜ð¥/}©il\Ñs\ßúÖ·œû\Zô¼÷~UF¯\çÇŽk\n\n\n\Ì7¾ñ\r\'q\×A[Íž/[¶,!}»®\"‘——·ø\É\'Ÿl_\ÎþË‚Á\àUEÑ‡u™\Ï$«²\ÇÙ„	>Löu\Ìm‚Q\Íu\Ì3‹f6ZHÖ§Â¹±JªKJJœ¤@	ºŽ«D\ë\ïÿ»\Ó\Î=÷\\§\ÄJ¯U¬dµ\\\æØ¬\é\ç\éõü\ã\Ío~ó§i \Ñs§vZ\Óc:\ß\Ê{š\á;ýôÓR%_\ZLN8\ásüñ\Ç;ŽÊ¿tä—„‚·\Î(wŒfñ -\n¤8µ%K–˜n¸Á9¨¥û\ÚAóª?4K£,%\í*-\ÔÁ°\ïÿûÎŽ\à\É\'Ÿ\ìÌ¸\èz¨úR¹„‘8J\Úg~§[\n\Ë\"I\Ñ\ÎT\'\ê:\æùY\\\Ç±}\Î[œ!O\Ô>’f\Ê53ž˜«Ÿ\Ö\äÄ¤I“šöM´/²\×^{™Ÿü\ä\'NB¯£:7]û8*[ÿ\Ü\ç>\ç$eš¸\Ð÷©ÏµÉ©Y·nùÑ~\ä\ìK\é\çkv[}¶\ÄÎŸ?\ßI\Òõý·\Þz«sž¹ jÿ\ë°\Ã3:\Õ6\Ë-e\×û\Ðx¢·:p ™x=§ƒº¯}4=\ïýmgŸ}¶óü÷¾÷=3o\Þ<§4^?[tÀ÷\á‡ns»Žô\í:-\É\î\Ãm_µjUƒ\ë†\r¶\Ö]+?\Ý>“\\\Ç<\Îl°œ®rö†††¤%\æÁ`pW*ŸSø\Óÿ\ÛW†øAkÿÿd\'ÿø\Ç?œ-\r,Gq„“˜«Wr¬¦ÀK\Ì\ë\êêœ’t¾\ä’KœD^³\ã:²«\ÄY·õ¼^§\×kpQðÀ8³\Þ\Z(4h\é¾ý¾ðó¸TN¯„E‹¢\è³šnŸw\Þy\Ìô!\é\åŽ\Ñ6\í¼\éó­8òZøý/|\á\Îkµ³¦øQ,(¶¼s5k¢“‹.º\È\Ü}÷\Ý\ÎM*—0G\ÉÑÙ¥¶f¬£MºcMÎ½ƒEü÷oñ\ê\ÛU¬Ï²*Šü‰¹úaõ™ê§½\×\ê1\í+i&ZûHJÒ•˜\ëþC=\ä<§×©RI}°y›Œ:	´q%\à^S2¯òøðRöiÓ¦9‰—J\Ø5\Ã~\Çw8\ÕP^•¡o%\Ö\Ú?\Ó\Âpz¯ª(\Ô}=\î%\æ*­?\æ˜cœƒú\Ûôw\èý\ëõ\Zt[3\îªnLdß®1Y‹^º‘g´uÀ¥«\Ò\é¶\Þþˆ½\í\ì\'‚>3yyyþj\Ûô\Í#¼K;9I*c\×ùÉ›\éZ3‹¸+¢	¤\Î(ÁUyŒf\Ýtûò\Ë/wfó´¨‰Ú—¿üec;\Ôf\ç°\ê5‡zh\ÓÀ¥@¥RJ0üe»Jª•€k0¸ñ\ÆAƒ\î\ëü-/1¿é¦›œß¥\Ù=›¥òy\rn:—KM·\Õü¥Z$Ÿ˜\'¥\Ü1–¦\Øð—³\ëó®\Ó;¼Ç¼\n•\ë9•KFjŠAÍ¨¤r	#q\Ô%Dš95ÙŽöõ$\å\è‰¹šf\ËU]\äO\ÌU\Ñô\ïÿ»\Ù\ë´o£ƒ¨j\êG\Õ{÷\Õ\Çþ\îw¿s^÷\Ê+¯8‰¶\ïß¿¿3¨\ÒPý±~ö=÷\Üã”»{ûIJ\ÌÕ—«¯V\å”w%õzL·\Ï?ÿ|£\Óm½\Ä\\U…Z	^ôó´@œ\î«\ÑKÌµ¥™[=¯Ê­_þò—\Î\ä‹&P¦L™\â¼Í´\'«oO×„<l¿¤\Æ\Û7\Ñ\ç)t\àÆ·ÿ“\ÞydŸ>}n×ŽMf\ÍC6Ù¦…\È\èZ‘J‰¹:w\Ö\ÑW•\\=ºY+,,4/¾ø¢3;§òX®ó 4\àx—\ÑL\ß~ðgPzû\í·›s\r2š\í\ÖÀ¡B—\Ñ}ñõó÷\ß\ß<ò\È#\Îó:Š«u%\ZØ¼¦y’CB‘±‰yR\Ëci7nt>¿\Î\Ânú<k†Z÷Uf\î­Ò«™n-<¤™x\ÒN˜\×t€J¾#º>l*—0G]†f\Î\Ã\Ë\Ê\ïÍŠ½<½¥\ä¼$\ì÷pN9º\Ô>’J\Î\Ã\Ï1o\éuª\æSÉ¹ö•Ô—zk_F‰»ÿµ\ê\ï\ÕW{—^ó\Æú¯“®ƒ:UOW\r\Z\ä<U\â¬Ry=®\ÛJÀõ³ôú¡C‡:+¸«\ÏW¹»~žu\Ý\×û\×ó\ÞB»š]\ÕóªŽz\ì±ÇœIU«rK§KyUô\íñ¡Iÿ¬y¼\Ó\Ï\Ó\Ïõ~GF\ä‘Ø® H$Ï®£™pô]\'1¿\å–[œ\\\ç j \Ð\0¡#·\êø5K­Ûƒv:_uöº­Rv•\á\êÈ«\×N¿\Î+W9¯Ž\ÖzGƒ•˜«$W¥=*{\×\ï\Ñ\0¡û*\Ùò—²+\é\×ó\Z0Tv\ì±Çšk¯½\Öi\êˆ\Â\Ë\ÞI(j‰¹>\ÓYQ¬½\à5S®*UŒx\í”SNqsÿ\ëRµ„‘8\êrÉ¹A8’Ë‚n‘¾K¢¡\Ëô\í>ø ³Îfº5y \Òuõ\Åú\\+q\Õ\ãz^¯Sr«hõ­:ªý$\àT¯\Å;•\ìz«¯kGý¯~Ž\Î_\×†ö¡4¹ \Çt[š)\×Ìªf\ÒUR¯…tu\ê\àõ\×_ïœº§I\Ý\Öcú]ú\Ù:P\ë]3]\ë–\è\çy%ñš8ñ\äzM\Ïk\Ñ]]®MŽ\Z;´\íôw\êo\Ñz$ô\íqM\Îk½\ÄYñºtš¤\ë3\ãŸ-Ïˆ<R%\Æ\Ú\Ò\"‰°t\é\ÒOtMn]¯•/R)¡\Ðg^¥¼Rv-.¥A« «¤\\3\á\Z|\Â/¥¦ûšýÖ ¤r«–~¶Ê§ZKT´\àUxb®\ä^ƒ‘]:DM‹§˜#\ÕsTÒ¬¹v–\ÜÏ³S§ûú\\‡_\ÐK\ÌÇŒ\ÓÔ”œ«\Ý?³’ª%Œ\ÄQ—^Ö®¤º$+öK …_G¯Ÿ$µo\×Bm\ê+½+[´\Ôô¼· ›’e%¸^ÕžÊŠµx­%\ïür\ïsÍ¦«JÊ»\ZNMRÅŸ×´O\å%ò^\Ó>˜÷¿\Î{­*\Ãß¿\Z\ÕAYÿõ\Ó\Ã\Ç\"U_©jJ\ZtPx\ëÖ­M•>¼Ù¬?}{|òHÿ¥-Ui\Ú\Ñ\ä\\I¹öü—\ZÍ¨<2//\ïn-\ê 2x²º\Ùþ\ÃvSÂŽTM(¼sÌµøšVnÖ€£Y\ëŸÿü\ç\ÎùPZ€ÄŸ˜\ë\\Z\r\\ºH÷\îÝþ¢¢¢=-p¥G%¼:¢«„A–\îk`ò\Ïjux=¯•Ióóó\Ä\\‰…šŽî’˜#\Õ\ã(ü’iYaç˜‡7%\æ:O\\36^S¥HV\ØeSµ„‘8J‹ä¼£Z*“Ò¶o§Ñ·GŠý‹\Ójæ¼½e\íú¾°™r“‘y¤M\Î\è×¯_(^3\ç\îLùnû\Ï*\å#‹Tt´p›Ê©”˜kõg\ÍP«ŒK\×\Û\ÔyN*\Õ5—u9&\'¥|«\ÄY¥X\Þe\Ôt\É%õ\Ù\Ù\Ù-\Î\Ê\é$Y¾Ò«ð\æ\Íôi\ÕI•¯\ë\à€fÑ•\Ø\ëÈ±f\ïtªq¤X\ÐùÝªQ\Ó9\äú<û\Óm/f\Ôô˜D\éŠ^\Ó@¬\ïó\ÎGO\åF\â(\ã“óx\'ù\0‰9‰y—f\èûüÉ´\Î\r×¸¯1;\Ú\Õ\×U‘\á?§Ü½¢S\æ\æ‘:\âa“ƒ\ÐSO=\êÀ‚p¡\Ûn»M«p«¬\á>>ªH\ÕAG3\×:—\\Ž¨#\Ðe—T\ê¤\ÒW]\êL	²Ê¸4û¦2-¯,*<ÁV©®\Êl•\Ô+yÿ=Z­TÉ¼&\Ð\ßô{½¤E¥;:\'K·µŠ©œÓ¢+:H\Õ8RY¹Nÿð—¥‡7]\Ðÿ¾tÚˆ.\ã/Ÿ\Ôb‹:ð©D1•J‰£.­£\åç”¯ƒÄœF\ß!´-ž {§Gh6\Ü+sW¹º\ÖP\åª&Át%£°KÂ†\È#³þ®@0\Ü4p\àÀF­0û!ý\Ø&ö[u‚>ç”ƒA‡A\ÄqD¥pr\ëŒ7½¾F\ß\ÞFé¿ŒZ;ydG=nU‚Þ»w\ï\Æq\ã\Æ\íxù\å—Ö­[× ™Ù¶m[\ãúõ\ëwÎ™3g\ÃÈ‘#7\Ú\×\îÖ†\Ô\Ñ\rV_ƒƒˆ#\Zq”\Âb-G§|ô\í4úöò\Èv$\è\ä‘m\É\Í\Íí‘““3\Ãn¨\n\Ûv‡mÀÛªl›©#$l-0\è0\è€8¢Gi–œç»¯+b“¾F\ßN	0\è\Ðt@Gˆ¯¶\Î÷V_\')};¾\0ƒA\Äq„‰4sNù:\è\Ûiô\í\0th: Žˆ#tRrNRúv\Z};\0\Zƒˆ#\â”œ/\")};¾\0ƒA\Äq„\Î1\\‹eqI4Ð·\Ó\è\Û0\è\Ðt@G\ènbÐ·\Ó\è\Û0\è\Ðt@G 1\è\Û\é\Û€A‡A\Ä8\"1\è\Ûiô\í\0th: Žˆ#˜ƒ¾>•¾\0tt@Ñˆ#s€¾F\ß€A‡Æ \âˆ8‰9\è\Ûiô\í\0À Ã \âˆF‘˜ô\íô\í\0À Cc\ÐqD\Äô\í4úv\0`\Ða\ÐqD#ŽH\Ìúvúv\0`Ð¡1\è€8\"Ž@búv\Z};\00\è0\è€8¢G$\æ\0};};\00\è\Ðtˆ#>¿\ÄH\ÌA\ßN£o\0G4\âˆ\Ä o§o\0\ZƒqD#Ž@búv\Z};\00\è0\è€8\"Ž@bÐ·Ó·\0ƒA‡8¢G 1};¾\0tt@G 1b2w\î\\úTúv\0 ¡`\ÐqD#ŽHÌÎ²`Á‚\Æ\ê\êjú\Õh\ëÖ­û\Øö\í;ùT ¡ ‘P€8\"Ž@bŽ2oÞ¼›\Ë\Ê\ÊB6l\è\Ò}beee—O\Ê\çÌ™³Û¶[ùTH[”i‘P€8\"Ž@b´\Ì&ƒ£lŸ²UýJWl¯¿þº)..63f\Ì0]õo\ÐL9I9€´G™eZ Žˆ#˜\é\ÇsÀ¦M›Bµµµ¦ÿþ\Ø\"\0\ÂÒ¥L+’	Ê´ˆ#\ZqDb ^Ö®]»Ê¸.\\Ø““S\ÄV€\Ö\ÕË´Ò¤Q¦EÑˆ#s\0qQ__ß«±±\Ñø;¶¡OŸ>\Ý\Ù:\0\0\0\0HÌ«ªª\Úm\Â\Ô\Õ\Õ5\æ\å\å-f\ë\0\0\0\0 1¨¢¢b®‰`úô\é6\Þò\ÙJ\0\0\0\0HÌ°¹÷qÛ·o”—›P(d\n\n\n¶÷\ìÙ³[\0\0\0\0‰9g•••õ¦\r«W¯\ÖBp3\ØZ\0\0\0\0HÌ8+//o+/7;v\ì¨U\Ìõ\î\Ýû\0¶\0\0\0\0s Ž\n³‰w«‰ù°a\Ã\Ö2c\0\0\0€\ÄHG}tg¤¤|\åÊ•\Ël¼\ÕsŽ9\0\0\0\0s A²³³Ï°	xK¿\íƒ;X•\0\0\0\0‰9`\ãÇ_¢\Øý\î¿ÿþ\å@`[\0\0\0\0‰9`*U/--mô’òººº5999»úô\éÓ­\0\0\0€\ÄH‚+¯¼rÈ¦M›Lmm­\éß¿MÌ‹\Ø*\0\0\0\0HÌ$*))\ÙX\\\\llŒ­gk\0\0\0\0 1’L¥\ëŠ/-\Ç\Ö\0\0\0\0@b_\0\0\0\0H\0\â\0\0\0\0H\0\â\0\0\0\0‰@|\0\0\0\0‰@|\0\0\0 q\0ˆ/\0\0\0\0$\0ˆ/\0\0\0\0$\0ñ\0\0\0€\Ä\0ñ\0\0\0€\Ä ¾\0\0\0\08\0 ¾\0\0\0\08\0\Ä\0\0\0\0\0\Ä\0\0\0\0€ø\0\0\0@\â\0€ø\0\0\0@\â\0_\0\0\0\0ºN’P¥D¡¶•-_\0\0\0\0“8ä·•8Ql)€ø\0\0\0¸\äac+‰C}Ïž=»±•\0\â\0\0\0@\â‡ˆ³z999El!€ø\0\0\0øä¡¥sa·2›_\0\0\0\0’“8\äs\î+@|\0\0\0\è\Ü\äa=³y\0ñ\0\0\0 “¾¾\Äa8[ ¾\0\0\0\0$™w.,³y\0ñ\0\0\0 	rss{\Çm²P‘““³+\ì<\Ø\Ýnù\íL½Ž­_\0\0\0\0\âD—i²	AýjZ¹\Ærø¥jƒÁ\à$¶@|\0\0\0h\ÂpŠm£M\"´\Í\Ù\Ù\Ùg°5\â\0\0\0@@q0ù“€\Ü\Ü\\STTd\æÍ›gÖ®]k¶l\Ùb\ä³\Ï>3•••¦¼¼\ÜLœ8\Ñ\ä\ç\ç‡\'!f÷\0\â\0\0\0@ôI\Ã(Y­†©S§š\ê\êj\Ú\ÚZ\çõú¾°ò\Û\Él]_\Ä\0\0\0€Ö“†b\ÒPPP\à\ÌÞµ‡¾o\èÐ¡Í’fö@|_\0\0\0\0\"\Ð9¯þò\Ú\Â\ÂÂ¦r\ÚöR\îØ±c\Ã\Ën\Ïakƒø\"¾\0\0\0\0\ì™8\Ôøgò:š4ø“‡°™½\Ílm_\Ä\0\0\0€\æIC‘ÿœ\×ö–×¶Vv\ë?\'–’[_\Ä\0\0\0\0]G\ÙÛ©\×\ÂR‰0m\Ú4fõ@|_\0\0\0\0\Â\å\æ\æöð¤Ò¬[MMMB­&\í¿Ô“Î¹e\ëƒø\"¾\0\0\0€Œ÷v\æÇoI\×aö\Í\ê\Íd\ëƒø\"¾\0\0\0€Œgw\à+¼ù²²²„&\å\å\åþÄ¡Š­\â‹ø\0\0\02^NN\Î.og>Þ‹R…«¬¬ô\'\rl}_\Ä\0\0\0ñt\ícog>^—pj\í\ÒN¾\ÄÁ°õA|_\0\0\0\0‰ƒoG>H@|_\0\0\0\0š\'\Ì\è\Ä\0\0\0€\Î\Â9°\0ñ\0\0\0 ±j4@|\0\0\0\èD\\g ¾\0\0\0\0t¢\Ü\Ü\Ü\ÞÎ¼½mjjj’4\Ô\ÖÖš¼¼¼¦\Ä!\'\'\ç¶>ˆ/\â\0\0\0@–Sn[\ã\í\ÐO:5!‰Ã´i\Óü³y›\Ù\ê ¾ˆ/\0\0\0\0®œœœ\"ÿ¬^¼©\Ò\Ï\Ó\Ïõ~G0œ\ÄVñE|\0\0\0hž<\Ôz;öq»´“.\á4dÈf³y={ö\ì\ÆñE|\0\0\0hž8œbw\ê½ü\Â\Â\Â\'J\ZÆŒ\ãO\ZBÁ`ð¶6ˆ/\â\0\0\0@@±o\'ß™\ÙkoÙ­¾/l&[_\Ä\0\0\0€¶\Øüûü;û:wUVi\Õ\çhW‡\ÖBTþs^\ÕlRR\Ê\ÖñE|\0\0\0ˆ‚föl…\'ºsYY™3[\ç•áªœ¶²²Ò”——›\â\âbsé¥—6KT^«d„­\n_\0\0\0\0b\àž[–\Ä\Ú6s\Î+@|\0\0\0\è€@ pk;ˆÍš\Åcuh€ø\0\0\0\'¹¹¹=rrrfØ„ Â¶\Ýa‰BƒmU¶\Í\ÔL [ ¾\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\É÷?$\ÌÍ’\Ú\Ð.\0\0\0\0IEND®B`‚',1),('2501',3,'source-extra',NULL,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\Õ\0\0\0\×h²¿\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€\è\0\0u0\0\0\ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0sRGB\0®\Î\é\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0 \0IDATx\Ú\í\Ý	|T\Õùÿñ3I€°#EED´X•Š\Öj«¨ØºÕ½ŠD[•Z«‚.?pWV\å\çVEA‚ \âV@©\ÅJù[T\Ä­+a‚²¯’\ÌÿùÞ¹7½ŒIÈž™\É\çýz2{Â™{\î=\ç¹\Ï9\×9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0”W„*\0\0\0\0P[¢\Ñh\æ²e\Ëþ¸yó\æË¶o\ß\ÞyÛ¶m™EEETLUv‘H433s]ƒ\r\ìÞ½{d·n\ÝþJ­ Ú¶/ª\0\0\0\0@mXºt\é\ï¿û\î»Q;w\îlÒ¶m[×²eK×¼ys—––F\åT‘‚/[·nu›7ovkÖ¬\ÙUPPð¯;v\\v\æ™g\æP; p\0\0\0\0 \á-_¾|\Æ\×_}ÁÁ\ìÚµk§3\äTJ\rZµj•5;\ìf\ï_þò—¯Q#¨\nZ+PCHÃ«¡ix´#\Ú\í@R\r¬\\Ð¹sg×¢E*¤–\Øq\Ó-^¼x‹\í\ë/=\í´\ÓÞ¤F@\à\0H ¤\á\Õ\ÒðhG´#\Ú€\äÛŸ/[¶\ì‰#Ž8¢Ä ÁÎ­k\Üw_½\í¶oX\ê¢\Ñ\"×¸\Õ!n¿Ng¸\ÌRy\Õ<X¸p\á\Æ\Â\ÂÂ“\ØÏ£²Ò© z)¢ž››;ø€hp\Øa‡¹V­Z¹\Ì\ÌL\Òñª‰\ê±Q£F^Ç£]»v\é6ˆlkƒŸ+úõ\ë—3aÂ„SC´#ÐŽ\0$eŽ-Y²\ä/ÚŸ\ï»\ï¾%\rV,|\Ö\åoYm¯-´7¹\Ý;6¸\ÍyÿtM\Ð\Ée4\";¡ª\Z6l\è\Ò\ÓÓ·oÚ´é˜‰\'N FPœ¶ªy°£4<E\Ô<ð@9µ@s$»v\í\Ú\Øˆ/Ì™3\ç\\j„v\Ú€Ä¡\éf\Ê\Ó~¦$ë—½\ï\nvmû\Þ\ãE…»\ÜÚ¥s©ÀjÒ¾}û\Ö?|\çw~Nm€ÀP‡”†§J›»§ˆú\ÊE/¸/ÿz·û÷»\Ã\Üò…Ï¹ü\Í\ßPqÕ iÓ¦®K—.\Í\í\æ³g\Ï>’\Z¡v 1h\ZM7+-¼£Œ}¸öù¨>mÚ´É³S p\0\Ô¥\ái.¶V	.m°£4¼­kÿ\íEÐ£Enûúÿ¸\åg\ÐSƒžŽ;¥§§?JmÐŽ@;´°­Ö¨)u\ß_¸»Œ‹\áV§ýö\ÛO‹Ft§&@\à\0¨#¤\á%\ÒðhG H,º\ZŽ¶EÝ³\ï\á\0ûÑ•š\0 Ž†—8HÃ£v q\è*.\\\r\'A~±\ï!ƒš\0 Ž†—8HÃ£v y4h¼O©\Ïe4\"SHDœ€j@\Z^\âð\Óðö¥&hG H|­>Á\í\Úö\í÷¦¢¥7h\ìZÒ\n@5 \r/vj¤\áÑŽ@;4š\íûc×´M\ço¾\ßT(}ª\0¨y¤\á´#\0@\É\nw\ïø\Þc;·P1@!p\0\Ô¥\áe4lú½\ÇI\ÃhG\0P_\í\ÚöwIÝ­\ßý\ë{\Ïm[·\Ä-ÿ\èi\ï5\0\0õix\0\í\0ð_›V-t\Ë?~\Æmß°´\Ô\×lß¸\Ì\å.x\ÂmX>\ßEY¨S\Ì_j	ix\0\í\0\ê;e¬ùò\Ï^FAy\îò^¿\å»¹ý~t¶\Ëô\ÖnP\Û\È8\0j\á\0I\Z@;\08/ƒ ¼Aƒ0e&,ûð)* p\0¤\Òð\0\ÚP[ú÷\ïßŠZ@¢SAeE‹\n¨@ Ž0U¨¤\á´# 6\Ýq\Ç—-Y²\ä…\áÃ‡÷¿ë®»&P#HT‡v/•\0$!2€\Z@\Z@;jËw\Þ\Ù{\åÊ•~ý\ë_»\Ü\Ü\Ügo»\í¶þ\Ô\n\0€À\àH\ÃhG@m2d\È\ÅË—/\áücZß¾}\Ý\r7Ü¶fÍšg\r\ZtiþYÃ¬œk\å+ý\ËùžOø6 q1U¨¤\á´# ¦)\Ó`ÅŠ“®»îº´cŽ9\Æ{ì¨£ŽRð }ô\è\Ñ\r\Z\äÆŒób\rÿÍ¬´‰{,\ßl¼•k­tµò…•\îVnŽ{\í©þÏ|£\0@\à\0\0\0\0\Õdøð\áý4-A™A\Ð Ð¥K7p\àÀô±c\ÇN¼ö\Úkw<ö\Øc¯\Ö\àŸ\Ò\Ã\Ê\ï¬|z¬“ÿóÿ\ç\rV²2\Ë/\Ï\é¿\àôZ¥µµ\ÒÁ}¦ÿy¤\0ƒšF3/^\Ü\ï“O>¹tõ\ê\Õ]W­Z\Õdó\æ\Íùùù.###Ú¼yóÝ­[·þ¦E‹ó\í\å÷\Ü|ó\Íÿfs\0\0\0\É4Ð´e”D\ßx\ã\é£FšÚ·o\ßK&NœøZ\rþI\Ê,x>.˜  ÀH?0gek	\ïSV\ÂeV\Òý>iÿñ~V:òM¨+}úôi_PPpa$Q\0TYS\nn*\ÃJUy6\Ö\\d\Ïý===={ò\ä\É+	$iÀ\à•W^ùÓ½÷\Þ\Û{Ýºu?þñ]÷\î\Ý\ÝA\äZ·n\í233]~~~dË–-\rW¬X\Ñ1\'\'§\ãÂ…/4h\ÐòmÛ¶\Ýû§?ý\éš\n\0\0HÐ AŸ½\r\Ê<<xpƒ‘#G¾Ô¯_¿‹&L˜ðV\rýY\'†nkJBŽ•3ýûššð˜•E%¼OYÃ¬\æ\Z†ùŸ\Â7\r .ô\î\ÝûBûqmQQ\ÑÉ‘H¤a	/QFT{Nû¬GdeeÍµû\ã§L™2‰ÀA’ø\àƒ~{\ß}÷=¾iÓ¦Föz\Ñöôôô\ïÛ™™^\Ùw\ß}\Òûúö\íùô\ÓO\É\Î\Î~rÀ€ƒ×¯_Þ´iÓ¾¢\é\0\0€D1p\àÀ—.]:Ak\Z\ì-h\Üt\ÓM\rGŒñªuˆÏ·Ž\í¬\Z\èK®µ’\ëbg\å\Îò\0:;\×\Æÿ¹h/Ÿñs+Ÿñ\r¨+6vT0\à\Éh4zf%\Þ\Þ\Ý\Þ\×\Ý>c@aa\á©:ŽL‰À}Q¯¿þú\Û\Ï?ÿü©\çœsŽ\Ó\åˆJ\n”E`+\é³g\Ï>ì¥—^ú\ç\ÕW_}=\Ù\0\0 (\ÓÀ\Z¤Ç¯iPž\àÁ!C\Z(xÐ«W¯K¦Núf5þi\í­ü\Å\Ê\\¿_\Ù5ô\Ü8\Ë6(\í}YV\Ô\×RGý!¾e\0uÁö‹Yiii\í<¦±\ä‘G\éŽ?þx×©S\'×ªU+×¼ys·}ûv·q\ãF]ú\Ö-X°À-\\¸\Ð\íÞ½;x[7{\ß\'½{÷¾&³’þrŒ\n\Z¼÷\Þ{ó\çÌ™s\ê7\Þ\è\Î=÷\Ü\n\r\Â\Î<óL­R\Ü\Ø6žG¯¼ò\ÊkiJ\0\0 .\Ýq\Ç—Y\'ube‚\á\àÁ\àÁƒ36l8\Í:\É\çVãŸ·¿‹­a‚¹¾ÿp±ùÀ³\ÜOT\éù~pA\ë|\à?\×Áí™•À¢ˆ\0j+hp®û&A#5ž3fŒ»\å–[Ü©§ž\êMyW\Ð@š4i\âÚµk\çN8\áe¹G}4~ü\Ù\ÌÆ§/ô\î\ÝûJ	F™/¿üò\Ï\ì \ê~ø\ÃV\Ëgr\È!\î\î»\ïVð\àAû\Ò/£I\0€º\n\Z¬\\¹r‚\Ö4¨l\Ð  \ì\Ê!C†Twð@‹jJ\ÂVúX™g\å4+\Çû+x\å?¦ûJ\á=\É\ÊU.–¥ +,	}ž^Ï¥\ÔF\Ð@™3l \ïúx\à´0¢7¥½<”‰ \×\ë}\n0\ì3ŸNµqdR´¦ÁÌ™3O½\îº\ë\Êýå–—>\ï¶\ÛnkÖ Aƒqö¥F\Ó\0\0µI\Ó‚ Ay\×4\Ø\ÚB¦õo^²þ\ÍYUü¸#ýA¾\0\çY¹\Ü\Å.½xŽ•K¬\\ce¦‹]®1\×Å²\n4MBWXheeŠ•\Ù~°Aˆ\î~\á¾}\05Ik\Z¤§§?\r:w\î\ì†\r¶\Ç\à¿\"ô>½_û\ØPð\à‰T\ZG&\í\Zºz\Â=÷\Üó„\Ö4¨®Lƒx\Ê<\èÕ«W£_|Q\Ñð_\Ð\Ä\0\0@m(i!DÍ«½\æšk¾÷Z¥Ê†O h\î\ï~÷»\ï½\î±\Çó®0¥Ž\íÐ¡C?üð\Ã/[§ö\â*.˜xk\è¶\ïùÁ\ç\n®ðƒñ‹…uõ_ûd\è±n~\ßô)¶\0\05)--\í™`z‚2\r\\<¡²4A\Ó@X±b…Ò´…§],\Ë*ù\ë,Yÿð3fŒ\×%µ&AM:û\ì³·lÙ²#S\0\0@mP¦ÁÆ§Ç¯i ”X\Ô9\ru~Ý“O>¹\Çûÿô§?¹\r\Z\ß\ßgŸ}\Üe—]\æ\rþ\Õš\Øû§Wa\ÚBN\\@\àùP\Ð  \çK\nLÌ\Z\èu÷º\ØV²\0¨)º\äbQQÑ¯t[kh°_Õ A8x løÐš\ÝRe™”e\ä\ä\äô\Ô%\ÃÆš2`À€}\ìÀ\ÊB‰\0\0 ˜õCnW´{÷\îÕ–Á9|øð~e-„xò\É\'»8 ø¾u~\ÝÒ¥K\ÝG}\ä\Ýÿ÷¿ÿ\í/^\\¼\ÊwFF†kÑ¢…;\ë¬\ï\ÏJP&\ÃÐ¡C\Øk²«yÁD°£ùùù{}Ú®u¨¬š\Ý&‹\Çuº\Z_e§\'”FŸ§Cc\×©P\ïI¹°b¿o¿ý6£º\æû\í\ÍO~ò“†\Z5ê¨¹0\Ù\ÙÙ¹4W\0\0`\îQÿý÷\ßh}„7#‘\Èä‚‚‚yÓ¦M\ÛZ… Á³{[\Ó\àü£û\ßÿý_oJ‚\ìØ±\Ã=ó\Ì3\Þ\Ýq\ã\Æ?.:ûuõ\ÕW—z\Å)õq†\ê~ø\ál\ëˆ÷¨\â´¤öv¾Å¶ó×ªºW–ŸÓ¶¼zõj÷ü£\Ä\é8ûûœ¦3?õ\ÔS®C‡e~\îÈ‘#\Ý\Ï~ö3w\Ê)§¸¯¾ú\Ê\Ä\Ùÿ\Ñ{N9k#®mÛ¶\ÞsŸþ¹Œ\Ó\ç+ ÷\Å_xY?¡¢W~ÿûß—ø»úö\í\ëF\íÚ·o_\êß£³\ßú†÷Ê°ž={6[b\Ü6i\ßËŽ^½z½m\ßÁ“\å\Ý&ûô\é\ÓÞ¾\×Su[ûEj‚‚µþóŸƒ n·TG&e\à\à“O>¹T©*—]¬¨.]º\ä\ÙNª‡ö/´\ÕÔ¤È¥ŒÞœ;w.—\0”›\r2´\Ð\ßeÖ‘½\Ìú&ký \Â\ÔF\Z\Í}þù\çó\Ëów\Þyg\ïò\rDƒuJgÎœ\é\rDÁ‚û\î»\ÏmÞ¼¹øuJ½ý\Å/~\á=ô\Ð2?OÁƒ!C†Ž1bŠu\Â/Ÿ:u\ê›|«(a;o\Ú\Î7øA„\nm\çUñ\á‡º«®º\ÊmÚ´\É}ùå—¥¾Nµ+¯¼\Ò\íÜ¹\ÓkU«Vyƒñûï¿¿ø1\Þ~ûmg\íÎ»¯ö³lÙ²\âÀÁ\ÓO?\ín¾ùf÷›\ßü\Æ\íÚµ\Ë[gD—\é\Ó\à~Ýºu\Þ\ßÔ¯_?/@¡6©õ\ÑôzÖ®]\ëºw\ï\î~ô£ÿ¾­[·º\ßþö·®Y³fÅ\éÿò\î»\ïºýö\ÛÏ»¯l\ê\Ì\ÌL/H¡ ‰þ}–^üÿô™;vd£t®±\Õ\Ï¶M^`\Û\ä6\Û&g\Úýñem“\Úk¼A¤¶‡ð®ê¤©e\Ê\ZSË—ô\ãÈ¤X#êª†X›Ž?þøVöÅŸB\à u\ÙN\ç\Õý÷\ßG\ïÞ½\Õaz¶.¢\é	Z/\ÅÐŠ\ÐÁU\Ö\Úð¡n)uÐ¶•œdÀ•wW\'\Ô:#{<¦ŽdÃ†\r÷ú^¥§ª#Xuu&«2\í\r	3°*²\íI—\ìo?û\Û÷¾\Õ\Ú\Åt{üµ²Ú…\r\Ú/^¾|ù\á…÷æ¢‹.r\ï½÷^q\à@Û}\Æ)\ÎÚžzö\ìY®Ï³\ß\Ûxð\àÁE#GŽ|±W¯^—<À^\ì\ÚÎ·\Ûvþ\ÒÞ¶ó\Ê\Ð6}ðÁ\í«¸}m÷\Ú7qM\ÓQ6N×®]½ûÿ÷ÿ\ç\í·5Wp@‡°7\ÞxC\'Ž¼ÁúÂ…½^0E\èoû›\ëÔ©“4\Ã?\Ü+S¦Lñ‚\n\Zü\ç?ÿq?ý\éO•\áŽ<òHo@¯L„\à\ï\Õ\ë_z\é¥\â\ß÷\ÜsÏ¹ÿø\Ç\î\ç?ÿyñcj£z\í’%KÜ½÷\Þ\ëýZXOY\Z|\êñ–-[K”\í°‡¦\Zœ\Û6\ÙÃ¶\É]¶M¾®\ì˜øm\Ò;%¸}\Üq\Ç\Õ\è¤\Ï’~™”ƒU«V5QD¯6z\è¡Z‰¨+m2\å;}m‡£KH]b¥­þN\ç…ÚŠ¦—\×\ÙgŸ\í^}õU¯ƒø\ÄO\ì1p),,tÝºus¥]\ï{øð\á^:«\Ö)€u€;ÿüóK|þ\ÓO?õ\"ò<òˆ,\ÐA\\@¥\Ò\Þy\ç\ÞÁM“~\á½’‚t\Ö~\Ôÿ\édÀ\Ý~û\í^\çô\Ö[oõ:y¥”öª3M\ê\Ä*` 3S·\Ýv›·]ð\ZuP7nü½÷“žZ?\Ø6¿vT³`pÕ¶mÛµ6@™c÷\'„)\Ê4ðƒ\é¥\í·K¢“\à\Z1b„Û¶m[ñ6\Ð>Wg6+²\ß=úè£›:t\ë\Ã?Lð\0\Ñ$´+\ám\Ûÿ?_}\'MO\Ð`¿´¶ñ\æ›oz|\í›EY8š®£q\Â;\ï¼ã¥¡+\ë&77\×MŸ>\Ý€Ö¯_\ïF\Z¥u>¼,„o¿ý¶ø÷h¿Û¿\ïó\Ëò—¿ü\ÅË€ø\àƒ¼÷k!Re	ˆ—_~¹»ö\Úk‹,ð2†‚`ˆúG\nB\è\ïÒ™oO¬ê„¥×\Òg\êÿ¤\0ˆN\Æh!\ÔpJ\Õ0\"X}o³}¯®\à2N\Ûd~~~\×\Ðø®Fÿˆ¸i2I?ŽL\ÊÀu\Ö2t@¬MÛ·o\ß\×6¾\Û=œg%¿”\ÎC¾\í4ó\Ê\è\\¬µ\çK\íL\ç\å\å­$e¾Î©\Ãw©}W—\ÚN&\ß:Q/¥¥¥½šgS•Z§Ê–-[¼;E¨ý\ë_5\Ç;ø}÷\ÝwÞ ^\Ç\à,¦žû\æ›oÜš5kŠß£N§\\x \å\ÖÁ4x½G:pýóŸÿ,\î˜\ê\à,$£AŽC}úôñV\íV¤\\\ïUªŸ¢ò\ZDi¥ƒg8]©€³Ù¶r‘pvÀ\ÖuÜŸM´\0\\@0¥\Ò\Ù(\Ý.\é\Ä]w\Ýåµ+®¸\Â;“¥K\ß}ö\Ùg\Þ\Ù(uòtFJ@\äôé©©\ë’K.if\Ûu›J¼µµ	El³”bÇ”¯Ú´ió’\ísoQ¦AE‚uu\rFt\\hÎµö\Ë\Ç{l…?\Óö\éÍ†²þ¡‡Ò´¥¢Å·Ž\nP&B/\Û\Ö{Û¹ú\"•¥³ñS§N-5p0a\Â/\è\Z\Ð>ZƒxMøøã½L\0õq´nÁw\Ü\áN8\á/@|\Øa‡yû\ì/¼Ð­\\¹\Ò;£\0„Ž\nB¨\ß4k\Ö,oý\r\Ø\ï¹\ç¯_£@]NNŽ·¯WÖ¦\'\èø \é	\ÚÇ«Ms\æµOÿÁ~\àõ›n¹\å\ï1}¶Ž1\'žx¢w_\'sl?P|\è_ÿú—\×\ïš3gŽ84h\×Æƒ>\ntW…Ž)\ê§ÅgR]SûÎ¶Ÿgû‹SGXkz<÷ùm’½\"“2pPž”\Ïê¦<U_w•³\ã\\¥\ç,\Ç\áRñU\æ¿\ÖU\Ókõš5eEö4©\Òó¶£ÏŸ6mZ^-ov™ö7õµ¿­¯}7›üÐ„\Ú\é`¨h´\ãQ^\Û\È\×_\í:8Ú:öG[;Qª›^:)/8À*ú®Á¿¢\àJu\r\ÎJ\Ùÿ\Çûüþð‡\Å1\rzt`¥\Ì)\Í.|ð\ÒQ\éz\ZL)%OYÍ·UÀACE\Ò	\Z\Ô\ß\0\\\Åcû\î\Öv^µ\ÛS\ë:\0§lu&\ÃûbuÎ´ýªh¦ý°\ÎD©Ó«\Ûw\ß}·×±T[RpMYDze\ä\Ùš÷Jzj¥ßºß¬„cB[«§’úz¬m)¿bÿù\ï^Ky¼´\Ï\Êð¯öþ’ýŸ:Ù¶r›•	\Z°\r¥\ÂuVœ^]]»vmm\Ûóf\Û\ï÷a†ªn\ç\nl]|ñÅ•z¿2(•ùXb\'8/Ï»Šˆ®4l÷\Ê\Ó\Ù|½Oûoe\è‡\ì:q¢~\Ô\ã?\îe˜)+A}\"ø˜8q¢w¢\ã\ïÿ»D2¿^x\á/x«¾–ö\Í:!¢6›\í\æÏŸ\ï´\Ö\É}•e ¶pO‹*Î˜1Ã»¯þ•N¦Á}nxqEõÁ\Î8\ã/h AZ\\O\'^\àP›\ÖqFAA*\ãý÷\ß÷ê¡¼\ã™T\Ý,ƒ\Õu	\Æ\Ò\Äe|e&{\Å%e\àÀkQ\ë€Fj3x`\ÑuÓ§Ooi;Àû\Ê\Ñ1ÑŽ2S2>²\ÄRHûr|?m+ð_8¬5ú¼º{	ª\ì-øQ‘@JIZÆŸ5\ÒÁ«–¶C\ï\à§ÁŠ\Ò\ëtðÑ€ü\Æo,~’Á™\'\íO?ýt\ïö€¼T\ë`}E\ã•b^$\Èo_\î\ÒK/õ^+\Z,t\ÒI\î\ÔS½h\Ý[o½\åi×€\æ‚.ðnë ­ƒ ¢\ÚZHQý\n<”•¦z¡Q\Ðvl ®©@\ïZ{¢.2\Ô\ïoÔž4x¶su@5?\\{\å•W‚Î–GÁÅ”ñ#zNu\ÊR!=Uqg¥J:Þ•tk[\Î\×U\Û1¥([p­»Cþ__\ÛwÿúÜ¹s¯·AJZe¯õ\â‹/zuž¦ }ðk¯½V\êÔ›½±\íy\í³u–n2¨À ³PÝ´ø\í\Üú.•\Î×‰\íÃ‹~^ýu­R<ðV;P_DƒqDQ™4i’\×R\æ(s+\Z¨\Í\\s\Í5^FûZDÑ ]\\0\Ñk•\r \ÇÕž\â){A\ëH8\ã ž²Ž8\â\ï¶ND*k,¸¯uJ\n*(#´]»v^OÁe–\êÿw\Þy\çyS\'Tô7W–úsÊœ°6>¼žl“\ê§\Åm“EÁ´2\ÕoM\ÂW¸q\å;\ÙKà ºY§l÷ÆªV[š6mº\Î6´\Ù\Ù\Ù\Ã¥lð\Ø\Ö:¥{ž”#ˆQ\Ñ×–u–GŸÑ¨¬\Ï(\Ç\ï\È\ÜKP¤<\Ï\ï­3WmE\Óu (\ïTU¡`™Š#A¦€\\:x\ï!‹ŠöHµ\ÖQƒyü4\Ï/ èµ¢\îø\Ã¼ASx^öØ±c½¹€¢(º¢\êŠÆ‹\0A0B;DM\Ì\Ð\çi‘¡`Z„\"ó\Ö!.þ4(«ÀA=M\ÃKF\ZHžoû‚ó€³\ïkiU\ÒY+*È¨	\è¿¦\"({ $\n\\ýõ\Þ6®Žl˜cjÿÊ¼Ñ¶Ÿˆ\é©¥³r5|V*<ø.n¾þ\ãñû\Ø<e¢•ðee¿•˜‘W\Úg•–\éfû\Ù\ë\Èç•–c\ßM¹/¶n¿c£ýŽ9Z¬«Q£F³‚`™\íŸÿŸmSlûªðtm\Õ>:<M!Lipð\ÑGUxº‚‚#FŒ\Ðz?½Y\ã\0þv~W\ÛuŸ‘\ë5™’¶sPG«òû{\ì±×•â©Ÿa}v¯¤ö¡,­\ÓN;­øù‡~\Ø%4mAy‰ýÿ¯{ùå—½6>1\îW)3@Yk\Zøk`¯\'šÂ A¨:9£}¼7\Ø\Ê\È(Î”\ÖñAûý\à~ ý>e\Ã\éÒªú\Û0\Ö\É \íÿµoP0ú\Üs\ÏÝ£/WQú›ôY7\ß|ó°T\Ý&\ãXiñÛ¤õ9\Û\ã\ÞÁ>XÈ»¦\èó\ãŽqj›uð–[\ã\êT›\Û!ü\Ç\ßF\Óõ¿¨/¸þýûg\ÚN¡2‹¿–\ã\ãKŠ\\~müCk\ëÿ§³üº¤\æñ\é\à£ü9¥\Ë)\n¯\ÔhE©5\ÐW2”e \×÷\è\ÑÃ›7¨û¿úÕ¯¼ŸAð@™š·\'>ø œR5\çOƒh`£¢3^:øiž_p þ&@D\Ô54¼¤Õ±*\é¬¥ —¶ù Ó¦3Tá¶¤`†!\r®¢ð\ÐCyg¯4@\Ó­0\Õ4\Å@AP!\Ñ\ÒS+JS*\â\ÎJ}o ^\ÒZ=%\r\Ìm»¶_¡Fÿ\ïYV¦\Úö5Ç¾\çñ/¸ÿþû_\Z8p\à®q\ã\ÆM·Ÿ\é\å\Í<Pp@gIuf4TÿÅ™Z°MSd”uP\Þ?ú\è£5£Gnl\Ûy‚(¥¥³µ\n¤5ô\ïg”g;¯	\á}h ¸š‚¶\í3\Õ?	¢ýtxA<õw´¿\×teT*°P\Zxµ µNÚ¨­ý\îw¿óN¾\èv8\ã@ûú\àXd\\™:Ž¨\íV\Ï\é5¢ý\Ø/ùK\ïó\Õ\ç\ÓñHS\ä”=Š\í\n¶I?hP\ê6™••µ(\èX¬\ÙU4-8dƒ:Ð¢E‹÷rrr:)¥³¶ÌŸ?_G\â÷h—‰\Ï?‹“[\Ñ@J\Ó\ÂÁ‚´šˆ¦——\Î\àk¾\"\éš?­+ehúþþgŸ}\Ö\ë j°® ‚ª\Z\ÔMEªuP\Ô`I‹ú(Nƒ-\r_f.>\Z¾¿·K\Ïi°¡‡€’\Z4Õ–J\ÃKF\å	\ÖDý6õ½t\Öc=¶\Öp:c¤z°=«-)[%˜›ªAYø,®dz½2‚õ>\nhŠƒ\ÎZ…%RzjEpÀ)qVªƒJ\Ùz\Ëö›o–g\Z\ÎØ±cg8°‡ýœ^Þ«+húL8\rVmC\Zd\è ú©c…¶Ÿ½ùò\Ë/W3&“ \ÊÜ\ÇR¼Vf;¯(\r\æuUƒ`®µ´X¡Ö‘\ÑmM¥\ç\ê\érˆÊ‚\Ô4/­E @«ú?:Ù¡A·ö«Ú¯ýe\'jõs\Ôw\Ðg¨½\èye\ë(Ð«,3½GŸ­¿.\Ýøè£zŸ¥`w¼\Ð>\\ûy½Ç¿º7•T@õÛ‚ŒK)´þ‚‚¢\Ï_\éÁ\ët\Ú\ïS\Ñ46?\æÍ›\çe†j…~­É ÷«M—8©\ÇÊ½M\Ú÷óžõ9zè¶¾\ÃSN9¥\Æþ(}~HÒ#“2p°iÓ¦l`p…u\ì\Òj\é\ZñùK–,QðZ\Úe½90†S\ï\Ò\\E\Ó\ã)@ ¬Ø«‹¦(J­ˆ\ìj\Ê4PJ›„#\íƒöV:\È\ê@\r4 \Òb?Á\Ô¥ú)`¡”9\Ñ\Õ‚l„£,ö7\é\0Púum\ÎQN•4¼d´—t\ÖB\Û´\Ã\ÖÆ^—8\Ñ:º”]@AuuV§,Ê¾‰\Ï8P\'±¤3º‰”žŠ\Z?f\è˜0\×ö\ÃÁ¢¹>F(x`\ßõ%6(™zýõ\×7(+x Á‘²¿Âe\Ìh9M	öÁ\Z\ÜhÚ‰2\ÆÊºì˜¦\'Ø€L\ë÷4@n\ç¡3Á\êoƒ\Òú\ê\Óh ®À¯¦y—¬Ö”\Ñ\Ù}M¿\Ô\ç\èRe\ãhªg°ÿVÀX—˜\Ö>]SD\Ù\nÀ©„\×Q\0`Ñ¢E\Å\ë\Øhÿ¼ay–\è¥\0\0\åIDAT\Ã¯\èý\n+p  @80 \Ï	2‚ÿcI\ÔvQ¦¨ A`üøñ^œ~wUU­\ÏÛ¤g\Øw­\ëwf\èû\ÖþRAš\ê¦i\nüq\Ôýw1\Æ\é\êÀ½÷\ÞûŸo¼q©}\ÙÿS\æ\í·\ß~\ÙC‡dgg\çrØ¨B©w5\ZM¯*\ÍÁ\Ó1¸†·2\ê<\Æ\Ïw\r~z^A\Ô4¥@‘{]s8L\Ó´Â°\n>3¼8¢9%-©³¦š\"¡ƒipù8\Ñ9Xõî€¾Skžøm*=QpU¡)	\áEEÁ6M{PG5Ü‘%=µ^¸Ã¶\í\\;FL¯Žc\Äc=öjÏž=\Ï~\ä‘GÞº\á†\Z–\Ö\ÇQp)<ø\ÐÀGiÒš««\Å5•Y\æ_v\Ì\Û÷\ëõ<ð€+\édK°¦\Ý\ì3eÊ”|¥¨\é\í¼¼”A£R\Ñ~Q<õ/i\nPü\"\ëjšZ:)£uo*J{£5qD\Ó,J\èŸ¯\Ã6Y¹mrò\ä\É+{÷\î=×ŽÉ§)X¤õ{«›‚»\Ö?‚óRa™‘¬ø¦M›nµõ¢\í2j8\ë`\ã„	·s4m´^tj5š^Y\ê*nö\ì\Ù^‡PS\riW:ž¢\îº\ì¢:ZH]6HS\ä”\'J\ÇÓ‚AZÿ@\ï:¨%M\n¯Ö­€BTMú:cªÎª\"\ëÁBFú\Í\r\æy£~ñƒ	€\ÓUA´M†3m´2¶Ú”‚_µ#]fQ\Ó‚vÐ¬Y³\â¯\ÂA‚pA\ÐQ%=5õÙ¾õ\Þ\êþL\Û7Ï±\í\ã‚q\ãÆ½z\Ýu\×e\Æ´]hŸ«}ox¿\ì»þ\ÉO~\â¥Zk{\Òö©à²®\0d«X\Ó\0uµu¼Mª£ê­š©À²²ªs­dx\ã7Š³\r¬?ôT*\Ô{\ÒÆ?mÀ€wØ—\ÝE)œ5e\äÈ‘\Ê6èœ———M3MùA\Î\åµM¯(\rjnº\é&o´þ\Ê\ÐB<ºL‚\êP\ê\ì¤:‰Z»@g¡”\æ¬Á²\0\ÂWNP°@¯)  \Ï\Ñô„ø•\æE\ï)k ¢\Ó\äÉ“‹Ó¨\Ã\é^J¯\ÓYSCý‘\è8e\ÙhÁ\ÎðÙ¦ð•H\Zì‡·gt?~f\r\Ì\â§*žŠª˜2eÊ¬Þ½{ÿf\ìØ±¯<838[ª\Ô×’V˜¿ú\ê«÷¸¯•ð\ÜZ4ýLÁ…`›V¦‚v³\×Ô©SgQ\ë\0\ê\Ñ>vFVV\Ö\\»\Ù]Yšö;lØ°j¹Â‚¦=ò\È#…6~\Îl\Ï[½zuJŒ##\Éü\Ç\Û\ÞÁ:kŸ\ßr\Ë-K\ZðT\Õ\âÅ‹_¿ÿþû³å©¶}A3Ci\Þy\çhp\ÕÔ½¿ý\íoÊ¤ˆPµ¾O¾]©ƒ\Z5ªT\0ŽvD;Âžzö\ìyšµ§7˜Y£ \Ó@A)¨i\ÐGb\ß^û,\ìÇ‡V¼4Bˆ\ÓZ`U	(h0v\ìØ¨!ƒú\Ýjý¢Ÿ¥\Ê82©ó5Wd×®]W\Z5j{u_ÿû›o¾ùûƒ>\ØÕ¾\ì!\r\0 \\û\ä{m9)‘³v€d¢i;w\î<\Ï:¢ùüqµ\\ZAƒ1c\Æ4\Ôô‚\0\êqŸ%7\Zj•doÞ—WÖ¦T†\Þw\çw†‚\Êf¾&•Æ‘I?QrÒ¤I“·n\Ýz\Ý\í·ß¾uÉ’%\Õò™\Ê4:t\èA………O¨L\Ó\0\0u<\ØY\Õ\àA0=Áú7}Y\Ó\0@}gûAM!¸*hz\í­·\Þ\êMÁ\ÕÔ°ò\Ðë´–\Ø-·\Üý\æ›oŠÞ‹F£·¦\Ú82%VX²/÷\ÙM›6]u÷\Ýwo~\íµ×¶i®J%m´\êóšžPTTt—mLÒ¤\0\0@]¬os±‚‹-ªT\'G™þ\Õz4\0€ô?oƒü\Ëýõ™¼\Ër¾ù\æ›\Þú\\ZÿKWGR6\Ö MGP€aþüù\Þ\å=X¤µ\Æl\ìX<=Á\Ê©8Ž\ÌH•ÿˆ\"FYYY\ØÁuüÌ™30`@‹£>ºq9ßžÿ\Î;\ïÌ˜8qb§‚‚‚N¬i\0\0\0‰¿`\â\Å#GŽœ>hÐ ?ý\éO–÷½\á…™ž\0\0%#mø´.\Ó.\\è•½ŸˆŸgŸqUªŽ#3R\é?\ã_óWö\Å÷°\ë5\r6\ìr\Øa‡}×­[·f;vlØºu\ë¶ZE{ÇŽk6nÜ¸\éó\Ï?_2oÞ¼ô%K–t¶C\×\Ìz,//o\ÒÜ¹shB\0\0 Ñ‚={ö¼pÌ˜13\r\Z\ä\Ê<P\Ð@™þ%	\Z\0@\é\ã\È\Ó5Ž´Áÿ€h4Ú½c\åyVÆ§ú82#E¿x]3|zŸ>}\Úú\é§=-Zt¢\Ý?ÖŠ\ì\Òõ·t¬\ÝVt}Í¿X¹\Æ\ßX\0\0\0–¦-(x0zô\èW\r\Z´û\ØcmZ\Úk¿üò\Ë\Õ#GŽTŸ§\Ó\0 b\ãÈ¢¢¢\Ñh4G¶õÇ‘\ZO®µ²\È\Ê{zm}Gf¤ònò\ä\É+\í\ÇX¿\0\0\0¤Dð w\ïÞ—Œ3\æ\åÁƒo>\æ˜cZÄ¿Æ¿zB¦uzuõ„\Ô\Z\00Ž¬Š4ª\0\0\0 ¹h\ÚBAAÁ£FŠ|øá‡›\ÃÏ…¯ž@\Ð\0\0P\ês\à u\Üÿ_©|\él\0\0 (ó   à¢±c\ÇF,X°AÅ­iÀô\0@µH¥©\n?±¢T½¢ž\Ó\å1tù¢B·\Ò\Û\Å\æ©\ÈCVt­\Íyl\0\0 Y‚={ö¼hÌ˜1¯¶o\ß~óÊ•+›F£\Ñ\Þ\r\0\0\Õ)•2:Y9\Þ\Ê-V.õoŸie´û\'q¯/\n\rX\èle¾•k\Ø,\0\0@2¢\Ñ\èk+W®l¡Ÿ\r\0\0\Õ-•2^ñ*²À\ÅV¹<\ÈÊ~ð p’•V³2\ÓÊ‹VV¹\Ø\ÕLPfB+Ï³y\0\0€d‰D¾\nÿ\0€ÀAÕ¼o¥••&.¶\ÎAs+ƒ\\,ˆp‹²¬h1¡l\"\0\0\0\0€ú,U?´òV´ª°¦œc\å;?8p¸•iþ\íQV\Þu±)·Y¹\Û\Ê\ßý Áj\Ë<Èµòg+Ý¬\ê\0\0\0\0 p–øÁ\0\ç¶²\ÆÅ²\î²reèµºr\ÂñþÿýP›¶Ÿ]°\Ý\Ê\Ø<\0\0\0\0\0õ]*NU\Ðôƒ5e<¯5ú¹Øšÿð‹ºØº\×\Ø4\0\0\0\0\0H­«*\ÈyV6•\ãuË­¸\Ø4†],p\0\0\0\0\0\0\â¤J\ÆAC+7Y\énå‚¸ÿ_üÿñV&[fe‘•}­´u±)l\Z\0\0\0\0\0¤NÆ.£¨,‚³¬\ì=žo\åoq¯\Õ\î°2\Ï\ÊV+K­ü\Û\Ê_Ce›\0\0¨eý\Êx®‹‹$\0€ÀA%i\ÚÁ$?€¦+%<÷\Ø¬|÷\ØV>\r•l\Z\0\0 –©?rˆ•H\Ü\ã\í¬¼\å÷a\0\0¨uT\0\0@BÐ¥£u5¨ýü\ÛZ\ÈYW~z\Ý\Ê+¯RE\0€º@\à\0\0\0 n)TY“yV~\ë?\Ö\Â\Êh+c]lm¦qT’r\ãNK‹E\ì\'•Q\Ç\ì{Xf?¤&P\Ù\0\0\0\ê†d^l\å\ÏV:ø\åR+[ù\Ò\Ê.võ§aT’Qff\æ·[¶l¡\"À†\rr\\lqx \Â\È8\0\0\0¨;»­ae+Z™\èbg»¹\ØZM\Ò\ßJ¶•^V¦ReH&\r\Z4˜·iÓ¦‹[¶lIeÔ±¼¼¼\Íö\ã_\Ô*ƒŒ :\ZR,\rŠH\0~\Z^5A;\í(‰4·²\Ë\nœoe¤•Á.v%¨ýý\×\\o¥#U…d“ŸŸÿ°\rXwG£Q*£n\å®_¿þ(ûù2U@!\r/q†G;\í(	iADe\Z<á—“],\ë\àIÿþ±V&XyªB²9ù\ä“D£\Ñ®ZµŠÊ¨C999\ï\Ø÷°\êô\ÓOÿ€\Ú\0 ŽøixTDð\Óð\æR´#ÐŽ’ˆ¦+\Ü\àb)Äº,´‚6ŸXy\×\ìc%\Ë\Êÿ£ªŒv\ì\ØqYnn\îöÍ›7Su`Ã†\r¯­_¿þ¼¢¢¢A\Ô\0uˆ4¼„A\Z\í´£dö_þa\åC+k¬d\åF¿\ÐoCR:ó\Ì3¿°A\ëŸþù&‚µ4\È\É\É\é‰D®²\ï!‡\Z ‘†—HÃ£v”¤ò­Œ÷ƒ·ø\åf+\×X\éi\å+\Û\\\ìòŒ@R:\í´\Ó\æ\ìÞ½»Ç§Ÿ~ºyùò\å\ë	×¸\\ÛŸ?½xñ\â\ã\íö\rVÿoR%¨\n®ª\0T?\r\ï\ã\æÍ›7iÑ¢R\ËBix§S´#ÐŽ’\Ìp¿”\åa[û\0H\ê\àÁ\ìÙ³·ýü#+V¬8z¿ýö[Ù¦M›Z¶l\Ù6--q\Ïg®]»Ö½ÿþûî¤“Nrö÷&\ìß©…mµF¦›)s,\Zv\ÔþœLT‡U\0TŸ9s\æœÖ Aƒ\é‡~xK=µ;\ØQ\Zž#¢N;\í(u\è»Xº¯u°òyI/\Î\Ê\Ê\Z\æb‹,\Ï\Î\ÎFõ!Ñ½ýö\Û]#‘\È\Åv³»‹-\0š™¨\ëÂ…\Ý\'Ÿ|\âŽ>úhw\Ì1\Ç$rµ\êj8Z#e®•—\É Á=\ÚYr\È!tPk;(R)5Gix\ï\è©\æ\î1Ø¡v”ä®°òœû}+\'…ž»\ÕŒ p\0\Ô.\ÚÀ\Z@µS\Z^aa¡\Òð>š?þwK–,ùdÃ†\ry\\Ÿ¾z(\roÝºuo}ö\ÙgS\Þÿý\í6\Øñ\Òð\ìÐŽ@;JýC·\Ã+\È)Û »•1T\0 .°\ÆP´z°~(\roõ\ê\Õ[Q‡¯•K\à4¼$¢k›\çb—-{”4<\ÚhG)dk	\é$\Ïd[¡€*\08\0R\Ìgœ¡yf‹¨	€vT‚ùÐ¢ˆš¾0Ÿ\ê\0\0\Ô\0\0\0u\ëN+M­t¶r›•5V~deœ•¡þ}\0\0\êk\0\0\0Ô­w­¼ee­‹]5A«¦»Ø•.u,f\r\0¨c\0\0\0\ê\Ö2+ÿ°²\Î\Ê+Ï¸\Øú\'º\ØÂˆS\é³\0\ê!\0\0€º¥\Ë.jÊŽq}³.6a±•û¨& Jú•ñœ²{n¢Š€\Ò8\0\0\0¨[/Zù…•¹VfZi\ãöœžp•Ó­AU•v…•C\Ü÷§þ´s±©Bÿ¡Š€Ò±8\"\0\0@\ÝË·ò+=¬ôµ²o\Üó\Ê8¸\Ö\r€Škb\å.+ûù·_q±©A¯[a\åUª(\0\0€\Ä1\Ýÿ9!\îq\rpfS=@…)Ãº\ÈJž•\ßú\éR§£­Œµ2\ÙÅ®``/\r	\0\0\0‰e]\Üý¨•\íTP!\r\\l?[\é\à]©\äq+_Z9Ào[Ã¨* ld\0\0\0\0HE»]lmý­\\he¢•­t³²\ÚM+\ÙVz¹\ØL\0”€Œ\0\0\0\0©ª¹•].8\ß\ÊH+ƒ­´r±€‚\\\ïbW5P\n2\0\0\0\0¤*-ˆ\Ø\Ù\ÊÖ¸ÇŸ´\Ò\Ð\Êý.vå’»©* t\0\0\0\0¤*MW¸Á\Êe.–yõ\ËF+k¬\ìc%\Ë\Ê&ª\n(\0\0\0\0©\îH\ÄÅ®¬p•s¬,°2\ÜÅ®¾\0 \0\0\0\0¤ª|+\ã­\ì,\á¹&Vº[¹\É\Å.\Ï8\êJF\à\0\0\0\0@ª\Zî—²<l\ådª\n(WU\0\0\0\0PŸt‰»¯u\ÖR-@\é\0\0\0\0HuW„n?÷\Ü\ï]l­\0¥ p\0\0\0\0 \Õõ\Ý\Þº­lƒ\îV\ÆPE@\é\0\0\0\0Hu[KMv±5\n¨\" t,Ž\0\0Dzõ\êuK$y ”§\ï\Ê\ÊÊº+\î±\á\Ù\Ù\ÙÃ¨9`º£E|\Î\Ê|ª(\0\0€$’––¶(\Z–ûõ‘H\ä+j\rõØVšZ\él\å6+k¬ü\È\Ê8+Cýû\0öv\ì¡\n\0\0\0’Ç”)Sf¹r®\0F76j\Ôh:µ†z\ì]+oùm\æs++\é.ve…Kýû\0ö‚Œ\0\0€$FgD\"‘+\ËñÒ¹\Ï?ÿ|>5†zl™•o­¬³2\Ã\ì7VzX¹\Õ\ÊT+YVŠôDE§eggx@½@\Æ\0\0@ò¦–ó¥\ã©-\Ôs\'YùÀJÇ¸±\Ï›Æ°\Ø\Ê}Åƒ£´´ETð}\0\0\0’L“&M\æÙ¼½¼lk\ãÆ\çQ[¨\ç^´ò+s­Ì´\Ò\Æ\í9=\á+§[9Bwü©@›\Ëù\Ù+©^8\0\0\0@Bò§\Ì\Ú\ËË¦\Û\ë6R[€S{ùƒ•§­ôµ²o\Üó\Ê8¸6¸STT´·uAv\éŸh4:‹ªE}Á\Z\0\0\0\Éi‚•þe<ÿU\ìaz¨\í„i\íƒÙ¡ûS¬ü¶´‰F£…‘HDW,™L•¢¾ \ã\0\0\0 	\å\å\å\Í\ÓUJyzkff\æ›\ÔP¢uñ±\0+Ûƒ;þT õ¥½9‰4¶k\Õ©J\Ô\0\0\0’\ÐÜ¹sl\03©”§gq5 rü¶Sb\ÆN4\Z-ð\ÎP¤¶P_8\0\0\0HR6x™]\ÊSS© Jž-\åqï²iii/SE¨O\0\0\0$©5k\Öhq¶=Vv\×ô…\Ì\Ì\Ì9\ÔPyþ4„mñG\"‘†js«W¯¦¡^!p\0\0\0¤üT\é9q›9\\M¨–¶õ\\\ÜÃ…úGWS`š\ê\0\0\0\Ém\âY\é¨ñS\ì~Ô¿ùjõ\r\0\0€$–™™ùAø~£F¸¶<P\rü©@\ß÷#‘ˆ.e¿¶¨¨ˆ+– \Þ!p\0\0\0\Äü\à¿ð\ï\ær5 zø\Ó\âq³¦M›¶•\ÚA}C\à\0\0\0 \ÉE£Ñ¾‘H\ä¯V.§6€jµ\Ç\Õ¬q5\ÔKT\0\0@r›:u\ê‡ö\ã—\ÔP½4(?ÿ¿I<\Z5šK­ >ŠP\0\0\0É¥OŸ>\í\n\n.ŒD\"§\ØÝ®V\ÚZifE#œ¼h4ºÈžû{zzzö\äÉ“WRc@•\Ú×¡.–©­\Å—Ñ¾@\à\0\0\0\0	«w\ï\ÞÚk­œlƒ—†\å|\Û\\äŒŸ2e\Ê$j }\0\0\0RPVVVœ<iƒ™3«ð1ó\n¯˜6m\ÚW\Ô(@û*‚À\0\0@\ëÕ«WVzzú\ãEEEû\Ù}w\ä‘Gº\ã?\Þu\ê\ÔÉµj\Õ\Ê5o\Þ\Ümß¾\ÝmÜ¸\Ñ\å\æ\æº¸…ºÝ»w‡?n«\r®\á\ì(@û\0\0\0¤Æ \æÜ´´´\Ñh4=\Ðüú×¿vgœq†\Ûw\ß}÷ú~\rr\Þz\ë-7s\æLWXXø\ß`$r•\rnž¡†Aû¢}\0\0\0’wP“eƒšIÁ ¦]»vn\àÀî ƒªðg­X±Â7\Îû\Z\Ü\\Î™QÐ¾h_@y¤S\0\0\0‰Es®\Ó\Ó\Ó_·AM\Ý\ïÜ¹³»\í¶\Û\Êu´$-[¶t\'žx¢[ºt©ûö\Ûoƒ‡\Ï\èÒ¥Ë«999k©qÐ¾h_@YÒ¨\0\0€ë ¥¥=Ì¹Ö™\ÐÁƒ{s¬«¢I“&ñgT›\ÙÀ\éij´/\Ú@\à\0\0\0 ‰\è’p6¨ù•nkÎµ#UÔ„7\×]w÷¹¾nöû.£\ÖAû¢}\0\0\0’ÇµÁ\r-\ÔV™9\×e\Ñ\ç{\î¹\Å÷£\Ñ\è\0ª´/\Ú@\à\0\0\0 	ô\éÓ§½ý8U·ƒ\Þk\ÂYg\å\Z4h\Ü\í¦9\ß\Ô>h_´/€À\0\0@‚+((¸0X\åý¨£Žr­[·®‘ß£\ë\Òs\Ì1\á‡zPû }Ñ¾\0\0\0\0	.‰œ\Ü>\î¸\ãjôw\Å}þ)\Ô>h_´/ 4\0\0\0G\×\àÆ¡‡Z£¿¨C‡%þ^€öEû\â8\0\0\0HmƒJw®IqŸß†ª\í‹ö”†À\0\0@\âhÜ¨®KÄ•F—ŽÉ¤\êAû¢}¥!p\0\0\08¶7¶l\ÙR£¿hûö\í\á»ùT=h_´/ 4\0\0\0G^pc\ãÆ5ú‹\â>-U\Ú\í(\r\0\0€Ä±(¸ñõ\×_\×\è/\Ê\Í\Í-ñ÷´/\ÚÀ\0\0@‚ˆF£\ï·,XP£¿+\îóß£öAû¢}¥!p\0\0\0 222fØ\Ýþô\ÓO\Ýúõ\ëk\ä÷(ú\ã?Ž†šN\íƒöEû\0\0\0$¸É“\'¯ŒD\"su»°°\ÐÍœ9³F~Ï¬Y³\\AAAÄ¿;/;;;—\Ú\í‹ö8\0\0\0H74°Y±bEµ~¸>\ï7\Þ(>j©§¨rÐ¾h_\0\0\0€$1e\Ê¥S\Ï\Õm;vlµ]:N—ˆ{\ä‘G\n‹ŠŠŠÏ†®^½:›Z\í‹ö8\0\0\0H.W8ÿn«V­r£Fªò\àFƒ\Z$E¿ù\æ›tÿ¡­‘Häª¹s\çPÝ }Ñ¾€²¤S\0\0\0‰%\'\'g\ãG±\Â\ÚÝ´u\ë\Öi±5wøá‡»–-[Vøó”>ý\àƒ~õ\ÕW\Å\'\ì³7eÊ”w©mÐ¾h_\0\0\0€$ô\ÙgŸ\åyä‘š€}®7:#ú\î»\ïº;v¸ƒ>\Øeff\îõ3´ºûŒ3\Ü\ã?Ý¼ysñ &\ZÞšý8µ\Ú\í(U\0\0\0¸zõ\ê•e?žˆD\"­‚\Ç\Ò\Ó\Ó\ÝQG\åŽ;\î8wè¡‡ºV­Z¹\æÍ›{\é\Ò\Z\Ì\ä\æ\æzgP­\íÜ¹3<5u«•\ëlPó<5Ð¾\0\0\0\0)\"++«ƒ\rlžŽF£§U\ác\æi\Îõ”)S¾ F\ÚP\0\0\0’g€\Ó\Ã\'l€\Ó\Ý\îf”w@ce|^^\Þ$jh_\0\0\0€z OŸ>í‹ŠŠz\Ø\0\çD»{¬•¶V4);\ß\ÅV‹_d\å=+Ó³³³s©1€ö\0\0\0\0\0\0\0\0\0 žjT\Âc\íöòe–¶§\ê\0\ÚPUiT\0\0@Â›m¥a\ÜcŠ»¯T\ê\Æ.67[¥•I¡ûþ\0©!\Õ	Ð¾€ŠÈ \n\0\0\0š\æYÿ\Ý\Ê.+Ç¹Øœ\ëB›w=ÀJº•V~`\årÿ¹À¡V\Æ\Çõý4 zjh_\0\0\0€\Ôp…•!VÎ±µòOð²Ñ¿­\ÍwV>²²\ØJ\×\Ð\à\æGV^ôo\ëu[YC•´/€À\0\0@j\Ð\Ù\Ðc¬Œ°\Ò\ÑÊ….v\æSgG·[Y\æb)\Ó\ëü\×wõ@	\rfšú·me€öTT:U\0\0\0°VZy\Ê¬\Ü\é÷\Ýþh\å§V¾u±\Ô\êŸ[\Éu±³¢ÿce›‹ý—•s­\Ü\å\ß>\ØO.\Õ\nÐ¾€Š \ã\0\0\0 q)uúVò¬i\å+;\ÛYzVwÿÌ¿­\Çc\åx+ûZ9\É\Ê.v&T+À/¦J\Ú@\à\0\0\0 u4ð\'\Z\ä[Y\êb‹¯½\æ:+\ïø·\çø¥ƒ•±þ@¨…•¬¬§:\Ú\0\0\0€Ô¤Ë¼u·rˆ•\×\âž\ßWªµV‚\Ë\ÊþþsG[y\Û\ÅÎ’ }F\Æ\0\0@\â:ÁÊ­.¶P\Û?¬\äX9\È\ÅÎ‚ö÷j\à¢EÞ¦[9\ß\ÅV~Wšõ\'VzZj\ån+÷X™G\Õ´/\0\0\0\0É¯¡•´¸Ç´˜\ÛQ¡ò„ÿ¸Î–\îz5\ã\ãÞ«k\Óÿ\Õ\nÐ¾\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\É\ãÿ\Â\Î\Åc‰FXs\0\0\0\0IEND®B`‚',NULL),('40005',1,'var-canWrite',NULL,_binary '¬\í\0sr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0t\01t\02t\03x',NULL),('40007',1,'hist.var-canWrite',NULL,_binary '¬\í\0sr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0t\01t\02t\03x',NULL),('40020',1,'var-canWrite',NULL,_binary '¬\í\0sr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0t\01t\02t\03x',NULL),('40022',1,'hist.var-canWrite',NULL,_binary '¬\í\0sr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0t\01t\02t\03x',NULL),('47502',1,'test1.bpmn20.xml','47501',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"${agent}\" activiti:candidateGroups=\"canWrite\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <userTask id=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" name=\"ä¸»ç®¡å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" sourceRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"609.0\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"795.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"960.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"831.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" id=\"BPMNShape_sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"74.99831278471224\" y=\"52.22497469177069\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"54.25\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"629.5\" y=\"71.5\"/>\n        <omgdi:waypoint x=\"629.5\" y=\"116.92970092290889\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"648.5441860465116\" y=\"52.455813953488374\"/>\n        <omgdi:waypoint x=\"795.0\" y=\"52.11600928074246\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" id=\"BPMNEdge_sid-AAEE5013-74E6-4835-933E-07312A14B86B\">\n        <omgdi:waypoint x=\"310.0\" y=\"55.0\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"55.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"845.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"845.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" id=\"BPMNEdge_sid-911C3373-8840-490E-81A1-DCCE9D636DCA\">\n        <omgdi:waypoint x=\"895.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"960.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" id=\"BPMNEdge_sid-5F14346F-77BF-4773-8014-AA2502CA4612\">\n        <omgdi:waypoint x=\"520.0\" y=\"54.056603773584904\"/>\n        <omgdi:waypoint x=\"609.3703703703703\" y=\"52.37037037037037\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('47503',1,'test1.test_process.png','47501',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\æ\0\0\0­\0\0\0=e\0\0&*IDATx\Ú\í\Ý	tT\Õ\Çñ\ÔZK­µÖ¶Zk-µVk­µ\ÚªµV±\ÖÖ¥V«Ái&‰¢¬ÅºŠ\Ð\0‚AP±ÑŠ©+HÅ¥‚Š\Ò([ƒ;Š  !‚! k2·÷÷ú^\ÎËIf’™\Éd\æû9\çžÌ–dò2ÿ{\ßÿ\Ýÿ»/+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cL·U«VU¼ò\Ê+f\îÜ¹fö\ìÙ´$·9sæ˜—^z)d\Û$>‘\0\0\0\0a””/X°ÀTWW›;w\Ò:©mÜ¸Ñ”••…l’~+ŸJ\0\0\0\0\È š)\')O\ä|ö\ì\Ù;ùTH[”iQ¦\âˆ8€=©?\')N¦¾žO%€´E™eZ Žˆ#\0Ø“AúVs\0H\nÊ´(\ÓqD@ûó­uŸ˜Uo<h–\Í\í4\Ý\Öcô\É$\æ\05Ê´t@G\0Ð¾Ä¼¾¶Ò¼ûü³ä¹¡Íš\Ósô\Éô\í\0×£Á4G\Ä\0úö\æ­b\Ù3{$\å^[·l&}2};\0\Ä7¡ L‹A\Äq€¾½y{þ-s=GŸL\ß\0qt(\Ób\ÐqD oß³½;{d\Ä\Ä\\\Ï\Ñ\'Ó·@\ÜÊ´t@G\0\è\ÛI\Ì\é\Û Ê´t@G\0\è\Û÷l:-)Rß®\ç\è“\é\Û€£Á: Žˆ#\0H`ß¾¢ü®ˆ}»ž£O¦o\0\nG\Ä\0$°o¯©\\j\Þ}¡p\Ï~\Ý>¦\ç\è“\é\Û nƒeZ: Žˆ#\0ô\í-·\ÕoNÙ£_\×cô\Çô\í\0\×A‡2-G\Ä\0úöÚŽf\Å\ÂI{ö\ëö1=GŸL\ß\0qt(\Ób\ÐqD o\ßó2˜\Ë\Ë\ïŒx\ÐU\Ïq9Lúv\0ˆ\ß\Ñ`Ê´t@G\0\èÛ›f\É?Y1Ï¼SzcÄ¤\Ükz^\Ë\ì9};\0t<¡ L‹A\Äq€¾½\ÍYrf\Ï\é\Û !	eZ: Žˆ#$Aw6ºB\ß\Í,yk³\çô\Ñô\í\0[BA™ƒˆ#\â\É1\Ü6\ã~RºoooR\î5úhúv\0ˆzÐ¡L‹A\Äq„$¹Ö¶m‹Ü¯£\Ø$Hùƒ®4úv\0HÆ C™ƒˆ#\âILÊ½d\\3\æ$\ç 1§Ñ·`Ð¡L‹A\Äq„\ä\'\åm=˜Ó·Ó·`Ð¡1\è€8\"Ž\'\Ã\ÛH¾½\ç9\çô\í4úvtc\ÌK—.:eÊ”ºq\ãÆ…®º\ê*Ó»woó\ç?ÿ\Ù\ä\å\å™Aƒ™aÃ†\í¾\å–[V?þ,¶tt@Ñˆ£.–”·•t3súv\Z}{;\ä\æ\æö\ÛÜ±\"\'\'g—ý\ZR\é¶Ý¶­·m¦^\Ç\Öj%!ò\É\'?ºé¦›\Ì5\×\\cJJJÌ«¯¾j*++\Íö\íÛ\èkuuµyë­·\Ì\äÉ“\Í\ÕW_m¼»ÿþ±Á Ã \âˆF¥°k³b›	õõ\0};}{Æ²Ix‘M¸k\ìW\ãK\Ä[möµµÁ`p[\Ï\Ç&\àŽ3\Æ:\ÔIº\Z\ZL´/^l®¿þz3`À€\Ù\Ù\Ùg°5Á Ã \âˆ8BŠ&\å£\Úù}$\ç o§o§oo9!?Å¶\Ñ&\ã\Ú\æŒ\Ï#m^\Ý\íé§Ÿ®8p ™9sfL	y¸\Ò\ÒRÓ§O\Ã\ì9tt@GHƒ¤<^\ßÐ·Ó·§¥@ Pý¥\ê&77\×™yóæ™µk×š-[¶8¹\âgŸ}\æTb———›‰\'šüüüð\ä<”±³\çJ\Ê\çÏŸ¿õ\Ê+¯4Ë—/7ñ°f\Í\Z£$¿oß¾ñQƒƒˆ#\â¬­…Þ’ýs\0úvúötI\ÊGù\ËÖ•O:\Õ9\í9\Zµµµ\Î\ëõ}a\å\í“3ncj¦\\Iy´/Zúyýúõq¾\0tt@GH¤<^e\èÌœƒ¾¾ÿOÊ‹ýIyAA3;\Þú>N\íO\Î3*\Ô9\åšÙŽ\×LyK3\çùùùJ\Î\Ï\á£G\Ä’,ü\Üð½l»\×ý\Z‹ð\ï\ãœsÐ·Ó·g4S\î/_/,,l*Wo/•¹;6¼¬=ýóH­¾>zôh\çœòDš5kV(77·ž/tt@Gè„¤|”/¹þP»@\î\×h“óH\ßGrúvúöLN\Ìkü3\åM\Êý\Éy\Ø\Ìù\æ´ß˜Ó§O_­?z×®]&\Ñ\r\Z\ÔHI;tt@Gè¤¤\\\îu“kCr\îOÊ½V\â{žs\ÎA\ßNßž‰Iy‘ÿœòö–¯·V\Ö\î?\ç<­óHÍ–\ë:\åº$Z2,Y²\Ä0kG\Ä’ R²\ÜR’\ÝZr\í\ë9\çô\íô\íMzö\ì\Ù-\Ý?“ºN¹—4k\á¶D˜6mZfÌš/]ºtª|\ë\Èe\Ñbuù\å—7\ê\\ºW0\èP€8\"Ž\ÉE]tœ\Ý	›c÷\î@R>¼ƒ\Év¬I<e\íhWrc?\çƒ\è\ÛÓ£o·\é\Îq•••õºØˆ#ž\éŠ	z4Ÿ\É\Ü\Ü\ÜÞ‚ošÕ®©©IH\î¨\Õ\Úý—RK\Û<rÊ”)u÷\ÝwŸI¦‰\'n³u&\Ýpf‰¶Sb\Ð!¡\0‰9q\ÑÎ—v\Â@È¶RÛŽŠò[£MŽ\ÛJºcM\Êý¿¿1‹™sDŸyIGýœ÷¥o\ïº}{EE\Å\Ü\íÛ·7\å=;v\ìÐŒ\ï®+®¸\âütûL\Ú\Ç÷^7~üøD\çþYóô\Ì#Çzõ\ÕW“š˜/\\¸p·Ý Ut\Ã7\èlV\0÷\î\Ýû\0\n\n˜Gˆ\"1?\Ø¹·½~ñ\Å_ERmR)ùÞ»I¹‡s\ÎÑž$\Èk[š­¤oOÝ¾½¾¾¾Wuuõ\îHùÏªU«LQQ\Ñ{m\íw¥Ï¤}¬\Â{¾¬¬,¡ù£ª|\ï%=óÈ«®º\Ê|ò\É\'IMÌ«ªª\Z\ím Î¸Ag·[~¢ÿÿ#‘:&\n´\ZG”;G™ž°x\í\ãôöž\ã\ÝRr¾³IyG\ßøœ7\ÍVúû|úö\Ô\ëÛµ^\×ÚµkW566¶™…B!SZZ\Z*((ŸIûu—÷x¼}WYY\é\é™G\Ú\ä\Èø\Ë-’A¿O•n8\ãf>\Z\Ã{·Vr$¡ ¡@»J\Ê‰£LOXšfq\ÜX\è\èuK\ÉyG’òð\äœs\Î\Ñ\á\Ïy\"úv\í—û¿FjŸ~ú©Y´h‘s	«\Ö^§óŒÙŸ*|þù\ç#>¿m\Û6\çÐ›6mjzlÍš5fñ\â\Åq/¯¿þº©««Åš\é½Mš4iS§\ç¤\äg\Ò?^—Hk\í\Òiþß—¶Agÿ\ç\êü1]8\Þ6g6Ý]UÓ‘˜¶m·M\ç¦oµ­^e\Ñ6©«uwNõÁ\Ø`\Û\'öö:ûu­m«\íó+\í\×m{Ï¶w\ís‹\í×·\ì\ã¯Ù¯m[`\Û|ûølûu–}ü\Ûf¸\çK<boO¶_\ï³÷\ï±_\ï¼ø\â‹o·_\Ç\Ù\Ç\ÇƒÁB{ÿ{{ˆ}þJ{{ }\îr{?\Ï\Þ\ïeŸ?ß¶s²³³\Ï\Ð9rZA‹\Ø\Øvt~~þ\á^x\á!½zõ:°ÿþûŽ9r\ïtô?NBABv\Å\åŽ\ÄQB\Ø1jU6]r\É%‡j\ç\Ñ~\ÖN\È\Ë\Ë;\Ù~\Þ\Î\Ô—ó—\éó§±Pý¸}ü&\Û&hÌ´Ý«q\Ô\ÞTc«m\Ïi¼µ__´Ï¿b¿¾©qÙ¶eöör\Û4n«,r½}¬\Ú]\é·.ŠCo?B\ÛxQÿl\Ç\á3\å;\Ý\Ç;bQ´\ÖZ‹w\ß~ÿý÷›¯}\íkNÒ­\Ïûœ9s\"¾ö²\Ë.3_ý\êW\Í3\Ï<\ã¼N\í¥—^\Ú#\Éÿ\Îw¾c&Ož\ì\Ü8p`\Ó{·û¾\æñ\Çw¿ë®»\ÌYge\Î9\çs\Æg8{w\Üq\æ§?ýiSûñl>üðC§\Ý~û\í\Î9\Æjgžy¦\éÖ­›¹\í¶Ûš\Óó|ðA\Ó{\Ðß¢\ïó\Þ×¸q\ãÌ¯ý\ë¸n;\Í\à;“µg13}o:}6“?¦\åNÞ¥—^šôómÛ¶93§\Zô\Ï>û\ìým0\äüG\Øö\rþööI6\Ù=U;\0öþ¹v`¿P{\0öv¾Žº;\×\Ø\×\\kŸ»\Ñ>>Ò¶›µC`Ÿho\ße_Wbo?`o?loO³·Ÿ°·Ÿ²\ßó¬ýú¼Vzµ­Ì¶—µ“`_ó†m\Z<—hGÁ¶\ì\í¶}d\Û\Zw‡¡\Ò>^¥{ÿS{“v\ì\í\Í:``ÿL\ìWL\Ø\é–x\è\0CƒfŒ\ÝYc\ï D¤w\È=Pá½¾Á\ÞwR\Øû;ÝŸ­ƒú][\íc[Ü½½§j½G½W÷=l\ï¯\Òß¢¿\ÉýÛ–\Ú\ç\Þ\Öß¬¿Ý¶rwgi®¶¶‘mO\Û\ÛOj§J\ÛP\ÛR;Zö{\î¶_\ïpw¾n¶÷Gi‡LÿýOô¿±÷û\Ùû—\ê¦ÿþ‡Q\ìT\éï¹™„‚„+-#1O\Í8²c\Þ~\Z\ïtp\Ööw\Ç\ÚÿÙ‰övš\â\Ú\Û\Ù\Z\ß\Ôw\Úv•m\×i\\SU‘\Æ4]·\Õíƒ§j,Ódõ\Õö\ç\Ì\Ó¦\ÎnŸþŽúy÷À´úþuî˜¥8\Z#4Vmµ÷·¹½w¹\ãK£»ÀZ(Âófc‘o\Ú\êþ\ÌM\îŒ^•{€|m+\Ý1G\ïi‘m¯\ê½\ê=k!71\î\ß2\ÕÞ¾\ß[&\êov~_\ën‹HŸy¯\Ùv˜rgµ½\n;3\æè’“\Ú\ÏòÐwß®Dù ƒrf;õY\ã7öx\Í\æÍ›\Í_þò\çù\îÝ»›_ý\êWN;\à€ÌhÖ¯_\ßô\Ú\éÓ§;)\Ñ\×ý	&˜‘#Gšë®»\Î\ì³\Ï>\æšk®q_°`\Ñ\é´|°ù×¿þe~û\Ûßš!C†˜«¯¾Úœt\ÒI\æ¹\çžs~\ßò\å\Ë\Í/¼\à|¯VÿV\ÓA¸?ü\á\Þ\ê\ÜNû\â¿hþû\ßÿšÕ«W;¯\×÷\ê\Ò]¿ø\Å/\ÌW¾ò\'‘ÿü\ç?oö\ß³\ß~û™¾}û\Æeû=õ\ÔS\Æö?.\\\ØmTWW·\Æ~&×§ò\ê\â\Ñ|&ýù3\æqð×¿þ5\é\ç˜\Û\0\Þ\É9\æ{\îh\ÇB³\èšM\ïÓ§Ow\ÍPh–]³íš¥°;)§\Û\ç\Ï\ÒL…f\å\í6º³4k\ï\ÎXhgn„f-4»¯Y~û\\±v\ê4û\ïV<¢û\Ütw\çn–f1\Ü¼—TM\à\î\ä½iok6\ã·\ê@\Õ+5«\á\íð©JA0¸\å,5nƒy\Û\â\î°ms«vt\Ö\Ñ\àhš-*¡•3cù¾\r68ï·¾¾¾\Í\×VWW·ùZujþûo¾ùf‹ƒ$‰9;oQ\îK\Ó\"0­•;ê€°f]ü¥†úž•+Wv™\ÆXZøÁW_u˜’Ën?©-¶ÕºYU	¶^U`\îÁ\Õ\Ý«‹Ýƒª\ê«_Tÿ\íL\î\ÎNOÖi·\ïŸ\à\Îb\ßhŸ\ìÔ¾ÌŽ+{ÿ<ü\ÖøbŸ?¾w\ï\ÞG\ê ¹f\ÉS©’\Ë\ÝV\Í\èoŒ°N	\ç˜#]úöf	y¼ºžz\ê©fÖ¬Y\æ‰\'žh–˜k¿CÉ¦\íœ\×ifW3×š0`€3»®X³Õš=Ÿ;wn³}˜Ÿý\ìg\æ\æ›ovfÊ•¤{ý²iýÿ~Ž~Ï‘G\é\Ü\Ö,ø‰\'žhzô\èa¾ý\ío\Û?9\ïGc\ÂÒ¥K\Ý/vnô\ÑG\Î \ç\Þz\ë-\ç¾\ï×¯Ÿ\Ó\Ï\ë@\ÃøC\çù£>Ú¼÷\Þ{\Î~ŒûG}\ÔüóŸÿt~žb‹\ç>’(Ž\Z5ªÁn¯\ÆV\Î/\ßQRR¢§»Z:•³+~&9\Ç<\ÎFŒ±+Ù«²Û€ªfUvßµk5\ÓÞ™3}*\Å\Ú{ï½\Ûû\Ûßœâ¨£Žjj½zõj:o\ê\ã?vf©•––:ÿŠ+šS\Ç\Ô\ÒùU¯½öšóÚªªªßƒ‹\Ã?Ü¼üòËºæ¥±¼s¤Wƒ”nëˆ³¡NN(hZ\îK\ÓL\È!‡b¾ù\Ío:Ÿ\å–F©„Oñ 7Íš\èó¯§\ßÿþ÷Î¬‰\Ú\ÓO?²%Œ\àJ\êØ±\Û÷\Ù.Ó\ë8\ÏP³*;Ri©^I[¤K\ÌÆ«oWYºÖ™ú\Ïþ³Gb®>ù‚.hz\í»\ï¾\ë\à|ö\Ùgrs/4\ë¬}MRx\å\é^B¬¤ýw\Þ1º$³ò\ï~÷»f\ß}÷5úÓŸœ}š\éþú×¿n\î¼óN§o\×lùW\\\á\ìûÌ˜1£)1\×\ÏÖ˜ð¥/}©il\Ñs\ßúÖ·œû\Zô¼÷~UF¯\çÇŽk\n\n\n\Ì7¾ñ\r\'q\×A[Íž/[¶,!}»®\"‘——·ø\É\'Ÿl_\ÎþË‚Á\àUEÑ‡u™\Ï$«²\ÇÙ„	>Löu\Ìm‚Q\Íu\Ì3‹f6ZHÖ§Â¹±JªKJJœ¤@	ºŽ«D\ë\ïÿ»\Ó\Î=÷\\§\ÄJ¯U¬dµ\\\æØ¬\é\ç\éõü\ã\Ío~ó§i \Ñs§vZ\Óc:\ß\Ê{š\á;ýôÓR%_\ZLN8\ásüñ\Ç;ŽÊ¿tä—„‚·\Î(wŒfñ -\n¤8µ%K–˜n¸Á9¨¥û\ÚAóª?4K£,%\í*-\ÔÁ°\ïÿûÎŽ\à\É\'Ÿ\ìÌ¸\èz¨úR¹„‘8J\Úg~§[\n\Ë\"I\Ñ\ÎT\'\ê:\æùY\\\Ç±}\Î[œ!O\Ô>’f\Ê53ž˜«Ÿ\Ö\äÄ¤I“šöM´/²\×^{™Ÿü\ä\'NB¯£:7]û8*[ÿ\Ü\ç>\ç$eš¸\Ð÷©ÏµÉ©Y·nùÑ~\ä\ìK\é\çkv[}¶\ÄÎŸ?\ßI\Òõý·\Þz«sž¹ jÿ\ë°\Ã3:\Õ6\Ë-e\×û\Ðx¢·:p ™x=§ƒº¯}4=\ïýmgŸ}¶óü÷¾÷=3o\Þ<§4^?[tÀ÷\á‡ns»Žô\í:-\É\î\Ãm_µjUƒ\ë†\r¶\Ö]+?\Ý>“\\\Ç<\Îl°œ®rö†††¤%\æÁ`pW*ŸSø\Óÿ\ÛW†øAkÿÿd\'ÿø\Ç?œ-\r,Gq„“˜«Wr¬¦ÀK\Ì\ë\êêœ’t¾\ä’KœD^³\ã:²«\ÄY·õ¼^§\×kpQðÀ8³\Þ\Z(4h\é¾ý¾ðó¸TN¯„E‹¢\è³šnŸw\Þy\Ìô!\é\åŽ\Ñ6\í¼\éó­8òZøý/|\á\Îkµ³¦øQ,(¶¼s5k¢“‹.º\È\Ü}÷\Ý\ÎM*—0G\ÉÑÙ¥¶f¬£MºcMÎ½ƒEü÷oñ\ê\ÛU¬Ï²*Šü‰¹úaõ™ê§½\×\ê1\í+i&ZûHJÒ•˜\ëþC=\ä<§×©RI}°y›Œ:	´q%\à^S2¯òøðRöiÓ¦9‰—J\Ø5\Ã~\Çw8\ÕP^•¡o%\Ö\Ú?\Ó\Âpz¯ª(\Ô}=\î%\æ*­?\æ˜cœƒú\Ûôw\èý\ëõ\Zt[3\îªnLdß®1Y‹^º‘g´uÀ¥«\Ò\é¶\Þþˆ½\í\ì\'‚>3yyyþj\Ûô\Í#¼K;9I*c\×ùÉ›\éZ3‹¸+¢	¤\Î(ÁUyŒf\Ýtûò\Ë/wfó´¨‰Ú—¿üec;\Ôf\ç°\ê5‡zh\ÓÀ¥@¥RJ0üe»Jª•€k0¸ñ\ÆAƒ\î\ëü-/1¿é¦›œß¥\Ù=›¥òy\rn:—KM·\Õü¥Z$Ÿ˜\'¥\Ü1–¦\Øð—³\ëó®\Ó;¼Ç¼\n•\ë9•KFjŠAÍ¨¤r	#q\Ô%Dš95ÙŽöõ$\å\è‰¹šf\ËU]\äO\ÌU\Ñô\ïÿ»\Ù\ë´o£ƒ¨j\êG\Õ{÷\Õ\Çþ\îw¿s^÷\Ê+¯8‰¶\ïß¿¿3¨\ÒPý±~ö=÷\Üã”»{ûIJ\ÌÕ—«¯V\å”w%õzL·\Ï?ÿ|£\Óm½\Ä\\U…Z	^ôó´@œ\î«\ÑKÌµ¥™[=¯Ê­_þò—\Î\ä‹&P¦L™\â¼Í´\'«oO×„<l¿¤\Æ\Û7\Ñ\ç)t\àÆ·ÿ“\ÞydŸ>}n×ŽMf\ÍC6Ù¦…\È\èZ‘J‰¹:w\Ö\ÑW•\\=ºY+,,4/¾ø¢3;§òX®ó 4\àx—\ÑL\ß~ðgPzû\í·›s\r2š\í\ÖÀ¡B—\Ñ}ñõó÷\ß\ß<ò\È#\Îó:Š«u%\ZØ¼¦y’CB‘±‰yR\Ëci7nt>¿\Î\Ânú<k†Z÷Uf\î­Ò«™n-<¤™x\ÒN˜\×t€J¾#º>l*—0G]†f\Î\Ã\Ë\Ê\ïÍŠ½<½¥\ä¼$\ì÷pN9º\Ô>’J\Î\Ã\Ï1o\éuª\æSÉ¹ö•Ô—zk_F‰»ÿµ\ê\ï\ÕW{—^ó\Æú¯“®ƒ:UOW\r\Z\ä<U\â¬Ry=®\ÛJÀõ³ôú¡C‡:+¸«\ÏW¹»~žu\Ý\×û\×ó\ÞB»š]\ÕóªŽz\ì±ÇœIU«rK§KyUô\íñ¡Iÿ¬y¼\Ó\Ï\Ó\Ïõ~GF\ä‘Ø® H$Ï®£™pô]\'1¿\å–[œ\\\ç j \Ð\0¡#·\êø5K­Ûƒv:_uöº­Rv•\á\êÈ«\×N¿\Î+W9¯Ž\ÖzGƒ•˜«$W¥=*{\×\ï\Ñ\0¡û*\Ùò—²+\é\×ó\Z0Tv\ì±Çšk¯½\Öi\êˆ\Â\Ë\ÞI(j‰¹>\ÓYQ¬½\à5S®*UŒx\í”SNqsÿ\ëRµ„‘8\êrÉ¹A8’Ë‚n‘¾K¢¡\Ëô\í>ø ³Îfº5y \Òuõ\Åú\\+q\Õ\ãz^¯Sr«hõ­:ªý$\àT¯\Å;•\ìz«¯kGý¯~Ž\Î_\×†ö¡4¹ \Çt[š)\×Ìªf\ÒUR¯…tu\ê\àõ\×_ïœº§I\Ý\Öcú]ú\Ù:P\ë]3]\ë–\è\çy%ñš8ñ\äzM\Ïk\Ñ]]®MŽ\Z;´\íôw\êo\Ñz$ô\íqM\Îk½\ÄYñºtš¤\ë3\ãŸ-Ïˆ<R%\Æ\Ú\Ò\"‰°t\é\ÒOtMn]¯•/R)¡\Ðg^¥¼Rv-.¥A« «¤\\3\á\Z|\Â/¥¦ûšýÖ ¤r«–~¶Ê§ZKT´\àUxb®\ä^ƒ‘]:DM‹§˜#\ÕsTÒ¬¹v–\ÜÏ³S§ûú\\‡_\ÐK\ÌÇŒ\ÓÔ”œ«\Ý?³’ª%Œ\ÄQ—^Ö®¤º$+öK …_G¯Ÿ$µo\×Bm\ê+½+[´\Ôô¼· ›’e%¸^ÕžÊŠµx­%\ïür\ïsÍ¦«JÊ»\ZNMRÅŸ×´O\å%ò^\Ó>˜÷¿\Î{­*\Ãß¿\Z\ÕAYÿõ\Ó\Ã\Ç\"U_©jJ\ZtPx\ëÖ­M•>¼Ù¬?}{|òHÿ¥-Ui\Ú\Ñ\ä\\I¹öü—\ZÍ¨<2//\ïn-\ê 2x²º\Ùþ\ÃvSÂŽTM(¼sÌµøšVnÖ€£Y\ëŸÿü\ç\ÎùPZ€ÄŸ˜\ë\\Z\r\\ºH÷\îÝþ¢¢¢=-p¥G%¼:¢«„A–\îk`ò\Ïjux=¯•Ióóó\Ä\\‰…šŽî’˜#\Õ\ã(ü’iYaç˜‡7%\æ:O\\36^S¥HV\ØeSµ„‘8J‹ä¼£Z*“Ò¶o§Ñ·GŠý‹\Ójæ¼½e\íú¾°™r“‘y¤M\Î\è×¯_(^3\ç\îLùnû\Ï*\å#‹Tt´p›Ê©”˜kõg\ÍP«ŒK\×\Û\ÔyN*\Õ5—u9&\'¥|«\ÄY¥X\Þe\Ôt\É%õ\Ù\Ù\Ù-\Î\Ê\é$Y¾Ò«ð\æ\Íôi\ÕI•¯\ë\à€fÑ•\Ø\ëÈ±f\ïtªq¤X\ÐùÝªQ\Ó9\äú<û\Óm/f\Ôô˜D\éŠ^\Ó@¬\ïó\ÎGO\åF\â(\ã“óx\'ù\0‰9‰y—f\èûüÉ´\Î\r×¸¯1;\Ú\Õ\×U‘\á?§Ü½¢S\æ\æ‘:\âa“ƒ\ÐSO=\êÀ‚p¡\Ûn»M«p«¬\á>>ªH\ÕAG3\×:—\\Ž¨#\Ðe—T\ê¤\ÒW]\êL	²Ê¸4û¦2-¯,*<ÁV©®\Êl•\Ô+yÿ=Z­TÉ¼&\Ð\ßô{½¤E¥;:\'K·µŠ©œÓ¢+:H\Õ8RY¹Nÿð—¥‡7]\Ðÿ¾tÚˆ.\ã/Ÿ\Ôb‹:ð©D1•J‰£.­£\åç”¯ƒÄœF\ß!´-ž {§Gh6\Ü+sW¹º\ÖP\åª&Át%£°KÂ†\È#³þ®@0\Ü4p\àÀF­0û!ý\Ø&ö[u‚>ç”ƒA‡A\ÄqD¥pr\ëŒ7½¾F\ß\ÞFé¿ŒZ;ydG=nU‚Þ»w\ï\Æq\ã\Æ\íxù\å—Ö­[× ™Ù¶m[\ãúõ\ëwÎ™3g\ÃÈ‘#7\Ú\×\îÖ†\Ô\Ñ\rV_ƒƒˆ#\Zq”\Âb-G§|ô\í4úöò\Èv$\è\ä‘m\É\Í\Íí‘““3\Ãn¨\n\Ûv‡mÀÛªl›©#$l-0\è0\è€8¢Gi–œç»¯+b“¾F\ßN	0\è\Ðt@Gˆ¯¶\Î÷V_\')};¾\0ƒA\Äq„‰4sNù:\è\Ûiô\í\0th: Žˆ#tRrNRúv\Z};\0\Zƒˆ#\â”œ/\")};¾\0ƒA\Äq„\Î1\\‹eqI4Ð·\Ó\è\Û0\è\Ðt@G\ènbÐ·\Ó\è\Û0\è\Ðt@G 1\è\Û\é\Û€A‡A\Ä8\"1\è\Ûiô\í\0th: Žˆ#˜ƒ¾>•¾\0tt@Ñˆ#s€¾F\ß€A‡Æ \âˆ8‰9\è\Ûiô\í\0À Ã \âˆF‘˜ô\íô\í\0À Cc\ÐqD\Äô\í4úv\0`\Ða\ÐqD#ŽH\Ìúvúv\0`Ð¡1\è€8\"Ž@búv\Z};\00\è0\è€8¢G$\æ\0};};\00\è\Ðtˆ#>¿\ÄH\ÌA\ßN£o\0G4\âˆ\Ä o§o\0\ZƒqD#Ž@búv\Z};\00\è0\è€8\"Ž@bÐ·Ó·\0ƒA‡8¢G 1};¾\0tt@G 1b2w\î\\úTúv\0 ¡`\ÐqD#ŽHÌÎ²`Á‚\Æ\ê\êjú\Õh\ëÖ­û\Øö\í;ùT ¡ ‘P€8\"Ž@bŽ2oÞ¼›\Ë\Ê\ÊB6l\è\Ò}beee—O\Ê\çÌ™³Û¶[ùTH[”i‘P€8\"Ž@b´\Ì&ƒ£lŸ²UýJWl¯¿þº)..63f\Ì0]õo\ÐL9I9€´G™eZ Žˆ#˜\é\ÇsÀ¦M›Bµµµ¦ÿþ\Ø\"\0\ÂÒ¥L+’	Ê´ˆ#\ZqDb ^Ö®]»Ê¸.\\Ø““S\ÄV€\Ö\ÕË´Ò¤Q¦EÑˆ#s\0qQ__ß«±±\Ñø;¶¡OŸ>\Ý\Ù:\0\0\0\0HÌ«ªª\Úm\Â\Ô\Õ\Õ5\æ\å\å-f\ë\0\0\0\0 1¨¢¢b®‰`úô\é6\Þò\ÙJ\0\0\0\0HÌ°¹÷qÛ·o”—›P(d\n\n\n¶÷\ìÙ³[\0\0\0\0‰9g•••õ¦\r«W¯\ÖBp3\ØZ\0\0\0\0HÌ8+//o+/7;v\ì¨U\Ìõ\î\Ýû\0¶\0\0\0\0s Ž\n³‰w«‰ù°a\Ã\Ö2c\0\0\0€\ÄHG}tg¤¤|\åÊ•\Ël¼\ÕsŽ9\0\0\0\0s A²³³Ï°	xK¿\íƒ;X•\0\0\0\0‰9`\ãÇ_¢\Øý\î¿ÿþ\å@`[\0\0\0\0‰9`*U/--mô’òººº5999»úô\éÓ­\0\0\0€\ÄH‚+¯¼rÈ¦M›Lmm­\éß¿MÌ‹\Ø*\0\0\0\0HÌ$*))\ÙX\\\\llŒ­gk\0\0\0\0 1’L¥\ëŠ/-\Ç\Ö\0\0\0\0@b_\0\0\0\0H\0\â\0\0\0\0H\0\â\0\0\0\0‰@|\0\0\0\0‰@|\0\0\0 q\0ˆ/\0\0\0\0$\0ˆ/\0\0\0\0$\0ñ\0\0\0€\Ä\0ñ\0\0\0€\Ä ¾\0\0\0\08\0 ¾\0\0\0\08\0\Ä\0\0\0\0\0\Ä\0\0\0\0€ø\0\0\0@\â\0€ø\0\0\0@\â\0_\0\0\0\0ºN’P¥D¡¶•-_\0\0\0\0“8ä·•8Ql)€ø\0\0\0¸\äac+‰C}Ïž=»±•\0\â\0\0\0@\â‡ˆ³z999El!€ø\0\0\0øä¡¥sa·2›_\0\0\0\0’“8\äs\î+@|\0\0\0\è\Ü\äa=³y\0ñ\0\0\0 “¾¾\Äa8[ ¾\0\0\0\0$™w.,³y\0ñ\0\0\0 	rss{\Çm²P‘““³+\ì<\Ø\Ýnù\íL½Ž­_\0\0\0\0\âD—i²	AýjZ¹\Ærø¥jƒÁ\à$¶@|\0\0\0h\ÂpŠm£M\"´\Í\Ù\Ù\Ùg°5\â\0\0\0@@q0ù“€\Ü\Ü\\STTd\æÍ›gÖ®]k¶l\Ùb\ä³\Ï>3•••¦¼¼\ÜLœ8\Ñ\ä\ç\ç‡\'!f÷\0\â\0\0\0@ôI\Ã(Y­†©S§š\ê\êj\Ú\ÚZ\çõú¾°ò\Û\Él]_\Ä\0\0\0€Ö“†b\ÒPPP\à\ÌÞµ‡¾o\èÐ¡Í’fö@|_\0\0\0\0\"\Ð9¯þò\Ú\Â\ÂÂ¦r\ÚöR\îØ±c\Ã\Ën\Ïakƒø\"¾\0\0\0\0\ì™8\Ôøgò:š4ø“‡°™½\Ílm_\Ä\0\0\0€\æIC‘ÿœ\×ö–×¶Vv\ë?\'–’[_\Ä\0\0\0\0]G\ÙÛ©\×\ÂR‰0m\Ú4fõ@|_\0\0\0\0\Â\å\æ\æöð¤Ò¬[MMMB­&\í¿Ô“Î¹e\ëƒø\"¾\0\0\0€Œ÷v\æÇoI\×aö\Í\ê\Íd\ëƒø\"¾\0\0\0€Œgw\à+¼ù²²²„&\å\å\åþÄ¡Š­\â‹ø\0\0\02^NN\Î.og>Þ‹R…«¬¬ô\'\rl}_\Ä\0\0\0ñt\ícog>^—pj\í\ÒN¾\ÄÁ°õA|_\0\0\0\0‰ƒoG>H@|_\0\0\0\0š\'\Ì\è\Ä\0\0\0€\Î\Â9°\0ñ\0\0\0 ±j4@|\0\0\0\èD\\g ¾\0\0\0\0t¢\Ü\Ü\Ü\ÞÎ¼½mjjj’4\Ô\ÖÖš¼¼¼¦\Ä!\'\'\ç¶>ˆ/\â\0\0\0@–Sn[\ã\í\ÐO:5!‰Ã´i\Óü³y›\Ù\ê ¾ˆ/\0\0\0\0®œœœ\"ÿ¬^¼©\Ò\Ï\Ó\Ïõ~G0œ\ÄVñE|\0\0\0hž<\Ôz;öq»´“.\á4dÈf³y={ö\ì\ÆñE|\0\0\0hž8œbw\ê½ü\Â\Â\Â\'J\ZÆŒ\ãO\ZBÁ`ð¶6ˆ/\â\0\0\0@@±o\'ß™\ÙkoÙ­¾/l&[_\Ä\0\0\0€¶\Øüûü;û:wUVi\Õ\çhW‡\ÖBTþs^\ÕlRR\Ê\ÖñE|\0\0\0ˆ‚föl…\'ºsYY™3[\ç•áªœ¶²²Ò”——›\â\âbsé¥—6KT^«d„­\n_\0\0\0\0b\àž[–\Ä\Ú6s\Î+@|\0\0\0\è€@ pk;ˆÍš\Åcuh€ø\0\0\0\'¹¹¹=rrrfØ„ Â¶\Ýa‰BƒmU¶\Í\ÔL [ ¾\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\É÷?$\ÌÍ’\Ú\Ð.\0\0\0\0IEND®B`‚',1),('5002',1,'test1.bpmn20.xml','5001',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"ä¸»ç®¡å®¡æ ¸\"/>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-4B4F3AE3-DE93-4173-B023-422C7748899A\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\"/>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\"/>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\"/>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\"/>\n    <sequenceFlow id=\"sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\" name=\"æˆåŠŸ\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"141.609375\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"216.609375\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"361.609375\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"495.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"690.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"531.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"367.609375\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"171.609375\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"216.609375\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"382.0104166666667\" y=\"71.59895833333334\"/>\n        <omgdi:waypoint x=\"381.6819128864211\" y=\"135.0001879207243\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"401.1678759140768\" y=\"52.44149908592322\"/>\n        <omgdi:waypoint x=\"495.0\" y=\"52.15347721822542\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4B4F3AE3-DE93-4173-B023-422C7748899A\" id=\"BPMNEdge_sid-4B4F3AE3-DE93-4173-B023-422C7748899A\">\n        <omgdi:waypoint x=\"316.609375\" y=\"52.21645021645021\"/>\n        <omgdi:waypoint x=\"362.0224184782609\" y=\"52.413043478260875\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"545.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"545.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\" id=\"BPMNEdge_sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\">\n        <omgdi:waypoint x=\"595.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"690.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5003',1,'test1.test_process.png','5001',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Ø\0\0\0­\0\0\0Š£^\0\0\ÕIDATx\Ú\í\Ý	”•eù\0p²eö}·Ó©Ó¾žc«e‹yÚ³¦  ŒH\Í\Â\Ì\r!\\\Ò\ZM´ô˜†\Ê%S²PIB,\Íã‚™fš‚Š \"‚\nóþ¿\çûó\Íù¸20w\æÞ¹÷Ž¿\ß9Ï¹\Û\è\å½\Ïó\Ü÷{¿÷2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0©”Ò®w\Þy\ç²%K–¤ùóç§¹s\çŠŽyóæ¥«®ºª+‹F$r‹[\0Z\\ÀE‹¥•+W¦M›6‰ÅªU«\ÒÂ…»²‚x¢Q‰\Ü\"\ä€³K\n`óÂ¹s\çn2*‘[„\Ü\Ð\Â\âÐ­\Ô<‡uJ\ä!·\0´°HºŠ\"r‹\ÜÀ\0ÁõßŸ\î¼ö\ìtË¼)y\Ä\ß\ã6…K¹En \Ê\"¸nÍ½i\é\åG¥/›¸M\ÄmqŸ\â¥‚\Ü\"·\0PE\\vË¥O(€E,¿e¶\â¥‚\Ü\"·\0PM¼õ\Ê\ãz,‚qŸ\â¥‚\Ü\"·\0PE\\:÷˜‹`Ü§x)‚ ·\È-\0(‚Š \È-r\0)‚qfOE0\îS¼A[\ä\0ª(‚ÿZ|jE0\îS¼A[\ä\0ª(‚«\ï½)-½b\Ò\áf·\Å}Š—\"r‹\Ü@E0\â®\ë\Î}BŒ\Û.E\ä¹€j‹\àÆ\é_W\Ïx\â!\Üì¶¸OñRAn‘[\0\èeŒ«©Ý¾ø”\×I\Æ}®¸¦‚\Ü\"·\0°³\"¸qcºÿ_\Ò\Ís\ï±\0‰ÇšqRAn‘[\0Á\íÁ\Í,™qRAn‘[\0¨¢öffiG3NŠ™\"\ØO»y\ä¹EnTE°¯°\ÅL\ì‡#³H[ÿDn‘[\ä€ÁQ…\"\Ø ‡fÑ•\Åõ[ÿœ\ì*·¹@Š`ÿšë¢©Ž\ì-šl¹E\È-\0Š Pû\ß\\\ï\ìv\ä!·\0(‚B\ìÁ‘;i¢‹û­É–[„\Ü´‚‹.ºh\ßSO=uÙ”)S6\ï{\ßK£FJ\ßø\Æ7Òˆ#\ÒþûïŸ¦N\Úu\Úi§=¸dÉ’\ãA¡Ö­¹\ÞYól&[nrË 6lØ°\Ý\Û\Ú\Ú\Î\Ïze\í\í\íevE?²5\Ï\â¾,f\Ç\ã¼[4­É“\'ÿ\ï\á‡¾\å\àƒNgœqFº\æškÒ½÷Þ›6lØBü¹r\å\Êô÷¿ÿ=s\Î9)w\ÔQG¥\Î\Î\Î\ëA¡\ÖÄ¡U\ÎLWûx\ä¡ÁnzY3==kœWg¦RC½\Ã\È»¦££c†w¦q\Øa‡\íuè¡‡>>q\âÄ¼yÞ¼ys\ê­n¸!eMyÊž\ßuö\Ùg¤\nE°\ß\Íõ\ä>>O“-·¹¥\Õ\ë=²X\ÕÛ¦º‡X»\Ï>û\ì\éÝ¤¡Ž:\ê¨KÆŽ›fÏž]Uc]iÎœ9\é;\ßùN:ýô\ÓoR…\"8`\Íu­ž\Ü\"·\ÐPmmm\å% iØ°aiúô\éiÁ‚\éž{\îI<òH\Þs<ú\è£ùöÅ‹§“O>9_\ÂZ\Ñdw™Í¦aN8\á„cMõ\í·ßžj\á?ÿùOŠ5\ÛY“}‡\"(Á^\Û\Ù	ý:\È-r\Ý\\O./‰\Æz\æÌ™ù²\Ô\ÞX³fMþøx^Å²‘s¼»¨C9\ä¼h®{;x{+^/š\ì“N:i‰\"(Á^7ÅµZ\Þa&[nrK\Ë\Í\\—›\ëñ\ã\Ç\ç³\Õ}Ï‹\å®\å&\ÛL6&\Ö83¦f3\×Û›ÉŽe\'S¦L¥\nEp§\Íp\Ñ\\\ï’\Å/·þY\Ê\çY“-·\rv\Ëô#\åe!“&M\ê^\ÒW±|dÚ´i•\ËEöönSwû\í·ß†Xs]O±&;ûºEŠ`¯fš£9¾-‹´õ\Ï\Þ6\Ù==O“-·\rv+4Ø«\Ë3\×ým®\ËMv\ÅLöZ\ï6u5r\ä\È9\äô\Øc¥zûÁ~\Ûø]¦\nEp‡\Íõ­3Ð©½i²\Ë\Íug”\î·&[n\Z\ìfn®§—\×\\÷uYÈŽ–‹”\×d[*B]pÀc+¾p\ÓM7¥	&´\ä,¶\"¨\ÖIOM\ïöš\å5Ù½}¼5\Ùr‹\Ð`7¥\Ø\çºh~\ã\Åz˜5k–Yl\ê/®t[\éõg;¾jt\ÐA)ö\Ùn¶uö\Íy?EP¬\ç\ÚAs}d?›\æj›q\ËEšhL\È-r‹\Ï\Âÿ÷#Å‰1Ë¼zõ\êºô ±»Hy¿Xó\í_ˆš\ë\è\è¸(®\Ð8\â[\éGqc“}ø‹\Ûê¶¶¶}AE°c¨M\îÎš\çj›\ëò\ï\ßb&»ñcBn‘[|òC\Î/wüñ\Ç×µ‰}²KÿM³ýQs\ãÆ{(.>b9Ê„	66é‡¿ˆU•ß¶AE°¿ch;\Íuo›Ûžš\èÿ\écs]9ƒ®\Én\à˜[\äŸ…ü1ËŠû.\\X\×>$.FSúoY\á_ˆš9r\ä\æû\ï¿@\ì\Ø{ô\è\Ñ]Mþ\á\ïþ¶]$EP\ì\ï\êcs½£&{S?š\ëþþ÷P£1!·\È->ù	Ž·\×ú\ä\ÆJq\Å\Ç\Ò\ÃfÿB\Ô\\¬sÚ°aÃ€6\Øñû\â÷¶È‡¿û\Ûv£‹`|£m†zº?\Þ\×K/½4=ô\ÐC\Û<\çŽ;\î\Ø\á\ëF\"»üò\Ë{¼ÿ¿ÿýoŠ-Ë¯ûš\ßp\Ã\rŠ`•ch·\Ýv»¸Ÿ\Í\ìöš\ìþ4×•M¶5\Ù<&\âpy=rK\äƒòŸ=Åƒ>˜®¿þúæ–ˆX[\Ï\Ïs3\å!\rvc>\åŸkµ5ßŽ¶\ì+ÿ>ÿB\Ôe\Ð7B/>lMl°-Z”^ñŠW¤—¼\ä%±\ÍaZ·n\Ý\Ó\ÙÙ™7Z\ãÆKx`úù\Ïžžþô§§\Ï|\æ3±$\'K.¹$\Ýv\ÛmqU\Í|\rZÄ§>õ©´ë®»¦Ÿü\ä\'Ý·\Åýÿü\ç?»t¼n<¯ø]?þñ\ÓG>ò‘†7Ø­4~¾ò•¯\ä\ï\ã›\Þô¦þ&óÿ\Ù\Î\Ìõ¦­·÷\ÇõñZ­ø\Ùlõ¨un9ë¬³\Ò^ð‚¼yŽ\Óyó\æõø\ØÑ£G§\ç=\ïyù—óx\\\ÄUW]õ„fýÕ¯~u:\çœsòŸ#Ç”\ÇõùçŸŸ\ß~ê©§¦½ö\Ú+\í½÷\Þi\Ï=÷\ÌO${\ç;ß™\Þõ®wu\Ç\Û\Þö¶<—4s2&Ý‡\è©¹ŽŽ3\Ø;þv½¾­­mòÐ¡Cw\è;Þ§˜YZºti7\Þxcú\á˜¾öµ¯\å?\ß|ó\Í\é\Úk¯\Íû\Ç?þ1=ó™\ÏÌ›\ï§>õ©\éû\ßÿ~zý\ë_Ÿ¾ô¥/¥}\èC\é½\ï}o~\ÒHü?\\q\Åy\ãgkGdÿ\ésŸû\\q6u\Ïx\Æ3ÒŸþô§t\×]wå\Â\'§¾\ï}\ïK\Ïy\ÎsòB¿\ç¹\Ï}nzö³Ÿö\Ýw_3Ø½CCút3ØƒcÖ®<&j¾D$\ZÞ—¾ô¥ù,`Œ\"O”c\íÚµ\é»\ßýn~ÿn»\í–>ü\á\çñü\ç??½ð…/L÷\Ýw_÷c÷»\ß\å·E\Ã?Ÿp\Â	\é˜cŽÉ¯k¹\ä\àƒ\îžˆ/÷/{\Ù\Ë\Ò/~ñ‹ô\ÉO~2ÿb;G}\àH—]vYþû\âŠÁÍœ‡\Ì`7\æ³WW4ƒÍ ñ\Ío~³!k°G\Z\Õ\ìk°·)€õ(‚;‹8\Z\å)OyJwTþü´§=-\ìò\å\ËSöo™fÌ˜‘µ¢pžr\Ê)yqû\êW¿šN;\í´üj\ìE>fÌ˜|\éÈ¿ÿý\ïü°l<6N>Ÿ\ãöoû\Ûù¡\×(\Ô[g\\Ó›\ßü\æôü#/>Qó›\ß\ä³\äñzw\Þy§»c¨¢™µû\É\×TlwL\Ô*·|ô£Í¿l_pÁ\Û4\Ø\×]w]úý\ï\Õ\ÈÛ”\ÅLr\ÌJ\Ç6­1\Ûl\Ì\Çlöüùó»_3^#¾ {\ì±ù\Ìu4\ÛÅ’hˆ\ãu\â1\Å\ã\ã÷¼ño\Ìÿ³\Ò\ïÿû\Ó\î»\ïž^ù\ÊW¦¯ý\ëùO\ä˜f\ÎC\Z\ì\Æ|¬ÁfP\ÉôòÅ‹w\rô.\"YR_Û¤þuq%©\í4E\r9)ŠXy™H˜øBT\ÜV¬›ŒÃ¨q_\Ìõ1\Ã}\å•WæY¥ø¹Xv\Ï}ù\Ë_žÿ³Bqñ;\â°p\Ü?mÚ´ü²µ/~ñ‹ó\Â\ë!c\é–[n±»—c¨3\Ævi\í¦b‡c¢V¹%–{Œ\Z5*]x\á…Oh°#\Ä­\â±q,¾pÿ\áÈ—q\ã\'fÿò—¿¤x {\ÙG\Ñ\ØFóG\Î\Î<óÌ¼±~\ík_›žõ¬g¥/ù\Ëy^3\Ï/zÑ‹ò/÷\Ñ`\Çüý÷\ß?Ÿu¾øâ‹»\ìf\ÎC\Z\ì\Æ|\ì\"Â ûNžt\ÒIdƒ}\î¹\ç\Æl\ëœ&ûð÷4\Û\Ø\Ð{ÕªUù7ùeË–\åk$£À\ÄLMü‡M‹C¶1\ã³W_ø\ÂòÙ¨(RE\Ä!\ßo}\ë[\éóŸÿ|ú\Û\ßþ–?>–š\Ä\Ú\ì(¼1#¯E5~Žð¸¿øoø\ìg?›\ßÿº×½.-X° ?\Ô\ë£ˆÆš\î_ÿú\×;=A\êI\Ò`\ïtõq\æ¸^û`b\ì¦µ\Ê-1s3Å•\rv,‰Y\å8\ÂU{\Ï{Þ“v\Ùe—ôŽw¼#o\Ìcö:\ÖnG‰\å q„,šœ»\ï¾;^4¼]tQ~´\ì-oyK:ú\è£ó×\ÜMu\Ì\"\Çøh¶\ãù\'žxb¾;rE,=y\Ík^“FŽÙ½D¤™ó»1Ÿû`3¨Ä•“F\Zµe ¯\ä8nÜ¸®V¼rR#\Z\ìHC¶¿\Þ6¸HPùñ1C…\éG?úQw\ì±\Çyƒ]~\\®(LQ¤\âÄ£x­8Œ?\Ç\íEa‹C\Åo}\ë[ó\â\Z\'Eq™©x|\Ôø{\Ì<Å—\0[iõ\É\Îf\ë}%\Ç\é²\à\à\É-q\Ø;þ\í\ã³Zn°\ãs\Z\Ë)\âó[<6nû\Ù\Ï~–\Ï\Ç2‘h¶£ÁŽŸõ«_\å÷\Å\ã\â¤\ÂXž\rùG‘7\Â\ÑPG#]D4\å±\ì¤r‰H\\’:rX,\r‰\ïŸþô§ù‰‹+V¬h\ê<¤Án\\?R4½õ¾’\ãð\á\Ã]É‘ú\Ë\×ê«¯¾z@:\ì8Q/k\è}2Áj\â\á‡\Îg±#!lMúù:\Ãø9f¡\Êk\Ë\röÔ©S»#š\ì(š\å\íº¢p}ü\ã\Ïwˆb\Z¯\' \Å\Ïû\ØÇº[¬»Œ™„¸?þ\í>øÁ\æ\ë6\ãPo‰ˆC³1\ãd‰H¿ô4“]m\Ó\Ü\Û\Çk®qn‰\Ù\ë8°\Ü`Çº\ìó\Î;o›\Ç\Åy\Z‘+\"\âs\rjñs,¿øô§??nÉ’%y\Ã·;6_KDb©F¼öé§Ÿž/#)v6Š;Žœ\Å2Ž8\Ù:\Zðh\Î\ã¶øû¿ø\Å7k\æ<¤Án\èL÷\ê¢ñq\\ñÅ¯4{½Ö»N=\ì\écÆŒ\Ù<³\Øx\à–ŽŽŽ\Z\ì¾m\Õ7¤b\rveDƒ\ë£ ñö·¿=^1k1q\â\ÄüLÿ(šqø6\îB?GaŽû\ãqqBj4óEcÿ\Û\ßþ6Ÿ=:\à€òCÈ±CI|	\Ð`\×d&»r¹\Æ/‡T¿\ìc{MöUÌ˜3rK,\å¨\\ƒ½½\ÇmÜ¸1_\Ê³×±Ì¢¸=f“£/?6–¤\Å\ìu±\å_q\ÞGù‹{4÷\ï~÷»ó™\æýö\Û/_\rp,A‰\Û\ã\ï\ÑH\Çk5s\Ò`7¶)\Ïb\×úd\Çx½x\Ý\âw´j?Bk\r\ê5Yò«\ë~}Y²\í\Êöº*Ö¨>©\ìøö\ëc\Æ\'\"\ÖXG)\ß\ÇÏ‰\Ûb\Ý\ã\äÉ“»#NŠ\ç\ëµ#b-v±\×mœ\ì÷‡xÿü\ç?w¯\Õ.\"\îÿ\ë_ÿšo\ÏõªW½*/Àñ~D!ŒC·±…–»&Mvù\Ä\Çr³\\Í‰‹==\ÏV|ƒ8·œ}ö\Ù\éŸøD>ó_¬cIH|>cD\Z·\Çýñ¸hRcF8>»q\ÎF4¾±†9–s\ÄN!Ñ´»…\Ä\îC\Ñ0\Ç\ë\Äú\î8a1f¦c6;n‹¿GŽ‰™\ë\ÈE1³KU\æÌ™“o\ãw\Øa‡\å{c¿\á\ro\Èÿ·\Å\ïj\æ<¤Án|?R4Àq$¤V[ö\Å\Zý«\å\Ù\ëV\íGh­½GöMnË­·Þº¥\Íuœ­>|øð®\ìw\ìm–©w3E±\×ly¹GeÄ¾\×\åÿ®\ØK6\Ö;jˆ˜2eJ~x¶¼¯m9b¯\íX\ï\Ø\Óý13\'JÆ‰EQ¨c\Ý÷úõ\ë»÷\ê>ò\È#·™ý\Ò`÷K\år‘]¶\Î@W»õ^\åóú»ÿ6Mž[\â„\ÄhšËŸýÊˆû‹£\éFµ8\"‡\Í\ã¢1\Ñxë¯‹5\ØñùŽ«\ã\çhpcG’\Øûºˆ\Ø)¤hÈ‹ˆ\Ùë¸½ü¸â±±Ö»™ó»ñýH6·ð¤I“ú\ÝdGs5³\Ô\\·t?B‹Éš³Î¬	Þ¼bÅŠšn\Û‡÷F½¥\Õ\Å4z‰ˆx\ÒÁZ\ïK½½\å\'\È-Bƒ\Ý\ÔýHy\ß\ì˜\É\î\ër‘x^\ÅÌµ¥!¼l\àMöÒ¥Kk²u_ŠŒ]J²ËœVoAE°›l‘‘[„\ÜÒ²ýH¹)ŽµÓ±)–õv·82S^s1úZû›c\×Ygµ¶?\'>^pÁe;óœ©\nE°O3\ÏýY\ÖaYˆ\Ü\"ä––\ïG²\èªl´‹\åN1;],‰e ±þ?.\"\Ó\ÙÙ™\ï»^qõÈ®ÁÒ\ÐÂ¶®Z=bÄˆM‹-Z_\å•\Z7;vSö\Zk\Ó\Z\'EPl`“]\í´\Z\å!·ª~d;—[¯&\ÖZsM³}{<1vöqó\ÑG½vþüù\ë–/_¾yÃ†\rù:\í8¹dÅŠ›¯¹\æšM\Çw\Ü#\Ù7\Æ\Í\ÑXÇ·\ÄÁvv®\"¨6Hµ\Ë<,‘[„\Ü2hû‘j\ëÁØ0ˆ\Ä–²\Æù\âl .\Ë\âñŠ¼9‹q¹\ÑÁ|E$EPl&{\Ä‘‘[„Ü¢™\í\n \nE°7v¶¦º\Ø-Ds-·¹@Š`/õ4“mYˆ\Ü\"\ä\0EP(‚5j²5\×r‹[\0A¡Ö¨É¾^s-·¹@Š`mÄš\ëü\ÄŸN¹E\È-\0Š Pkc7\r¶\Ü\"\ä\0EP(‚5¤Á–[„\Ü \nEPƒ\Ü\"·\0 *‚\Zl\ä¹\0EP\Ô`#·¹@Š [nr€\"(A\r6r‹\Ü€\"¨j°‘[„\Ü \nEPƒ-·¹@Š ¹En@T5\Ø\È-r\0Š \"¨ÁFnr€\"(A\r¶\Ü\"\ä\0EP(‚\Zl\ä¹\0EP\Ô`#·¹@Š [nrÀ 2þ|\ÅG\Ô`#·\È-\0\ÔÊ¢E‹¶¬\\¹Rj‚X¾|ù\ÝY\ÜdTj°\å!·\0´°»p\áÂ®x@!jpœ7o\Þ\ãYœhTj°\å!·\0´¸,ñNž;w\îú8„(\Z›@\r¶\Ü\Ò|cQn\04\Ø`,\0hj0\045‹\0\0š\Z0\0M\r‹\0\0š\ZŒE\0\0M\r‹\0€¦ŒE\0\0M\r\Æ\"\0€¦c\0@S\Æ\"\0 ©c\0@Sƒ±\0 ©c\0\ÐÔ€±\0 ©ÁX\0\Ð\Ô`,\0hjÀX\045`,\0hj0\045`,\0š\Z0\045‹\0\0š\ZŒE\0\0M\r‹\0\0š\ZŒE\0\0M\r\Æ\"\0€¦ŒE\0@S\Æ\"\0€¦c\0@Sƒ±h,\0š\Z0€\'w³\"š˜\Äz\ï\Æ\"\0@ïšš;kj\Ú\Ú\Ú&{§0\0z\ßØ¬\ÚAS³n\èÐ¡»z—0\0z\ß\Ôô8s\Ø\Þ\Þ>\Ý;„±\0P}c³½õ¯\ë\Íb,\0ô­©a½+\Æ\"\0@m›û\Ìb,\0\ÔH[[Û¾¥¦\æH\ï\Æ\"\0@?\ë_\Íb,\0TiØ°a»·µµŸ51\Ë\Ú\Û\Û\Ëþ\ì*\Í\Z>¾õ0ý\ìxœw‹Œ\Çd<\0-!¶;\Ë\Z•Õ½¸j^y‹´53¼{\Ôk<f\Z\0@\Ë52{\ì\äB½‰µû\ì³Ïž\ÞMj1³0€\Ö\Ô\Ö\ÖÖ™5#[\Ê\ÍÉ°a\Ã\Òô\é\ÓÓ‚\Ò=÷Ü“y\ä‘}ô\Ñt\ï½÷¦Å‹§“O>91¢²©\é2{H\Çc6†ºŒG\0 U›™É•\ÌÌ™3\ÓÊ•+So¬Y³&|<¯\â0ý9\Þ]ú2\Ë\ËAŒG\0 Õš™\Îr2~üø|v°/\ây\'NÜ¦©1sHµ\ã±\Ü\\\0@KÙº\æº{YÈ¤I“º»÷U®Ÿ6mZ\å\áù½½\Ûôf<–—…\0@\Ë)\ï3…ýmf\ÊMM\Å\Ì\áZ\ï6½h°G\0 ¥›™\é\å5®}=¿£\Ãó\å5°\Íc<\0ƒZyö:N«‡Y³f™5\Äx\0¿¸\Ò]y¶põ\ê\Õuihb7‡ò–i±\ÆÖ»\Ïö\Æcqb£ñ\0´¤­—›Î›Œ\ã?>\ÕS\ìK\\š5œ\í\Ý\Çx\0¬±XV4.¬kCÿ(54+¼û\0À \Ó\Þ\ÞþX\Ñd\Ôúd²Jq…½RC³Ù»ñ\0:±p\Ñd\Ôj+´m‘V¾Ð‡w\ã\0Œ\rMwƒ144\0À`oh\Ìb<\Z\0@­XóŠñh<\05d\×ŒG\ã\0¨!ûc<\Z\0@\r¹’#O\Öñ8|øp\ã\0¨¬ÁX]4\Z3gÎ¬KC3kÖ¬òl\áZ\ï:\Æ#\00hµ··O/\Ï\Z\Öú\ä²x½x\Ý\âwttt\Ìð®c<\0ƒ½©YS4\ãÇ¯\Ùi±\ÚÄ‰·™-:t\è®\Þq\Z5\'L˜`<\0\Ò\Ð\ì‘5[Š\ÆcÒ¤Iýnj¢™™6mZ¹™\é\ê\è\è\ØÛ»M£\Æ\ãÔ©SG\0`à´µµu–/¼3‡}=<Ï«˜¹v(ž†ŽÇŠ™k\ã\0Y\ãqf¹	‰µªq¢Y\ìº\Ð\Û\Ý\â²ò\Z×ˆ¬Yš\ã\Ý\Åx\0ž”b\æ0‹®\Ê\Æ&ö%Ž‹\Äl`q¸>»\Çñ\â¢iÔ¨Q\Û42[/}}¦w•FŒÇ‘#G\Z\0@sØºvuEsRm¬µ\Æ\ã\0 ¤­­\í\Ä>46kc–\Ð\î\0\0=ˆ+ìµ··_œ5*Ë²x¼¢ÙœÅŠ¸Ü´+\âa<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04¿ÿ<nþx.\ÃRb\0\0\0\0IEND®B`‚',1),('5011',1,'test1.bpmn20.xml','5010',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"ä¸»ç®¡å®¡æ ¸\"/>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-4B4F3AE3-DE93-4173-B023-422C7748899A\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\"/>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\"/>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\"/>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\"/>\n    <sequenceFlow id=\"sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\" name=\"æˆåŠŸ\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"141.609375\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"216.609375\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"361.609375\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"495.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"690.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"531.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"367.609375\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"171.609375\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"216.609375\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"382.0104166666667\" y=\"71.59895833333334\"/>\n        <omgdi:waypoint x=\"381.6819128864211\" y=\"135.0001879207243\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"401.1678759140768\" y=\"52.44149908592322\"/>\n        <omgdi:waypoint x=\"495.0\" y=\"52.15347721822542\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4B4F3AE3-DE93-4173-B023-422C7748899A\" id=\"BPMNEdge_sid-4B4F3AE3-DE93-4173-B023-422C7748899A\">\n        <omgdi:waypoint x=\"316.609375\" y=\"52.21645021645021\"/>\n        <omgdi:waypoint x=\"362.0224184782609\" y=\"52.413043478260875\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"545.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"545.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\" id=\"BPMNEdge_sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\">\n        <omgdi:waypoint x=\"595.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"690.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5012',1,'test1.test_process.png','5010',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Ø\0\0\0­\0\0\0Š£^\0\0\ÕIDATx\Ú\í\Ý	”•eù\0p²eö}·Ó©Ó¾žc«e‹yÚ³¦  ŒH\Í\Â\Ì\r!\\\Ò\ZM´ô˜†\Ê%S²PIB,\Íã‚™fš‚Š \"‚\nóþ¿\çûó\Íù¸20w\æÞ¹÷Ž¿\ß9Ï¹\Û\è\å½\Ïó\Ü÷{¿÷2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0©”Ò®w\Þy\ç²%K–¤ùóç§¹s\çŠŽyóæ¥«®ºª+‹F$r‹[\0Z\\ÀE‹¥•+W¦M›6‰ÅªU«\ÒÂ…»²‚x¢Q‰\Ü\"\ä€³K\n`óÂ¹s\çn2*‘[„\Ü\Ð\Â\âÐ­\Ô<‡uJ\ä!·\0´°HºŠ\"r‹\ÜÀ\0ÁõßŸ\î¼ö\ìtË¼)y\Ä\ß\ã6…K¹En \Ê\"¸nÍ½i\é\åG¥/›¸M\ÄmqŸ\â¥‚\Ü\"·\0PE\\vË¥O(€E,¿e¶\â¥‚\Ü\"·\0PM¼õ\Ê\ãz,‚qŸ\â¥‚\Ü\"·\0PE\\:÷˜‹`Ü§x)‚ ·\È-\0(‚Š \È-r\0)‚qfOE0\îS¼A[\ä\0ª(‚ÿZ|jE0\îS¼A[\ä\0ª(‚«\ï½)-½b\Ò\áf·\Å}Š—\"r‹\Ü@E0\â®\ë\Î}BŒ\Û.E\ä¹€j‹\àÆ\é_W\Ïx\â!\Üì¶¸OñRAn‘[\0\èeŒ«©Ý¾ø”\×I\Æ}®¸¦‚\Ü\"·\0°³\"¸qcºÿ_\Ò\Ís\ï±\0‰ÇšqRAn‘[\0Á\íÁ\Í,™qRAn‘[\0¨¢öffiG3NŠ™\"\ØO»y\ä¹EnTE°¯°\ÅL\ì‡#³H[ÿDn‘[\ä€ÁQ…\"\Ø ‡fÑ•\Åõ[ÿœ\ì*·¹@Š`ÿšë¢©Ž\ì-šl¹E\È-\0Š Pû\ß\\\ï\ìv\ä!·\0(‚B\ìÁ‘;i¢‹û­É–[„\Ü´‚‹.ºh\ßSO=uÙ”)S6\ï{\ßK£FJ\ßø\Æ7Òˆ#\ÒþûïŸ¦N\Úu\Úi§=¸dÉ’\ãA¡Ö­¹\ÞYól&[nrË 6lØ°\Ý\Û\Ú\Ú\Î\Ïze\í\í\íevE?²5\Ï\â¾,f\Ç\ã¼[4­É“\'ÿ\ï\á‡¾\å\àƒNgœqFº\æškÒ½÷Þ›6lØBü¹r\å\Êô÷¿ÿ=s\Î9)w\ÔQG¥\Î\Î\Î\ëA¡\ÖÄ¡U\ÎLWûx\ä¡ÁnzY3==kœWg¦RC½\Ã\È»¦££c†w¦q\Øa‡\íuè¡‡>>q\âÄ¼yÞ¼ys\ê­n¸!eMyÊž\ßuö\Ùg¤\nE°\ß\Íõ\ä>>O“-·¹¥\Õ\ë=²X\ÕÛ¦º‡X»\Ï>û\ì\éÝ¤¡Ž:\ê¨KÆŽ›fÏž]Uc]iÎœ9\é;\ßùN:ýô\ÓoR…\"8`\Íu­ž\Ü\"·\ÐPmmm\å% iØ°aiúô\éiÁ‚\éž{\îI<òH\Þs<ú\è£ùöÅ‹§“O>9_\ÂZ\Ñdw™Í¦aN8\á„cMõ\í·ßžj\á?ÿùOŠ5\ÛY“}‡\"(Á^\Û\Ù	ý:\È-r\Ý\\O./‰\Æz\æÌ™ù²\Ô\ÞX³fMþøx^Å²‘s¼»¨C9\ä¼h®{;x{+^/š\ì“N:i‰\"(Á^7ÅµZ\Þa&[nrK\Ë\Í\\—›\ëñ\ã\Ç\ç³\Õ}Ï‹\å®\å&\ÛL6&\Ö83¦f3\×Û›ÉŽe\'S¦L¥\nEp§\Íp\Ñ\\\ï’\Å/·þY\Ê\çY“-·\rv\Ëô#\åe!“&M\ê^\ÒW±|dÚ´i•\ËEöönSwû\í·ß†Xs]O±&;ûºEŠ`¯fš£9¾-‹´õ\Ï\Þ6\Ù==O“-·\rv+4Ø«\Ë3\×ým®\ËMv\ÅLöZ\ï6u5r\ä\È9\äô\Øc¥zûÁ~\Ûø]¦\nEp‡\Íõ­3Ð©½i²\Ë\Íug”\î·&[n\Z\ìfn®§—\×\\÷uYÈŽ–‹”\×d[*B]pÀc+¾p\ÓM7¥	&´\ä,¶\"¨\ÖIOM\ïöš\å5Ù½}¼5\Ùr‹\Ð`7¥\Ø\çºh~\ã\Åz˜5k–Yl\ê/®t[\éõg;¾jt\ÐA)ö\Ùn¶uö\Íy?EP¬\ç\ÚAs}d?›\æj›q\ËEšhL\È-r‹\Ï\Âÿ÷#Å‰1Ë¼zõ\êºô ±»Hy¿Xó\í_ˆš\ë\è\è¸(®\Ð8\â[\éGqc“}ø‹\Ûê¶¶¶}AE°c¨M\îÎš\çj›\ëò\ï\ßb&»ñcBn‘[|òC\Î/wüñ\Ç×µ‰}²KÿM³ýQs\ãÆ{(.>b9Ê„	66é‡¿ˆU•ß¶AE°¿ch;\Íuo›Ûžš\èÿ\écs]9ƒ®\Én\à˜[\äŸ…ü1ËŠû.\\X\×>$.FSúoY\á_ˆš9r\ä\æû\ï¿@\ì\Ø{ô\è\Ñ]Mþ\á\ïþ¶]$EP\ì\ï\êcs½£&{S?š\ëþþ÷P£1!·\È->ù	Ž·\×ú\ä\ÆJq\Å\Ç\Ò\ÃfÿB\Ô\\¬sÚ°aÃ€6\Øñû\â÷¶È‡¿û\Ûv£‹`|£m†zº?\Þ\×K/½4=ô\ÐC\Û<\çŽ;\î\Ø\á\ëF\"»üò\Ë{¼ÿ¿ÿýoŠ-Ë¯ûš\ßp\Ã\rŠ`•ch·\Ýv»¸Ÿ\Í\ìöš\ìþ4×•M¶5\Ù<&\âpy=rK\äƒòŸ=Åƒ>˜®¿þúæ–ˆX[\Ï\Ïs3\å!\rvc>\åŸkµ5ßŽ¶\ì+ÿ>ÿB\Ôe\Ð7B/>lMl°-Z”^ñŠW¤—¼\ä%±\ÍaZ·n\Ý\Ó\ÙÙ™7Z\ãÆKx`úù\Ïžžþô§§\Ï|\æ3±$\'K.¹$\Ýv\ÛmqU\Í|\rZÄ§>õ©´ë®»¦Ÿü\ä\'Ý·\Åýÿü\ç?»t¼n<¯ø]?þñ\ÓG>ò‘†7Ø­4~¾ò•¯\ä\ï\ã›\Þô¦þ&óÿ\Ù\Î\Ìõ¦­·÷\ÇõñZ­ø\Ùlõ¨un9ë¬³\Ò^ð‚¼yŽ\Óyó\æõø\ØÑ£G§\ç=\ïyù—óx\\\ÄUW]õ„fýÕ¯~u:\çœsòŸ#Ç”\ÇõùçŸŸ\ß~ê©§¦½ö\Ú+\í½÷\Þi\Ï=÷\ÌO${\ç;ß™\Þõ®wu\Ç\Û\Þö¶<—4s2&Ý‡\è©¹ŽŽ3\Ø;þv½¾­­mòÐ¡Cw\è;Þ§˜YZºti7\Þxcú\á˜¾öµ¯\å?\ß|ó\Í\é\Úk¯\Íû\Ç?þ1=ó™\ÏÌ›\ï§>õ©\éû\ßÿ~zý\ë_Ÿ¾ô¥/¥}\èC\é½\ï}o~\ÒHü?\\q\Åy\ãgkGdÿ\ésŸû\\q6u\Ïx\Æ3ÒŸþô§t\×]wå\Â\'§¾\ï}\ïK\Ïy\ÎsòB¿\ç¹\Ï}nzö³Ÿö\Ýw_3Ø½CCút3ØƒcÖ®<&j¾D$\ZÞ—¾ô¥ù,`Œ\"O”c\íÚµ\é»\ßýn~ÿn»\í–>ü\á\çñü\ç??½ð…/L÷\Ýw_÷c÷»\ß\å·E\Ã?Ÿp\Â	\é˜cŽÉ¯k¹\ä\àƒ\îžˆ/÷/{\Ù\Ë\Ò/~ñ‹ô\ÉO~2ÿb;G}\àH—]vYþû\âŠÁÍœ‡\Ì`7\æ³WW4ƒÍ ñ\Ío~³!k°G\Z\Õ\ìk°·)€õ(‚;‹8\Z\å)OyJwTþü´§=-\ìò\å\ËSöo™fÌ˜‘µ¢pžr\Ê)yqû\êW¿šN;\í´üj\ìE>fÌ˜|\éÈ¿ÿý\ïü°l<6N>Ÿ\ãöoû\Ûù¡\×(\Ô[g\\Ó›\ßü\æôü#/>Qó›\ß\ä³\äñzw\Þy§»c¨¢™µû\É\×TlwL\Ô*·|ô£Í¿l_pÁ\Û4\Ø\×]w]úý\ï\Õ\ÈÛ”\ÅLr\ÌJ\Ç6­1\Ûl\Ì\Çlöüùó»_3^#¾ {\ì±ù\Ìu4\ÛÅ’hˆ\ãu\â1\Å\ã\ã÷¼ño\Ìÿ³\Ò\ïÿû\Ó\î»\ïž^ù\ÊW¦¯ý\ëùO\ä˜f\ÎC\Z\ì\Æ|¬ÁfP\ÉôòÅ‹w\rô.\"YR_Û¤þuq%©\í4E\r9)ŠXy™H˜øBT\ÜV¬›ŒÃ¨q_\Ìõ1\Ã}\å•WæY¥ø¹Xv\Ï}ù\Ë_žÿ³Bqñ;\â°p\Ü?mÚ´ü²µ/~ñ‹ó\Â\ë!c\é–[n±»—c¨3\Ævi\í¦b‡c¢V¹%–{Œ\Z5*]x\á…Oh°#\Ä­\â±q,¾pÿ\áÈ—q\ã\'fÿò—¿¤x {\ÙG\Ñ\ØFóG\Î\Î<óÌ¼±~\ík_›žõ¬g¥/ù\Ëy^3\Ï/zÑ‹ò/÷\Ñ`\Çüý÷\ß?Ÿu¾øâ‹»\ìf\ÎC\Z\ì\Æ|\ì\"Â ûNžt\ÒIdƒ}\î¹\ç\Æl\ëœ&ûð÷4\Û\Ø\Ð{ÕªUù7ùeË–\åk$£À\ÄLMü‡M‹C¶1\ã³W_ø\ÂòÙ¨(RE\Ä!\ßo}\ë[\éóŸÿ|ú\Û\ßþ–?>–š\Ä\Ú\ì(¼1#¯E5~Žð¸¿øoø\ìg?›\ßÿº×½.-X° ?\Ô\ë£ˆÆš\î_ÿú\×;=A\êI\Ò`\ïtõq\æ¸^û`b\ì¦µ\Ê-1s3Å•\rv,‰Y\å8\ÂU{\Ï{Þ“v\Ùe—ôŽw¼#o\Ìcö:\ÖnG‰\å q„,šœ»\ï¾;^4¼]tQ~´\ì-oyK:ú\è£ó×\ÜMu\Ì\"\Çøh¶\ãù\'žxb¾;rE,=y\Ík^“FŽÙ½D¤™ó»1Ÿû`3¨Ä•“F\Zµe ¯\ä8nÜ¸®V¼rR#\Z\ìHC¶¿\Þ6¸HPùñ1C…\éG?úQw\ì±\Çyƒ]~\\®(LQ¤\âÄ£x­8Œ?\Ç\íEa‹C\Åo}\ë[ó\â\Z\'Eq™©x|\Ôø{\Ì<Å—\0[iõ\É\Îf\ë}%\Ç\é²\à\à\É-q\Ø;þ\í\ã³Zn°\ãs\Z\Ë)\âó[<6nû\Ù\Ï~–\Ï\Ç2‘h¶£ÁŽŸõ«_\å÷\Å\ã\â¤\ÂXž\rùG‘7\Â\ÑPG#]D4\å±\ì¤r‰H\\’:rX,\r‰\ïŸþô§ù‰‹+V¬h\ê<¤Án\\?R4½õ¾’\ãð\á\Ã]É‘ú\Ë\×ê«¯¾z@:\ì8Q/k\è}2Áj\â\á‡\Îg±#!lMúù:\Ãø9f¡\Êk\Ë\röÔ©S»#š\ì(š\å\íº¢p}ü\ã\Ïwˆb\Z¯\' \Å\Ïû\ØÇº[¬»Œ™„¸?þ\í>øÁ\æ\ë6\ãPo‰ˆC³1\ãd‰H¿ô4“]m\Ó\Ü\Û\Çk®qn‰\Ù\ë8°\Ü`Çº\ìó\Î;o›\Ç\Åy\Z‘+\"\âs\rjñs,¿øô§??nÉ’%y\Ã·;6_KDb©F¼öé§Ÿž/#)v6Š;Žœ\Å2Ž8\Ù:\Zðh\Î\ã¶øû¿ø\Å7k\æ<¤Án\èL÷\ê¢ñq\\ñÅ¯4{½Ö»N=\ì\écÆŒ\Ù<³\Øx\à–ŽŽŽ\Z\ì¾m\Õ7¤b\rveDƒ\ë£ ñö·¿=^1k1q\â\ÄüLÿ(šqø6\îB?GaŽû\ãqqBj4óEcÿ\Û\ßþ6Ÿ=:\à€òCÈ±CI|	\Ð`\×d&»r¹\Æ/‡T¿\ìc{MöUÌ˜3rK,\å¨\\ƒ½½\ÇmÜ¸1_\Ê³×±Ì¢¸=f“£/?6–¤\Å\ìu±\å_q\ÞGù‹{4÷\ï~÷»ó™\æýö\Û/_\rp,A‰\Û\ã\ï\ÑH\Çk5s\Ò`7¶)\Ïb\×úd\Çx½x\Ý\âw´j?Bk\r\ê5Yò«\ë~}Y²\í\Êöº*Ö¨>©\ìøö\ëc\Æ\'\"\ÖXG)\ß\ÇÏ‰\Ûb\Ý\ã\äÉ“»#NŠ\ç\ëµ#b-v±\×mœ\ì÷‡xÿü\ç?w¯\Õ.\"\îÿ\ë_ÿšo\ÏõªW½*/Àñ~D!ŒC·±…–»&Mvù\Ä\Çr³\\Í‰‹==\ÏV|ƒ8·œ}ö\Ù\éŸøD>ó_¬cIH|>cD\Z·\Çýñ¸hRcF8>»q\ÎF4¾±†9–s\ÄN!Ñ´»…\Ä\îC\Ñ0\Ç\ë\Äú\î8a1f¦c6;n‹¿GŽ‰™\ë\ÈE1³KU\æÌ™“o\ãw\Øa‡\å{c¿\á\ro\Èÿ·\Å\ïj\æ<¤Án|?R4Àq$¤V[ö\Å\Zý«\å\Ù\ëV\íGh­½GöMnË­·Þº¥\Íuœ­>|øð®\ìw\ìm–©w3E±\×ly¹GeÄ¾\×\åÿ®\ØK6\Ö;jˆ˜2eJ~x¶¼¯m9b¯\íX\ï\Ø\Óý13\'JÆ‰EQ¨c\Ý÷úõ\ë»÷\ê>ò\È#·™ý\Ò`÷K\år‘]¶\Î@W»õ^\åóú»ÿ6Mž[\â„\ÄhšËŸýÊˆû‹£\éFµ8\"‡\Í\ã¢1\Ñxë¯‹5\ØñùŽ«\ã\çhpcG’\Øûºˆ\Ø)¤hÈ‹ˆ\Ùë¸½ü¸â±±Ö»™ó»ñýH6·ð¤I“ú\ÝdGs5³\Ô\\·t?B‹Éš³Î¬	Þ¼bÅŠšn\Û‡÷F½¥\Õ\Å4z‰ˆx\ÒÁZ\ïK½½\å\'\È-Bƒ\Ý\ÔýHy\ß\ì˜\É\î\ër‘x^\ÅÌµ¥!¼l\àMöÒ¥Kk²u_ŠŒ]J²ËœVoAE°›l‘‘[„\ÜÒ²ýH¹)ŽµÓ±)–õv·82S^s1úZû›c\×Ygµ¶?\'>^pÁe;óœ©\nE°O3\ÏýY\ÖaYˆ\Ü\"ä––\ïG²\èªl´‹\åN1;],‰e ±þ?.\"\Ó\ÙÙ™\ï»^qõÈ®ÁÒ\ÐÂ¶®Z=bÄˆM‹-Z_\å•\Z7;vSö\Zk\Ó\Z\'EPl`“]\í´\Z\å!·ª~d;—[¯&\ÖZsM³}{<1vöqó\ÑG½vþüù\ë–/_¾yÃ†\rù:\í8¹dÅŠ›¯¹\æšM\Çw\Ü#\Ù7\Æ\Í\ÑXÇ·\ÄÁvv®\"¨6Hµ\Ë<,‘[„\Ü2hû‘j\ëÁØ0ˆ\Ä–²\Æù\âl .\Ë\âñŠ¼9‹q¹\ÑÁ|E$EPl&{\Ä‘‘[„Ü¢™\í\n \nE°7v¶¦º\Ø-Ds-·¹@Š`/õ4“mYˆ\Ü\"\ä\0EP(‚5j²5\×r‹[\0A¡Ö¨É¾^s-·¹@Š`mÄš\ëü\ÄŸN¹E\È-\0Š Pkc7\r¶\Ü\"\ä\0EP(‚5¤Á–[„\Ü \nEPƒ\Ü\"·\0 *‚\Zl\ä¹\0EP\Ô`#·¹@Š [nr€\"(A\r6r‹\Ü€\"¨j°‘[„\Ü \nEPƒ-·¹@Š ¹En@T5\Ø\È-r\0Š \"¨ÁFnr€\"(A\r¶\Ü\"\ä\0EP(‚\Zl\ä¹\0EP\Ô`#·¹@Š [nrÀ 2þ|\ÅG\Ô`#·\È-\0\ÔÊ¢E‹¶¬\\¹Rj‚X¾|ù\ÝY\ÜdTj°\å!·\0´°»p\áÂ®x@!jpœ7o\Þ\ãYœhTj°\å!·\0´¸,ñNž;w\îú8„(\Z›@\r¶\Ü\Ò|cQn\04\Ø`,\0hj0\045‹\0\0š\Z0\0M\r‹\0\0š\ZŒE\0\0M\r‹\0€¦ŒE\0\0M\r\Æ\"\0€¦c\0@S\Æ\"\0 ©c\0@Sƒ±\0 ©c\0\ÐÔ€±\0 ©ÁX\0\Ð\Ô`,\0hjÀX\045`,\0hj0\045`,\0š\Z0\045‹\0\0š\ZŒE\0\0M\r‹\0\0š\ZŒE\0\0M\r\Æ\"\0€¦ŒE\0@S\Æ\"\0€¦c\0@Sƒ±h,\0š\Z0€\'w³\"š˜\Äz\ï\Æ\"\0@ïšš;kj\Ú\Ú\Ú&{§0\0z\ßØ¬\ÚAS³n\èÐ¡»z—0\0z\ß\Ôô8s\Ø\Þ\Þ>\Ý;„±\0P}c³½õ¯\ë\Íb,\0ô­©a½+\Æ\"\0@m›û\Ìb,\0\ÔH[[Û¾¥¦\æH\ï\Æ\"\0@?\ë_\Íb,\0TiØ°a»·µµŸ51\Ë\Ú\Û\Û\Ëþ\ì*\Í\Z>¾õ0ý\ìxœw‹Œ\Çd<\0-!¶;\Ë\Z•Õ½¸j^y‹´53¼{\Ôk<f\Z\0@\Ë52{\ì\äB½‰µû\ì³Ïž\ÞMj1³0€\Ö\Ô\Ö\ÖÖ™5#[\Ê\ÍÉ°a\Ã\Òô\é\ÓÓ‚\Ò=÷Ü“y\ä‘}ô\Ñt\ï½÷¦Å‹§“O>91¢²©\é2{H\Çc6†ºŒG\0 U›™É•\ÌÌ™3\ÓÊ•+So¬Y³&|<¯\â0ý9\Þ]ú2\Ë\ËAŒG\0 Õš™\Îr2~üø|v°/\ây\'NÜ¦©1sHµ\ã±\Ü\\\0@KÙº\æº{YÈ¤I“º»÷U®Ÿ6mZ\å\áù½½\Ûôf<–—…\0@\Ë)\ï3…ýmf\ÊMM\Å\Ì\áZ\ï6½h°G\0 ¥›™\é\å5®}=¿£\Ãó\å5°\Íc<\0ƒZyö:N«‡Y³f™5\Äx\0¿¸\Ò]y¶põ\ê\Õuihb7‡ò–i±\ÆÖ»\Ïö\Æcqb£ñ\0´¤­—›Î›Œ\ã?>\ÕS\ìK\\š5œ\í\Ý\Çx\0¬±XV4.¬kCÿ(54+¼û\0À \Ó\Þ\ÞþX\Ñd\Ôúd²Jq…½RC³Ù»ñ\0:±p\Ñd\Ôj+´m‘V¾Ð‡w\ã\0Œ\rMwƒ144\0À`oh\Ìb<\Z\0@­XóŠñh<\05d\×ŒG\ã\0¨!ûc<\Z\0@\r¹’#O\Öñ8|øp\ã\0¨¬ÁX]4\Z3gÎ¬KC3kÖ¬òl\áZ\ï:\Æ#\00hµ··O/\Ï\Z\Öú\ä²x½x\Ý\âwttt\Ìð®c<\0ƒ½©YS4\ãÇ¯\Ùi±\ÚÄ‰·™-:t\è®\Þq\Z5\'L˜`<\0\Ò\Ð\ì‘5[Š\ÆcÒ¤Iýnj¢™™6mZ¹™\é\ê\è\è\ØÛ»M£\Æ\ãÔ©SG\0`à´µµu–/¼3‡}=<Ï«˜¹v(ž†ŽÇŠ™k\ã\0Y\ãqf¹	‰µªq¢Y\ìº\Ð\Û\Ý\â²ò\Z×ˆ¬Yš\ã\Ý\Åx\0ž”b\æ0‹®\Ê\Æ&ö%Ž‹\Äl`q¸>»\Çñ\â¢iÔ¨Q\Û42[/}}¦w•FŒÇ‘#G\Z\0@sØºvuEsRm¬µ\Æ\ã\0 ¤­­\í\Ä>46kc–\Ð\î\0\0=ˆ+ìµ··_œ5*Ë²x¼¢ÙœÅŠ¸Ü´+\âa<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04¿ÿ<nþx.\ÃRb\0\0\0\0IEND®B`‚',1),('62502',9,'source',NULL,_binary '{\"resourceId\":\"62501\",\"properties\":{\"process_id\":\"test2_process\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-50FE8D91-DA87-44F9-B734-43156F42261E\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¼€å§‹\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-05036490-AE7D-4C3A-9B12-AAE78FC1030B\"}],\"bounds\":{\"lowerRight\":{\"x\":47.17683506785362,\"y\":535.9513818999012},\"upperLeft\":{\"x\":17.176835067853617,\"y\":505.9513818999012}},\"dockers\":[]},{\"resourceId\":\"sid-C12877CC-FFAE-4DD0-95D3-D7F29DB0A530\",\"properties\":{\"overrideid\":\"\",\"name\":\"æäº¤å·¥å•\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-755A77AE-FBB6-4D64-BBF0-69CA66B38E62\"}],\"bounds\":{\"lowerRight\":{\"x\":271.76835067853614,\"y\":560.9513818999012},\"upperLeft\":{\"x\":171.76835067853614,\"y\":480.9513818999012}},\"dockers\":[]},{\"resourceId\":\"sid-A3F77C5D-42DC-48B3-B0D1-8EFBFFE2D2AF\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¯¹åº”ç®¡ç†ç¡®è®¤\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0301AEAB-3CF1-4B3A-9F26-80D531F5752F\"}],\"bounds\":{\"lowerRight\":{\"x\":495.0672065606331,\"y\":560.9513818999012},\"upperLeft\":{\"x\":395.0672065606331,\"y\":480.9513818999012}},\"dockers\":[]},{\"resourceId\":\"sid-6F1911F9-0179-44AD-89AA-47CC3DADEB08\",\"properties\":{\"overrideid\":\"\",\"name\":\"æ˜¯å¦é€šè¿‡\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-263992E0-2E7F-443E-936C-D0071E09A15C\"},{\"resourceId\":\"sid-CFC66FB1-EAA6-4B73-B78A-D9B991BEE0B4\"}],\"bounds\":{\"lowerRight\":{\"x\":606.8355572391692,\"y\":540.9513818999012},\"upperLeft\":{\"x\":566.8355572391692,\"y\":500.9513818999012}},\"dockers\":[]},{\"resourceId\":\"sid-0301AEAB-3CF1-4B3A-9F26-80D531F5752F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6F1911F9-0179-44AD-89AA-47CC3DADEB08\"}],\"bounds\":{\"lowerRight\":{\"x\":566.3290766007457,\"y\":521.3775549364964},\"upperLeft\":{\"x\":495.5276816754724,\"y\":521.128724488306}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-6F1911F9-0179-44AD-89AA-47CC3DADEB08\"}},{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\",\"properties\":{\"overrideid\":\"\",\"name\":\"åé¦ˆ\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-CCC42B2A-E0A4-4E07-90C5-A041B4679DE7\"}],\"bounds\":{\"lowerRight\":{\"x\":804.2502377819982,\"y\":560.9513818999012},\"upperLeft\":{\"x\":704.2502377819982,\"y\":480.9513818999012}},\"dockers\":[]},{\"resourceId\":\"sid-263992E0-2E7F-443E-936C-D0071E09A15C\",\"properties\":{\"overrideid\":\"\",\"name\":\"ä¸é€šè¿‡\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C12877CC-FFAE-4DD0-95D3-D7F29DB0A530\"}],\"bounds\":{\"lowerRight\":{\"x\":587.3355572391692,\"y\":500.3594230835065},\"upperLeft\":{\"x\":221.76835067853614,\"y\":350}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":587.3355572391692,\"y\":350},{\"x\":221.76835067853614,\"y\":350},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C12877CC-FFAE-4DD0-95D3-D7F29DB0A530\"}},{\"resourceId\":\"sid-285CA00F-6778-440D-B07F-8520FDCC9571\",\"properties\":{\"overrideid\":\"\",\"name\":\"å»¶æœŸå®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-CAF768A7-8B24-4BEE-9D49-877B4C56DBB5\"}],\"bounds\":{\"lowerRight\":{\"x\":928.8417533926807,\"y\":372.00619615351144},\"upperLeft\":{\"x\":828.8417533926807,\"y\":292.00619615351144}},\"dockers\":[]},{\"resourceId\":\"sid-755A77AE-FBB6-4D64-BBF0-69CA66B38E62\",\"properties\":{\"overrideid\":\"\",\"name\":\"è‡ªåŠ¨åˆ†é…å¯¹åº”ç®¡ç†\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A3F77C5D-42DC-48B3-B0D1-8EFBFFE2D2AF\"}],\"bounds\":{\"lowerRight\":{\"x\":394.348320680635,\"y\":520.9513818999012},\"upperLeft\":{\"x\":272.4872365585342,\"y\":520.9513818999012}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A3F77C5D-42DC-48B3-B0D1-8EFBFFE2D2AF\"}},{\"resourceId\":\"sid-FAE0DB23-CA33-4509-8D9B-FCD019F19C57\",\"properties\":{\"overrideid\":\"\",\"name\":\"æ˜¯å¦å»¶æœŸåé¦ˆ\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E9777428-7B5E-4822-8AE7-7BB92D9636C1\"},{\"resourceId\":\"sid-2A85632A-E0FF-4EB8-8B6D-A031C95C2792\"}],\"bounds\":{\"lowerRight\":{\"x\":898.8417533926807,\"y\":540.9513818999012},\"upperLeft\":{\"x\":858.8417533926807,\"y\":500.95138189990115}},\"dockers\":[]},{\"resourceId\":\"sid-05036490-AE7D-4C3A-9B12-AAE78FC1030B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C12877CC-FFAE-4DD0-95D3-D7F29DB0A530\"}],\"bounds\":{\"lowerRight\":{\"x\":171.1486962023028,\"y\":520.9513818999012},\"upperLeft\":{\"x\":47.98867222493819,\"y\":520.9513818999012}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C12877CC-FFAE-4DD0-95D3-D7F29DB0A530\"}},{\"resourceId\":\"sid-CFC66FB1-EAA6-4B73-B78A-D9B991BEE0B4\",\"properties\":{\"overrideid\":\"\",\"name\":\"é€šè¿‡å¹¶æŒ‡æ´¾è¿ç»´äººå‘˜\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\"}],\"bounds\":{\"lowerRight\":{\"x\":703.697446482453,\"y\":521.3917457459575},\"upperLeft\":{\"x\":607.2438564078047,\"y\":521.102814928845}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\"}},{\"resourceId\":\"sid-CCC42B2A-E0A4-4E07-90C5-A041B4679DE7\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FAE0DB23-CA33-4509-8D9B-FCD019F19C57\"}],\"bounds\":{\"lowerRight\":{\"x\":858.3743290785116,\"y\":520.9513818999012},\"upperLeft\":{\"x\":804.8921697831295,\"y\":520.9513818999012}},\"dockers\":[{\"x\":50,\"y\":39.99999999999997},{\"x\":20,\"y\":20.00000000000003}],\"target\":{\"resourceId\":\"sid-FAE0DB23-CA33-4509-8D9B-FCD019F19C57\"}},{\"resourceId\":\"sid-A080EF73-043E-4C92-B00C-8CEAAB9221BD\",\"properties\":{\"overrideid\":\"\",\"name\":\"éžå»¶æœŸå®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-96FB5F8B-9B38-4558-8FFF-F4763C93D548\"}],\"bounds\":{\"lowerRight\":{\"x\":928.8417533926807,\"y\":784.2502377819982},\"upperLeft\":{\"x\":828.8417533926807,\"y\":704.2502377819982}},\"dockers\":[]},{\"resourceId\":\"sid-5329A1AD-2BA5-43A1-B957-D8E7C164926B\",\"properties\":{\"overrideid\":\"\",\"name\":\"æ˜¯å¦é€šè¿‡\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B004D343-97BB-41C7-932C-B2ED83470419\"},{\"resourceId\":\"sid-A1861E74-5051-4D16-BF6A-D97825BE1A25\"}],\"bounds\":{\"lowerRight\":{\"x\":1070.610104071217,\"y\":352.00619615351144},\"upperLeft\":{\"x\":1030.610104071217,\"y\":312.00619615351144}},\"dockers\":[]},{\"resourceId\":\"sid-2A6E5AA7-2460-4FE4-9267-2631C078E424\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":1064.610104071217,\"y\":543.3050520356085},\"upperLeft\":{\"x\":1036.610104071217,\"y\":515.3050520356085}},\"dockers\":[]},{\"resourceId\":\"sid-B004D343-97BB-41C7-932C-B2ED83470419\",\"properties\":{\"overrideid\":\"\",\"name\":\"ä¸é€šè¿‡\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2A6E5AA7-2460-4FE4-9267-2631C078E424\"}],\"bounds\":{\"lowerRight\":{\"x\":1051.0587352892398,\"y\":514.4676357088726},\"upperLeft\":{\"x\":1050.647800978194,\"y\":352.7248311957733}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-2A6E5AA7-2460-4FE4-9267-2631C078E424\"}},{\"resourceId\":\"sid-59262203-A698-4A97-897F-54A487DD0845\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F3DC8BE6-E43F-4697-BD2F-FD5E036399B6\"},{\"resourceId\":\"sid-50DF43F8-57AF-4E22-AD68-92FB7401384F\"}],\"bounds\":{\"lowerRight\":{\"x\":1070.610104071217,\"y\":764.2502377819982},\"upperLeft\":{\"x\":1030.610104071217,\"y\":724.2502377819982}},\"dockers\":[]},{\"resourceId\":\"sid-F3DC8BE6-E43F-4697-BD2F-FD5E036399B6\",\"properties\":{\"overrideid\":\"\",\"name\":\"ä¸é€šè¿‡\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\"}],\"bounds\":{\"lowerRight\":{\"x\":1050.3098456651176,\"y\":1012.8249302328404},\"upperLeft\":{\"x\":743.5601291604934,\"y\":561.3394572997321}},\"dockers\":[{\"x\":19.842841067353675,\"y\":32.03367866318149},{\"x\":1045.8724634784098,\"y\":1012.8249302328404},{\"x\":743.5601291604934,\"y\":1012.8249302328404},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\"}},{\"resourceId\":\"sid-96FB5F8B-9B38-4558-8FFF-F4763C93D548\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-59262203-A698-4A97-897F-54A487DD0845\"}],\"bounds\":{\"lowerRight\":{\"x\":1029.922410938153,\"y\":744.6887415958165},\"upperLeft\":{\"x\":929.6380692986185,\"y\":744.3976714681799}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-59262203-A698-4A97-897F-54A487DD0845\"}},{\"resourceId\":\"sid-A1861E74-5051-4D16-BF6A-D97825BE1A25\",\"properties\":{\"overrideid\":\"\",\"name\":\"é€šè¿‡\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\"}],\"bounds\":{\"lowerRight\":{\"x\":1051.110104071217,\"y\":480.00623750779573},\"upperLeft\":{\"x\":754.2502377819982,\"y\":127.64534480840138}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":1051.110104071217,\"y\":127.64534480840138},{\"x\":754.2502377819982,\"y\":127.64534480840138},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FD730648-B9AA-4119-84C7-3C6077C0C23D\"}},{\"resourceId\":\"sid-50DF43F8-57AF-4E22-AD68-92FB7401384F\",\"properties\":{\"overrideid\":\"\",\"name\":\"é€šè¿‡\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2A6E5AA7-2460-4FE4-9267-2631C078E424\"}],\"bounds\":{\"lowerRight\":{\"x\":1051.060908301543,\"y\":723.5522543112638},\"upperLeft\":{\"x\":1050.643674840891,\"y\":543.7703734517683}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-2A6E5AA7-2460-4FE4-9267-2631C078E424\"}},{\"resourceId\":\"sid-E9777428-7B5E-4822-8AE7-7BB92D9636C1\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¦\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A080EF73-043E-4C92-B00C-8CEAAB9221BD\"}],\"bounds\":{\"lowerRight\":{\"x\":879.2965404716372,\"y\":704.0863789146284},\"upperLeft\":{\"x\":878.9318881887243,\"y\":541.5981560591139}},\"dockers\":[{\"x\":20.5,\"y\":20.50000000000003},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A080EF73-043E-4C92-B00C-8CEAAB9221BD\"}},{\"resourceId\":\"sid-2A85632A-E0FF-4EB8-8B6D-A031C95C2792\",\"properties\":{\"overrideid\":\"\",\"name\":\"æ˜¯\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-285CA00F-6778-440D-B07F-8520FDCC9571\"}],\"bounds\":{\"lowerRight\":{\"x\":879.286379741013,\"y\":500.4708384486084},\"upperLeft\":{\"x\":878.9498614193485,\"y\":372.96728653899385}},\"dockers\":[{\"x\":20.5,\"y\":20.50000000000003},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-285CA00F-6778-440D-B07F-8520FDCC9571\"}},{\"resourceId\":\"sid-CAF768A7-8B24-4BEE-9D49-877B4C56DBB5\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-5329A1AD-2BA5-43A1-B957-D8E7C164926B\"}],\"bounds\":{\"lowerRight\":{\"x\":1029.922410938153,\"y\":332.44469996732977},\"upperLeft\":{\"x\":929.6380692986185,\"y\":332.1536298396931}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-5329A1AD-2BA5-43A1-B957-D8E7C164926B\"}}],\"bounds\":{\"lowerRight\":{\"x\":1423.8832783655837,\"y\":1202.3785108164248},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('62503',8,'source-extra',NULL,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0a\0\0\'\0\0\0[‘qC\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€\è\0\0u0\0\0\ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0sRGB\0®\Î\é\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0 \0IDATx\Ú\ì\Ý¸\\U¹?þ5\'Cj(Q@\"½—Ÿb#‘ª ”’€hP\Ð(\\A	\Ü+E@Š€ x	\"$ùR¥H¤ƒ¡\nH	\Ò\ÄB€\Ôsþ\ëÙ“L\'…œ“M\Ê\çó<\ï3}Îœ5³÷\ìýµ\ÖN	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`aT4\0\0\ïÕ!CúL™2e-Tw,+•kFŒ1^KÀ¼u\Ö\0\0¼WE\0s‘–\0BKKËùd¸–€y\Â\0\0\Ð£s]¬`™õ\Õ\\4,!\0\0\íqñÈ‘#‡kX6\r\Z4(Nh	X0Mš\0\0\0\0`\Ñ\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\0\0”@\0\0\0P!\0\0\0@	„0\0\0\0\0%\Â\0\0\00?=\í?BûYˆ\0\0\0¨6—\ë·\Ëu˜\æö\é¬	\0\0\0–y}suÏµi®µZ\Ýöj®ñ¹zh&h!\0\0\0ŸÍµy®\rs\Þ\ê¶r\r¶ÿ\íg!\0\0`xqzq®\ï\ç\×\Î56\×\ïs\Í\ÌU\ÑL\Ð>\æ„\0\0 õ~â‰¹Ž(\Îï—«K®iš\ÚGO\0\0\0\ê\"t\Ù,×½¹þX\\×œk\å\\¯ihÿ\0\0\0\áž\\c\Ò\ì\0¦\î¿s]£y }ô„\0\0 ì›«qþ›¹>kF®Us]Ÿkœ&‚ö\Â\0\0\0°u®¥\ÙGFŠ\à%\æ„y9Õ†\"—ë·¹&j*XxB\0\0\0\î/ª\îO¹&\ç\Ç\ç:.×º­\î¼GB\0\0\è@·\Þzk÷™3g\î‘\Ï\î\Ò\Ò\Ò\Ò\Ï6÷<Í¨T*ãš››ÿÚ¥K—‘œ¬I¶ºüx®\Í\í\ã\0\0:È7\Þ8t\æÌ™G¯¸\âŠÿZw\Ýu—\ïÞ½ûFù\êžZf®&N›6\í\éý\ë_«O˜0\áØ›nº\éÔv\Ú\é\Íò¾X=\×[¹¶Èµs®™\r·\ÅQ‘^Èµ|®K4,<!\0\0´Ó­·\Þ\Úyúô\é—ô\é\Óg7\Þx¥Î;H«,>]»v\Ý:·Y\Ê\í÷\Æ\Ã?¼Û7Þ¸}—.]8p\à\ÍSª©6\ï#©6ipª%)æ€‰P\æ¹\\«h&h‡¨\0€vŠ\0fµ\ÕV\ë¿ù\æ›ºs\ç\Î\Ð\"\ï]—.]zoµ\ÕV»\æv\\#\Ú3‚-­Rª\æ\\Ï¦Z\àòR®7R­Ì«¹N\Êõb¼Mš	\ÚÇŠ\r\0\0\Ú!† õ\é\Óg\Ýõ\×_›¶nŸ1\í­ôæ«¦\æ\éo§½?˜z¬°NªTü:7¹?>eÊ”¿¼ñ\ÆCóEC“\Ê5:\×Á¹NÎµA®ÿ—kZQ\'\äê¤‰ }¬ý\0`!\Å$¼MMM\Çl¼ñÆ›µuû\ÛžN\Ïüýôô\Ê\ãJ¯=}sú÷¥¼4µ4\Ï\Ðxó\Ûó£•Jå‡¹}ûhRE\0s[®£r]“j!\Ø)¹öIµž2Íš\ÚG\0\0iúô\é{õ\í\Û÷\ÅÎ;wk\ëöqO\\“šgN›\ãº\É\ãŸH¯?—Æ›‡Òµ\Ê*«Œö\Õ\Z¥º,\ÕAýÁ\\+\ä\ê›jö®Ÿk\å4û\ÕÀB\Â\0\0ÀB\êÔ©\Ó\Îk­µ\Öm\ÝÃ¦½õZ›{k\Â\Ó\Zo>>ü\á¯\Õ\ÔÔ´½–(\ÍøT›ÿ%&\ãÝ©¸‡X\ß8\×¹v\Ïu§f‚ö\Â\0\0À\ÂnL75­Ó­[·^m\Ý\Ö\Ò<}®3iþºv\í\Z½1\Ö\Ô¥¹%×›¹>’jó¿ÜžjGFš+>°q\È\êh&h\ç÷†&\0\0€…S©Tzj…E¸³\Ò\Ô\ÔC+”&†]j“ó†s=‘\ëž\\÷¦Z¯˜®š	\Ú\ÇÑ‘\0\0`p$–0\Ñuk¿\\¯—\ï\Èuwªª:Do˜Rm¸°„0\0\0°(6´»õJ]º÷IÓ§L|\×mq¨jX\Ì<\Ó\êòµ­.ÿYAû‰\ç\0`Y\ëÿ}\ë]\×õ\\yý´òº;j€e\0\0\Õ\Æv§.ï¾²\Òd¨À²ú½ 	\0\0 \ã½ýú³\é\Ù;\Ï~\×õ“_ûgza\Ì%i\Æ\ÔI\Z	`#„\0€‡Ÿ~õ_7¤\ç¸¨\Íù`\Â\äñO¤±wŸ›\ÞúÏ¿4À2\ÄÄ¼\0\0\ÐA¢÷\Ë+O\\“¦N~e¾÷1\í­ôü?.N}\Ö\Ü&­º\Þ\çRS\'GÿX\Ú\é	\0\0dü3Y \0¦\Ñ\Ä\ïKS&½¨ñ\0–z\Â\0\0@\é½ú–i¹\ÖyÏ\ë\Òc\Ç©R©,\×\ÒÒ’zöì¹‘Ö€ù\Â\0\0@\é½\ÆV\Ze\Æ\àÁƒW\îÑ£\ÇA›m¶\Ù\Ô\Ç{\ìðý\èG#O<ñ\Ä´Ì\áH\0\0\0¼\'{\ï½÷j=zô¸þè£^\ç°\Ã\ëö\ío»Ë¤I“þöƒü`}­s\'„\0\0`E\0Ó«W¯+?þøuû÷\ï\ß\'®\Û|ó\Í\ÓAô©S§\Þs\ä‘G®¦• mB\0\0\0H=€6l\Øzýúõ›c2£b¾ò•¯ôjnn~ô‚.XYkÁ»	a\0\0\0˜¯`–_~ù«\Û\n`\ê¶\Új«ôù\Ï~\Å\çž{\î¡|¿>Z\r\æ$„\0\0`ž\"€\éÝ»÷1inL\Ýö\ÛoŸ¶\Ûn»Õ§NúÈ¹\çž\ÛS\ëÁlB\0\0\0\æ*Ž‚=`Ž;\î¸\r\çÀ\Ô\í¾û\îi\Ûm·]óù\çŸÿ\ç!CºkE¨\Â\0\0\0Ð¦!C†ô‰£ s\Ì1ý4€©\Ûs\Ï=Ó–[n\Ùo\ÕUW}hÀ€µ&¤dA\0\0\0\à]\"€\É\'>ê¨£>´\Î:\ë,\Ôü.û\ì³Oš8q\âGºv\ízg¾¸\Ý\èÑ£ghY–eB\0\0\0\æCšššª=`\"€™2eJ:ðÀ\Ó?øÁ´üò\ËW\ïó\ÒK/¥Ÿý\ìg³.¿ýö\Û\é\È#L«­V;Bõ[o½•ž{\î¹ô›\ßü&ý\êW¿\Úf\àÀ×Œ=zW­Ë²\Ìp$\0\0\0f‰Ixc\Ò\ÑGÝ¿\Þ¦{÷\îi¯½öJ/¿ürz\ì±ÇªÕ¿ÿjÀR7bÄˆ´\Ê*«Ìºýµ\×^«>f¹\å–K‡rH\ÊÏ¹\Ë)§œòG-Ì²L\0\0@U0½zõº2Ž‚Ô¿ÿ9† }\éK_J}úÌ¾\êÁ¬†2ÿú×¿ª=^üñô\ÔSOÍº=\î»\Ç{T\Ïw\é\Ò%~ø\á©R©\ìq\Þy\çýŸ–fY%„\0€\Å\Ôo¼‘ÆŒS­	&\Ìq\Û\äÉ“\Ó\å—_ž®¸\âŠ\ê\åÑ£G§\'Ÿ|²zþW¿úUõ4vŽŸ~ú\é\êŽñ+¯¼\Ò\æßˆçˆ\é¹9\æ˜c\æ¸|ê©§zcCƒ\rj‰\Úw\ß}ÿ¸\Ï>û\ì¸0\á\Ö˜aÃ†­7·Ix=ô\ÐÔµk\×\êù\éÓ§W{¹\Ä\ç\í\Â/L\Í\Í\Íi\æÌ™\Õ\Ûòó¤ý÷\ß?u\ê\Ôi\Öc\ëA\Ìë¯¿>\äô\ÓO?Û»Æ²Èœ0\0\0°˜zó\Í7\Ó}÷Ý—þò—¿Tùû\ì³Ï¦^x!?¾º|\ÐA¥vØ¡\Ú!†…\Ä|þð‡Ó¥—^Z=Àd·\Ýv«Þ¿R©¤\ã?¾z\ßÿø\Çi\ÕUW­þ˜\Ç#z3¬»\îº\Õ\Ë---\Õ\'Ÿ|rõrü½˜$^G\ìD\ßr\Ë-\éÓŸþtõ¶iÓ¦¥O}\êSÞ¨\ÅHô4‰\êÛ·\ï\ÄÁƒŸ\ß\Ü\Ü|\é¨Q£™\ß\ã\"€‰\ÃP6l\Ýyiýõ\×Om´Qzè¡‡ª¡K|ž\âsŸ\Õz\Ð!\Í&›l’¶\Új«w=>>C\ßû\Þ÷*\'œp\Â!§vZóGq¸we‰\0\0Syg8}\å+_I7\ß|sôtˆ£Ì¤VX!\Ýv\Ûm\Õ^/Ì„˜‡\ã#ùHZo½õ\Ò\æ›o^½œ_c5\Òw¾ójxs\É%—T\ïû\Î;\ï¤\í¶\Û.\å\ß\ê\åGy¤\Ú\Ó\æ\Ë_þò¬¿+B—x\Ì\Ýwß~úÓŸVCÿü\ç?ÕžO<ñDõ~	aK-•J¥wKK\ËQùô¨ü~Þž¯ûM>Íˆ#Æ·¾s0½{÷¾\â¸\ãŽ[wACý\Ío~³úù‰‰wCL\Ð[\ïbþ˜üœs}|\Üþƒü \é\Øcý\Îù\çŸÿ\ÆÐ¡Có–±¬\Â\0\0Àb,z³l±\Å\éž{\î©^Ž\0du\ÖI/¾øb5<Yq\ÅÓ‡>ô¡´\æšk¦?ÿù\Ï\é\á‡N3fÌ¨^Ã‘\"„™4iR5D	›m¶Yº÷\Þ{\ÓW¿ú\Õ\êP’˜<5v¢ÿþ÷¿Wo^1—]vYõ¶nÝº¥‹/¾¸z\ß\èù\Ì/~ñ‹\êó\ÆsF@\Äb©\Òp¾%\×\'£ZZZf\Z4\è\Ê|zq=n>|ø”8\nR>õ‚0!zJ}\á_¨…‹\ÞPL|w\Ùe—YGHš\×sü\ä\'?©œv\ÚiÇœþù:ô\Þ6–B\0\0XŒm³\Í6\ÕÝ˜w#†EO–ð\ïÿ;\Ýÿýi\Ã\r7¬.!&N! y‡ºz9†}ö\Ùsô„‰9:bRôføø\Ç?žx\à\ê£8´p\ØgŸ}ªL¸\á†ª½mN9\å”\êücÇŽ­W\Z9rdúõ¯]\í	\ÃK…x?üð*ƒ\r\Z\âS\Ð.•Vû{U*•½bˆYn\Û;ºu\ë\Öó˜cŽùP¿~ýú¼—\'anñùˆ\Ï\æ¬?T©ý©w\Þyž#zpýð‡?l:é¤“.;\çœsfzè¡Žœ\ÄRO\0\0‹±ë®».\r2$}ö³Ÿ\ãúRôõ¯}Ž\ëþö·¿UÃ™˜Ÿ#\Äð¥\èA=]\æ\Ø+\Ï;\Ë?ÿùÏ«=^¢\'Lôª‰£Û„˜\È7¼þú\ë\Õ\ç\êÑ£G:\à€ªóÀ\ÄDÁ\Ñû\å\Úk¯My\Ç9\í´\ÓN³\æ‡\éh0\Ýy\ç1Q\ÍE>‹\Ì\ÇWXa…\×ë‡¡~/\"\Ì\ëÝ»wõ3Á\\ýº\è=\Õ8\ïüDÏ™Áƒw9ó\Ì3G\å\Ïy¯\è\ãmai&„\0€\ÅXL¼{\Øa‡¥«¯¾º:ü(†~\Äp£8ž(Ñ£!†(E\Øs\ÈÄœ11w\Ë\í·ßž¦NZ;&‚–Ö¾÷½\ïÍµ\'L1bD:ø\àƒ\ÓYg•¶\Ýv\Ût\î¹\çV‡:E\ï‡ab¾™EÀ„­·\Þ:=ú\è£O\ßy\çÿ\ëS°@\æVµd•zW•\Ú\å·ó\Å¼ò\Ê+\ë\Üq\Çcóga\Ë÷ò\Çb\è[L\Ì[`B|.£wK\ÜVŸ¯h~\" ¼ô\ÒK\'­¼ò\Ê?\ãŒ30,õ„0\0\0°[{\íµÓ¸q\ãÒ7\ÞX\rV:wîœžy\æ™\êmGuTµ§JSŠy[\âH5qdšü\à\Õ\à%z\ÏÄ„»Ã‘\ê;\Ë1\×L\Ì\ÛGNŠ\áús\Ö\'Ý\áJõ\r\Ñ#&†=\r:4p\Â	\éšk®©¾–E)†Dmºé¦¯v\Øa\Ã}\n\æoÐ Am…0Í¹šŠó1n\è\Ö\\W\å÷õšK/½ô…\âqkŸs\Î9ž9s\æ\íŸúÔ§>¹ +†Š\Åg zFµ½ª\âóô\ÉO~²:\ïË¼\Äa\×ó\çpr~¯÷8ñ\Äõ.²,\Â\0\0Àbê©§žJ\Ç{lõhHqX\é•VZ©\ÚC$z»455UNC:\Î8\ãŒô\Å/~±zø\àJ\â41\\)\æ\ìˆ1\r \Ò\ç?ÿùt\àV×º\'Ìw\ÞY=­0\Ñ\Û!Ž¼\áLñ&ž3æ‡‰	£7M„3,¶&\ä÷ýæ–––+Š‰x\'¶¾\ÃÈ‘#\Ç\æ÷uû_þò—W¾ó\Î;w\í¼ó\Î›ß“þö·¿­†d\à…8Ÿ³÷¢Vž:\æ\rŠ\Ðnn\"¨9\çœs&\ä\Ç}þ\Ì3Ï¼\Ã[Å²B\0\0‹©jà®º\êª\é\Â/¬ön‰CJG‚˜ 7‚•\èù½b\Ø\Òö\Ûo_}\\Þ©­\î(o°ÁiÔ¨Q\ÕyebHS]¾º.ž£gÏž³.\Ç\\3zõ\êU\n;Í¿û\Ý\ïfM\ÚsÊœþùB˜\Å\Ï\Ó---W755]Ñ­[·ûdŽ•\Ë/¿|Ü!Cv\Í÷½aÒ¤Iw\ìµ\×^Ÿ\Û}c\î 8RV\Ì\"¬ûÀ>0G(ó\Ïþ³:,)†¯mº\é¦m>\Ç\Ï~ö³·óc?{\Þy\ç\Ý\ã-cY\"„\0€\ÅTô(h;¶ló¾aH\ìGO—°\ï¾ûVkn¶\Ür\Ëj\ÍM\Ì	Ó–\å—_~V\ï\Þ•J\å€\\\\v\Ùec\æñ\ÑKfÈ!®¸\âŠ?Ž?þ¶¡C‡~ª­ûýò—¿¬öxiür\È!Õ£d|ò\É\ÕI¡c¾¢˜ 7\æŠžYõ\Ö˜|v§_ü\â–9Mš\0\0\0`\É6bÄˆ\ß-l\0S½fÆ÷ù¿þõ¯o}ö\Ùwµ¾=__\íU?úVô~‰9‹\Ö_ýô\á¸\Z\ZÆœE!Â–\è¥uýõ\×\Ïz|\\w\Úi§M\Í÷\Ùý¼ó\Î3‰e’\0\0€ªÑ£G\Ï\èÞ½ûžw\Þy\çÄ“O>ù¶|Uµ\ÛK„/1ü,&\ã\áGQ1/Ñ·¿ý\íY	¢c.¢ú\í1¡ó¥—^Z}l½L·n\Ýv>û\ì³o\Õ\Ò,«G\0\0`–\è3dÈ=ÇŒ3\â˜cŽy\àø\ãßª{÷\îcxÑ¼DÏ˜˜Ã¨µ˜\Ë\è´\ÓN{+Ÿ\Ýùô\ÓO\×†ešž0\0\0\0\Ì!‚˜Q£F\íùô\ÓO?vô\ÑG?2}úô)ó<\Ñ\æ„Nx«¹¹y°!H \'\0\0\0s1r\ä\È|\Òa‡V9ë¬³\Ö\ïÒ¥K÷}l\Ã$¼;Lt\Ø5×´Vw\ë_\ÈõXqy\\›\çš>—§®\Ïñ|®.¹žÈµC®•\Ûx\ÞÑ¹^..o\ëþ6žoH®˜¼\æ\ï8‹šž0\0\0\0\ÌÕˆ#Žž0a\Â\È\Ã?ü\É\éÓ§O^\Ç\Ô\'\á\íÑ£\ÇgzÀ´\äŠCjuoUk\æ: \á\á]s­\ØP\ä:?\×j\r\×õ\Î\Ç\É>3×‡r\Ëõjª…1\Ï\æZ+×§s5¾\Þ/\çj\ëPa[¯9=a\0\0\0˜§Q£F<hÐ q‡rÈ·\Ï<óÌ–[n¹\Ì\í¾õ0q¤\ÓO?ýo\r7E³j®\í[=¤W®ñ\r—\Ç6Jµ\0\æº\\\ë\æúy®7\îû­\\Ÿ\Éõ¯â¾±{iªõª¹1W½þ\Z¾Ÿ\ëŒ\â5ü¿\\3‹\ë\ãüs=œk˜w›EIO\0\0\0\æk\äÈ‘\Ã\ß|ó\Íó=ô\Ð¿þú\ë“Úº\ÏK/½T‚´SGAŠýÏ¸\íß­\ê¥\\Z\Ý7z»\Ëõ\Ý\\\ß\ÈÕœ\ëÿ\Ëõ»\\{¦Ú¤06\×ðT\ëó@®Ÿ\äº;\×!¹\îÍµs\Ãs\Æs–\ë¹N\ÏõµTŠô\ç\\\ßKJ \'Ë´!C†ô™2e\ÊZXU*•kFŒ1^K\0° \"ˆ4hP:üð\ÃO8õ\ÔSg®º\êª+\Ôo›0aB:ë¬³&æ³»µ1	o\Ü/†—\Þ=\'L*qô¤õr=™jÁ\É\á©\Ö\ë\å\æT\ë¥NôT\Ù;Õ‚”?\åúU®÷‰^6ƒRmˆR_:(Õ†,\ÕÃ¢˜c\æ©6d\é‚\\\ë\ä\Ú\'×¼«”I\Ã2­`.\ÒÀ²¨¥¥\åÀTûõ\0X1ƒw\ä‘Gþâ¤“Nš±\Æ\Zk¬=`\Î8ãŒ·:u\ê´\Û\\Ž‚AJL\ÊK}\ÂÝ¯æº¸\á>\ï¤Z¡Ê©6\×K1Z)\×s\ÅùpU®SS-d‰£6mR\\?&\Õ&×\áE÷¤\ÚD½\ë·=•+ŽŸ=`\"„ùcªõžY\Û;J™„0P3º\Õ\0À\Ò,6zh\0Öˆ#n\Øo¿ýö>ê¨£F}\ë[\ßjù\Ãþ\Ð=\Û\ã\ÄOœ\Ûa¨*\ê”\\7äŠ¡J1InýˆD3r*\ÎÇ°¡\Írý \ØN¯_·Kq~\×\âü¹&·¥\ârô„™Vœviøûo5£\áº\ï4<J!„š‹#\Ñ\×À² º‘\'!\0\ít\Ùe—ùò—¿|\Ð\ÙgŸ}ÓŠ+®¸\ã\Ïþó\Û\çó8\êQôDS\\Ž	vŸ,Î·ž¯4Â’˜P÷Œ6ž\ç\ã\r\çc’\ÝUŠ}\ÛGS\íp\Õõ\ÃW\ÇÑþ\Ùpß•‹û§†¿92Õ†/–D)„0\0\0\0,”3f\ÄpŸn&L\èŸOoŸÏ¾\çe¹¾k\\\ç¥\Úd¼14)z°D ²qª)!†-m›j\ç¶Ö£8\Þ0ñ\Ë\Â\Åsõ-NOHµ°\å†4{\Â\ß\rsŸ\ëúT›\à7&\çy\Ñ~R\Ü\'‚˜ib\Ôd\ï,‹Š\0\0€E-–˜L÷–\âr$qh\éRbn—:½X\ê!ÌŒ\âü“m<\×ó\Åieúzªõ|\Ù\"\Õz\È\Ä\á®#Ð‰\ÃOGÀóZq\ß\åR\í(K1|\é÷¹vKµI}£wNKñ÷\Þix}°Ha\0\0\0X\Ô,ª.Â‘Qó¸ÿ}Eµ¥>\ïÌ˜†\ëÆ´º\Ü\Úý\r\ç\Ç\åú·„÷C“&\0\0\0\0Xô„0\0\0\0\0%\Â\0\0\0\0”@\0\0@ˆ9Cû\Ì\å¶sõ\ÓD\Ð>B\0\0\0B„,‡\Ï\ã¶þš\Ú\ÇÑ‘\0\0\085\×Ú©´¬•j‡r~£¸m¬æŽ!„\0€…4s\æÌ·µÂ¢\Ó\Ü\Ü<M+”\æ¬Ta¾TœotIrHg\è†#\0ÀBjiiy\ê\í·\ß~]Kt¼Ü®\Ï\å“k‰Ò¼PTô~›«{®=Šóh\èB\0\0Xx|\æ™gž\Ò/·\ëóù\äZ-ñ¾\Ø5\×÷s]X\\þ&Ž!„\0€…Ô©S§k&Nœ¸üÛ™\Ö\è8S§N}-·\ëÊ¹}¯\Ô\Z\ï‹1¹¾•kr\Ãuk\'s\Ã@»	a\0\0`!\r8p\ÆÌ™3xè¡‡^™>}º\é\0ÑŽÿø\Ç?\Æ577˜\ÛwŠ)U„.£sËµI®Eí•«w\Â@»	a\0\0 v\Þy\çû¦OŸþû\î»\ïµ	&\Ì\Ô\"o\âÄ‰\é\Þ{\ï@\ëG;\í´\Ó]Z¤Tk\çúuª0\á\Ç\ÅuQû\æ:WAû	a\0\0 v\ÜqÇ›§L™òñ\'Ÿ|òcÆŒ™2aÂ„8r’†Y\0\ÑN\Ñ^¹\Ý\Þù\ç?ÿÖ®¹=¯\Ñ2¥[;\×Á¹/.\Í5¼¨s]T\Üh‡¨\0€°ë®»\Æ½\Û\Þr\Ë-\ëŽ7\î\'cÇŽÝ¡©©©÷\â²\Í=yò\ä\Ê]w\Ý\Õy\Ûm·Ñ»w\ï–Å¤\Ùb\×;w¾ý­·\Þú\ß\Ï|\æ3ú$½oF·º|d\ã\Ç\'×ž¹&j&h!\0\0t v\Ø\á\é|ò\Õ\Å\íu\r<øš–––\Ý~ø\á\Ñ#GŽ\Ü\Ñ;E+1Lô‚Ù£8\ßh|®µR\íPÕŽ\í`8\0\0,ZZZ>Zœn§5hC’úˆ\\›\çº9\Õz¿DO®\á¹>‘\ë\\ý4´\0\0–r{\ï½w\ÏJ¥²bœÏ§\Ë\r<xe­B\"xY;\×©\Öû%‚—±¹ŽM³\'\ì\ÚÁp$\0\0X\Ú7ú;wÞ£¥¥¥ñ\Ørr¡–¡•‘©vT¤`\Ö\Î\Õ\'×°T›\Æ|0\Ðô„\0€¥\ßnš››w\Ó$´\á°T~tV®«rý5\ÕB˜35\rt!\åŠo\Ê\0\0 \0IDAT\0\0,\ÅÐ¹¹¹ù³\×U*•\Ï\r2¤»Ö¡•\Ós\ÍHµ¹_b\ÈZ\Ì	³vq9>/“5´\0\0–b«¯¾úŽ•J¥w««»¾ó\Î;ŽD£\'Rm\ÈÑƒ¹\â³\Ñ3\Õ\æ„’kPªM\Îû¸f‚ö\Â\0\0ÀR,K=—›þK\ë\Ð\à\ä\\Û¤\Ú!¨‡\å\Z“j“òFE áŒž0\ÐNB\0\0XŠµ´´\ì\'mÜ´WU\ÒB\Ô?¹öOµ&\ì›f‡0&\å…\"„\0€¥Ô Aƒ¶©T*kæ³•Ö·\å\ëûô\í\Ûw­Dal®#\Ó\ì\Þ.1)\ï\è¢bbÞ˜+Æ¡Í¡„0\0\0°ôšß£=5…rm\Ðpùü\\«\åÚ½¸A\Ìx\Í\í#„\0€¥TKK\Ë<C˜J¥²¯V¢L\ëžQ?Nµù`€\"„\0€¥\Ðþû\ïß¯R©l:Ÿ»­µ÷\Þ{÷\×Z´!ŽˆÃþ ) \ãa\0\0`)4cÆŒO.\Èý:w\îü1­E+r\í’\ëÀT›\è fC\0€¥Ð¨Q£Fæ“‘õËƒ\r\Z’O.Š\ë‘#G\×B´!g~Mqþ\à$€\'„\0\0 L\ÉuSqúxq]L\ÎÛ½8i®5,<!\0\0\0\á–\\\ß\Êõ\ë\\W\åºR“@\Ç2\'\0\0\0u“s\rNµ9ah\èXB\0\0\0Z;2×©¹\Ö\Ö\Ðq„0\0\0\0\Ä$¼“.\Çù˜œ÷›š:Ž9a\0\0\0¸½\ë\Æ\äzD\Ó@\Ç\Ñ\0\0€¹q˜j\è@B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0\0\0 B\0\0\0€a\0\0\0\0J „\0\0\0(\0–^=}\×\0,>l˜À’o\Ø\\®\ß.\×aš\0`ñ\ÐY\0À«o®\î¹6ÍµV«\Û^\Í5>W\Í\0°x\Â\0À’ë³¹6Ïµa®\Ã[Ý¶C®Á¾\ë\06\Ì\0`\É5¼8½8\×w‹ók\ç\Z›\ë÷¹f\æªh&\0€Åƒ9a\0`\éùN?1\×\Åùýru\É5M\Ó\0\0,ô„€%_„.›\åº7\×‹\ëšs­œ\ë5\Í\0°øl´\0K¶{rI³˜ºÿ\Îu\æ\0X<\è	\Ã2e\ß}÷T©TF´q\ÓEƒ\rº¨ñŠ‘#GšGX\"Vm¹úç¿™\ëÓ¹f\äZ5\×õ¹\Æi\"|‡À\âA\Ã2¥¹¹ù¾N:i`i±u®¥\ÙGFŠ\à%\æ„y9Õ†\"—ë·¹&j*|‡Àû\Ïp$–)—_~ùSù\äñùÝ¯¥¥\åJ­,\îOµ£\"µ—ÿ”kRq~|®a¹\Ö\ÕLt\àwè£¾C`\á\é	\Ã2§R©\\™7š\Ëm\Óóm]r«¥€%À\ê¹\ÞÊµE®S\í\Ôu1!\ï¹–Oµ°:\â;ô\êü¹ñ\\n›”o\ë\å;\0\æNO–9\Í\Í\ÍW\Í\í¶¼\á5ñ\ÕW_­¥€%À€\\§\ä\Ú4\ÕzÁô\ÊõL®rm˜j¡\Ì*š‰2¾Cóm\Ý|‡À¼	aX\æŒ\Z5\ê®|ò\Ò\\n\î\Ò\Ô\Ôtþ\èÑ£gh)`I\Ø\'\Îõlªõ‚‰õ\Ú©\Ö\æ\Õ\\\'\åz1\Ökš‰þV-­o«T*\Ý|‡À¼	aX&µ´´\\7\×=š\æ\æKµ°k£\\\'\ç\Ú=×¡¹~˜\ëç¹¦\å2“*ýzC>i}ô£¾C`þ\Ì	\Ã2©©©éŠ¼yP\ë\í\Ê\\Ž\Z5\ê-,A\Îu[®Ÿ\äŠõ\Ú=¹^\Ïugª…3ÍšˆEýZ©Tšòuø€ù|j–EÝºu7\ßhuuüªg2A`IsYªM¼ûÁ\\+\ä\ê›jö®Ÿj‡©ž¤‰Xß¡q\ØóYC’ò\å&ß¡\00B–IÃ‡Ÿ’Onm\ØxŒ\r\É•J\åZX‚\Äa¨cþ—1¹v*.÷\ËG¯9 Õ†\'Ý©™Xß¡£\Ó\ì!IÍ¾C`ÁaXv?üMMW\Ô\Ï\ç\r\ÇØ¼rÄˆ\ãµ°¹%×›¹>’\ë„\\·\çŠ\nRmŽŽ8:\Ò?4‹ò;´Øžô\n\0òª	X†\ÝP©TfÍ•Ï›LX\ÒÄ£R­WB\Ø1\×©6/Ì½©\Ö+¦«f\Âw(\0,„0,³Š_\ìfýj×­[·´\n°„™žk¿\\c‹\Ëw\äº;\Õ˜ksý.\Õ&\çß¡\0°pt$Jqë­·vž9sf\ÌM°[KK\ËÚ‹\Ëg\ïº\ë®kzù\å—\Ó\n+¬0\é‹_ü\âõû\ï¿ÿ\âð²b\\ý¸\æ\æ\æ¿v\é\Òe\äÀ\'û-U\ËB÷¼,\ì‘\Ïî’—…~\ÖÃ–…vz¦\Õ\åk‹\Ó\èý‡§þ³&²\Þð\n\0‹ÿ,r7\Þx\ã6y\ãqøò\Ë/?\î#ùH—\å–[n£¼´ò\âð\Ú6\Ýt\Ót\å•W¦\Ïþó½V^y\å‹I“M™6m\Ú\ØgŸ}¶ÿk¯½v\ÜM7\Ýt\ÊN;\ítŽO\ÒR±,\Í\Ë\ÂQ}úô³\Þz\ëõ\êÚµë¦‹Ë²°˜²,\Ì_·\\§\åú\ï†\ëb~˜Ss\í¡y¬7|‡Zo¼=Sm2\ï‘\r\×\r\Íu¾¦\è8B©›o¾y\ÇÎ;Ÿµ\Å[ô\êÑ£\ÇÆ‹\Û\ë[a…Ò¸¸½¬\îy#{ƒõ\×_?õ\ï\ß\Æc=v@Þˆ\Ûñ\Ëœ\âSµä‰ž`Ó§O¿d¹l\Ë-·¬\ä÷ò¿´Še¡ƒLMµ\ÃR7:#\×5õ†\ïP\ë÷(z\r\í›jGWûi®h¯¦Ú„\ßõ\àoFq€…dN™n¸¡—.].\Þz\ë­\×\ëÑ£G?-ò\Þu\êÔ©ó¦›núÿ\ÖXcMgÎœ9\"6ÊµÊ’\'v¤VZi¥\å·\Ýv\Û\Ï\åi\ËBki8ÿ?¹®\Îõ¨f±Þ°Þ°\ÞX{¦Z\àrk®C‹ë¾Ÿk›\\1\Þ\ìÇš }„0,2Ý»wÿ\íz\ë­×·k×®\ï\Ú\èiiž‘&¿ö\Ï4þ™¿¤I\ãª^f\îú÷\ï¿^\Þ\ßpÆŒCµÆ’%†\Ä/Ù›l²\É.©Þ‡–\ËB~—\ë¹T;Z\ÖXo,Œ¥Zˆ»]®®ÿC®¿\ç\Z§‰\0:f\Ã\r:\Ô\í·ß¾~=¶\\q\Å;µ¾m\Æ\ÔI\é™;\ÏN/<xiuò¥G~_½<}\ÊD\r7ë­·\Þú:uúñ­·\Þ\ÚGk,b2Í¦¦¦£¶\Ür\Ë-\ÚÚ‘²,X:H\ì¨ÿ:\Õ\æsˆ\Ï\ÙÐ†úV®Aš\Èz\Ãz\Ãzc}3\×\ã¹¤Z \Ó]“\0t,!‹DÏž=ùÐ‡>\Ô\æ÷ž¦¿3aŽ\ë\ârlL2w;wN}ûö}{úô\é{i%C¼W1™\æÜ†X,\äú\\—\ä:,\Õ\ækx©U\×D\Ö\Ö\Ö¨_Q±>Y;™? \Ã	aX$¦M›¶S\ïÞ½Û¼\í\í‰Ïµyý;o<¯\á\æc­µ\Öúp—.]v\ÓK\È\n¶©i‡8š\É\Ün·,X:\Ð\ßr}&\Õ\æs“\ëOE]•\ëf\Íc½õ\ÆŠ.U\Ãs=Xœ:\Ä7@G\×k‘;u\ê\Ô\æ\r\Í3¦¶y}\Ë\Ì\éZm>ò\Æcl ¯­%–---«\Å\ád\çv»eÁ²\ÐÁ¢\×Kªú¢Tš„õ\Ö\ïU[GŠ`&z}\"\×jš }t1d‘m\ëh‚E#o@\ZŸ½\ä\è^©TV\Ö–…E¨S«õ\í3¹\Î\Îuzª\Í\í€õ\Ö\ïEý³÷x\Ãu1\Ùw„/÷¥¶C\Z\0\Þ!\å«\è€–:\êS”j=_\Z\Å¤\å5õ,„ú\Ñ\ÕF§w§Z ó¸¦\è¾\É)\Ýr}Úœk0õ˜\Ëõ`Y€¹Š‰xÿ\Ü\Æõ¿\Ó4\Ö°®luù|MÐ±„0”®\ï_Hº\Î9]A÷\åWO«m¸‡\ÆÁ²`Y\0¬7\0`©%„¡t•¦Î©Òº;u¾×ƒeÁ²\0Xo\0À\ÒJC©¦¼ùr\Z{÷¹i\Æ\ÔIs^?\é\Åô\Ü=¿LS\'¿¢‘°,X\0\ë\r\0X*	a(\Í/=ž»÷‚¹n$\Æ\Æe\Ü>ñ…»SKK³Ã²`Y\0¬7\0`©¢\ï*‹\Üô)\ÓË^‘\Þ~ý\ÙùÞ·y\æ´4\îñ«\Ó/Ikl²w\ê\ÒcE\rˆeÁ²\0\Ö\Ö\0°TÂ°\ÈÅ¯w²ñ\Ø\è7ž¯nD®ü\á\Ïh@,–°Þ°\Þ\0û\î»\ï J¥2¢›.\Z4h\ÐEõù>Œ1\Â\Ñú !‹\Ür+¬³P‚ñ8°,X\èxøÀn}û\í·›ûõ\ë÷¦Ö°\Þ`Ù‘wŠ—kiiI={ö\ÜHk°°š››\ï\ëÔ©Ó‚\ÜoŒÖ‚w\ÂP\Ê¤Á÷\Õ^¹\Þ\Èu\Ó{xÌ±¹þ§\ë?›\ë…\\\çúV®_¶º=\Þ\è\çšÑ°Žy9\×\ê\Åu•\\\çš×—òò¹\çú\Õ\\n_!\×~¹\Îmkß²x\íG—»\äúq®a­\î·r®8\ÆkKªÍµR®Æ­‰x¯\åzÚ²À\Òfð\àÁ+ç°?\ì¿ÿþo_}õ\Õ#~ô£}\ì\ÄO|@\Ëøe\é_ö{ô\èq\Ðf›m6õ±\Ç;</û#-û,Œ\Ë/¿ü©Aƒý3Ÿ\Ýpw{vÔ¨Qh-x7!,\ÖHµÀdZ®\ï\äú¿\\«\áB„\"7\á\ÃÅ¹\Þ*Æ\\3sm\Ü\ÆsF ñß¹ö-.Gˆñù\\W7\Ü\çTi,.G—\Ôø¥½{ª…0±\'±{ª)\åš^¼¦§\Ò\ì\Ð\'‚‘O¦9C˜O\çÚ®¸-|3W¯âµ†©¹~‘\ëôTSn\Ïu_ñwc=wW®ÛŠÿùû\ÅF\Ã\çr},\×\ï‹\×\Ýj÷(Ï»vq_Xj\ì½÷Þ«å°«>ú\èþY\Ï~ýú¥/¼ðo?øÁ¶þ\Ù\Ï~ö\Ä\"ø“›\Ë\á}\ÅòÕ§ûŒ\Î56\×6\Å\éøV·¯V¬›Nnuý¹\ä:³\á~Ç¥Z@\Ü(\Ö5\ë¦\ÃrY\\ß¿X\Îo..š\ë\Â\\S\Z»A®sm^¬ÿ¦¯\å\Ê\\‹¿¿v«¿÷x±\ÎI\Åÿ¯\é\è\âò\Å\ã\â=m;\ËiÄˆm\Þv÷\Ýw\Ç{6\ër\ïÞ½«5u\ê\Ôô\Ù\Ï~6}\âŸðAg^\Ëþ:y\Ù\ïö\àƒ.\êeŸ¥\\¥R¹ª¥¥e^!\ÌZ	„0°,\éWl\äj\Ø\áHE\à1´a\âð´z\\7ka\ÉAE`smqÛ‰©\Öû¤>|\áç¹®+v®^.®›P\ìdô/.ÿW®Ÿ\äªÿÒ¶i®/äºµ¨ð\áb§iŸ\"L\éZ¼†}Š€$a\Ésivš{þf=¸Y+\×õ¹®\Éuxñº#0ú\ß\"´\Þ\Ú\ÜV\ì\ì\Å\ã¢7\Ïö¹\îÉµm®‡Šp¨ŸK\ÛNX¯^½®6lØºýúõ«†!›o¾y:è ƒ>p\ÑE\Ýs\ä‘G®ê©§Ž\ë\à?\Ë\Ù%¹Ž/–\ß%öOµ\08\Â\Ï|ÿP\Ü7B’_\ë¬x3\Z‚Œõ¶[\ê×)–í•‹\à\æ\Ô\\?m\ã5\ÌH³\ÙT~],ß¯#5<\ß‘s¡K\Üÿ?¹n(Â™Æ¿{y®=‹\×\ÙZ\ãu{\ÏW·o±\ÞÝ·\áu¿\Ë+¯\ÌýP\Ó¶|\êSŸJ_ù\ÊW\æ¸þoû[zúé§…0,.\Ë>K¹\æ\æ\æ«*•\ÊQó\ni´¼!Ì!CºO™2%vžvËµI—.]Vljjj\Î3‹œ\Çc1c\Æ\í—_~ùdot˜bÒ‹­¿‹ð%Ä°¡¦Ù½K¢—\ÈK¹žŒ}€TrtDfQ<\îÚ†\çšY„¿+v„ž*ž«k±\Ó§=ŠŸ¾\Å\Ì\Z\ÅkH\Å\ÎO<\ïf±ÿP¬¦5¼\Æi\r«k\ÂD¯\çS\í\äÝ‹Û¾_¼®¸ýOE`¾Zœþoqzl±\ã;@Ë¥Zoœx}±A\Z½z\á\Ó\Ç\Z\Â\ZX\Úv\Â\Ö\Ë;a+4\Þ;cy‡¾\×e—]ö\è\\°þ7¿ù\Íñø§\ã»ý\àby@f@ªõX¹µ+n(–¹›‹\Ëg¥Z»u\Ãs\Äò½^¢g\Ý)ExrI±NÙ _\â\ïDø{X±þ\Z]\ÔQ\Åznb†\ÄzªÞ£%-ž\'žóö\"`9¢x3ŠuÆ€b}!ô#\Å}N)þ\Þ\Ä\âÿj­gñš>Qü½!E\à²AmQ¼\î\èÐº‡OºÿþûS\Þ6J;¿{3-®\Ï\ÛL\é¶\Ûn›\ãú‰\'V{\ÐÀb²ì³”5j\Ô]ƒ\rª9om\Â\Ë/¿|—V‚C˜¼\Â\ïÙµk\×\ï555}u«­¶šü™\Ï|f…7\Þxõ\îÝ»\Ïú{Ó§O\ã‘Giºþú\ë\×y\ì±\Ç~ž\â+fÎœyŠ0:L\Øs·\Ç\á6¢W\Ë\ÅNRS\ÚÄ°¤\ç{±£r`¤¼R\'±CsGñŸÊµs±C§S‹¥[C\ØLüŠ|}q[ý±?\Êu^±a\Î!¹\Î.\î=h®lx­–Dpû‹b-v˜\Ö+£\Åõ©c:ÿKK\Ã\ã?’\ëiv¯ õ‹0&vôv*v–®/žstñ·ööbi\Ù	[~ù\å¯.~_¡­û\ä\ï\êô\æ›o®x\ã7>”\ï·Q®‰øb\Çnxª\Í\Ítsbt.\Ö-kE}H\Ð]Eu/‚Š»Šû—fsLiv/¾‹\Z®\Ö¾Ô\\<%\Ñk/z½ý²a(Â’’wMµŒ¾[\ÜaN‹ŒaD\Ñ+¦uº¯w›\â¹\×Mµ0÷þ†Û‡\Ï¯}D±Ž‰uòU\Å\ë¬×»¼ò\Ê+]cxÑ£>Z\ÝInm¥•VJGyd›\rƒ\Åh\Ùg)\×\Ò\Òrm¥R9¨›®=zô-%…0ƒ\r\ZÐ£G‹ö\Úk¯\ì´\ÓN«t\éÒ¥\Íû\å\ë{o¹å–ŸÎ•fÎœ9eøð\á›\Ür\Ë-w\í³\Ï>‡ÿþ÷¿¿\Ù[\í¿4Ÿ\Þ\êº8.+\ÎÇ¯1\ì\çž\"Œ‰nú\Ñûe«\" ‰ ·Š‰z \×ý6\××Š\Ë*\î; \Õ~5Ž\0\ä\Ó\Å\ÎEô6ùvªý\ê;R\'´z-øü¬\ØA‰¿s{Ìœ\Ô\Æÿ“õ\ÆP…WSm\ØQ\ì\ì\ÄÐ¡*C \ê½fŽ*^_\ëI}‡ÁL}\Ï\åÅŽaƒŠa+¦\Úð€MŠ )6Boòbi\Ø	\Ë;\æWw\Üqs\Ý	«\Û~û\ícglõ;\î¸\ã‘s\Ï=wƒC9¤#~Ù½+\î+.©X\×lQ¬\'\"5x£¸\í˜b»ddª­\ß,\Ö+Oµ±\í2¿ûzO”ºC\"T¾ €(\îwM±Ž‰\×\Z!òYE°\Û#_Oµ\Þ:Šõ\á÷‹\×`ñ?\Äz\'B\ãq\Åÿ[?\ë¸b\Ý\ë´zO¼_\ë°O§W¥9\çt\Ï=÷ô‰\åOúS›!\ÌG‘8\à€6ÿ\éë¯¿~®s\É`\Ù/y\Ùg\Ð\Ô\ÔtEKKË»B˜J¥b>˜×²Ó‘OöÕ¯~õ\'ë®»\îˆs\Î9g\í\Ï}\îss\r`Z\ëÔ©S÷¯ý\ë{ü\æ7¿\éÒ«W¯£÷\Ýwß£¼5\ÐnûH\ëjó³\Ä|ÿ.vŒ\ê;M+v@\ÞLsö(\Ù=Íž\Ë%Ô‡\í4\îE(G\ZS\ìH\Í\ËÇ‹\à\'zÁD™®iöp¥FLµž8\×¯\á¶\âo\ì×°\ÃÓ¨w«ŠÿqR÷‹¿µYñ\Ü\Ï\áK„CcS­7,±\âH(ñ+x\Þ	\Ûp~;a³ð\ÝwO\Ûn»\íš\Ï?ÿü?cHq¼ŒŠ\àb›\âr}ùš\\œ6™<¹¸nµ\âòw‹ ¦õ/óˆ\\TÔ®\r\ç£\Ý‹ó\Ç÷ýŸ\â9>Z.ÿS2õjœ|»>¡\îjiö¼.=‹óñwN+\ÎY6‹Úºx\ì\Ä\â|¿†°(z\éE½/½ªon/N¯l\Ý`·\Þzk\ßYzè¡¹\Î\róÁ4\Î	S¿Ü³gO|—eŸe@·n\ÝF·´´¼\Ñx]¾<5®\×:PBóµ¯}mØ†nøý\ã?~µ\å–[n¡ž£G\ëýú×¿þxß¾}?!ˆv‹Imn£\êV.B˜Bb8QÑ‰®ú\Ñ;\æ±bå…†ûÇ°¢8\Ò\ÒoÛ¶¾“S\í\èCÑ«d•6n¯ÿ½añ÷¾˜js±D rT«\Ð\'t)vf\âú¿;;ñºbr\ÞuS\ëµZUaú\ïV¡N\ì\0\í’js4Œ/‚˜\è‘½k¢\ÇÍ›>B,©òNTŸüzý1\Ç\ÓAw\Â\êö\ÜsÏ´\å–[ö[u\ÕU\Z0`@{{Ì¶\î±!\Ç\è\"fE¨­ûNlµÎª«ÒŒ)\ÎX§\ç\ë½\Þ\Î-\Ö91Iycš\î\éÝ“o\Çzb@¼LiXO^U¬w\Ú\ê}sLqÛT\ë\å\ë“3ŠÛ¢·\Ì\Ý\ÅÿQ‹c7,\Í\î	´{«\çº\Þz\ëM\êÓ§O\Ê\ï]:\ê(›B,±\Ë>Ë€\áÃ‡Çº²ñÇ¹\èsk¾Þ°6˜‡YÁzè¡Ÿ\Í+\ì#²t\êÔ©½O\×ý¬³\Î\Úõ\ßøF\Ï}ö\Ù\ç>C“`¡TŠŠ¶q}½§I\×b\ç\äžb§!“šó\ã\"€ùDt\Ôwb8Q\ë‰\á:q¥X\Ø\'´ñü=vn\âüô\"ÀY»¸¼F±C¥(Â•#Šû¯P¼®\Æ &zôD/™ýŠ\×·\ÅU>Rü½\ï;T§÷\Ûoiõº¢\ÛÿZ]þ[ñ?EøÔ«¸>^\ë;EÓ½x-\Ó|œX\Òv\ÂòÉŸóü‡\ÖYg>óùû7&zýH×®]\ï\Ì·k\ç\ØþXö»\ëŽ_Æ¦ZO˜\Øx\áI¿¢®›\æ<Dt](†\Ý\×\Æó\îU„+ó2®Ë£.\×p~ÿ4{¬Ö¡O¬ÿP1}Šu\Ø\Ê\Åÿ2¥\áy\ÇÁ\Ìj\Åã¢¢\ç\Î!\Åúö¯Eø²Vz÷œ0ñÿ\ìv\à\Æ\ä\ã\ë\ÄP¤8\nR„1Ã†\r›5I\ïj«­6\ë7\ÝtSõ°\Ô1t\ésŸûœ¿eq[öYC’öhaE‚E\Â\Ä$¼yÁ»ôû\ßÿ~G0³^\×Ygõ¡ƒ>ø\ìü…òqi*¼gÑ‹#\æ4øs\ë\ï\ÊT› 6Ä‘~\Ùp[ta»¤\ØIˆ.û“Šóñ˜˜üvÏ†\Ðe­\âþ?nõüZÜ˜fÿ\êC\r¢—IIR\ì„]\ì\ä\ÊõZ«\ÇGÏœ˜“¦q\ØTôÊ‰aHq(\ë§\Zš;[ýÝº\ç‹¥\ÑZ\í\Ø\Ý\Þ*Y³x\Þ;‹ ¨Â°$‰ayƒ¸ú+x\ì„M™2%\åúôÁ~0-¿üòµÿ¥—\Ò\Ï~ö³Y—\ß~û\í\êD¯õû·\Þz+=÷\Üs\é7¿ùMúÕ¯~µ\ÍÀ¯\É;b».\äKŠ\0¢~ô´Ø™‹#\nEH“|G¯‘«Š0#¶Gb\î”k‹0$®{¤X\Ô\ÖEx\Ëå¡©6ô\çÀ€\êaI*þþ6\î7 ø{Ÿ,\Ö{f¯7Ö‹?-Ö›{\áP<÷s\Å:m\í4ûP\Øý‹çŠ¹¦þ^¬\ã¶ÿ*\Ö9ýŠ&þ¿sR-ˆŽ\à{\ïnÝº]_ÿ\Ã_û\Ú\×\â=ˆm­t\É%—Tß—\è­p\ÒI\'¥ÿû\ß\ÕóqH\êk¯½¶:OLGúû\ßÿ\î0Õ–ý\Åa\Ùg\ÙqC¥Ri\ÎûƒME(sƒ&E\Âl°Á¿øô§?½\Â\ÂAš›=z|x—]v¹\éºë®‹ñ\Ú\Çz«\à=ùgQm9u.\×?•fw\×?¦\Õm\ÃZ]>.\Ïñv«û^Zœþv_÷\ÅE5úG«\Óùù\Ñ{l«}\\X\Z\ÄDœù»óê£>ºýWð\îÝ»§½ö\Ú+]y\å•\éùçŸ¯\Þo›m¶©\îd~ø\á\Õ\Ë1‘\ë*«¬’{\ì±\ê\åø>\Ç\Ä\é!‡’\Î<ó\Ì]N9\å”?þð‡?\Üs!^Vüˆr@š}8\ém\Ú\Øö˜R\Ü½Z¢\Ç\Ë\è\"Y»\çS‹\0fF«\ÛÆµõ,\ÖmñwcxÒ…\r·-N#¤9½ø›õ¸W¥\Ùó\Ñ\\Y@Q\ß*®?¶aú§9{ÏŒ)¸\ï\Z®û~7\Í\Ù§.þæ™©!O\ßø\Æ7\Ò;\ìP\rX&OžœÆŸ>ó™Ï¤­·\ÞzV\ï˜k¢^|ñ\Å4n\Ü8ƒeqXöY>w:uÚµ¥¥e\ëb\Ý?^\ÍÈŽ<xð\Ýùú›GŽ9VKA‡01qW\Þ ³ª/\nû\í·\ßÀ›nºi­üwN\×\æý‘W¢_nnn3jÔ¨G´–\Ë‹\ï\Æp¯^½®,E;\Ç0„/}\éKiô\è\ÑÕ÷ð\àƒ¦\ÕW_=ý\ë_ÿJ]»vM?þxzù\å—g\Ý?\æ#\ÙcZ\Ïò˜`?v\Øò\Î\Ø\çw\Þÿ}û\Û\ßþ\Ú{|i·:?¯Éº‡ž\Ïóo\ãº+Û¸nd«\Ë¶º|~C\Æ\Ï\ãù\ê\áL\ãö\ÈøV™—ñóø¿\Æ\Ì\ëë®»nõô£ýhµ\æf\Í5×¬\Ë\Îw\Êb¼ì³”\Êûg[\ä\ÏnôÜµ}\É\Îq\È\êú“\r\Z½bŽ9r\ä}Z\Z”ö<x»\í¶šW\â\Ýô(H\ïU§N:o±\Å\ã\ï¹\çž\è\Ò{·«|y%zI^™\ÆJô©|\Z¿\è]›¿°\ïz¿\ÇÇ¯Ã‡ùˆªG˜4iRŒA­\Þ6s\æ\Ì\êFj·n\Ý\Þõ¸\'Ÿ|2ýõ¯M|p»þ~tóý¿ÿû¿”7Jª—\ï¿ÿþô\ÆoTÄ²°¨¼ù\æ›)o°§ƒ:¨\Í\Û_ýõ\ê\íC‡}\×m\Ñ\Íü\ÄOL?ý\éO«—§OŸžN>ù\ät\ì±sv4Œõ¸oü¯y#+ý\ç?ÿ©.S\r\íPý\å4®{\æ™g¢\Ûqõ¹v\Úi§t\á…V°\Ý\ß[{\íµ\×ÒwÞ™¾ð…/Ìº\î÷¿ÿ}õþÝ“rI’?O-E»^™\ë\ÜW_}uô{ýL5ì„­7·‰8c]\ïÿ´iÓª\ïW´ys‰_\Ë\ã}®¿\Çùy\Òþû\ïŸ\Z‡\×w\ÆN=õ\Ô!§Ÿ~ú\ä\ïÿûß±F(\ïý}Ÿ\×{\é‰\'ž¨~-p\n\0\0 \0IDATNÚº-¾g\×Xc\ê\å¿ü\å/\Õ\Ï\Õ\Ç>ö±Y÷‰\0 G\Õ\ï\äøœ\Åú‚ŽûN±\ìS¦øñ=oÿž‘?75\îC\æõ@s\ïÞ½[ò\ç«S\Þ/œ9q\â\Ä\ÊÔ©S\ë{5»\î»\ï¾\æuÁù‚¦;ûÅ„p‹\Ò.»\ì²Ê½÷Þ»›\æ}·n\Þ`ˆ\Ã4µ\Új«d;&Þš1c\ÆÍ—_~ù\ä\Ò?¸;§‡~¸zþ\ç?ÿyu\\|\Ý\Å_œ.¸\à‚\êŽbtÁ½\á†f21úž{\î™u96\"£‹wüZ”70\ÒØ±cg…9b\ã%6d6\Ùd“\ê\å\Øxyê©§ª\áË–[nYÝ±.¾X\Úû\äFÀ¿ñùŒ_Àô£\Ú«øl\Þq\Çs„0·\Ýv[ºû\î»g}ný\ë_WC\Éú†t|\Ö#,ü\áX\Ý\Ø8p`\Új«­R\Þ@Š>\ÃÕ‰?cþˆ\Ø¹\â—\ÑXf\â9£[úu\×]—ò\ÆSu\âÏ¸_<o,\'1\×@„š<ð@5H‰€(B•\Øa»\ï¾ûª‰\î¸ãŽ³^\çJ+­T}Î§Ÿ~:}÷»ß­^Ï½ë®¦(\Þ\Û=¢úö\í;qð\àÁ\ç\ç÷\ã\Òù…<v\Â\âP´Å¯\às=\Êúë¯Ÿ6\Úh£jh\ïu¼\Ï–\ÅûV?rü2\ë¸ø|´Ÿ\Ç\ï}\ï{•N8\á\ÓN;­ùˆ#Ž8Ü»¶\è\ß\ß÷[¬3b¢\ÖÿŸ½;“«ªó\Ç}«;!\Í\ZÀ\0Q‘E¢\à(‚(‹\Ê&q%&Á-Œ(\n?g@Qg@$\ìtˆJ\èd\"pˆ\Ã\"H@6!\n\n‚@@À1„%I‡$]ÿó½u*Þª\Ó]Yú}Ÿç¤–®ªîœª{\ëž\Ï=K\ì:a\Þò–·\ä?1Ip\ìB|Îš5+qcCb\â{ó\ÄOôa\è§\ï\Û>\r`bž¡+³\ÊP\ÑT\Ë{\î¹g\é½\ï}oLM\ÑTsB>?øˆc›nº)ŽQ\Ê\ésWŠ\Þ1\éù£\ÒþoLkk\ë³j!\ÌJxþù\ç\ßü\Æ7¾q@ÿÀ7¿ù\ÍoJ\r\î¹ÞªUY=&\Ë*+C|*4|*5\È\Ú\ÒCtÑ¾\"¬]›|0z\è]q\ÅÙwÞ™}\ç;\ß\É#X©ŠƒŠ\êÙ¶8\ã q;º\áF#ò\Ý\ï~wö\Ç?þ1>[y˜Sý\âˆI\r«\r\Ùx\ì\ÕW_¯J\â\ì\Ñ&›TŽq\âKeÊ”)ùY£|\âSˆ\Ë\è!sþù\çû´Žma\É@l1¼³:\Äó±\Ç\ËÅŸý\ìgyC&\ÂÀ˜ó!nWEñ\Ù\ßj«­²XI%Ä˜ÿ\Ú\ÕS\â3x¾ÿý\ï\ÏWO‰\Ïg„\ç\é\ïËŽ?þø<´ù\Ìg>óJh\Û\Ç6\Ûl“?\ïK_úRò\ì¶\Ûny°²\ãŽ;\æ\ÛÌ“O>™7¾\î¿ÿþ\ìcûX\ÂD\ï²(ozÓ›ò\íkøð\áy\àRF\Û`„•ñ\Ü\Ú^A,\×X\r²ty\\ú<\Å\Ò?J\×gtv\Ð\Z°T\ÏW¤†\ív½YŠ6\Þ\ÏÔ€\Ê{:…¥k{9E#9&€\íJüü\ØcmúÖ·¾õµ‹.º\èù\Ã?\\‹ºþ÷w\ãÞ¾¿«\ÅAb\Ú\Þc[ÿö·¿\Ý\ãc#]´hQvë­·\æó\Ó\Ä	Ž\è!\Z¯½a6\ß|s€\î¿S¢\×\Ô&½ùN±\í\Ó\à\0¦¥6€‰cŒ¯~õ«¥\îÚ€q\ì%o”.¸\à‚\ê¼Dû´··ÿ2½Þ¾¦™@³Ò†\Ô\ÒY\Õþ\ßôe´eú\"š\à\íZ-,·Vzob\ì\ç\Ó\ÕF#nüøñÏ¤\ëwÅ\×@‰a‘¼u\ÔQùPŠh@ÆŽ¾*”8\Û\â\ì{<ö®»\î\Êï‰\æŠ\Ïn~\Öþ¼ó\Î{%°©=@Œd4FošŽ\â\ìQ¼\æ‡?ü\áüŒ\Ò5\×\\óÊ™ý\ê\ë”X\É\à¾û\în{X-]~SXq[˜1cFó;\ìPw\ã\ãsŸû\\>T(z{EO•*\âLeŽñy\ëU\ÌD³þú\ëg\é`<\ïñg\Ã9çœ“.ñóK¢\'JˆUVBõ¬tˆ\î\\z\é¥ùg,†5EcjþüùùÐ¿R½_\âùµ]Õ£\ÇL9±}\Åoû\Ûó\Ç\ÄÐƒ\Ø\Þb²\Ç\è©A\Î\r7ÜI\Õ^=!^;~Ç¦›n\ê\Ó\Ôyƒ,†\â¾;½\ï\Ë\Ò6eºüq\Ú/\ÝÝ¹c%”˜ˆ³·°ó=\Äp°±\ãsS\Û‹÷ ‚º\Ú\0¯«\×H\rò\ÒÄ‰OH±ûRc\ìgÞ²>{\åý;vll´“\ãý]þÀ\è1\Ûr|\ßv8þ\ËOd¤†X~;¶\ïønŽ\Æ~ô\Za±O<.J1±‰}Xg½Me5ÿ-u8ÆŠ\ï˜Ž¯Rž´\Þz\ë}ß¶O£´µµ}¿\ZÀ\ÄÉ˜¯ý\ëYo\Û[o½u~&ŽG\"¨M\Ûÿ\Î\éõb\Ì1j!L¥\êuúŒƒûôe±Mºz©·k5<b(•†te¢µyP4\Ä\"¨H\Ï<óL>/L4:£JUœ±«=\Èûù\Ïž÷\\‰Fh|D6\ÎÅ¸õt –~ú\éÙ¶\Ûn[\×\ï¾þú\ëó3I\Ñ\ë&‚˜\ï¿²\ÒsH1ü\é–[ny­\íau\ÜV\Ü\âó=ª\"T©Gôðú\Ú×¾–ô¦\Þ,ð\æ_4`\âõj\çU‰°¤:n?z\ÈD HôH‰ð¤:oQ„1q\à\r¢\Ú\í#†\Õ\Å\ç7†\ã…b\ÛË½÷Þ›\Ýx\ãù\Ù\ì2¯\Ûtü®8-\Ñ+¬\Úó%Vo‰m+\Z\Õf\ÕÀ&º¹G\ïšhœulEù¾ô¨dmK5*òô¾ûºô¾=}ÿnp\Â	\'l\Õq\"Îžt\ÐAyxûÂšo~9zô\è^½F„\Ói¿\Ût\Úi§]~\Æg´¤ý\Ò»€•ÒœÞƒ§Ë\Çû{\ÕUWÍ\á##FŒX\Z_Ùž{î™½ó\ï\Ì?\'ñ=\Z\Ò÷P\Þ®*–Œ£±õ\Ío~3^|GWç‡‰}O\Ì³*˜5ð;´¹³ã«´_}W\Úö‡¬\êmÒ¤I\Ë\Ò>ýJ›\ï\Ú-}\ßD·\Ûü{6öK±¤y½s\ÖLòœ1ñ}\ß\ÝS§N¬†\ÂôÁÒ¥K\Ëû]tƒ¿ô\ÒKÿºxñ\âo{»V‰ºTÒÂ½\éÀ\ëõE\ã0†TÌ›7/\ï\é\r\Æ8ˆƒ‹8ˆž\Ñx/Š[¢‘ù\Å/~‘}ö\Ùù|\Z1)]4$\ãŒ}¼^=!L4bcuh|Fo™8\ã\×C‘\ZH±$ij$ÿ-Dþ‡\æ\ê¿->ü\Åø\Ã\Öû¼h¬üÛ¿ý[>D.z¸D#(\Â\Âc=v…\ÇFÏ¬\è½mb\ØQŒé¡Cqv3Jµ\×L4Žbˆ@\Ç@(†#\Åg:zÞ„w\Þ9oü\Å0¨˜+)¶³ºAKôd‰m+\æzI\ï¼av\Üq\ÇeGqD~\Æ<\æˆ9 \â1±BKµ‘Cù¢\ÔN–!J\Ð\ÅÐ…\êjkqcª¿\í™\êó¹\êR´uµêš›óž~\Ñ)B½\ê}ñ\Þ\Ôör\êI|¶Æ?ô¬³ÎšÜ±±\È\ÊI\Û\Ð\Æqò \Þðv \Ä\Ê9[l±E>T\å\ÐCÍ·\ÕØ§\\w\ÝuùRUŸý\ìg³x \ïý=d\âI?ˆ³\àñ¹Š\ï\áø¾}\ë[ßºJÿ?«\Ùwh_Ž¯\Ê{\íµ\×?Ò¶¿ýª\ÞöSƒzÚ„	62\Ñ\êÚ«†”±m;‚”¾.\ÆÏ‹žsql\Ç\Éùi¿Òi`­aRc·mÉ’%\ë\r\Ô\êH!¾Rûii\éª1nÜ¸\î^	\á\Òúu\é}š:gÎœ\Ëbfÿ´“-\Ô\ß\r\Î\è\Ã\Z>ø\à|¨C4Ncõ•X(™\êºÑ€­®þÑ› <d“&M\ÊÃšOªJo\í±\Çyø-q¶/¾˜\"”‰ƒš88bŽ›w\Üñù/ùË¶‡5`[H¨_Ž1bŸ¾ü¾ô\âs½`bµ£3f¼r\à\\+z¤D\0ó½\ÄD·±M\Ä}±JR4š:\ê\Ø[+\Îl\Çg¸“ƒý|8T4À\"@©+\Ð\Ä>?†0U‡\á…Z¿7\Zmq½§ƒú´O\Ïç¾‰\Þ;±\ív6ôo\rjL\rXC,\Z]¥š\î\é\æ\ÂtóÞ¹s\çn{û\í·\Ï\Þs\Ï=\ë\n¼£ñ¡[\íg)†»Eý\Ç\Ïb~ŸÞˆž€S¦Ly!5\ÈÞŸÞ¿\ì!úüþ.K\ïgs\íû;r\äÈ¶´=¯cô¢\\ô®‹\à%¾s£7[|ÿE»\î¶ñø\È\Æ$\à\ÞF°\Û\Ù>fUX¾C{øN©u}*­ñòº×½\îm·\Þz\ë\Ïw\Úi§{Wõ¶Ÿ¾ö<û\ì³0k±E‹¶\å|œZ¬œµ²\ÛqaŠ\×)\æN\Ü \íCbÿ·\Ô4B˜:¥/\âÌž={½z±õH;ûeK–,ùƒ·jµ“­T—{4\ÒNô\éù\ÉFýqÀgÝ«1d¢\ÚC \î¯.­\ÛQL\Z\Ä8€Œm$úõ.—¿+z\ÕT\Ï\è\Ç\Ü\Ñû zP——]vYv\î¹\çú¤¬ýbP}sw\ÛB_C¹\â\ÝýcÞ¢\èiŸ«\è\ÉCjÅœY±\r\Äg~Ÿ}öÉ‡oFPcû£gKôPYn\ãM\ÛE,#[+>\Ã1)&m¬†:1\átL€§c(Ašq4Ÿ¢·£[{<7þ†(PF	\ÑC\'¶¹Ž¿?z¡E\Z!Ql‡\Ñ\ë\ç?ÿó?\ë\ÞfÖ–@²³†Xmð’.bg73•Ÿ§\Ï×Œ\ê\ç+=o›I“&]—Þ›[\ßóž÷¼»7¿+zEw6gW\'‰\ÆUL\Ì[w\â,\ægœñRz>r\ÖYgE÷¿;\í\êjh¿²\ïH\ïoLðý\Ë\Ú÷7m{7¥\ínŸ\Õ\á\ï\ï¼\ê|01\Év|Nb›ÿÔ§>\Õ\ås\â3C1cb„81‰xôŠ±<u÷:l÷¦›—wr|5+}¦ö^¶ýSO=õÞµµ[ú~).£—k|>úCô\ì\Õüñ¸9!»œ\\Ï²\ì „\Éò.ó3÷»\ß}z C˜t\0ð\×ôEs½·jµ\na.O\Ó\ÒAÖµ«j\Ç=P\âX%æ²ˆ\ÉE#„‰®\Ð\Ñ\Õ1\"\âL|uÀX&/–ËŒ3ôÑ« \Z•±pLDs\Â\Äü\Z±\ìo<&\Z–\Õp\'\Z˜\Ñk¦\ÚxŒp|q\Ä\ÜU1ñh\Ü\re\ß1s*—õ÷¶“`\Æ\ç9ºó\Ç\ç7†!UÃ’]j\çTˆ^$zD¯’?‹\Ïd4|\âó+Ä¶R\rX\â\ç\Ñ[¬V\Åz\í\í˜\Û!¤hlU{\ÎD\ï—~\áG¼flq@´˜+&B£˜˜7D\ZÃ’jÿ\Öø{bµ§x*# Š×Œ!M\Ñ\ë\'~_MƒüóTm€\ÍKå—©Î®hii¹¡³U$\Ò{>{Ì˜1{§}\àUi\ßt\ç\èÑ£w\ï\éü\ä\'?\Éß¿ø¬Tƒ¬xc\ïWô¼Š\ÏRô¼\êJ4\ÖRp^z\ÞÁ\çœs\Î\ívu}wVSˆ\ç\Òû{Cw\ï\ï\ê z¨Å¾!z\Ãýð‡?Ì‡%F¸8\Ãz\ãþ\Øn#¬\r1¿\Ô\å—_ž\Ç½\äÆ™\ï˜<\Â\Ý\êüTt\Ù\àpnj|§Ì™3§\Ë\ï\Û>pè¡‡îœŽ}·‰\ëqœQÏµžD S„0[Ž92v w«q„0uH;\íI\é÷\Óq–´?7\ÎZ¿ý\íocÂº™ÞªU\î\Îô>L6l\Ø\äU}Àgû#|‰ù*¢J„(1#æ–ˆ0%\Z«ñyŒ9a\"x‰¡G1·F4öªbnŒ±c\Ç\æ•\ÑP=é¤“òÕŽ\ê\È\ÕaòDÖžm!Š#¤\è8<\'\Îb\ÆüEñÙ­Š¥ccR„µMÌ½PU;	cô@©U\Ñ3¬v•ƒXÆ½*¶¯8K\Z¯¯\ÛV”x\ÍX{Â„	ùvL\íÁ{L\Ì\Ý\ÚÚšv\Øaµ\rŒ<l‰×‹¹šjç‰Iˆ# \È\ï’5 öX:\àýß¦¦¦+\Òg\ë\î\ÞÌ³c\é\Ó{p`z\ìµ/¼ð\Â\í‡rÈž]=6xc^ŽxÿB\Ôs|jfd\Ç\ç.†¡\Å\n½\Æ÷¾÷½…\é¹¸ð\ÂkWP—\è\Ù0£ž÷wU‹‰uc»Žm9&ÛŽ}PuøylóÀ\Æ\ê€\Õ&z\ã¥c¶W†\æ\ÆjI\'Ÿ|rþY‹\Õ\ÕbB„\ÊñZ¬\ÜwŠmŸ–¾\ÞW½\ß÷ý)^/z•‡´¿xŸ!L¶\ß~ûßžw\Þys~ÿûßŒ\É û[z\ÝE\Ém\é\0\àYo\Õ*k|:\í œ:u\êj³ƒŒÉš£tø;ó³÷QjE¯—b\ì\é\n\â $\Z‘+£/s\Ê`[\èN\ÌuÒ™£Ôª6~ª—=‰U—\êðv§\Z\\v\\	-nw¶:Z4\àbˆBgg[»;»¶®R¹ÿò\Ë/ŸÕ—\çG£-\í\Çö¹\âŠ+®L\rª_§z|Og‹\à:¾ª\è\Ísd\Å{C\×bøX„`1\Ô2\Z\Ý1irm Vm„¥«¤}ªFXƒ\Þ\ßU©:‰nW\Çw\Ñ+´¶gh\í|‡\Æv_]þùN±\í3\Ògsû8¶Ž“41ÁvŠ\áMñ9Œ\Ï^úÛ«m£• »\Ã;|êª«®\Êw\àý\í’K.y¦­­\íxoÓª“¾/[°-°¶}®V¶½*\æÌ™sð\Í7ß¼\à¼ó\Î[a~–t>„,xCœFqL¸\ZËƒ\ÇP„j\ï„hp\Å$¬\ÑÃ¡¶6q\â\Ä\Å\é1¼ð\Â\rChðû‹\ï\Û>«@\Þ\Í;“\è¡\ZóÁ\ÕþlV:„=zô›m¶\Ù\íµ;\íþp\ÕUW=‘¾4¦\Ç\ØWo\0t-\æhiiù\èw\Ü1ÿ»\ßý\î¯\Ó]ù©\ïh€\ÅP¯˜¿\'zÿE‰	Rk\ç\çˆù=\âlgõ\ç1-ºŠ\Çs«gÁ‡\r6:5ònR\Ó`\Ûg\íW*•òYšjÜš`gµ\Í`\Ô/s7\Üp\ÃýÓ—À\ßw\Üq\Ç\rú£\Ë\ÚSO=õ\â\Ïþó\çÒ—…e\Ë\0 \â¬ø„	>:kÖ¬\ÖN8áž“O>y—\ÔÀ\ZCºg\Ç/¹\ä’î‰Y\'Nœ¸ ]}\æ™g:¶}‰r¹<?†#\Å|s¡f\ÅKj›Á¨_\Ö<\ì°\Ã\Ú^|ñÅ\Ï=÷\Ü>ú\èJ½\Öc=öôòh[[\ÛGÖ„‰\ë\0`ujŒM›6\í£<òÈŸŽ?þøû\ÓtŸ¾G\ã,ø)§œ² ½½}¼a`\Ûgp)•Js\â2–—ˆ)\'\âuC¹\\ž£¶ŒúmŠú‹/¾ø‘/~ñ‹;þù7;v\ä\î»\ï^÷\0\Â[n¹e\ÖøÃ—\Ó\ÇXÃ\0 o\Òw\èa\ãÇ?\í¨£Ž*{\î¹\Û:´¥žFX1\ç\è¢\'lL\å\åûŸL\åO\Å\í\ä\Ëhtu\ê´T¼F}G÷?§3»Ž\è\äug¦ò·\âv\ÌVý»N^oB*1z®wÖˆm?\æGzcõ×¥2¯\æ11,å ¬²œûô\â¾ýRyª\ØW\Ä\ì\í¥ò\æ\â1ñš1\ÙÍœ\âú©´uñ»¯b\Æù\è\åsG\Íc\â÷\Äÿû\Î\âÿ\Ö>\Ø?G\årù\Ñ¦:4-\æ\ê/À,\\¸°zó[-ƒQS¾X1ó\ç\Ïõ\ßÿý\ß7žu\ÖYs«õ\ä…^xú\Øc½ùû\ßÿþ\ãic\ß_\0\0+§µµõøyó\æM=ú\è£Z²dI¯º|W\'\â\\w\Ýu?Ps¼œ\Ê1©´t(¯O¥vÉ®uRÙ´¦\ìP4šF\Ö\Ü7<•X+÷œT¶*\ZP\Ïd•0\æ±TbLs,­Uû÷~*•±ü¹;°flû¥\Ë[Æ¢ÿ’Ê·S‰ñPW¦25•E©\Ì(^ó-©|!•Må‹©|&•Ñ©|?•ƒ³J{dñ\Ø8ñûÿ÷uVjWŽŠ×¨†?_(^/ž¯¤ò½TNò	Ê—¨¾¶zý\î»ûwM‚¯7Cm3\r\é\ï,†½Ü¸qûü\éO:\íu¯{\Ý\Ðýö\ÛoÈ»\Þõ®MÒŽýu\Å\ïœóò\Ë/?s\ÓM7=q\ã7¶?õ\ÔS—\Ë\å\ïN:õZo	\0ôiÓ¦}7}\Ïù\ÊW¾ò\ås\Î9\çŸ\Ö[o½õ»k„\ÅYðX	\å\Ì3Ï¼¥\æG\Ñ\Û<•½;<%\ZT\Ï\ÖÜž]”ðOE#\ìÿR\Ù.•³²\ÊY\ëª#²\Ê\Ùç‡‹\ÇÆ±Á”¬rfýúTÞ‘Jõoø·T\Î.þ†w¦R\í\×ß\Ê}\ZN°\Ælû“‹ \äòTbò\×\çŠ×.ÿ[ó¸g\Ê*½`fÏ‰\ëOûƒ\èšñ\Ù\â±K‹}Ç‰½¨š\èY·nV	{XümÃ‹\×XTü\ÞAoúô\éIŸŸ\Ó\Õb•­}\èCù$\Î++\æ˜I\í¿\êÍ¿Ì;÷Aµ¦M:ufº\Øc\ìØ±»?üð\Ã]|ñÅ»—\Ë\å\'ŠÜ\â26¼_Ì™3\çÖ˜\Ý\Ý\Û\0ýþ}<9LgGyä±©õúM6\Ùd£Žyúé§«\Ã8\ï¼ó:\Î½f\ãgOt¸Ó¢1\Óñ¾¯e•3\åqö:\Î0\Ç\êËŠ\Æ\×UE\Ãnvq;Î„ÿ2•Ÿ§ò\ÝTŽ\Ë*C>T\Â\ÄÐ€£Š\ë\Ñû\å\Å}\Ñ‹5{—a\Ùöc¿7•wÏ‹^3\ÑnË¬¾\Î+¶\éd•!OH\å\íE\Û!î°\æÂ¬U‡²+ö\rtò÷ÿ¹\ØO„r®/žAÑˆ\"„i*\Ê\Ò\â\ï/\ë V*•þ+µ\Ý~:oÞ¼ø,e&LX\é\×üŸÿùŸ|\â\ç\âõ/\ÐþC3@¦M›\ã+\ïT\Õ\0°jcG}ô)gœqÆ²\Í7\ß|“\ê\Ï\â\0û\ÜsÏŸ®\Ô\ÉDœñ¸Rg˜;\Î\r•E£è¡¢stV9ó}CV\é¥\r›\è©2¦R\âL÷Å©\ì^<&\Z:\ã²\Ê\ÙðhŒ}>«œ•~¡ø;LœþA*Û¦ò‰TþÃ»\nkÜ¶ÿ‘T\î\Ê*Ã—Ž(¶\éõŠ×Œ¡ˆ»f•-µÁj\ÌsBýgqû/©\Ä:Ûµ=a¢‹\ÆmE{#ö)?+\î\ß\'•k^+–›³Jø{Jñ¼-²Wç‡‰aMO	`*Z[[/;vì¿•J¥¯»\îº\ì\ío{¶\Ë.»ôùõ\î»\ï¾\ìšk®©\Þ|pØ°a©e«&U\0\0ƒ£1¶dÉ’/s\Ì1ÿxú\é§óS‘qü´\ÓN[²\êb%”hL\\4d\Þ^”3‹\Ë‹0eÿ\â±\ÑøŠ¹[bB\Ý’°MÑ˜Šë£²Jo—x­\è\á23•·Ï‹¡¿-‚–¸¼·\æ÷Gƒ+\æŒxoq;\æŽØ¨xm`\Í\Úöc(aL¾“sÿ¢xn5ð¸­\Ø\Öo\ëðw\ÄP¥¥²aq;†0E/šk½\çb~©i©’½Ú«%&>«\æq—f•€7z¿D™š´gV\é…ó\ÚT\È*a0Õ†bS\Óø¬˜£ë¬³\Î\Ê\î¹\çž>½N0ñüb¥¥¶r¹<\Æ*¸\êmk\0^3v\Î;uRbg¹mñ˜X\á5\Ïù\×b§\0\Ö\Ö\Ök—.]:\æ¸\ãŽ{\îŽ;\îx\æ\Ì3\Ï|au\Ö9øô\ÓO\ïj)\Úú“UnZ„#Ñ ‰\ç¹E‰³\Æ\ß/\Û^œš\Êû³\ÊY\íö\âz”ó‹\Ç=Ÿ\Êü\ì\ÕH\âvô„y¹¸|¾\æ÷/(\ZWµ]\Öc\È\Ãl\ï&ôi\Ûþ’K.ya\âÄ‰/®‚m?D`Ã†b\È\è3¤(\ÍEû \Z¶\Ä¾»IQŠ¡C1Án=\Ú>{u•¥=r,ö!\ß\É*C\âoŸ”½:‡Tg\"\0º1«­Šù©n\í°¯ñ¹im}°\\.\Ç\ÆK#@9\ãŒ3bþ\Ï|Õ¤Þˆ9`¦L™’¥\ÏY\ísŽ˜6m\Úýj—Ál †#\ÅN8º\Æ,\æ?)\î;,«Œ.‹‘’¿)«Œ/]¿8Àzw*_\Í*Ý\èm€qù\å—\Ï:ô\ÐCÇžþù·Ž9ò]§žz\ê{xJ4”bÁ¬\âö‹\Å÷y\èx2\'\Z0\Ñ\Ó\å\ìN^gÏš\ë1\Ù\çf\ÅqHüþ?g¯._«!=Pó\Ø\Åã³š\ß+©\ÄkÃ’ Žmüøñ?ýÕ¯~uòÐ¡COø\éOz\Ó*\Øöcþ—\æ½T¢‡[,k]\rT\Î\È*“\ã\Æ\êI1ñ\ïg•U’b\ßpZ±ø¿¢}Q;\é}5¿7z\ÏÅ°£\ík\Ú!ùPñw\Ì\Î*!\Îÿd•\Û\Ú}R–7mÚ´©cÇŽ9\\¢§\Ò14é®»\î\Êö\Þ{\ïl\×]wÍ¶\Þzë¬¹¹y¹\çDO«\ßü\æ7ù$¼\Õ9`²JˆwDô\ÌR«v\Â\\V\\FWÁ‹‹\ë²ü fGM1\ÙVŒÙŒ°&º.(v²\Ñ]ñjo\r\0\\clŸ}öÙ¸µµµ§³¾qœ«˜\Ä\Ñ\å?&´l.\ZN\Ï\r±·AJˆ¹\"\âö„N^«:‘gœW\ÄkmQ\\žR4²®-ngE\ì\äTb\"˜\äóü¢qö\í\â1\ÄDHs:¼ä…\î‹dD…§VÁ¶\'a£·\ÌYe\"\îØ–c½\â\çŠðcýšg¬ŒvEñ;b?ME˜\ê\êMñø\è1Ç°¨od•Àhrq\ì[\î­ù\"\è_üŸ\Þ_„ñwÇ°¤I>%1\ãÇŸ•>?1G\Ï\Ûb>¡+¯¼2/±j\Òk_û\Úlþüù\Ù&›l’Í™3\'[¸paÇ—ˆ5cô€	abœvŒ©\\Z\\ß®¸\Ã\âzKq ;\Óo¦ò\ÓT~\\8}/{µ;\ãuÙŠ“€\0ý¤—«RD#+&Ô¼±¸\É~E\Ã%&Ð\á®iˆ--®?\Ô\Ékýµ¸Œ¡Ÿ+¾\çc¨òž\Å1C4\ê–¼\ê©\ÓõŠ†U4˜\âLu]Þ½h„•³W—•½\Ñ;\nýj ¶ýhük±˜P(1¿Luµ¥r±_ˆ|¬1t©\Ú[\ç\È\â9\ÑK.\æ)ù`V\"¯Ã›>™½:Ì’\â9öP\ì7ª!Ì¯²\Ê*L\ZE«%P\ì{bÚ„˜Dø\ß3Ã’VC“ö\ÙgŸwl±\Å‡—J¥¯\ïQ>\Ì\è±\Ç\Ëó\Üs\Ïu|ZôLúÁ²e\Ë.š>}º \ný\ÂÄŽðC\ÅN4&ôúpqõz¤Ö—q\æ\ë¾b§>¢x\\\ìo+.€U\ë÷E©ŠpdZ7¿»(©\Î=1«\æ¾Ynwô»š\ëqFûG\ÞXc·ýû:\Ü“qw >-?,qY\Íö\ßZ”®öµ~Y”ªk®\Ùá±‘$\í­\ïZ\ÞGo¡IcÆŒ\Õ\Ô\Ô¡\×N¥R)F6D8¾¬\\._Z´÷fÌÄŒVT\0\0 \0IDAT;÷A\ËPÃŠú;„‰´3\Æs\îV\ì,«\ã3\ãLWuvò\è2\Ý£\àqY\ålØ¯³J\êýš¬’ª\ZŽ\0\0°\Zš>}z´û\"Œ\Ù`È!ÿZ.\ç]5755\ß\Ú\Úú¬\Z‚®\r\Ô\Õc²\Êò“‰¹_¢û_ô„‰^31)ºFJ}sö\êRu\0\0\0¬¦†ò‘r¹\\Û¦üˆZ\îõw½\\N\Ï*AKu\ìe-\ZZó˜˜±<\ÆnF\0skñóOg•1¢\ã¼%\0\0\0«•8þ÷\ÅD\É\Õ\Þ\Ñ\Þ\ÞþÁš›14©¥\æv‹j„Y)V0˜\Ù\áwüo\Í\í˜\Ìëˆ¬24JL\Èõ›¬23yü\ì­\Þ\0\0\èR\Ì\Åqmq=\æVŒ•}f©\Ða©\Ä\êHqr=¦”x¹T*½m\éÒ¥;\×.Q].—?8t\è\Ðó—,YSS\ìšUF@TÅ¼1ÿ/•Åª“Á¬¿C˜\è3³\Ã}1Cy\í\äY\êðó‹:Ü¾\Ó\Û\0\0]ŠÕ€ª!L,¹W\Ç	Í‘5y°¸V\ÖYe–X\Úü\ØTþ;•—\ßø\Æ7\î\Û\ÜÜ¼\\ï–¦¦¦\æ\í¶\Ûn““\â3Y&F`\Ä|¡½&U\0\0\0k”¥5\ãX6úªT¾‘\Ê6EùNñ3\è»d•@%‚¿+²\Ê¤	›o¾ù\Û;{ð[\Þò–\è\ZK¬ˆuNq=–!¦*a`†#AXlG;0\Ú\Û\Û_Vk\ÔAò“Y¥›8¶°ß°\ß\è/\Õ\Þ§¥rL\Ñ@“‹Ë½³Êª¥\Ðn\É*ÃfŸ«\çcs\Új«­þ­³:ôƒ\Í\Í\Íû/[¶\ìµ\é\æ>Ye\á•m2\0 gC` ücÉ’%j¡Ÿµµµ\ÅX[UkˆR©ô\äK/½ô€š°-€ý†ýF?‹^.1\ê\ïS¹?\Óë…C‘¢7Ë›³Êœ.Gm¹\å–\Óþj‹N˜MM¤Ÿ\Ç\ç3\æ„ùZ*/e•I|_P• „a€477_5o\Þ<\Ñ\Ïüñ¿,]ºtºšXcüü¡‡’F\ÚÀ~\Ã~£¿EO˜/e•¹abšó½\Ã XLe§¬2\ä-†#\r\ßk¯½\ï\î	ox\Ã\âñW¦rJV™\Ô7&ŽnS• „a€,[¶\ì;O>ù\ä¢r¹¬2ú\É\Ë/¿œ=ûì³¥¸\ÔÆš!½W3,X°õÂ…R¶°ß°\ß\è\ÏC­T>šUz|µh\ä\Â@\Ù7•¦rA*\ï(¶©\Ïv÷„-·\Ür“\â\êm©|;«\ÌSó\Ãlª:\ì„0ˆw¾ós\Ê\åòe=ö\ØRµ±òbh\×\ïÿû\'–-[ö©}÷\Ý\×Y„5\åˆe\ß}—¶··O¸\çž{§ƒ«\ØÀ~\Ã~£?\Å1Ö·²Ê¼00\"Hù\\*‡§r\Åf›möÄ°a\Ãzš·\êM›o¾ùsYe\Ò\'RùJVY÷E\Õ\É`\'„aÀ\ìµ\×^_|\æ™gf=ö\Øc/\ë\Ówó\ç\Ï\Ï~÷»\ß\ÍO\ã_;\à€,á¾†=zô\Ý\éóÿõ»\îº\ë\ÙDh`[\0û\rûþT\â1*•?§rSQ¶I\å@Ÿ\0ú\ÉrZ\ï·\ß~õ\æIû\ï¿¬ŽT;¼òÁ·aP*©\Ú\Í7\ß|Á!C&¼\á\roX\ï5¯yM–®«”,[¶,{þù\ç³\'žxb\é\âÅ‹nkk;4”\ÏR3k®k¯½v\Ô:\ë¬ó£õ\Ö[\ï[o½õ†Ã‡a*Æ¶\0öö}sÀ|µ¸>2•qYe¨G·Æ7!«\Ì!s\ØÔ©S\'û´\Ð|® >B\Zâ¦›n\Z±\á†~#}<\Ý|M*ë¨•.6\ÊR)\Æy¿˜¼\ï^´hÑ‰{\ì±\Ç=je\íq\Í5\×lóš×¼\æÿ¥m\á#MMM\Ûl°&\î7^z\é¥Òw\Þ9d·\Ýv[:|øð²ý\Æ*g¸z®±\Ì@ð¹‚:¿«T\0\0u6º®I–J¥›Z[[÷S#\Z\Ëø\\ù\\A\ï˜\0€z\í\Zÿ”\Ë\å\ÝU\0ôž\0€^?~üˆR©T]fv\ÝO~ò“[ª\0\è!\0\0õ8°\\.¿r™®ÿ‹*€\Þ\Â\0\0\Ðk\åryl\í\íeË–¦V\0 w„0\0\0ôÊ„	Z\Ò\Åû\Ê\É+“MM\ïL÷o¬v\0 gB\0\0zeÑ¢E;§‹–RR½/†&µµµ½O\í\0@Ï„0\0\0ôJ©T:¨‹}H\í\0@Ï„0\0\0ô\Ö\Çk‡\"U¥»T5\0\Ð3!\0\0=\Z3fÌ¨tñ–Ú¡HU\é®\ÍÆ¿ƒZ€\î	a\0\0\èÑ!C>\Ø\Ý\Ï\Û\Û\Û?«–\0 {B\0\0zT.—\Çu÷óR©t¨Z€\î	a\0\0\èÖ˜1cF¦‹wõð°­Š\Ç\0]¢\n\0\0\è\Îô\é\Óç¤‹W\æ‚7nÜ¥\ébB*\ÛN:u¶\Z€\Þ\Ñ\0\0\0 „0\0\0\0\0\r „\0 .¥RiË¸œ3gÎ“j\0zO\0@]\Ê\år>¯\àÌ™3—ª\r\0\è=!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\êÕ’J›j\0€úa\0\0¨\×\ÈT\æ¨\0¨\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0¨×T–ª\0¨\0€zY	\0ú@\0@½ô„€>\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0½6fÌ˜X)+•JVG€:	a\0\0\èµ\æ\ææ–¸,—\Ëmj\0\ê#„\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0z­T*µWM\Ì\0u\Â\0\0\Ðk\årydqu®\Ú\0€úa\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0ôZ\Í\êHs\Ô\0\ÔG\0@¯•J¥–\âj›\Ú\0€úa\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0€^«®ŽT*•¬Ž\0u\Â\0\0\Ðk\ÕÕ‘\Ê\å²Õ‘\0 NB\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0 \×J¥Ò°¸41/\0\ÔO\0@¯Y¢\Z\0úN\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0 ù\êH---VG€:	a\0\0¨GKü3yò\ä6U\0õ\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0õˆ‰yM\Ê\0} „\0 ±Dµ\å© „0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\êau$\0\è#!\0\0õhI¥M5\0@ý„0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0@¯Œ3&VF\ÊJ¥’Õ‘\0 „0\0\0ôJsss¬Œ”•\Ëe«#@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0€^)•J-\ÅUó@a\0\0\è•r¹<²¸:Wm\0@ý„0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0@¯TWG*—\ËVG€>\Â\0\0\Ð+\ÕÕ‘J¥\Òµ\0õ\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0½bb^\0X9B\0\0z\Å\Õ\0°r„0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\è­-\âó@\ßa\0\0\è-óÀJ\Â\0\0\0\04€\0\0\0 †¨\0\0XûŒ3fTssóÃü\è\Òq\ã\Æ]Z½Q.—wœ6m\Úýj`\à\é	\0@¯”J¥|N˜eË–™f\r0}úô¿¤‹GzxOŸÀ\04Ž\0€^)—\Ë#‹Æ½Õ‘\Ö¥Riz\ï\é4µ\Ä\0;2•}jn’\Ê\î~>B51Xa\0\0`-\Õ\Þ\Þþó\î~^*•¦ª%Ø¤T>›\ÊwR9)•Of\ÅJk\É	Y%€yV51X˜\0\0\ÖRÓ¦M»sÜ¸q\Ñsid\'?^ð·¿ý\íNµ\Ä\0\Û5«„,?Neiq_µ7\ÝU©Ç \"„\0€µX¹\\žQ*•>\ßÉ~1s\æÌ¥jˆ½`~“Ê‰©lU™\è	sKžUz\ÇLNe¶ªb00	\0\0\Ö\æþ¦¦+:»¿T*µª\Z ‚—\ËRùt*¿O\åYe\Â\èÛ²\ÊP¤\íTƒ‰ž0\0\0ôVi1)\ï\ZfØ°a3-ZôR©TÚ \æ\î%q¿Ú¡A6Ne\çT¶\Î*“ô\Æ\å°TJ\åI\Õ\Ã`¢\'\0\0½UBÀ\Zdò\ä\Éñž\Ý\Ø\á\î[\Òýó\Õ\r\à6Y%Œ©^F/˜—Ry^õ0˜a\0\0`m?\èojúY\ím«\"\Ñ@\ÕÀefVŽ4¹¸Œ\áH1,i/U\Ä`b8\0\0¬ý®-•J\í\år9?	\Û\Ô\Ôt­*¡A¢]¬s¿\ìÊ„TvJ\åõ©üWq\Ý\Ñ\ZB\0\0XËµ¶¶>;nÜ¸yY1dÊ”)\æ\á Qbi\êY©ü%•\ë²\Ê¤™Y%œ‰•’\ÆgB!\0\0½5²hLÑ›nº©eÙ²eIW\ß_.—·\\]Ž¹gÌ˜\Ñ4w\î\ÜlÄˆKù\Ë_Þ´šT\×\ÒR©4§½½ý\æ¡C‡N\Ýw\ß}_ò	Z\ë\Ì.Êƒ5û‘˜§ÈœDJB\0\0z\ËÄ¼=¸þú\ë_¶l\Ùñ›nº\é\Ã\Ûm·Ý†---ÿ”U&%]\åv\Üq\Çìª«®\Ê<ðÀ_û\Ú\×î³šT\Ùü—_~ù‘‡~øµó\æ\Íû\Ö/ù\Ë38\à€I>Ik]›ó;©S\Ü>0«„23‹\Ûg§rr&”am\0\0ÀJ¸é¦›†,Y²\ä§o¼ñ\ë\ÞúÖ·¾fÈ![­n\ã&›l’v\Øa«ÛŸµñ:\ë¬óÏ©Î²T\Ï\ßw\ß}]ýõ{:ô\Óûî»¯Ào\ípk*cS™žU†\"EO˜ÿ*~viVY¹K\0Ã au$\0\0XIÀŒ9r\ÔN;\íô\Þ!C†¬¯F\ê7t\è\Ð\á»\ì²Ë©_õÁ–ZY+\ÄÐ¼¹©ŒI%RÀd•`&\Ä1—©\"!\0\0¬„‚´ñ\Æo·ýö\Û\ï\Ú\ÙÏ—¾¼ {\î\É\ßfÿxlf¶p\Þ#Y¹Ü®Òº‘\êq\ÏTŸ›.]ºôpµ±V8(•‹:\ÜC’bx\ãûUƒ\0\0ú(&\ámjj:\á­o}\ë\Û;ûy„.\Þvf6÷Áÿ\Íþþ\È\r\Ù÷\\š=õû)Y¹\Ýb0\ÝIõù®R©ôT¿«µÂ³\ÅeÌtZ*{eVDb\Â\0\0Ð£1c\Æ\Ä<Y¬d£6^µdÉ’C¶\Øb‹§†2¬³Ÿ\ÏùóŒ¬}\Ù\Ë\Ë\Ý÷Ò³Îžû\ë*¯1¤k³\Í6›õ«6\Öü·3•S©¾—1\é[™†AJ\0@š››c\è@V.—M–º|½Œ\Þz\ë­w\è\ìg1\é\å\ïôy\æ=¢òzð\Æ7¾që¦¦¦½\Õ\ÄZ!ö1,)‚˜mR™P”Q\Å\åªˆÁ\ÂdW\0\0\ÐGMMM\Û6l£\Î~Vn_\Ò\åóG\ê\Ù:\ë¬ó†tñz5±Æ‹!ewmÏŽ\í\ÏX-ivfu$!\0\0ôQ©T\Ú@-œ¦¦¦u\Õ\ÂZ!z\Â\Ü\Ú\Éý±tõL\ÕÃ Ú¯©\0\0\è¥’CmHŽÉº>ù„\êa°ñ\Í\0\0\0`È°²¡-/\î³\îð7¨ ‹¿d•aG@&„\0 J¥RKq\ÕÄ¼u\Øú+ž\è\ß`\ÄöÙˆ\íÞ§r\0!!\0\0=*—\Ë#‹«s\ÕF\Û\ÍCW¼³\Ôd¨À`ý^P\0\0\Ðÿ>÷Xö\Ø\ç­pÿK {r\ÖO³¥‹_PI\0ƒŒ\0\0úQ,?ý\Ì\Ã\×f½\ç\ÒlI[\ç+\ï¾ôìŸ³Ù¿¹ [ð‡UÀ b‰j\0\0\è\'\Ñûe\îŸgd‹_\êy\Ô\ÖÒ—d½÷\Ç\ÙÆ¯\ß5\Ûü\Íÿ’55¯£\Örz\Â\0\0@?yö\Ñ_õ*€©5ÿ©»³¶žRy\0ƒ€ž0\0\0\ÐO†¿ö\Ùz›l[÷ó†®»‰\Êc´þú\ëß´p\á\Âö-·\ÜòEµ=\Â\0\0Ð£X©T*\Å\Õ9j£k\Ã_·‹J`\Ð?~üˆ´oø\Ù\'?ùÉ…W_}u\ëü\Ç\ì~ê©§Þ£f k†#\0Ð£R©\ÔR\\mSÀ˜1cF®»\îº\×üñ£:\è \rŽ8âˆ¡/¼ð\Â-\Ç{\ìöjº&„\0\0 \×\"€\Ùh£®:ùä“·5j\Ô\Æq\ßN;\í”}þóŸ_ñ\âÅ¿=\æ˜cFª%\èœ\0\0€^©0\'tÒ›·\Ür\Ë\å&3Š \æ3Ÿù\ÌF\í\í\íüÁ~0BmÁŠ„0\0\0\0ô(˜\r7\Üð\ê\Î˜ª]v\Ù%;ø\àƒ7}üñ\Çÿ·±Zƒ\å	a\0\0\0\èV0Ã‡¿\"† uÀT\í½÷\Þ\Ù{\ìñ\ÚÅ‹\ßÁl ö\àUB\0\0z«#\Åe©T²:2±\nRô€9ñ\Ä\ß\ÒS\0SõÁ~0\Ûm·\Ý^ÿ×¿þõ	&´¨E¨\Â\0\0Ð£\ê\êH\år\Ù\êH0ˆL˜0a\ãX\é„N\Õ\Û\0¦\ê£ýhöŽw¼c\Ë\Í7\ßüû\ì³\Ïµ	YfC\0\0\0`À¤‹\ëŽ;î¸­¶\Ýv\Û>\Í\ïò‰O|\"›?þ›\ÖYg;\Ò\Í=fÎœ¹T\Í2˜	a\0\0\0XNAjjj\Ê{ÀD\0\Ó\ÖÖ–v\Øa\Ù\Þð†l\Ã\r7\Ìóô\ÓOg\ßû\Þ÷^¹½p\á\Â\ì˜cŽ\ÉFŽ¬¬P½`Á‚\ìñ\Ç\Ï~ô£e_|ñ®û\î»ïŒ™3g¨v\ÌG\0\0\à1	oA:þø\ãGU{À´´´d‡rHö·¿ý-ûÓŸþ”—Q£F\åKUkkk¶\Ùf›½òó¿ÿý\ïùs\Ö[o½\ì+_ùJ–^óý§Ÿ~ú•j˜ÁL\0\0@.˜6\Ú\èªXiÔ¨Q\Ë\rAúø\Ç?žm¼ñ«wýþ÷¿\ÏC™‡~8\ïñò\àƒfù\Ë_^ùy<ö#ùH~}\èÐ¡\Ù\ÑGóK}\ä\Â/üo5\Í`%„\0 G©\á4,.M\Ì\Û<òHv\ÅWd/½ôRvÁ,÷³\çŸ>›5kV^\æÍ›·\Ü\Ï\âñÓ§OÏŸfÎœ™=ô\ÐCùõ‹/¾8¿Œs¼~4–\çÎ\Û\é\ï×ˆvWN8\á„\ånŸq\ÆÞ´UlÜ¸q\å(cÇŽ½òŸø\Äûú2n5€9é¤“\Þ\Ü\Õ$¼Gyd¶\Î:\ë\ä×—,Y’÷r‰\Ï\ÖøÃ¬½½=[¶lYþ³ô:\Ù\'?ùÉ¬¹¹ù•\çVƒ˜\çž{nÂ™gžyžwÁÈœ0\0\0ô\È\Õ\r©\ã¨\ßüz„)’¼ÿý\ï\Ïþð‡?,÷¸_|1»ûî»³_ý\êWù2À=öXö\ä“Of\Ï>ûl\Þ(þü\ç?Ÿ\í¿ÿþy¯„*sx¼ñoÌ¦L™’_F`r\ÐAå\ßwò\É\'\çý\æ7¿™m¾ù\æùïˆ¹=¢‡\Ãv\Ûm÷\Ê\ß½\Z¾û\Ý\ï\æ·\ã÷\Å!ñwD\Ãú\Æo\Ì\Þû\Þ÷\æ?{ùå—³÷¼\ç=\Þ\ÐU$zšD\Ùb‹-\æ?þ¢ööö)Ó¦M»¿§\çE\0\ËPŸt\ÒI\Ûu·\n\Òö\ÛoŸý\Ó?ýSþ¹Œ\Ð%>;ñ‹\Ïe5Ô‹\æmo{[¶\Ë.»¬ðüø¼|ý\ë_/r\Ê)_™8qbû¿ÿû¿\í]c0\Â\0\0Àj\àw¿û]öƒü 6lXT°·\ß~{\Þû ‚˜o#5’³\Ï|\æ3\Ù\r7\Ü½b\å™l“M6\É~ý\ë_\ç½^\"˜	ñ\Ø7½\éMÙ›\ßü\æl§v\Ê\×_÷º\×e_û\Ú\×òð\æ§?ýiþ\ØE‹e{\ì±G–\Z\Äù\íû\ï¿?\ïió©O}ê•¿/~W„.ñœ\ßü\æ7\Ùý\×\å¡\Î?þñ¼÷ÃŸÿü\çüq	aV¹r©T\Zž>3Ç¥\Ë\ã\Ò{wkº\ïG\éúŒ\Ö\Ö\Ög;>8˜\áÃ‡_q\â‰\'n×›e¨¿ô¥/åŸ•˜x7\Ä½\Õ0!\æI¯\Ù\åó\ã\ç\Ç{lÓ·¾õ­¯]t\ÑE\Ï~ø\á\'z\Ë,„0\0\0°\Z\Øu\×]ó¢—Áµ\×^›_\ßk¯½²I“&-÷\Ø\èÍ²ó\Î;g¿ý\íoó\Û€l»\í¶\ÙSO=•‡\'›nºi¶\ÕV[e¯ý\ë³ë®».»\ï¾û²¥K—\æ÷\Åp¤a^x\á…<D	oûÛ³»\îº+û\ìg?›/‰	U£a}\Ûm·\å?^1—_~yþ³‰~ü\ãç¿3™ó\Ï??\Ýx\ÍˆX\åJ5\×Ë©¼;J¹\\^:nÜ¸«\Ò\å\×]w\Ý&Ož\Ü« ¥\ëW÷6€	\Ñ+\êCúP>\ì-z>\Õ0ñÙ‹\\\Õ’º{oûÛ¥‰\'žp\ÑE\Ýwø\á‡ÿ\Ì\Û\Æ` „\0€\ÕD%ª† \ïz×»òû¢\'L„&\Ñ&\î‹\Þ)\ÖD\ã7\æ\âˆ\çDO–ð\ÄO\ä=j\Þò–·\äKˆ\ÉT£WMjd\ç·cˆ\Ñyç·\\O˜˜·#† E‡=÷\Ü3»\çž{ò!F±\Üpø\Ä\'>‘ÿ]!Â¡\èmsú\é§\çs~Ìž=;ÿÛ¦Nš]r\É%yO˜r²²\â\ï¹\ï¾û67n\ÜŸŒ•R\ê\Ðþ;¤T*\Ã\ÉR\Ý\Þ>lØ°\rN8á„­¶\ÜrË\ëy\Ñ\ÒŸ…ø¾ò‹Š\át£G\î\ÕkDo­o|\ãM§v\Ú\å“&MZv\ä‘GZ9‰µž\0\0V1¹i¸ùæ›³«¯¾:\"\"‰Ð¤\Öÿý\ßÿe&L\È>ð,w)ú\Ü\ç>·\Ü}·\ÜrK\ÎÄœ!†/Eš\è\é²\\K=5 \Ï:ë¬¼\ÇK„@Ñ«&V¼	1‘ox\î¹\çò\×Zw\Ýu³Oú\Óù<01Qpô~ù\Å/~‘¥\ÆtvÀ¼2?\ÌÊˆ0\éŽ;\îˆIi.õ\É0{n²\É&\ÏU—¡®GwÃ‡\Ï?O\ÂUï‹žRµ“ñö$zÎŒ?~\è9\çœ3-}¦7Š\Þ9\Þ\ÖfB\0\0X\r\Ä|.\×\\sMö\Ç?þ1»÷\Þ{ó\Þ\'C†\ÉW)Š	q£¡»þú\ë\ç½bb\âÝ£Ž:*jbøQ‰\áFq=Q¢—CQŠ°e\Ë-·\ÌçŒ‰¹[n½õ\Ölñ\â\ÅùïŠ ¥£¯ý\ë]ö„	­­­\Ù¾ð…\ì\Üs\Ï\Ív\Ûm·|\å¦\ê=\"\"„‰ùfú#€	ÿü\Ïÿuñ\Èw\ÜñŸ>½\ÒmX•>?1OL©\æö\ÂtóÞ¹s\çn{û\í·\ÏN\ïû;\êùe1\Ì-&\æ­0!>ƒÑ»%~V›¨\'N™2\å…#F\ìyö\Ùg`X\ë	a\0\0\è|‚‡––«#\rhGO–/~ñ‹ù|+€\Ä*I1oË¡‡úJ#7l³\Í6Ùœ9s²ë¯¿>V\"¬yô\ÑGóŸw\ÜqyO•¦¯«\×\Äj5\Ç{l¼D\ï™\ÒT;©ú\Ú1\×L\Ì\åG\ã¸úš\ÕIwc¸Rµ—Côˆ‰aO‡~xv\Ê)§d3f\Ì\Èÿ–þÃŸv\ÜqÇ¿u\ÔQ“}:z6nÜ¸\ÎB˜öTšŠ\ë1n\è¦T~ž\Þ\ÃS¦Ly²x\Þ6“&MºnÙ²e·¾\ç=\ïywo~WôÐŠ÷;zAu=¨\â³ó\îw¿;Ÿ÷¥;±\ÄzúÌ½”\Þëœz\ê©ô.2a\0\0è–ø\ÇP+\ÅpŸ\è\éAL\Õlð\Êü.!–®þÖ·¾•¯†\ËJ¿\æ5¯\É{Do—¦¦¦|Åš(1\Ì\ã\ì³\Ï\Î>ö±\åK\nGP«\Ò\Äp¥˜\Ç#z\Ä\ÔtŒ\È>ø\à\ì°\ÃËŸ×±\'\ÌwÜ‘_V˜\èo„3±\nN¼f\Ì{ô¦‰p†\ÕÂ¼ô\ßP.—¯(&\â\ßñS§N\ÞÃ½¿ÿý\ï_µhÑ¢;G½{O/ú“Ÿü$\É\"¬q=>S\äE«Xž:\æŠ€®+\ÔLš4i^z\ÞÁ\çœs\Î\í\Þ*!\0\0¬&¢\'\Ê7¾ñlÔ¨Qù\í;bÕ£Z1\Ô(&À\Ý|ó\Íó9d¢wK,)½\nb‚\ÞV¢\çKôHˆaK{\ï½wþ¼\Ô\Ð\Í\Ï;\ì°C6mÚ´|^™\ÒT\ËWW\ÅkDøS=tjm´\ÑFùP¨hH_v\Ùe¯L\Ús\Ê\\t\ÑEB˜U\ë‘r¹|uSS\ÓÃ†\r»»7Á\éô\é\Ó\çL˜0\áÀô\Øk_x\á…\Û9\ä=»zl\Ì«bE`\"˜‹arµ¡\Ì<KŠ¡j;\î¸c§¯ñ½\ï}oaz\î.¼ð\Â\ßz\ËLJª\0\0€žŒ7.†1\ì3u\êTÇ5fÎœy\ï{ì±³š·\ÝvÛû\í·\ßj¢g\ãÇÿT©Tºÿò\Ë/Ÿ\Õ\××˜0aBK[[Û•{\ï½÷ú‡~ø{:{Lw‹À¯:\Ñs9:ú\è£ó±b\î¢\êý[o½u\Þ3\ë;\ßù\ÎrõV˜tõ€/¼P&U\0\0\0°fkmm½le˜½f\æÌ™sð\Í7ß¼\à¼óÎ»³\ã\ÏcÕ®\è‰U\rZ¢÷K\ÌO´ýö\Û\çs\Å0¤˜Ÿ(D\Ø=²b²éª¸o\âÄ‰‹\Óc>(€a°\Â\0\0\0›9s\æÒ–––\Þq\Çó¿û\Ý\ïþ:Ý•\Ï\áK5‹\ÉxcøQ”\è\éò\å/ù•\ç\Æd\Ð1\ïPõ\ç1yó”)Sò\çV{À6lôy\çw“šf°2\'\0\0½óš”\è3aÂ„Îš5«õ„N¸\ç\ä“OÞ¥¥¥eH,QÞ\èóuóMœ8qAº:ú\Ì3\Ï\Ô†AMO\0\0z#–¨¶<5\ÄL›6\í£<òÈŸŽ?þøû—,YÒ§6zÀœr\Ê)\Ú\Û\Û\Ç‚B\0\0\0º0u\ê\ÔÃž|ò\Ék:\ê¨?\×\ÄT‡ µ··¾ð\Â¯V› „\0\0 ­­­\ÇÏ›7o\ê\ÑGýÐ’%K^\ê\Ísª“ð®»\îº\Ð^%„\0\0 [Ó¦Mû\î¼yó\Îþ\ÊW¾òÀÂ…t÷\Øj˜¦¦¦œyæ™·¨=x•\0\0€M:uò‹/¾x\á‘Gù\Äs\Ï=÷Bgyú\é§ó\0&]=À*H°\"!\0\0\0½AÌ¢E‹¾wô\ÑG?ÿ\Ì3\Ï<Wû³yó\æe\çž{\îütõ\0C sB\0\0z\Ã\êH@.‚˜%K–|ñ˜cŽù\Ç\ÓO?ý÷¸/zÀœv\ÚiJ¥\ÒA\èš\0€\ÞhI¥M5\0¡µµõÚ¥K—Ž9\î¸ãž¿\ä’K^˜8q\â‹ë¬³\ÎÁ§Ÿ~º\0º!„\0\0 n—_~ù¬¥K—þôW¿ú\ÕF\Ï>û\ìé§žzª9` B\0\0\0ú¤\\.?—K–,yJm@Ï„0\0\0\0\0\r „\0\0\0h\0!\0\0\Ý\Z3fL¬Œ”•J%\â¯\0N\0\0/IDAT«#ˆ\Ê\åò³ªz&„\0 [\Í\Í\Í-E#\Ë\êH@G\Ä?¥R\é%U=\Â\0\0\0\04€\0\0€vxH?ûT*;«\"XyB\0\0€Á­¥(o\ë\â\çCR\ÙX5Á\Ê¢\n\0\0\0µ3²JO˜]S\Ù;•ùE	1\ÔoTô!\0\0\Ý*•J-\år¹\Ú£Æ²e\Ëª…\Ó\Þ\Þþ²Zhˆ¯¦²M*R9©¦­¸4•KUôÃ‘\0\0\èV¹\\Y\\«6V¨›¿,\\¸ð95\ÑÿR½>ž.žP\r«UW8:.•Ã‹\ë\'÷ð¼-\âK\ØC\ïa\0\0 \ï®|ô\ÑGÿ¢\Zú_ª×¿¦‹_¨‰†‘Ê³©ŒK\å†T&÷\ÏNe\ËTº\nY,au\Â\0\0@577Ï˜?þ†µ\Ñ/^ü÷T¯#Rý^¥6\Z&æ€‰fj*wwøÙ»²J¬$!\0\0ôÑ¾û\î»tÙ²eŸþ\Ãþ0wÉ’%*¤D=\Þ{\ï½s\Ú\Û\ÛKõ«wE\ãŒ\Í*C’\Â	Ye.˜\ï¤ÒšÊ2sBA¿\Â\0\0ÀJ=zô\ÝK–,ù\â\Ýw\ßý÷yó\æ-S#}7þüì®»\îŠ@\ë?8\à€;\ÕH\Ãü{*¿\Ë*½`\ÂkR9\"«„/L\åIUýC\0\0+\é}\ï{\ß\rmmm{>ô\ÐC÷Îš5«mÞ¼y±r’Šé…¨§¨¯To‹x\à´Lõ9C\Í4\Ô9©ü¬\æö\ÍY¥\ç\Ë\ìT&¦ò¹\ì\Õ^2ÀJ°D5\0\0ÝŠÕ‘J¥R\\µúI7<ðÀ˜ w·o¼q»9s\æ|{ö\ì\Ùû755\rw\ÌÝ­\Ãõü!Cn]°`Á\î·\ß~T%«\Ä\Ò·k\ç\â‰0\æ\Ü\ìÕ•“:\ÊWOkii±€^ð…\0\0@·J¥RKMcŒ\ì¿ÿþ¤‹Ïª	\Ö G§rQ*\ßOe\ãâ¾¸œU&\ìÕ‘\Ætñ\Ü|ÿ0yòdû\è!\0\0À\à¶S*\'¦òx*?.\î\Û\'•“R9#\ëºP\'s\Â\0\0\0n¾\ÄP°­³bxQcTô=a\0\0\0ˆ!G£jn\ïUB™\ÛT\rô!\0\0\0±õ©\Ä\Ò\à1ÌYe8R\ØKõ@ÿ\Â\0\0Ð“|\â\Ír¹l\âMX;\Å*^—¥reV™fv*;g•fV\í\Æ\Ø?\Ø7@/	a\0\0\èI>GD©T²-¬~P´\r¿\ÚI1¶ÿ¶öö\r\ÐKB\0\0€Á-V?šž\Ê²\ÊP¤«³Wƒ•˜+f¼*‚þ!„\0\0Ü¾™U˜g‹\Û1\éø\âú¸TŽ\Ì^X	B\0\0€Á\íˆ·Ï¬¹>5•]Uô&U\0\0\00¨—s?¢G\Ì	©¼­¸}·*‚þ!„\0\0Ü¶ÏŠU\Ð\n±2R¬’t¿ªþ%„\0 \'[\Ä?VG‚A!zÄœUVJ\ê\í\ã\í —„0\0\0ô$?C^.—\ÛT¬µžLeƒ¬À–õ>X‰ýƒ}ô’‰y\0\0ˆ%ªžÊ©\ìž\Ê6~~g&l•&„\0\0\ÜFd•\Þ/­©¼”UÂ˜QYe¨Qµ\Íó\Ãa`%	a\0\0\0·†+\"œU‚˜¸>Cµ@ÿ3\'\0\0\0!zºŒO\åß²\Ê\nI@?\Â\0\0Ð“’µ´´X\ÖN/\Õ\\¯11Ao·#\'ÆŒ“\ï¬œ½\'„\0 \'ù\êH“\'O6¬®\èp;B•g•¹bº\Ô\Ü\Ül\å4¨“9a\0\0\0·É½¼XIz\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0 \'1ù¦‰7\å”J¥–\âªýô’\0€ž\Ä2´– –S.—GW\çª\r\è!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0€žX	\0ú\0€ž´¤Ò¦\Z€Z5KTi¡—„0\0\0\0Ô­T*µW…´\ÐKB\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0tiÂ„	\æ|\0€~\"„\0 KmmmV?€~\"„\0\0\0h\0!\0\0\0u+—\ËyO¹R©¤§ô’\0\0€º•J¥|Î¨r¹l\Î(\è%!\0\0\0@a\0\0\0\0\Z@\0@—\Ìù\0\0ýG\0@—j\æ|X¬6\0`\åa\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0úb‹øÇœQ\Ð{B\0\0\0ú¢:gT›ª€\Þ\Â\0\0Ð¥\ê\êH‰3\Ý\0°’„0\0\0t©º:R\âL7\0¬$!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\ÐK\Ð]\ÉWOkii±z\Zô’\0€Y¥RI#\è(i\'Ož,¤…^\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0]*•J\Ã\â\Ò\êH\0°ò„0\0\0t©\\.[	\èJ\ì\ì B\0\0\0ú\"–¨\ÖK\ê „\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0@wò‰y[ZZL¾	\0+I\0@wb\â\Ílò\ä\É&\ß:\Û?\Ø7@„0\0\0\0ô…%ª¡NB\0\0\0€\Â\0\0\0\04€\0€\în\0\0ýD\0@wL¼	\0ýD\0\0\0\Ð\0B\0\0\0\ê2fÌ˜ª˜•J%\Ã¡B\0\0\0\ê\Ò\Ü\ÜC³r¹l¸\"\ÔA\0@w\Ì	\0ýD\0@w¬Ž\0ýD\0\0\0\Ð\0B\0\0\0€\Â\0\0\0P—r¹lu$\è!\0\0\0u)•J\ÕÕ‘«\r\è=!\0\0\Z3fŒ3\Ý\0Ð„0\0\0tª¹¹¹z¦\Û\Õ\0\Ð„0\0\0\0\0\r „\0\0\0h\0!\0\0\0u©™˜\×pE¨ƒ\0€NY‚°€þ%„\0 S– €þ%„\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0:U]ý$±ú	\Ð\éþÁ\êHP!\0\0ª®Ž”´©\r ³ýC¹\\¶€:a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0€®˜x\èT©T\Zfÿ\0õ\Â\0\0\ÐK\Ð²D5ô\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0@W¶ˆ¬~t\"_©¥¥\Åþ\ê „\0 +-ñO¹\\nS@gû‡É“\'\Û?@„0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\0\0\Z@\0@W¬~t·°o€:	a\0\0\èŠ\ÕO€\îöö\rP\'!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\ÐoöÐ„0\0\0t\Å´€ýô#!\0\0\0@a\0\0\0\0\Z@\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0€®XýXÁ˜1cbß•J%û¨“\0€®´¤Ò¦\Z€Z\Í\ÍÍ±o\È\Ê\å²ý\ÔI\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0¬`Â„	-\ÅUo\Ë)•Jö\ÐGB\0\0V\Ð\Ö\Ö6²¸j	Z`9\år¹º˜«6 >B\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0+¨®~R*•¬ŽtºÈ¬žu\Â\0\0°‚R©\ÔR4¶«\r ³ýCÒ¦6 >B\0\0\0€\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0`V?z\Ú?X=\r\ê\'„\0`V?z\Ú?”\Ëeû¨“\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0èŒ‰7N•J¥aö\Ð7B\0\0:c	Z S–¨†¾\Â\0\0\0\04€\0\0\0 „0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0\è\Ìñ\ÕO\0 ÿa\0\0\èLKüS.—\ÛT\ÐA¾DuKK‹\ê$„\0\0 yH;yòd!-\ÔI\0\0\0\Ð\0B\0\0\0€\Â\0\0\0\04€\0€”J¥|Î‡eË–™ó\0ú‰\0€”\Ë\å|õ“\éÓ§[ý\0ú‰\0\0\0 „0\0\0\0\Ô#z\Ê\é%} „\0\0 1g”ù¢ „0\0\0\0\0\r „\0\0\0h\0!\0\01\ç\0ô3!\0\01\ç\0ô3!\0\0\0@a\0\0\0\0\Z@\0\0@=\Ì}$„\0\0 æŒ‚>\Â\0\0\Ðgº Ÿ	a\0\0\èŒ3\Ý\0\ÐÏ„0\0\0\0\0\r „\0\0\0h\0!\0\0\0@a\0\0øÿÛ»cÔ† €¢\ä\"E\Ê\ä0¹„@\à\":ž#Ô¤\r¨0¬c³¯\nBLõ˜\ÝzŠ}„\0$a\0\0hL\Óô\\¯þ˜h\Ãpýr\ÚSDøz\Zl \Â\0\0\ÐX–\å­^=d®\ën‘¶”\"\Ò\Â\"\0\0\0@\0\0\0 \0\0\0@„\0\0\0H \Â\0\0\0\0$a\0\0X{­\çQ\0ö\ìG„\0`\í¥ž¿F\Ø°\0\0\0 \0\0\0@„\0\0\0H \Â\0\0\0\0$a\0\0hD\Ä{=¿M°`?#\0\0\à^)\åP\Ï\ã8Žg\îö\Ãg=\í\Ø@„\0 \ç¿¬\ëõ£þ\0€ˆ0\0\04\æy>õ}ÿÿFÀZD|™\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ð\Ð\Öoø®o:Ù¹\0\0\0\0IEND®B`‚',NULL),('67513',1,'test1.bpmn20.xml','67512',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"æäº¤ç”³è¯·\" activiti:assignee=\"${agent}\" activiti:candidateGroups=\"canWrite\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <userTask id=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" name=\"ä¸»ç®¡å®¡æ ¸\" activiti:assignee=\"${agent}\" activiti:candidateGroups=\"canAudit\" activiti:formKey=\"${formId}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${flag==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" sourceRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"609.0\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"795.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"960.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"831.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"615.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\" id=\"BPMNShape_sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"15.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"74.99831278471224\" y=\"52.22497469177069\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"54.25\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"629.5\" y=\"71.5\"/>\n        <omgdi:waypoint x=\"629.5\" y=\"116.92970092290889\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"648.5441860465116\" y=\"52.455813953488374\"/>\n        <omgdi:waypoint x=\"795.0\" y=\"52.11600928074246\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-AAEE5013-74E6-4835-933E-07312A14B86B\" id=\"BPMNEdge_sid-AAEE5013-74E6-4835-933E-07312A14B86B\">\n        <omgdi:waypoint x=\"310.0\" y=\"55.0\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"55.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"845.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"845.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-911C3373-8840-490E-81A1-DCCE9D636DCA\" id=\"BPMNEdge_sid-911C3373-8840-490E-81A1-DCCE9D636DCA\">\n        <omgdi:waypoint x=\"895.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"960.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-5F14346F-77BF-4773-8014-AA2502CA4612\" id=\"BPMNEdge_sid-5F14346F-77BF-4773-8014-AA2502CA4612\">\n        <omgdi:waypoint x=\"520.0\" y=\"54.056603773584904\"/>\n        <omgdi:waypoint x=\"609.3703703703703\" y=\"52.37037037037037\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('67514',1,'test1.test_process.png','67512',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\æ\0\0\0­\0\0\0=e\0\0&*IDATx\Ú\í\Ý	tT\Õ\Çñ\ÔZK­µÖ¶Zk-µVk­µ\ÚªµV±\ÖÖ¥V«Ái&‰¢¬ÅºŠ\Ð\0‚AP±ÑŠ©+HÅ¥‚Š\Ò([ƒ;Š  !‚! k2·÷÷ú^\ÎËIf’™\Éd\æû9\çžÌ–dò2ÿ{\ßÿ\Ýÿ»/+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cL·U«VU¼ò\Ê+f\îÜ¹fö\ìÙ´$·9sæ˜—^z)d\Û$>‘\0\0\0\0a””/X°ÀTWW›;w\Ò:©mÜ¸Ñ”••…l’~+ŸJ\0\0\0\0\È š)\')O\ä|ö\ì\Ù;ùTH[”iQ¦\âˆ8€=©?\')N¦¾žO%€´E™eZ Žˆ#\0Ø“AúVs\0H\nÊ´(\ÓqD@ûó­uŸ˜Uo<h–\Í\í4\Ý\Öcô\É$\æ\05Ê´t@G\0Ð¾Ä¼¾¶Ò¼ûü³ä¹¡Íš\Ósô\Éô\í\0×£Á4G\Ä\0úö\æ­b\Ù3{$\å^[·l&}2};\0\Ä7¡ L‹A\Äq€¾½y{þ-s=GŸL\ß\0qt(\Ób\ÐqD oß³½;{d\Ä\Ä\\\Ï\Ñ\'Ó·@\ÜÊ´t@G\0\è\ÛI\Ì\é\Û Ê´t@G\0\è\Û÷l:-)Rß®\ç\è“\é\Û€£Á: Žˆ#\0H`ß¾¢ü®ˆ}»ž£O¦o\0\nG\Ä\0$°o¯©\\j\Þ}¡p\Ï~\Ý>¦\ç\è“\é\Û nƒeZ: Žˆ#\0ô\í-·\ÕoNÙ£_\×cô\Çô\í\0\×A‡2-G\Ä\0úöÚŽf\Å\ÂI{ö\ëö1=GŸL\ß\0qt(\Ób\ÐqD o\ßó2˜\Ë\Ë\ïŒx\ÐU\Ïq9Lúv\0ˆ\ß\Ñ`Ê´t@G\0\èÛ›f\É?Y1Ï¼SzcÄ¤\Ükz^\Ë\ì9};\0t<¡ L‹A\Äq€¾½\ÍYrf\Ï\é\Û !	eZ: Žˆ#$Aw6ºB\ß\Í,yk³\çô\Ñô\í\0[BA™ƒˆ#\â\É1\Ü6\ã~RºoooR\î5úhúv\0ˆzÐ¡L‹A\Äq„$¹Ö¶m‹Ü¯£\Ø$Hùƒ®4úv\0HÆ C™ƒˆ#\âILÊ½d\\3\æ$\ç 1§Ñ·`Ð¡L‹A\Äq„\ä\'\åm=˜Ó·Ó·`Ð¡1\è€8\"Ž\'\Ã\ÛH¾½\ç9\çô\í4úvtc\ÌK—.:eÊ”ºq\ãÆ…®º\ê*Ó»woó\ç?ÿ\Ù\ä\å\å™Aƒ™aÃ†\í¾\å–[V?þ,¶tt@Ñˆ£.–”·•t3súv\Z}{;\ä\æ\æö\ÛÜ±\"\'\'g—ý\ZR\é¶Ý¶­·m¦^\Ç\Öj%!ò\É\'?ºé¦›\Ì5\×\\cJJJÌ«¯¾j*++\Íö\íÛ\èkuuµyë­·\Ì\äÉ“\Í\ÕW_m¼»ÿþ±Á Ã \âˆF¥°k³b›	õõ\0};}{Æ²Ix‘M¸k\ìW\ãK\Ä[möµµÁ`p[\Ï\Ç&\àŽ3\Æ:\ÔIº\Z\ZL´/^l®¿þz3`À€\Ù\Ù\Ùg°5Á Ã \âˆ8BŠ&\å£\Úù}$\ç o§o§oo9!?Å¶\Ñ&\ã\Ú\æŒ\Ï#m^\Ý\íé§Ÿ®8p ™9sfL	y¸\Ò\ÒRÓ§O\Ã\ì9tt@GHƒ¤<^\ßÐ·Ó·§¥@ Pý¥\ê&77\×™yóæ™µk×š-[¶8¹\âgŸ}\æTb———›‰\'šüüüð\ä<”±³\çJ\Ê\çÏŸ¿õ\Ê+¯4Ë—/7ñ°f\Í\Z£$¿oß¾ñQƒƒˆ#\â¬­…Þ’ýs\0úvúötI\ÊGù\ËÖ•O:\Õ9\í9\Zµµµ\Î\ëõ}a\å\í“3ncj¦\\Iy´/Zúyýúõq¾\0tt@GH¤<^e\èÌœƒ¾¾ÿOÊ‹ýIyAA3;\Þú>N\íO\Î3*\Ô9\åšÙŽ\×LyK3\çùùùJ\Î\Ï\á£G\Ä’,ü\Üð½l»\×ý\Z‹ð\ï\ãœsÐ·Ó·g4S\î/_/,,l*Wo/•¹;6¼¬=ýóH­¾>zôh\çœòDš5kV(77·ž/tt@Gè„¤|”/¹þP»@\î\×h“óH\ßGrúvúöLN\Ìkü3\åM\Êý\Éy\Ø\Ìù\æ´ß˜Ó§O_­?z×®]&\Ñ\r\Z\ÔHI;tt@Gè¤¤\\\îu“kCr\îOÊ½V\â{žs\ÎA\ßNßž‰Iy‘ÿœòö–¯·V\Ö\î?\ç<­óHÍ–\ë:\åº$Z2,Y²\Ä0kG\Ä’ R²\ÜR’\ÝZr\í\ë9\çô\íô\íMzö\ì\Ù-\Ý?“ºN¹—4k\á¶D˜6mZfÌš/]ºtª|\ë\Èe\Ñbuù\å—7\ê\\ºW0\èP€8\"Ž\ÉE]tœ\Ý	›c÷\î@R>¼ƒ\Év¬I<e\íhWrc?\çƒ\è\ÛÓ£o·\é\Îq•••õºØˆ#ž\éŠ	z4Ÿ\É\Ü\Ü\ÜÞ‚ošÕ®©©IH\î¨\Õ\Úý—RK\Û<rÊ”)u÷\ÝwŸI¦‰\'n³u&\Ýpf‰¶Sb\Ð!¡\0‰9q\ÑÎ—v\Â@È¶RÛŽŠò[£MŽ\ÛJºcM\Êý¿¿1‹™sDŸyIGýœ÷¥o\ïº}{EE\Å\Ü\íÛ·7\å=;v\ìÐŒ\ï®+®¸\âütûL\Ú\Ç÷^7~üøD\çþYóô\Ì#Çzõ\ÕW“š˜/\\¸p·Ý Ut\Ã7\èlV\0÷\î\Ýû\0\n\n˜Gˆ\"1?\Ø¹·½~ñ\Å_ERmR)ùÞ»I¹‡s\ÎÑž$\Èk[š­¤oOÝ¾½¾¾¾Wuuõ\îHùÏªU«LQQ\Ñ{m\íw¥Ï¤}¬\Â{¾¬¬,¡ù£ª|\ï%=óÈ«®º\Ê|ò\É\'IMÌ«ªª\Z\ím Î¸Ag·[~¢ÿÿ#‘:&\n´\ZG”;G™ž°x\í\ãôöž\ã\ÝRr¾³IyG\ßøœ7\ÍVúû|úö\Ô\ëÛµ^\×ÚµkW566¶™…B!SZZ\Z*((ŸIûu—÷x¼}WYY\é\é™G\Ú\ä\Èø\Ë-’A¿O•n8\ãf>\Z\Ã{·Vr$¡ ¡@»J\Ê‰£LOXšfq\ÜX\è\èuK\ÉyG’òð\äœs\Î\Ñ\á\Ïy\"úv\í—û¿FjŸ~ú©Y´h‘s	«\Ö^§óŒÙŸ*|þù\ç#>¿m\Û6\çÐ›6mjzlÍš5fñ\â\Åq/¯¿þº©««Åš\é½Mš4iS§\ç¤\äg\Ò?^—Hk\í\Òiþß—¶Agÿ\ç\êü1]8\Þ6g6Ý]UÓ‘˜¶m·M\ç¦oµ­^e\Ñ6©«uwNõÁ\Ø`\Û\'öö:ûu­m«\íó+\í\×m{Ï¶w\ís‹\í×·\ì\ã¯Ù¯m[`\Û|ûølûu–}ü\Ûf¸\çK<boO¶_\ï³÷\ï±_\ï¼ø\â‹o·_\Ç\Ù\Ç\ÇƒÁB{ÿ{{ˆ}þJ{{ }\îr{?\Ï\Þ\ïeŸ?ß¶s²³³\Ï\Ð9rZA‹\Ø\Øvt~~þ\á^x\á!½zõ:°ÿþûŽ9r\ïtô?NBABv\Å\åŽ\ÄQB\Ø1jU6]r\É%‡j\ç\Ñ~\ÖN\È\Ë\Ë;\Ù~\Þ\Î\Ô—ó—\éó§±Pý¸}ü&\Û&hÌ´Ý«q\Ô\ÞTc«m\Ïi¼µ__´Ï¿b¿¾©qÙ¶eöör\Û4n«,r½}¬\Ú]\é·.ŠCo?B\ÛxQÿl\Ç\á3\å;\Ý\Ç;bQ´\ÖZ‹w\ß~ÿý÷›¯}\íkNÒ­\Ïûœ9s\"¾ö²\Ë.3_ý\êW\Í3\Ï<\ã¼N\í¥—^\Ú#\Éÿ\Îw¾c&Ož\ì\Ü8p`\Ó{·û¾\æñ\Çw¿ë®»\ÌYge\Î9\çs\Æg8{w\Üq\æ§?ýiSûñl>üðC§\Ý~û\í\Î9\Æjgžy¦\éÖ­›¹\í¶Ûš\Óó|ðA\Ó{\Ðß¢\ïó\Þ×¸q\ãÌ¯ý\ë¸n;\Í\à;“µg13}o:}6“?¦\åNÞ¥—^šôómÛ¶93§\Zô\Ï>û\ìým0\äüG\Øö\rþööI6\Ù=U;\0öþ¹v`¿P{\0öv¾Žº;\×\Ø\×\\kŸ»\Ñ>>Ò¶›µC`Ÿho\ße_Wbo?`o?loO³·Ÿ°·Ÿ²\ßó¬ýú¼Vzµ­Ì¶—µ“`_ó†m\Z<—hGÁ¶\ì\í¶}d\Û\Zw‡¡\Ò>^¥{ÿS{“v\ì\í\Í:``ÿL\ìWL\Ø\é–x\è\0CƒfŒ\ÝYc\ï D¤w\È=Pá½¾Á\ÞwR\Øû;ÝŸ­ƒú][\íc[Ü½½§j½G½W÷=l\ï¯\Òß¢¿\ÉýÛ–\Ú\ç\Þ\Öß¬¿Ý¶rwgi®¶¶‘mO\Û\ÛOj§J\ÛP\ÛR;Zö{\î¶_\ïpw¾n¶÷Gi‡LÿýOô¿±÷û\Ùû—\ê¦ÿþ‡Q\ìT\éï¹™„‚„+-#1O\Í8²c\Þ~\Z\ïtp\Ööw\Ç\ÚÿÙ‰övš\â\Ú\Û\Ù\Z\ß\Ôw\Úv•m\×i\\SU‘\Æ4]·\Õíƒ§j,Ódõ\Õö\ç\Ì\Ó¦\ÎnŸþŽúy÷À´úþuî˜¥8\Z#4Vmµ÷·¹½w¹\ãK£»ÀZ(Âófc‘o\Ú\êþ\ÌM\îŒ^•{€|m+\Ý1G\ïi‘m¯\ê½\ê=k!71\î\ß2\ÕÞ¾\ß[&\êov~_\ën‹HŸy¯\Ùv˜rgµ½\n;3\æè’“\Ú\ÏòÐwß®Dù ƒrf;õY\ã7öx\Í\æÍ›\Í_þò\çù\îÝ»›_ý\êWN;\à€ÌhÖ¯_\ßô\Ú\éÓ§;)\Ñ\×ý	&˜‘#Gšë®»\Î\ì³\Ï>\æšk®q_°`\Ñ\é´|°ù×¿þe~û\Ûßš!C†˜«¯¾Úœt\ÒI\æ¹\çžs~\ßò\å\Ë\Í/¼\à|¯VÿV\ÓA¸?ü\á\Þ\ê\ÜNû\â¿hþû\ßÿšÕ«W;¯\×÷\ê\Ò]¿ø\Å/\ÌW¾ò\'‘ÿü\ç?oö\ß³\ß~û™¾}û\Æeû=õ\ÔS\Æö?.\\\ØmTWW·\Æ~&×§ò\ê\â\Ñ|&ýù3\æqð×¿þ5\é\ç˜\Û\0\Þ\É9\æ{\îh\ÇB³\èšM\ïÓ§Ow\ÍPh–]³íš¥°;)§\Û\ç\Ï\ÒL…f\å\í6º³4k\ï\ÎXhgn„f-4»¯Y~û\\±v\ê4û\ïV<¢û\Ütw\çn–f1\Ü¼—TM\à\î\ä½iok6\ã·\ê@\Õ+5«\á\íð©JA0¸\å,5nƒy\Û\â\î°ms«vt\Ö\Ñ\àhš-*¡•3cù¾\r68ï·¾¾¾\Í\×VWW·ùZujþûo¾ùf‹ƒ$‰9;oQ\îK\Ó\"0­•;ê€°f]ü¥†úž•+Wv™\ÆXZøÁW_u˜’Ën?©-¶ÕºYU	¶^U`\îÁ\Õ\Ý«‹Ýƒª\ê«_Tÿ\íL\î\ÎNOÖi·\ïŸ\à\Îb\ßhŸ\ìÔ¾ÌŽ+{ÿ<ü\ÖøbŸ?¾w\ï\ÞG\ê ¹f\ÉS©’\Ë\ÝV\Í\èoŒ°N	\ç˜#]úöf	y¼ºžz\ê©fÖ¬Y\æ‰\'žh–˜k¿CÉ¦\íœ\×ifW3×š0`€3»®X³Õš=Ÿ;wn³}˜Ÿý\ìg\æ\æ›ovfÊ•¤{ý²iýÿ~Ž~Ï‘G\é\Ü\Ö,ø‰\'žhzô\èa¾ý\ío\Û?9\ïGc\ÂÒ¥K\Ý/vnô\ÑG\Î \ç\Þz\ë-\ç¾\ï×¯Ÿ\Ó\Ï\ë@\ÃøC\çù£>Ú¼÷\Þ{\Î~ŒûG}\ÔüóŸÿt~žb‹\ç>’(Ž\Z5ªÁn¯\ÆV\Î/\ßQRR¢§»Z:•³+~&9\Ç<\ÎFŒ±+Ù«²Û€ªfUvßµk5\ÓÞ™3}*\Å\Ú{ï½\Ûû\Ûßœâ¨£Žjj½zõj:o\ê\ã?vf©•––:ÿŠ+šS\Ç\Ô\ÒùU¯½öšóÚªªªßƒ‹\Ã?Ü¼üòËºæ¥±¼s¤Wƒ”nëˆ³¡NN(hZ\îK\ÓL\È!‡b¾ù\Ío:Ÿ\å–F©„Oñ 7Íš\èó¯§\ßÿþ÷Î¬‰\Ú\ÓO?²%Œ\àJ\êØ±\Û÷\Ù.Ó\ë8\ÏP³*;Ri©^I[¤K\ÌÆ«oWYºÖ™ú\Ïþ³Gb®>ù‚.hz\í»\ï¾\ë\à|ö\Ùgrs/4\ë¬}MRx\å\é^B¬¤ýw\Þ1º$³ò\ï~÷»f\ß}÷5úÓŸœ}š\éþú×¿n\î¼óN§o\×lùW\\\á\ìûÌ˜1£)1\×\ÏÖ˜ð¥/}©il\Ñs\ßúÖ·œû\Zô¼÷~UF¯\çÇŽk\n\n\n\Ì7¾ñ\r\'q\×A[Íž/[¶,!}»®\"‘——·ø\É\'Ÿl_\ÎþË‚Á\àUEÑ‡u™\Ï$«²\ÇÙ„	>Löu\Ìm‚Q\Íu\Ì3‹f6ZHÖ§Â¹±JªKJJœ¤@	ºŽ«D\ë\ïÿ»\Ó\Î=÷\\§\ÄJ¯U¬dµ\\\æØ¬\é\ç\éõü\ã\Ío~ó§i \Ñs§vZ\Óc:\ß\Ê{š\á;ýôÓR%_\ZLN8\ásüñ\Ç;ŽÊ¿tä—„‚·\Î(wŒfñ -\n¤8µ%K–˜n¸Á9¨¥û\ÚAóª?4K£,%\í*-\ÔÁ°\ïÿûÎŽ\à\É\'Ÿ\ìÌ¸\èz¨úR¹„‘8J\Úg~§[\n\Ë\"I\Ñ\ÎT\'\ê:\æùY\\\Ç±}\Î[œ!O\Ô>’f\Ê53ž˜«Ÿ\Ö\äÄ¤I“šöM´/²\×^{™Ÿü\ä\'NB¯£:7]û8*[ÿ\Ü\ç>\ç$eš¸\Ð÷©ÏµÉ©Y·nùÑ~\ä\ìK\é\çkv[}¶\ÄÎŸ?\ßI\Òõý·\Þz«sž¹ jÿ\ë°\Ã3:\Õ6\Ë-e\×û\Ðx¢·:p ™x=§ƒº¯}4=\ïýmgŸ}¶óü÷¾÷=3o\Þ<§4^?[tÀ÷\á‡ns»Žô\í:-\É\î\Ãm_µjUƒ\ë†\r¶\Ö]+?\Ý>“\\\Ç<\Îl°œ®rö†††¤%\æÁ`pW*ŸSø\Óÿ\ÛW†øAkÿÿd\'ÿø\Ç?œ-\r,Gq„“˜«Wr¬¦ÀK\Ì\ë\êêœ’t¾\ä’KœD^³\ã:²«\ÄY·õ¼^§\×kpQðÀ8³\Þ\Z(4h\é¾ý¾ðó¸TN¯„E‹¢\è³šnŸw\Þy\Ìô!\é\åŽ\Ñ6\í¼\éó­8òZøý/|\á\Îkµ³¦øQ,(¶¼s5k¢“‹.º\È\Ü}÷\Ý\ÎM*—0G\ÉÑÙ¥¶f¬£MºcMÎ½ƒEü÷oñ\ê\ÛU¬Ï²*Šü‰¹úaõ™ê§½\×\ê1\í+i&ZûHJÒ•˜\ëþC=\ä<§×©RI}°y›Œ:	´q%\à^S2¯òøðRöiÓ¦9‰—J\Ø5\Ã~\Çw8\ÕP^•¡o%\Ö\Ú?\Ó\Âpz¯ª(\Ô}=\î%\æ*­?\æ˜cœƒú\Ûôw\èý\ëõ\Zt[3\îªnLdß®1Y‹^º‘g´uÀ¥«\Ò\é¶\Þþˆ½\í\ì\'‚>3yyyþj\Ûô\Í#¼K;9I*c\×ùÉ›\éZ3‹¸+¢	¤\Î(ÁUyŒf\Ýtûò\Ë/wfó´¨‰Ú—¿üec;\Ôf\ç°\ê5‡zh\ÓÀ¥@¥RJ0üe»Jª•€k0¸ñ\ÆAƒ\î\ëü-/1¿é¦›œß¥\Ù=›¥òy\rn:—KM·\Õü¥Z$Ÿ˜\'¥\Ü1–¦\Øð—³\ëó®\Ó;¼Ç¼\n•\ë9•KFjŠAÍ¨¤r	#q\Ô%Dš95ÙŽöõ$\å\è‰¹šf\ËU]\äO\ÌU\Ñô\ïÿ»\Ù\ë´o£ƒ¨j\êG\Õ{÷\Õ\Çþ\îw¿s^÷\Ê+¯8‰¶\ïß¿¿3¨\ÒPý±~ö=÷\Üã”»{ûIJ\ÌÕ—«¯V\å”w%õzL·\Ï?ÿ|£\Óm½\Ä\\U…Z	^ôó´@œ\î«\ÑKÌµ¥™[=¯Ê­_þò—\Î\ä‹&P¦L™\â¼Í´\'«oO×„<l¿¤\Æ\Û7\Ñ\ç)t\àÆ·ÿ“\ÞydŸ>}n×ŽMf\ÍC6Ù¦…\È\èZ‘J‰¹:w\Ö\ÑW•\\=ºY+,,4/¾ø¢3;§òX®ó 4\àx—\ÑL\ß~ðgPzû\í·›s\r2š\í\ÖÀ¡B—\Ñ}ñõó÷\ß\ß<ò\È#\Îó:Š«u%\ZØ¼¦y’CB‘±‰yR\Ëci7nt>¿\Î\Ânú<k†Z÷Uf\î­Ò«™n-<¤™x\ÒN˜\×t€J¾#º>l*—0G]†f\Î\Ã\Ë\Ê\ïÍŠ½<½¥\ä¼$\ì÷pN9º\Ô>’J\Î\Ã\Ï1o\éuª\æSÉ¹ö•Ô—zk_F‰»ÿµ\ê\ï\ÕW{—^ó\Æú¯“®ƒ:UOW\r\Z\ä<U\â¬Ry=®\ÛJÀõ³ôú¡C‡:+¸«\ÏW¹»~žu\Ý\×û\×ó\ÞB»š]\ÕóªŽz\ì±ÇœIU«rK§KyUô\íñ¡Iÿ¬y¼\Ó\Ï\Ó\Ïõ~GF\ä‘Ø® H$Ï®£™pô]\'1¿\å–[œ\\\ç j \Ð\0¡#·\êø5K­Ûƒv:_uöº­Rv•\á\êÈ«\×N¿\Î+W9¯Ž\ÖzGƒ•˜«$W¥=*{\×\ï\Ñ\0¡û*\Ùò—²+\é\×ó\Z0Tv\ì±Çšk¯½\Öi\êˆ\Â\Ë\ÞI(j‰¹>\ÓYQ¬½\à5S®*UŒx\í”SNqsÿ\ëRµ„‘8\êrÉ¹A8’Ë‚n‘¾K¢¡\Ëô\í>ø ³Îfº5y \Òuõ\Åú\\+q\Õ\ãz^¯Sr«hõ­:ªý$\àT¯\Å;•\ìz«¯kGý¯~Ž\Î_\×†ö¡4¹ \Çt[š)\×Ìªf\ÒUR¯…tu\ê\àõ\×_ïœº§I\Ý\Öcú]ú\Ù:P\ë]3]\ë–\è\çy%ñš8ñ\äzM\Ïk\Ñ]]®MŽ\Z;´\íôw\êo\Ñz$ô\íqM\Îk½\ÄYñºtš¤\ë3\ãŸ-Ïˆ<R%\Æ\Ú\Ò\"‰°t\é\ÒOtMn]¯•/R)¡\Ðg^¥¼Rv-.¥A« «¤\\3\á\Z|\Â/¥¦ûšýÖ ¤r«–~¶Ê§ZKT´\àUxb®\ä^ƒ‘]:DM‹§˜#\ÕsTÒ¬¹v–\ÜÏ³S§ûú\\‡_\ÐK\ÌÇŒ\ÓÔ”œ«\Ý?³’ª%Œ\ÄQ—^Ö®¤º$+öK …_G¯Ÿ$µo\×Bm\ê+½+[´\Ôô¼· ›’e%¸^ÕžÊŠµx­%\ïür\ïsÍ¦«JÊ»\ZNMRÅŸ×´O\å%ò^\Ó>˜÷¿\Î{­*\Ãß¿\Z\ÕAYÿõ\Ó\Ã\Ç\"U_©jJ\ZtPx\ëÖ­M•>¼Ù¬?}{|òHÿ¥-Ui\Ú\Ñ\ä\\I¹öü—\ZÍ¨<2//\ïn-\ê 2x²º\Ùþ\ÃvSÂŽTM(¼sÌµøšVnÖ€£Y\ëŸÿü\ç\ÎùPZ€ÄŸ˜\ë\\Z\r\\ºH÷\îÝþ¢¢¢=-p¥G%¼:¢«„A–\îk`ò\Ïjux=¯•Ióóó\Ä\\‰…šŽî’˜#\Õ\ã(ü’iYaç˜‡7%\æ:O\\36^S¥HV\ØeSµ„‘8J‹ä¼£Z*“Ò¶o§Ñ·GŠý‹\Ójæ¼½e\íú¾°™r“‘y¤M\Î\è×¯_(^3\ç\îLùnû\Ï*\å#‹Tt´p›Ê©”˜kõg\ÍP«ŒK\×\Û\ÔyN*\Õ5—u9&\'¥|«\ÄY¥X\Þe\Ôt\É%õ\Ù\Ù\Ù-\Î\Ê\é$Y¾Ò«ð\æ\Íôi\ÕI•¯\ë\à€fÑ•\Ø\ëÈ±f\ïtªq¤X\ÐùÝªQ\Ó9\äú<û\Óm/f\Ôô˜D\éŠ^\Ó@¬\ïó\ÎGO\åF\â(\ã“óx\'ù\0‰9‰y—f\èûüÉ´\Î\r×¸¯1;\Ú\Õ\×U‘\á?§Ü½¢S\æ\æ‘:\âa“ƒ\ÐSO=\êÀ‚p¡\Ûn»M«p«¬\á>>ªH\ÕAG3\×:—\\Ž¨#\Ðe—T\ê¤\ÒW]\êL	²Ê¸4û¦2-¯,*<ÁV©®\Êl•\Ô+yÿ=Z­TÉ¼&\Ð\ßô{½¤E¥;:\'K·µŠ©œÓ¢+:H\Õ8RY¹Nÿð—¥‡7]\Ðÿ¾tÚˆ.\ã/Ÿ\Ôb‹:ð©D1•J‰£.­£\åç”¯ƒÄœF\ß!´-ž {§Gh6\Ü+sW¹º\ÖP\åª&Át%£°KÂ†\È#³þ®@0\Ü4p\àÀF­0û!ý\Ø&ö[u‚>ç”ƒA‡A\ÄqD¥pr\ëŒ7½¾F\ß\ÞFé¿ŒZ;ydG=nU‚Þ»w\ï\Æq\ã\Æ\íxù\å—Ö­[× ™Ù¶m[\ãúõ\ëwÎ™3g\ÃÈ‘#7\Ú\×\îÖ†\Ô\Ñ\rV_ƒƒˆ#\Zq”\Âb-G§|ô\í4úöò\Èv$\è\ä‘m\É\Í\Íí‘““3\Ãn¨\n\Ûv‡mÀÛªl›©#$l-0\è0\è€8¢Gi–œç»¯+b“¾F\ßN	0\è\Ðt@Gˆ¯¶\Î÷V_\')};¾\0ƒA\Äq„‰4sNù:\è\Ûiô\í\0th: Žˆ#tRrNRúv\Z};\0\Zƒˆ#\â”œ/\")};¾\0ƒA\Äq„\Î1\\‹eqI4Ð·\Ó\è\Û0\è\Ðt@G\ènbÐ·\Ó\è\Û0\è\Ðt@G 1\è\Û\é\Û€A‡A\Ä8\"1\è\Ûiô\í\0th: Žˆ#˜ƒ¾>•¾\0tt@Ñˆ#s€¾F\ß€A‡Æ \âˆ8‰9\è\Ûiô\í\0À Ã \âˆF‘˜ô\íô\í\0À Cc\ÐqD\Äô\í4úv\0`\Ða\ÐqD#ŽH\Ìúvúv\0`Ð¡1\è€8\"Ž@búv\Z};\00\è0\è€8¢G$\æ\0};};\00\è\Ðtˆ#>¿\ÄH\ÌA\ßN£o\0G4\âˆ\Ä o§o\0\ZƒqD#Ž@búv\Z};\00\è0\è€8\"Ž@bÐ·Ó·\0ƒA‡8¢G 1};¾\0tt@G 1b2w\î\\úTúv\0 ¡`\ÐqD#ŽHÌÎ²`Á‚\Æ\ê\êjú\Õh\ëÖ­û\Øö\í;ùT ¡ ‘P€8\"Ž@bŽ2oÞ¼›\Ë\Ê\ÊB6l\è\Ò}beee—O\Ê\çÌ™³Û¶[ùTH[”i‘P€8\"Ž@b´\Ì&ƒ£lŸ²UýJWl¯¿þº)..63f\Ì0]õo\ÐL9I9€´G™eZ Žˆ#˜\é\ÇsÀ¦M›Bµµµ¦ÿþ\Ø\"\0\ÂÒ¥L+’	Ê´ˆ#\ZqDb ^Ö®]»Ê¸.\\Ø““S\ÄV€\Ö\ÕË´Ò¤Q¦EÑˆ#s\0qQ__ß«±±\Ñø;¶¡OŸ>\Ý\Ù:\0\0\0\0HÌ«ªª\Úm\Â\Ô\Õ\Õ5\æ\å\å-f\ë\0\0\0\0 1¨¢¢b®‰`úô\é6\Þò\ÙJ\0\0\0\0HÌ°¹÷qÛ·o”—›P(d\n\n\n¶÷\ìÙ³[\0\0\0\0‰9g•••õ¦\r«W¯\ÖBp3\ØZ\0\0\0\0HÌ8+//o+/7;v\ì¨U\Ìõ\î\Ýû\0¶\0\0\0\0s Ž\n³‰w«‰ù°a\Ã\Ö2c\0\0\0€\ÄHG}tg¤¤|\åÊ•\Ël¼\ÕsŽ9\0\0\0\0s A²³³Ï°	xK¿\íƒ;X•\0\0\0\0‰9`\ãÇ_¢\Øý\î¿ÿþ\å@`[\0\0\0\0‰9`*U/--mô’òººº5999»úô\éÓ­\0\0\0€\ÄH‚+¯¼rÈ¦M›Lmm­\éß¿MÌ‹\Ø*\0\0\0\0HÌ$*))\ÙX\\\\llŒ­gk\0\0\0\0 1’L¥\ëŠ/-\Ç\Ö\0\0\0\0@b_\0\0\0\0H\0\â\0\0\0\0H\0\â\0\0\0\0‰@|\0\0\0\0‰@|\0\0\0 q\0ˆ/\0\0\0\0$\0ˆ/\0\0\0\0$\0ñ\0\0\0€\Ä\0ñ\0\0\0€\Ä ¾\0\0\0\08\0 ¾\0\0\0\08\0\Ä\0\0\0\0\0\Ä\0\0\0\0€ø\0\0\0@\â\0€ø\0\0\0@\â\0_\0\0\0\0ºN’P¥D¡¶•-_\0\0\0\0“8ä·•8Ql)€ø\0\0\0¸\äac+‰C}Ïž=»±•\0\â\0\0\0@\â‡ˆ³z999El!€ø\0\0\0øä¡¥sa·2›_\0\0\0\0’“8\äs\î+@|\0\0\0\è\Ü\äa=³y\0ñ\0\0\0 “¾¾\Äa8[ ¾\0\0\0\0$™w.,³y\0ñ\0\0\0 	rss{\Çm²P‘““³+\ì<\Ø\Ýnù\íL½Ž­_\0\0\0\0\âD—i²	AýjZ¹\Ærø¥jƒÁ\à$¶@|\0\0\0h\ÂpŠm£M\"´\Í\Ù\Ù\Ùg°5\â\0\0\0@@q0ù“€\Ü\Ü\\STTd\æÍ›gÖ®]k¶l\Ùb\ä³\Ï>3•••¦¼¼\ÜLœ8\Ñ\ä\ç\ç‡\'!f÷\0\â\0\0\0@ôI\Ã(Y­†©S§š\ê\êj\Ú\ÚZ\çõú¾°ò\Û\Él]_\Ä\0\0\0€Ö“†b\ÒPPP\à\ÌÞµ‡¾o\èÐ¡Í’fö@|_\0\0\0\0\"\Ð9¯þò\Ú\Â\ÂÂ¦r\ÚöR\îØ±c\Ã\Ën\Ïakƒø\"¾\0\0\0\0\ì™8\Ôøgò:š4ø“‡°™½\Ílm_\Ä\0\0\0€\æIC‘ÿœ\×ö–×¶Vv\ë?\'–’[_\Ä\0\0\0\0]G\ÙÛ©\×\ÂR‰0m\Ú4fõ@|_\0\0\0\0\Â\å\æ\æöð¤Ò¬[MMMB­&\í¿Ô“Î¹e\ëƒø\"¾\0\0\0€Œ÷v\æÇoI\×aö\Í\ê\Íd\ëƒø\"¾\0\0\0€Œgw\à+¼ù²²²„&\å\å\åþÄ¡Š­\â‹ø\0\0\02^NN\Î.og>Þ‹R…«¬¬ô\'\rl}_\Ä\0\0\0ñt\ícog>^—pj\í\ÒN¾\ÄÁ°õA|_\0\0\0\0‰ƒoG>H@|_\0\0\0\0š\'\Ì\è\Ä\0\0\0€\Î\Â9°\0ñ\0\0\0 ±j4@|\0\0\0\èD\\g ¾\0\0\0\0t¢\Ü\Ü\Ü\ÞÎ¼½mjjj’4\Ô\ÖÖš¼¼¼¦\Ä!\'\'\ç¶>ˆ/\â\0\0\0@–Sn[\ã\í\ÐO:5!‰Ã´i\Óü³y›\Ù\ê ¾ˆ/\0\0\0\0®œœœ\"ÿ¬^¼©\Ò\Ï\Ó\Ïõ~G0œ\ÄVñE|\0\0\0hž<\Ôz;öq»´“.\á4dÈf³y={ö\ì\ÆñE|\0\0\0hž8œbw\ê½ü\Â\Â\Â\'J\ZÆŒ\ãO\ZBÁ`ð¶6ˆ/\â\0\0\0@@±o\'ß™\ÙkoÙ­¾/l&[_\Ä\0\0\0€¶\Øüûü;û:wUVi\Õ\çhW‡\ÖBTþs^\ÕlRR\Ê\ÖñE|\0\0\0ˆ‚föl…\'ºsYY™3[\ç•áªœ¶²²Ò”——›\â\âbsé¥—6KT^«d„­\n_\0\0\0\0b\àž[–\Ä\Ú6s\Î+@|\0\0\0\è€@ pk;ˆÍš\Åcuh€ø\0\0\0\'¹¹¹=rrrfØ„ Â¶\Ýa‰BƒmU¶\Í\ÔL [ ¾\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\É÷?$\ÌÍ’\Ú\Ð.\0\0\0\0IEND®B`‚',1),('70002',2,'source',NULL,_binary '{\"resourceId\":\"70001\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-CF0A353D-0B50-49A6-A377-B771178F4FF6\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¼€å§‹\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":345,\"y\":135},\"upperLeft\":{\"x\":315,\"y\":105}},\"dockers\":[]}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('72501',1,'source-extra',NULL,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0‹\0\0\0¹\0\0\0\Ù%™\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€\è\0\0u0\0\0\ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0sRGB\0®\Î\é\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0WIDATx\Ú\í\Ý{h•\çð\×\\­6—\Å+NI\\¼_˜Q\ç\Ø\Ü,J·d\êtŒ•Ø1\×1ql\Â\Øp\îŸQ™,¥\Ó8­\Ú1¢\Ô\Ë4s\Ô\ÄK‚]‰¥^Ð¨]51:šœ=Os\ÆR)›-z¶s\Î\ç_Þ“\ä=y\á\áp~ü\Þ\Ëó$	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0QCÀ€T*5´­­\íù“\'O~µ³³sú•+W†Ýºu«¨··7)**J•••Ý«ªªº\\^^\Þvÿ\é\êÕ«\ßR,\0ò¨H\ìÚµk\ÓÙ³g—¿÷\Þ{E&LH¦M›–Œ=:	\Å!:thFOOOr\éÒ¥¤½½=immM\\¼s\çÎºM›6ýV±\0\ÈaÇÿÆ^\î\î\î.]¶l\ÙûE¢°°ð¡\Þ{úôé¤±±±\ï\æÍ›7n\ÜxnÇŽ\çruœ\n}T€<\í&ŠfÎœy`\çÎß7o^\ÑÊ•+“Q£F%¡[x\èÿ1r\ä\ÈdÁ‚\Å\Å\ÅO;w\î…Y³f]kiiiU,\0r¤P>|¸y\ïÞ½sV­Z•Ìž=û#‰UWW\'Ó§O/>v\ì\ØÂ¶«µµõ\r\Å \ËÅŽ\"Š5kÖ¼]\âQ¨¬¬L\ê\ê\êŠ<ø™ñ\ã\Ç_joo?£X\0d©x\"žzŠÅ£*ÿ2|øðd\êÔ©%GŽù\ÜÄ‰_\ã\ï¹2n>:@¾ˆw=555m\\¼xqRSSóXŽ1fÌ˜d\éÒ¥¥¿Ë¥±S,€¼±gÏž†žžž’…>\Ö\ã,Z´è‰ŠŠŠ±Ë—/ÿšbe]E{{ûW\â\í±\Å\ÅÅýxõõõŸ\ÝÅ·€,ŸÌ¾~ýzQ|Ž\"âµ‹\Ò\ÒÒ±¡8}R±\0\Èq\nòÀÝ£0eÊ”«a³D±\0\Èq®§É“\'gô˜uuu•a3_±\0\ÈqRÀx§R&7nX\ØLÏ…ñ+òòAœ=6>8—IO‡M¯\Î K\ÄYc\ãì±™”>\Þ\Ð\\?\Å\È¥¥¥©X02\é\îÝ»\×t\0Y¤¼¼ü^WWWFŽ\×691\å‡b\ä…\Ê\ÊÊ‹.\\\È\è1\Û\Ú\Ú\Þ›SŠ@öt‡\ã\nw™\Ô\ÜÜœ\n›ÃŠ@–\è\î\îþÙ©S§úûúú2u\ÈÞŽŽŽÚ°Ý©X\0d‰u\ëÖ½]RRòN\\\n5ššš^\í\ï\ï¿\Ò\Ø\Øx^±\0È®\îâ¥­[·\Þ\Ï@wÑµyó\æ‰C†ùM®Œbä†††·o\ß~sß¾}õ8\ë×¯]Å\Î\Î\ÎF\Å ;»‹/\íÞ½ûnGG\ÇcùÿmmmliiYºŠ:t?W\ÆÍ²ª@^ioo\ïš4i\Òù\'N<\×ÌŽK¡>*—/_>¶v\í\ÚO…—?Ø¶m\Û\ë¹4nŠwÎœ9\ÓV[[{õ\èÑ£ŸÛ’#F<’Ž\"Š¾¾¾/\çÚ˜)@^\n_\î\'«««\ß	ã‹………÷kjjJ\n\n>Ö™ù®\r64nß¾}~*•úQ\Øþ:\Çkˆ\Ï\âJv¡H4”••Mª¯¯/Ÿ1c\Æù\Ö\Þýû÷\ïÙ²eKõýû÷{\ã5ŠmÛ¶ý-W\ÇI±\0(\ZKB\Ñx±¤¤dJmm\í»s\ç\Î}r\ìØ±%UUU#\ã\ì±qRÀ8\×\ÓÙ³g;B7R\Ø\Ñ\ÑO9]om¸zõ\ê+¹t1[±\0ø/V¬XñLÿ’T*5\'üøé‘\ÉÀ4\ãqö\Ø8)`œ\ë)N\á±3W¸\0\0\0\àÿMUòÁ‡™+’<¹«\Ô\Z\Ü@>›\ZR\Òÿ!‹\×t\ã$R\Çý®!dyò\ï\Õ\ï~òJ\ÈQ\Å wU‡Œ\r™r1$.VT²0\ä!·(ýƒ\nE,&ñi\í\æC6\æò@y(\Ègo†ü%ä™ý!\é‚11ä¥–ô~óB~×§x.8õTÈ½d\àÎ¨™!S’YOgðñü9\ÝqK®[”…|/$N_û\Ñ!\ËBö„t\å\â\0x\Î\ÈW5!qjŽ[\ÉÀ\é¤!\ï¦B\ì,N¤_ÿ2\äõô¾?ùIÈ±d\à\âvgÈ•ó!\ÓBžù“\Î w\Ä9\Ê¦_Ç‚ð‹k\é.am\È7\íO\Ù×¥¿3Ç…¬ú.\â!\ß\Ê\ÕÁR,\0N-]ûwE=²+\ä¯\éß¥B¾>hŸ\×ry€,~\ä»xÁºû!ö‹wK\ÅùŸ\â)ª9\éb‘7t@¾*	ù~\ÈgC¾üÀ÷\âƒßqÁ‹ß‡ü8¸\ã\é\éd`Î¨Uƒö)V,\0rOº[x6ù\àCyñ9Š#\ì\ï„ZòFú\çøü\Å[!\í3Á\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0üoü;üþ™JŽ=ð\0\0\0\0IEND®B`‚',NULL),('7502',1,'test1.bpmn20.xml','7501',_binary '<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"test_process\" isExecutable=\"true\">\n    <documentation>miaoshu</documentation>\n    <startEvent id=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" name=\"å¼€å§‹\"/>\n    <userTask id=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" name=\"ä¸»ç®¡å®¡æ ¸\"/>\n    <sequenceFlow id=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" sourceRef=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" targetRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\"/>\n    <exclusiveGateway id=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <sequenceFlow id=\"sid-4B4F3AE3-DE93-4173-B023-422C7748899A\" sourceRef=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" targetRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\"/>\n    <userTask id=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" name=\"ä¸šåŠ¡ç»ç†å®¡æ ¸\"/>\n    <endEvent id=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n    <endEvent id=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" name=\"ç»“æŸ\"/>\n    <endEvent id=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" name=\"æˆåŠŸ\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\"/>\n    <sequenceFlow id=\"sid-ED19277B-278A-406C-9A55-548256184583\" name=\"å¤±è´¥\" sourceRef=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" targetRef=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\"/>\n    <sequenceFlow id=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" name=\"å¤±è´¥\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\"/>\n    <sequenceFlow id=\"sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\" name=\"æˆåŠŸ\" sourceRef=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" targetRef=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_process\" id=\"BPMNPlane_test_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\" id=\"BPMNShape_sid-C22099DF-84B3-429E-9673-3466EEAF0B0D\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"141.609375\" y=\"37.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\" id=\"BPMNShape_sid-392231E4-F4FC-45E6-9CE9-60E5208FC828\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"216.609375\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\" id=\"BPMNShape_sid-8386BDEE-0525-47D3-B158-2802DED1BAB3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"361.609375\" y=\"32.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A004629B-B30D-4620-B088-C4A1B3C0040D\" id=\"BPMNShape_sid-A004629B-B30D-4620-B088-C4A1B3C0040D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"495.0\" y=\"12.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-24B3E94A-0EFA-41BA-B183-FE587581347D\" id=\"BPMNShape_sid-24B3E94A-0EFA-41BA-B183-FE587581347D\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"690.0\" y=\"38.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-CEC87C93-A533-432B-98EB-83A08858B6A2\" id=\"BPMNShape_sid-CEC87C93-A533-432B-98EB-83A08858B6A2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"531.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-976F7F72-C689-48FE-997A-D82A66F57287\" id=\"BPMNShape_sid-976F7F72-C689-48FE-997A-D82A66F57287\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"367.609375\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\" id=\"BPMNEdge_sid-DD40C709-DF5E-4ADF-B80B-78DCD55C50AD\">\n        <omgdi:waypoint x=\"171.609375\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"216.609375\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-ED19277B-278A-406C-9A55-548256184583\" id=\"BPMNEdge_sid-ED19277B-278A-406C-9A55-548256184583\">\n        <omgdi:waypoint x=\"382.0104166666667\" y=\"71.59895833333334\"/>\n        <omgdi:waypoint x=\"381.6819128864211\" y=\"135.0001879207243\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\" id=\"BPMNEdge_sid-58DA28D2-6227-4E98-B1B4-9CDD428316EA\">\n        <omgdi:waypoint x=\"401.1678759140768\" y=\"52.44149908592322\"/>\n        <omgdi:waypoint x=\"495.0\" y=\"52.15347721822542\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4B4F3AE3-DE93-4173-B023-422C7748899A\" id=\"BPMNEdge_sid-4B4F3AE3-DE93-4173-B023-422C7748899A\">\n        <omgdi:waypoint x=\"316.609375\" y=\"52.21645021645021\"/>\n        <omgdi:waypoint x=\"362.0224184782609\" y=\"52.413043478260875\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\" id=\"BPMNEdge_sid-FFE1EF5B-485F-4806-841A-15D5B461C03B\">\n        <omgdi:waypoint x=\"545.0\" y=\"92.0\"/>\n        <omgdi:waypoint x=\"545.0\" y=\"135.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\" id=\"BPMNEdge_sid-14A057C5-E09B-45A7-B249-0DC7ADEF7DF6\">\n        <omgdi:waypoint x=\"595.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"690.0\" y=\"52.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7503',1,'test1.test_process.png','7501',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Ø\0\0\0­\0\0\0Š£^\0\0\ÕIDATx\Ú\í\Ý	”•eù\0p²eö}·Ó©Ó¾žc«e‹yÚ³¦  ŒH\Í\Â\Ì\r!\\\Ò\ZM´ô˜†\Ê%S²PIB,\Íã‚™fš‚Š \"‚\nóþ¿\çûó\Íù¸20w\æÞ¹÷Ž¿\ß9Ï¹\Û\è\å½\Ïó\Ü÷{¿÷2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0©”Ò®w\Þy\ç²%K–¤ùóç§¹s\çŠŽyóæ¥«®ºª+‹F$r‹[\0Z\\ÀE‹¥•+W¦M›6‰ÅªU«\ÒÂ…»²‚x¢Q‰\Ü\"\ä€³K\n`óÂ¹s\çn2*‘[„\Ü\Ð\Â\âÐ­\Ô<‡uJ\ä!·\0´°HºŠ\"r‹\ÜÀ\0ÁõßŸ\î¼ö\ìtË¼)y\Ä\ß\ã6…K¹En \Ê\"¸nÍ½i\é\åG¥/›¸M\ÄmqŸ\â¥‚\Ü\"·\0PE\\vË¥O(€E,¿e¶\â¥‚\Ü\"·\0PM¼õ\Ê\ãz,‚qŸ\â¥‚\Ü\"·\0PE\\:÷˜‹`Ü§x)‚ ·\È-\0(‚Š \È-r\0)‚qfOE0\îS¼A[\ä\0ª(‚ÿZ|jE0\îS¼A[\ä\0ª(‚«\ï½)-½b\Ò\áf·\Å}Š—\"r‹\Ü@E0\â®\ë\Î}BŒ\Û.E\ä¹€j‹\àÆ\é_W\Ïx\â!\Üì¶¸OñRAn‘[\0\èeŒ«©Ý¾ø”\×I\Æ}®¸¦‚\Ü\"·\0°³\"¸qcºÿ_\Ò\Ís\ï±\0‰ÇšqRAn‘[\0Á\íÁ\Í,™qRAn‘[\0¨¢öffiG3NŠ™\"\ØO»y\ä¹EnTE°¯°\ÅL\ì‡#³H[ÿDn‘[\ä€ÁQ…\"\Ø ‡fÑ•\Åõ[ÿœ\ì*·¹@Š`ÿšë¢©Ž\ì-šl¹E\È-\0Š Pû\ß\\\ï\ìv\ä!·\0(‚B\ìÁ‘;i¢‹û­É–[„\Ü´‚‹.ºh\ßSO=uÙ”)S6\ï{\ßK£FJ\ßø\Æ7Òˆ#\ÒþûïŸ¦N\Úu\Úi§=¸dÉ’\ãA¡Ö­¹\ÞYól&[nrË 6lØ°\Ý\Û\Ú\Ú\Î\Ïze\í\í\íevE?²5\Ï\â¾,f\Ç\ã¼[4­É“\'ÿ\ï\á‡¾\å\àƒNgœqFº\æškÒ½÷Þ›6lØBü¹r\å\Êô÷¿ÿ=s\Î9)w\ÔQG¥\Î\Î\Î\ëA¡\ÖÄ¡U\ÎLWûx\ä¡ÁnzY3==kœWg¦RC½\Ã\È»¦££c†w¦q\Øa‡\íuè¡‡>>q\âÄ¼yÞ¼ys\ê­n¸!eMyÊž\ßuö\Ùg¤\nE°\ß\Íõ\ä>>O“-·¹¥\Õ\ë=²X\ÕÛ¦º‡X»\Ï>û\ì\éÝ¤¡Ž:\ê¨KÆŽ›fÏž]Uc]iÎœ9\é;\ßùN:ýô\ÓoR…\"8`\Íu­ž\Ü\"·\ÐPmmm\å% iØ°aiúô\éiÁ‚\éž{\îI<òH\Þs<ú\è£ùöÅ‹§“O>9_\ÂZ\Ñdw™Í¦aN8\á„cMõ\í·ßžj\á?ÿùOŠ5\ÛY“}‡\"(Á^\Û\Ù	ý:\È-r\Ý\\O./‰\Æz\æÌ™ù²\Ô\ÞX³fMþøx^Å²‘s¼»¨C9\ä¼h®{;x{+^/š\ì“N:i‰\"(Á^7ÅµZ\Þa&[nrK\Ë\Í\\—›\ëñ\ã\Ç\ç³\Õ}Ï‹\å®\å&\ÛL6&\Ö83¦f3\×Û›ÉŽe\'S¦L¥\nEp§\Íp\Ñ\\\ï’\Å/·þY\Ê\çY“-·\rv\Ëô#\åe!“&M\ê^\ÒW±|dÚ´i•\ËEöönSwû\í·ß†Xs]O±&;ûºEŠ`¯fš£9¾-‹´õ\Ï\Þ6\Ù==O“-·\rv+4Ø«\Ë3\×ým®\ËMv\ÅLöZ\ï6u5r\ä\È9\äô\Øc¥zûÁ~\Ûø]¦\nEp‡\Íõ­3Ð©½i²\Ë\Íug”\î·&[n\Z\ìfn®§—\×\\÷uYÈŽ–‹”\×d[*B]pÀc+¾p\ÓM7¥	&´\ä,¶\"¨\ÖIOM\ïöš\å5Ù½}¼5\Ùr‹\Ð`7¥\Ø\çºh~\ã\Åz˜5k–Yl\ê/®t[\éõg;¾jt\ÐA)ö\Ùn¶uö\Íy?EP¬\ç\ÚAs}d?›\æj›q\ËEšhL\È-r‹\Ï\Âÿ÷#Å‰1Ë¼zõ\êºô ±»Hy¿Xó\í_ˆš\ë\è\è¸(®\Ð8\â[\éGqc“}ø‹\Ûê¶¶¶}AE°c¨M\îÎš\çj›\ëò\ï\ßb&»ñcBn‘[|òC\Î/wüñ\Ç×µ‰}²KÿM³ýQs\ãÆ{(.>b9Ê„	66é‡¿ˆU•ß¶AE°¿ch;\Íuo›Ûžš\èÿ\écs]9ƒ®\Én\à˜[\äŸ…ü1ËŠû.\\X\×>$.FSúoY\á_ˆš9r\ä\æû\ï¿@\ì\Ø{ô\è\Ñ]Mþ\á\ïþ¶]$EP\ì\ï\êcs½£&{S?š\ëþþ÷P£1!·\È->ù	Ž·\×ú\ä\ÆJq\Å\Ç\Ò\ÃfÿB\Ô\\¬sÚ°aÃ€6\Øñû\â÷¶È‡¿û\Ûv£‹`|£m†zº?\Þ\×K/½4=ô\ÐC\Û<\çŽ;\î\Ø\á\ëF\"»üò\Ë{¼ÿ¿ÿýoŠ-Ë¯ûš\ßp\Ã\rŠ`•ch·\Ýv»¸Ÿ\Í\ìöš\ìþ4×•M¶5\Ù<&\âpy=rK\äƒòŸ=Åƒ>˜®¿þúæ–ˆX[\Ï\Ïs3\å!\rvc>\åŸkµ5ßŽ¶\ì+ÿ>ÿB\Ôe\Ð7B/>lMl°-Z”^ñŠW¤—¼\ä%±\ÍaZ·n\Ý\Ó\ÙÙ™7Z\ãÆKx`úù\Ïžžþô§§\Ï|\æ3±$\'K.¹$\Ýv\ÛmqU\Í|\rZÄ§>õ©´ë®»¦Ÿü\ä\'Ý·\Åýÿü\ç?»t¼n<¯ø]?þñ\ÓG>ò‘†7Ø­4~¾ò•¯\ä\ï\ã›\Þô¦þ&óÿ\Ù\Î\Ìõ¦­·÷\ÇõñZ­ø\Ùlõ¨un9ë¬³\Ò^ð‚¼yŽ\Óyó\æõø\ØÑ£G§\ç=\ïyù—óx\\\ÄUW]õ„fýÕ¯~u:\çœsòŸ#Ç”\ÇõùçŸŸ\ß~ê©§¦½ö\Ú+\í½÷\Þi\Ï=÷\ÌO${\ç;ß™\Þõ®wu\Ç\Û\Þö¶<—4s2&Ý‡\è©¹ŽŽ3\Ø;þv½¾­­mòÐ¡Cw\è;Þ§˜YZºti7\Þxcú\á˜¾öµ¯\å?\ß|ó\Í\é\Úk¯\Íû\Ç?þ1=ó™\ÏÌ›\ï§>õ©\éû\ßÿ~zý\ë_Ÿ¾ô¥/¥}\èC\é½\ï}o~\ÒHü?\\q\Åy\ãgkGdÿ\ésŸû\\q6u\Ïx\Æ3ÒŸþô§t\×]wå\Â\'§¾\ï}\ïK\Ïy\ÎsòB¿\ç¹\Ï}nzö³Ÿö\Ýw_3Ø½CCút3ØƒcÖ®<&j¾D$\ZÞ—¾ô¥ù,`Œ\"O”c\íÚµ\é»\ßýn~ÿn»\í–>ü\á\çñü\ç??½ð…/L÷\Ýw_÷c÷»\ß\å·E\Ã?Ÿp\Â	\é˜cŽÉ¯k¹\ä\àƒ\îžˆ/÷/{\Ù\Ë\Ò/~ñ‹ô\ÉO~2ÿb;G}\àH—]vYþû\âŠÁÍœ‡\Ì`7\æ³WW4ƒÍ ñ\Ío~³!k°G\Z\Õ\ìk°·)€õ(‚;‹8\Z\å)OyJwTþü´§=-\ìò\å\ËSöo™fÌ˜‘µ¢pžr\Ê)yqû\êW¿šN;\í´üj\ìE>fÌ˜|\éÈ¿ÿý\ïü°l<6N>Ÿ\ãöoû\Ûù¡\×(\Ô[g\\Ó›\ßü\æôü#/>Qó›\ß\ä³\äñzw\Þy§»c¨¢™µû\É\×TlwL\Ô*·|ô£Í¿l_pÁ\Û4\Ø\×]w]úý\ï\Õ\ÈÛ”\ÅLr\ÌJ\Ç6­1\Ûl\Ì\Çlöüùó»_3^#¾ {\ì±ù\Ìu4\ÛÅ’hˆ\ãu\â1\Å\ã\ã÷¼ño\Ìÿ³\Ò\ïÿû\Ó\î»\ïž^ù\ÊW¦¯ý\ëùO\ä˜f\ÎC\Z\ì\Æ|¬ÁfP\ÉôòÅ‹w\rô.\"YR_Û¤þuq%©\í4E\r9)ŠXy™H˜øBT\ÜV¬›ŒÃ¨q_\Ìõ1\Ã}\å•WæY¥ø¹Xv\Ï}ù\Ë_žÿ³Bqñ;\â°p\Ü?mÚ´ü²µ/~ñ‹ó\Â\ë!c\é–[n±»—c¨3\Ævi\í¦b‡c¢V¹%–{Œ\Z5*]x\á…Oh°#\Ä­\â±q,¾pÿ\áÈ—q\ã\'fÿò—¿¤x {\ÙG\Ñ\ØFóG\Î\Î<óÌ¼±~\ík_›žõ¬g¥/ù\Ëy^3\Ï/zÑ‹ò/÷\Ñ`\Çüý÷\ß?Ÿu¾øâ‹»\ìf\ÎC\Z\ì\Æ|\ì\"Â ûNžt\ÒIdƒ}\î¹\ç\Æl\ëœ&ûð÷4\Û\Ø\Ð{ÕªUù7ùeË–\åk$£À\ÄLMü‡M‹C¶1\ã³W_ø\ÂòÙ¨(RE\Ä!\ßo}\ë[\éóŸÿ|ú\Û\ßþ–?>–š\Ä\Ú\ì(¼1#¯E5~Žð¸¿øoø\ìg?›\ßÿº×½.-X° ?\Ô\ë£ˆÆš\î_ÿú\×;=A\êI\Ò`\ïtõq\æ¸^û`b\ì¦µ\Ê-1s3Å•\rv,‰Y\å8\ÂU{\Ï{Þ“v\Ùe—ôŽw¼#o\Ìcö:\ÖnG‰\å q„,šœ»\ï¾;^4¼]tQ~´\ì-oyK:ú\è£ó×\ÜMu\Ì\"\Çøh¶\ãù\'žxb¾;rE,=y\Ík^“FŽÙ½D¤™ó»1Ÿû`3¨Ä•“F\Zµe ¯\ä8nÜ¸®V¼rR#\Z\ìHC¶¿\Þ6¸HPùñ1C…\éG?úQw\ì±\Çyƒ]~\\®(LQ¤\âÄ£x­8Œ?\Ç\íEa‹C\Åo}\ë[ó\â\Z\'Eq™©x|\Ôø{\Ì<Å—\0[iõ\É\Îf\ë}%\Ç\é²\à\à\É-q\Ø;þ\í\ã³Zn°\ãs\Z\Ë)\âó[<6nû\Ù\Ï~–\Ï\Ç2‘h¶£ÁŽŸõ«_\å÷\Å\ã\â¤\ÂXž\rùG‘7\Â\ÑPG#]D4\å±\ì¤r‰H\\’:rX,\r‰\ïŸþô§ù‰‹+V¬h\ê<¤Án\\?R4½õ¾’\ãð\á\Ã]É‘ú\Ë\×ê«¯¾z@:\ì8Q/k\è}2Áj\â\á‡\Îg±#!lMúù:\Ãø9f¡\Êk\Ë\röÔ©S»#š\ì(š\å\íº¢p}ü\ã\Ïwˆb\Z¯\' \Å\Ïû\ØÇº[¬»Œ™„¸?þ\í>øÁ\æ\ë6\ãPo‰ˆC³1\ãd‰H¿ô4“]m\Ó\Ü\Û\Çk®qn‰\Ù\ë8°\Ü`Çº\ìó\Î;o›\Ç\Åy\Z‘+\"\âs\rjñs,¿øô§??nÉ’%y\Ã·;6_KDb©F¼öé§Ÿž/#)v6Š;Žœ\Å2Ž8\Ù:\Zðh\Î\ã¶øû¿ø\Å7k\æ<¤Án\èL÷\ê¢ñq\\ñÅ¯4{½Ö»N=\ì\écÆŒ\Ù<³\Øx\à–ŽŽŽ\Z\ì¾m\Õ7¤b\rveDƒ\ë£ ñö·¿=^1k1q\â\ÄüLÿ(šqø6\îB?GaŽû\ãqqBj4óEcÿ\Û\ßþ6Ÿ=:\à€òCÈ±CI|	\Ð`\×d&»r¹\Æ/‡T¿\ìc{MöUÌ˜3rK,\å¨\\ƒ½½\ÇmÜ¸1_\Ê³×±Ì¢¸=f“£/?6–¤\Å\ìu±\å_q\ÞGù‹{4÷\ï~÷»ó™\æýö\Û/_\rp,A‰\Û\ã\ï\ÑH\Çk5s\Ò`7¶)\Ïb\×úd\Çx½x\Ý\âw´j?Bk\r\ê5Yò«\ë~}Y²\í\Êöº*Ö¨>©\ìøö\ëc\Æ\'\"\ÖXG)\ß\ÇÏ‰\Ûb\Ý\ã\äÉ“»#NŠ\ç\ëµ#b-v±\×mœ\ì÷‡xÿü\ç?w¯\Õ.\"\îÿ\ë_ÿšo\ÏõªW½*/Àñ~D!ŒC·±…–»&Mvù\Ä\Çr³\\Í‰‹==\ÏV|ƒ8·œ}ö\Ù\éŸøD>ó_¬cIH|>cD\Z·\Çýñ¸hRcF8>»q\ÎF4¾±†9–s\ÄN!Ñ´»…\Ä\îC\Ñ0\Ç\ë\Äú\î8a1f¦c6;n‹¿GŽ‰™\ë\ÈE1³KU\æÌ™“o\ãw\Øa‡\å{c¿\á\ro\Èÿ·\Å\ïj\æ<¤Án|?R4Àq$¤V[ö\Å\Zý«\å\Ù\ëV\íGh­½GöMnË­·Þº¥\Íuœ­>|øð®\ìw\ìm–©w3E±\×ly¹GeÄ¾\×\åÿ®\ØK6\Ö;jˆ˜2eJ~x¶¼¯m9b¯\íX\ï\Ø\Óý13\'JÆ‰EQ¨c\Ý÷úõ\ë»÷\ê>ò\È#·™ý\Ò`÷K\år‘]¶\Î@W»õ^\åóú»ÿ6Mž[\â„\ÄhšËŸýÊˆû‹£\éFµ8\"‡\Í\ã¢1\Ñxë¯‹5\ØñùŽ«\ã\çhpcG’\Øûºˆ\Ø)¤hÈ‹ˆ\Ùë¸½ü¸â±±Ö»™ó»ñýH6·ð¤I“ú\ÝdGs5³\Ô\\·t?B‹Éš³Î¬	Þ¼bÅŠšn\Û‡÷F½¥\Õ\Å4z‰ˆx\ÒÁZ\ïK½½\å\'\È-Bƒ\Ý\ÔýHy\ß\ì˜\É\î\ër‘x^\ÅÌµ¥!¼l\àMöÒ¥Kk²u_ŠŒ]J²ËœVoAE°›l‘‘[„\ÜÒ²ýH¹)ŽµÓ±)–õv·82S^s1úZû›c\×Ygµ¶?\'>^pÁe;óœ©\nE°O3\ÏýY\ÖaYˆ\Ü\"ä––\ïG²\èªl´‹\åN1;],‰e ±þ?.\"\Ó\ÙÙ™\ï»^qõÈ®ÁÒ\ÐÂ¶®Z=bÄˆM‹-Z_\å•\Z7;vSö\Zk\Ó\Z\'EPl`“]\í´\Z\å!·ª~d;—[¯&\ÖZsM³}{<1vöqó\ÑG½vþüù\ë–/_¾yÃ†\rù:\í8¹dÅŠ›¯¹\æšM\Çw\Ü#\Ù7\Æ\Í\ÑXÇ·\ÄÁvv®\"¨6Hµ\Ë<,‘[„\Ü2hû‘j\ëÁØ0ˆ\Ä–²\Æù\âl .\Ë\âñŠ¼9‹q¹\ÑÁ|E$EPl&{\Ä‘‘[„Ü¢™\í\n \nE°7v¶¦º\Ø-Ds-·¹@Š`/õ4“mYˆ\Ü\"\ä\0EP(‚5j²5\×r‹[\0A¡Ö¨É¾^s-·¹@Š`mÄš\ëü\ÄŸN¹E\È-\0Š Pkc7\r¶\Ü\"\ä\0EP(‚5¤Á–[„\Ü \nEPƒ\Ü\"·\0 *‚\Zl\ä¹\0EP\Ô`#·¹@Š [nr€\"(A\r6r‹\Ü€\"¨j°‘[„\Ü \nEPƒ-·¹@Š ¹En@T5\Ø\È-r\0Š \"¨ÁFnr€\"(A\r¶\Ü\"\ä\0EP(‚\Zl\ä¹\0EP\Ô`#·¹@Š [nrÀ 2þ|\ÅG\Ô`#·\È-\0\ÔÊ¢E‹¶¬\\¹Rj‚X¾|ù\ÝY\ÜdTj°\å!·\0´°»p\áÂ®x@!jpœ7o\Þ\ãYœhTj°\å!·\0´¸,ñNž;w\îú8„(\Z›@\r¶\Ü\Ò|cQn\04\Ø`,\0hj0\045‹\0\0š\Z0\0M\r‹\0\0š\ZŒE\0\0M\r‹\0€¦ŒE\0\0M\r\Æ\"\0€¦c\0@S\Æ\"\0 ©c\0@Sƒ±\0 ©c\0\ÐÔ€±\0 ©ÁX\0\Ð\Ô`,\0hjÀX\045`,\0hj0\045`,\0š\Z0\045‹\0\0š\ZŒE\0\0M\r‹\0\0š\ZŒE\0\0M\r\Æ\"\0€¦ŒE\0@S\Æ\"\0€¦c\0@Sƒ±h,\0š\Z0€\'w³\"š˜\Äz\ï\Æ\"\0@ïšš;kj\Ú\Ú\Ú&{§0\0z\ßØ¬\ÚAS³n\èÐ¡»z—0\0z\ß\Ôô8s\Ø\Þ\Þ>\Ý;„±\0P}c³½õ¯\ë\Íb,\0ô­©a½+\Æ\"\0@m›û\Ìb,\0\ÔH[[Û¾¥¦\æH\ï\Æ\"\0@?\ë_\Íb,\0TiØ°a»·µµŸ51\Ë\Ú\Û\Û\Ëþ\ì*\Í\Z>¾õ0ý\ìxœw‹Œ\Çd<\0-!¶;\Ë\Z•Õ½¸j^y‹´53¼{\Ôk<f\Z\0@\Ë52{\ì\äB½‰µû\ì³Ïž\ÞMj1³0€\Ö\Ô\Ö\ÖÖ™5#[\Ê\ÍÉ°a\Ã\Òô\é\ÓÓ‚\Ò=÷Ü“y\ä‘}ô\Ñt\ï½÷¦Å‹§“O>91¢²©\é2{H\Çc6†ºŒG\0 U›™É•\ÌÌ™3\ÓÊ•+So¬Y³&|<¯\â0ý9\Þ]ú2\Ë\ËAŒG\0 Õš™\Îr2~üø|v°/\ây\'NÜ¦©1sHµ\ã±\Ü\\\0@KÙº\æº{YÈ¤I“º»÷U®Ÿ6mZ\å\áù½½\Ûôf<–—…\0@\Ë)\ï3…ýmf\ÊMM\Å\Ì\áZ\ï6½h°G\0 ¥›™\é\å5®}=¿£\Ãó\å5°\Íc<\0ƒZyö:N«‡Y³f™5\Äx\0¿¸\Ò]y¶põ\ê\Õuihb7‡ò–i±\ÆÖ»\Ïö\Æcqb£ñ\0´¤­—›Î›Œ\ã?>\ÕS\ìK\\š5œ\í\Ý\Çx\0¬±XV4.¬kCÿ(54+¼û\0À \Ó\Þ\ÞþX\Ñd\Ôúd²Jq…½RC³Ù»ñ\0:±p\Ñd\Ôj+´m‘V¾Ð‡w\ã\0Œ\rMwƒ144\0À`oh\Ìb<\Z\0@­XóŠñh<\05d\×ŒG\ã\0¨!ûc<\Z\0@\r¹’#O\Öñ8|øp\ã\0¨¬ÁX]4\Z3gÎ¬KC3kÖ¬òl\áZ\ï:\Æ#\00hµ··O/\Ï\Z\Öú\ä²x½x\Ý\âwttt\Ìð®c<\0ƒ½©YS4\ãÇ¯\Ùi±\ÚÄ‰·™-:t\è®\Þq\Z5\'L˜`<\0\Ò\Ð\ì‘5[Š\ÆcÒ¤Iýnj¢™™6mZ¹™\é\ê\è\è\ØÛ»M£\Æ\ãÔ©SG\0`à´µµu–/¼3‡}=<Ï«˜¹v(ž†ŽÇŠ™k\ã\0Y\ãqf¹	‰µªq¢Y\ìº\Ð\Û\Ý\â²ò\Z×ˆ¬Yš\ã\Ý\Åx\0ž”b\æ0‹®\Ê\Æ&ö%Ž‹\Äl`q¸>»\Çñ\â¢iÔ¨Q\Û42[/}}¦w•FŒÇ‘#G\Z\0@sØºvuEsRm¬µ\Æ\ã\0 ¤­­\í\Ä>46kc–\Ð\î\0\0=ˆ+ìµ··_œ5*Ë²x¼¢ÙœÅŠ¸Ü´+\âa<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04¿ÿ<nþx.\ÃRb\0\0\0\0IEND®B`‚',1);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','75001',31),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_ACTINST` VALUES ('10003','test_process:3:7504','7521','7525','sid-CEC87C93-A533-432B-98EB-83A08858B6A2',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2020-12-01 20:42:44.237','2020-12-01 20:42:44.237',0,NULL,''),('10004','test_process:3:7504','7521','10002','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,NULL,'endEvent',NULL,'2020-12-01 20:42:44.237','2020-12-01 20:42:44.238',1,NULL,''),('10010','test_process:3:7504','10005','10009','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:45:28.479','2020-12-01 20:45:28.479',0,NULL,''),('10011','test_process:3:7504','10005','10009','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','10012',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:45:28.479','2020-12-01 20:51:23.617',355138,NULL,''),('10013','test_process:3:7504','10005','10009','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-01 20:51:23.618','2020-12-01 20:51:23.619',1,NULL,''),('10014','test_process:3:7504','10005','10009','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','10015',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask',NULL,'2020-12-01 20:51:23.621',NULL,NULL,NULL,''),('12506','test_process:3:7504','12501','12505','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:54:41.974','2020-12-01 20:54:41.977',3,NULL,''),('12507','test_process:3:7504','12501','12505','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','12508',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:54:41.981','2020-12-01 20:55:26.814',44833,NULL,''),('12510','test_process:3:7504','12501','12505','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-01 20:55:26.815','2020-12-01 20:55:26.815',0,NULL,''),('12511','test_process:3:7504','12501','12505','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','12512',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask',NULL,'2020-12-01 20:55:26.819','2020-12-01 20:56:10.690',43871,NULL,''),('12514','test_process:3:7504','12501','12505','sid-CEC87C93-A533-432B-98EB-83A08858B6A2',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2020-12-01 20:56:10.692','2020-12-01 20:56:10.693',1,NULL,''),('12515','test_process:3:7504','12501','12513','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,NULL,'endEvent',NULL,'2020-12-01 20:56:10.692','2020-12-01 20:56:10.694',2,NULL,''),('12521','test_process:3:7504','12516','12520','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:58:30.938','2020-12-01 20:58:30.939',1,NULL,''),('12522','test_process:3:7504','12516','12520','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','12523',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:58:30.940','2020-12-01 21:03:09.747',278807,NULL,''),('12525','test_process:3:7504','12516','12520','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-01 21:03:09.748','2020-12-01 21:03:09.748',0,NULL,''),('12526','test_process:3:7504','12516','12520','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','12527',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask',NULL,'2020-12-01 21:03:09.749',NULL,NULL,NULL,''),('17511','test_process:4:17504','17505','17510','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 11:19:32.289','2020-12-02 11:19:32.303',14,NULL,''),('17512','test_process:4:17504','17505','17510','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','17513',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 11:19:32.328','2020-12-02 11:19:45.203',12875,NULL,''),('17514','test_process:4:17504','17505','17510','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','17515',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 11:19:45.203','2020-12-02 11:21:48.075',122872,NULL,''),('17516','test_process:4:17504','17505','17510','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 11:21:48.075','2020-12-02 11:21:48.094',19,NULL,''),('17517','test_process:4:17504','17505','17510','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','17518',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask','2','2020-12-02 11:21:48.095','2020-12-02 11:22:38.771',50676,NULL,''),('17520','test_process:4:17504','17505','17510','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,NULL,'endEvent',NULL,'2020-12-02 11:22:38.771','2020-12-02 11:22:38.771',0,NULL,''),('20007','test_process:4:17504','20001','20006','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 11:27:30.843','2020-12-02 11:27:30.846',3,NULL,''),('20008','test_process:4:17504','20001','20006','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','20009',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 11:27:30.851','2020-12-02 11:27:55.019',24168,NULL,''),('20010','test_process:4:17504','20001','20006','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','20011',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 11:27:55.020','2020-12-02 11:28:37.099',42079,NULL,''),('20012','test_process:4:17504','20001','20006','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 11:28:37.100','2020-12-02 11:28:37.136',36,NULL,''),('20013','test_process:4:17504','20001','20006','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','20014',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask','2','2020-12-02 11:28:37.138','2020-12-02 16:21:16.373',17559235,NULL,''),('22507','test_process:4:17504','22501','22506','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 13:55:12.257','2020-12-02 13:55:12.262',5,NULL,''),('22508','test_process:4:17504','22501','22506','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','22509',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 13:55:12.268','2020-12-02 13:55:16.145',3877,NULL,''),('22510','test_process:4:17504','22501','22506','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','22511',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 13:55:16.146','2020-12-02 13:55:45.190',29044,NULL,''),('22512','test_process:4:17504','22501','22506','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 13:55:45.191','2020-12-02 13:55:45.240',49,NULL,''),('22513','test_process:4:17504','22501','22506','sid-976F7F72-C689-48FE-997A-D82A66F57287',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2020-12-02 13:55:45.245','2020-12-02 13:55:45.245',0,NULL,''),('25014','test_process:5:25007','25008','25013','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:13:28.447','2020-12-02 16:13:28.460',13,NULL,''),('25015','test_process:5:25007','25008','25013','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','25016',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:13:28.469','2020-12-02 16:13:30.623',2154,NULL,''),('25018','test_process:5:25007','25008','25013','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','25019',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:13:30.623',NULL,NULL,NULL,''),('27507','test_process:5:25007','27501','27506','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:15:37.983','2020-12-02 16:15:37.986',3,NULL,''),('27508','test_process:5:25007','27501','27506','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','27509',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:15:37.990','2020-12-02 16:20:41.179',303189,NULL,''),('27511','test_process:5:25007','27501','27506','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','27512',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:20:41.179',NULL,NULL,NULL,''),('27513','test_process:4:17504','20001','20006','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,NULL,'endEvent',NULL,'2020-12-02 16:21:16.433','2020-12-02 16:21:16.433',0,NULL,''),('27520','test_process:5:25007','27514','27519','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:21:48.105','2020-12-02 16:21:48.105',0,NULL,''),('27521','test_process:5:25007','27514','27519','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','27522',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:21:48.105','2020-12-02 16:21:50.451',2346,NULL,''),('27524','test_process:5:25007','27514','27519','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','27525',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:21:50.451',NULL,NULL,NULL,''),('27532','test_process:5:25007','27526','27531','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:22:53.616','2020-12-02 16:22:53.616',0,NULL,''),('27533','test_process:5:25007','27526','27531','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','27534',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:22:53.616','2020-12-02 16:22:54.964',1348,NULL,''),('27536','test_process:5:25007','27526','27531','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','27537',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:22:54.964','2020-12-02 16:26:43.912',228948,NULL,''),('27538','test_process:5:25007','27526','27531','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 16:26:43.912','2020-12-02 16:26:43.912',0,NULL,''),('27539','test_process:5:25007','27526','27531','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','27540',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask','2','2020-12-02 16:26:43.914',NULL,NULL,NULL,''),('30007','test_process:5:25007','30001','30006','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:27:36.606','2020-12-02 16:27:36.610',4,NULL,''),('30008','test_process:5:25007','30001','30006','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','30009',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:27:36.613','2020-12-02 16:31:12.232',215619,NULL,''),('30011','test_process:5:25007','30001','30006','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','30012',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','2','2020-12-02 16:31:12.233','2020-12-02 16:45:19.326',847093,NULL,''),('32507','test_process:5:25007','32501','32506','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:41:49.284','2020-12-02 16:41:49.288',4,NULL,''),('32508','test_process:5:25007','32501','32506','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','32509',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:41:49.294','2020-12-02 16:42:09.051',19757,NULL,''),('32511','test_process:5:25007','32501','32506','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','32512',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:42:09.052',NULL,NULL,NULL,''),('35008','test_process:5:25007','35001','35007','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:44:57.016','2020-12-02 16:44:57.021',5,NULL,''),('35009','test_process:5:25007','35001','35007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','35010',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:44:57.034','2020-12-02 16:44:57.395',361,NULL,''),('35012','test_process:5:25007','35001','35007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','35013',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:44:57.395','2020-12-02 16:46:38.720',101325,NULL,''),('35014','test_process:5:25007','30001','30006','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 16:45:19.327','2020-12-02 16:45:19.367',40,NULL,''),('35015','test_process:5:25007','30001','30006','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','35016',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask','2','2020-12-02 16:45:19.371',NULL,NULL,NULL,''),('35017','test_process:5:25007','35001','35007','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 16:46:38.720','2020-12-02 16:46:38.721',1,NULL,''),('35018','test_process:5:25007','35001','35007','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','35019',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask','2','2020-12-02 16:46:38.722',NULL,NULL,NULL,''),('37509','test_process:5:25007','37501','37508','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:49:05.494','2020-12-02 16:49:05.498',4,NULL,''),('37510','test_process:5:25007','37501','37508','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','37511',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:49:05.503','2020-12-02 16:49:07.323',1820,NULL,''),('37513','test_process:5:25007','37501','37508','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','37514',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 16:49:07.326','2020-12-02 16:58:19.067',551741,NULL,''),('37515','test_process:5:25007','37501','37508','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-02 16:58:19.071','2020-12-02 16:58:19.229',158,NULL,''),('37516','test_process:5:25007','37501','37508','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','37517',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask','2','2020-12-02 16:58:19.232',NULL,NULL,NULL,''),('40010','test_process:5:25007','40001','40009','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 16:59:52.987','2020-12-02 16:59:52.990',3,NULL,''),('40011','test_process:5:25007','40001','40009','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','40012',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 16:59:52.994','2020-12-02 17:00:08.116',15122,NULL,''),('40014','test_process:5:25007','40001','40009','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','40015',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 17:00:08.116',NULL,NULL,NULL,''),('40025','test_process:5:25007','40016','40024','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 17:00:26.530','2020-12-02 17:00:26.530',0,NULL,''),('40026','test_process:5:25007','40016','40024','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','40027',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 17:00:26.531','2020-12-02 17:04:31.378',244847,NULL,''),('40029','test_process:5:25007','40016','40024','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','40030',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 17:04:31.379',NULL,NULL,NULL,''),('42507','test_process:5:25007','42501','42506','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 17:06:57.018','2020-12-02 17:06:57.021',3,NULL,''),('42508','test_process:5:25007','42501','42506','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','42509',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 17:06:57.025','2020-12-02 17:10:13.173',196148,NULL,''),('42511','test_process:5:25007','42501','42506','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','42512',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 17:10:13.174',NULL,NULL,NULL,''),('45006','test_process:5:25007','45001','45005','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 17:10:57.764','2020-12-02 17:10:57.769',5,NULL,''),('45007','test_process:5:25007','45001','45005','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','45008',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 17:10:57.774','2020-12-02 17:12:46.371',108597,NULL,''),('45010','test_process:5:25007','45001','45005','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','45011',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 17:12:46.372',NULL,NULL,NULL,''),('47510','test_process:6:47504','47505','47509','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 20:42:01.650','2020-12-02 20:42:01.659',9,NULL,''),('47511','test_process:6:47504','47505','47509','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','47512',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 20:42:01.665','2020-12-02 20:42:53.912',52247,NULL,''),('47514','test_process:6:47504','47505','47509','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','47515',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 20:42:53.913',NULL,NULL,NULL,''),('47521','test_process:6:47504','47516','47520','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 20:44:08.120','2020-12-02 20:44:08.120',0,NULL,''),('47522','test_process:6:47504','47516','47520','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','47523',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 20:44:08.120','2020-12-02 20:46:42.966',154846,NULL,''),('47525','test_process:6:47504','47516','47520','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','47526',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 20:46:42.966',NULL,NULL,NULL,''),('50006','test_process:6:47504','50001','50005','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 20:52:03.552','2020-12-02 20:52:03.556',4,NULL,''),('50007','test_process:6:47504','50001','50005','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','50008',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 20:52:03.563','2020-12-02 20:57:25.667',322104,NULL,''),('50010','test_process:6:47504','50001','50005','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','50011',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 20:57:25.668',NULL,NULL,NULL,''),('5007','test_process:1:5004','5005','5006','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:25:21.985','2020-12-01 20:25:21.990',5,NULL,''),('5008','test_process:1:5004','5005','5006','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','5009',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:25:21.995',NULL,NULL,NULL,''),('5016','test_process:2:5013','5014','5015','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:25:50.687','2020-12-01 20:25:50.687',0,NULL,''),('5017','test_process:2:5013','5014','5015','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','5018',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:25:50.687',NULL,NULL,NULL,''),('5021','test_process:2:5013','5019','5020','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:26:08.792','2020-12-01 20:26:08.793',1,NULL,''),('5022','test_process:2:5013','5019','5020','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','5023',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:26:08.793',NULL,NULL,NULL,''),('52506','test_process:6:47504','52501','52505','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 21:12:47.789','2020-12-02 21:12:47.792',3,NULL,''),('52507','test_process:6:47504','52501','52505','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','52508',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 21:12:47.796',NULL,NULL,NULL,''),('52515','test_process:6:47504','52510','52514','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 21:14:26.668','2020-12-02 21:14:26.669',1,NULL,''),('52516','test_process:6:47504','52510','52514','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','52517',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 21:14:26.671',NULL,NULL,NULL,''),('55006','test_process:6:47504','55001','55005','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 21:16:36.067','2020-12-02 21:16:36.275',208,NULL,''),('55007','test_process:6:47504','55001','55005','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','55008',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 21:16:36.279','2020-12-02 21:19:11.412',155133,NULL,''),('55010','test_process:6:47504','55001','55005','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','55011',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 21:19:11.413',NULL,NULL,NULL,''),('55017','test_process:6:47504','55012','55016','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 21:20:41.501','2020-12-02 21:20:41.501',0,NULL,''),('55018','test_process:6:47504','55012','55016','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','55019',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 21:20:41.501','2020-12-02 21:28:00.747',439246,NULL,''),('55021','test_process:6:47504','55012','55016','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','55022',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 21:28:00.747',NULL,NULL,NULL,''),('57506','test_process:6:47504','57501','57505','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 21:28:59.349','2020-12-02 21:28:59.353',4,NULL,''),('57507','test_process:6:47504','57501','57505','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','57508',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 21:28:59.360','2020-12-02 21:29:26.415',27055,NULL,''),('57510','test_process:6:47504','57501','57505','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','57511',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 21:29:26.415',NULL,NULL,NULL,''),('60006','test_process:6:47504','60001','60005','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-02 21:31:32.832','2020-12-02 21:31:32.840',8,NULL,''),('60007','test_process:6:47504','60001','60005','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','60008',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-02 21:31:32.846','2020-12-02 21:36:16.541',283695,NULL,''),('60010','test_process:6:47504','60001','60005','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','60011',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-02 21:36:16.542',NULL,NULL,NULL,''),('65006','test_process:6:47504','65001','65005','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-03 15:59:12.536','2020-12-03 15:59:12.543',7,NULL,''),('65007','test_process:6:47504','65001','65005','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','65008',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-03 15:59:12.549','2020-12-03 16:01:34.472',141923,NULL,''),('65010','test_process:6:47504','65001','65005','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','65011',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-03 16:01:34.472',NULL,NULL,NULL,''),('67506','test_process:6:47504','67501','67505','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-03 16:02:37.803','2020-12-03 16:02:37.807',4,NULL,''),('67507','test_process:6:47504','67501','67505','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','67508',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-03 16:02:37.811','2020-12-03 16:02:50.623',12812,NULL,''),('67510','test_process:6:47504','67501','67505','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','67511',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-03 16:02:50.623',NULL,NULL,NULL,''),('67521','test_process:7:67515','67516','67520','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-03 16:03:53.051','2020-12-03 16:03:53.051',0,NULL,''),('67522','test_process:7:67515','67516','67520','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','67523',NULL,'æäº¤ç”³è¯·','userTask','1','2020-12-03 16:03:53.052','2020-12-03 16:03:58.657',5605,NULL,''),('67525','test_process:7:67515','67516','67520','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','67526',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','1','2020-12-03 16:03:58.658',NULL,NULL,NULL,''),('7507','test_process:3:7504','7505','7506','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:28:23.421','2020-12-01 20:28:23.428',7,NULL,''),('7508','test_process:3:7504','7505','7506','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7509',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:28:23.431',NULL,NULL,NULL,''),('7515','test_process:3:7504','7510','7514','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:28:42.362','2020-12-01 20:28:42.362',0,NULL,''),('7516','test_process:3:7504','7510','7514','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7517',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:28:42.363','2020-12-01 20:28:52.451',10088,NULL,''),('7518','test_process:3:7504','7510','7514','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-01 20:28:52.451','2020-12-01 20:28:52.452',1,NULL,''),('7519','test_process:3:7504','7510','7514','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','7520',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask',NULL,'2020-12-01 20:28:52.453',NULL,NULL,NULL,''),('7526','test_process:3:7504','7521','7525','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:30:03.368','2020-12-01 20:30:03.368',0,NULL,''),('7527','test_process:3:7504','7521','7525','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7528',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:30:03.368','2020-12-01 20:30:25.352',21984,NULL,''),('7529','test_process:3:7504','7521','7525','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-01 20:30:25.352','2020-12-01 20:30:25.352',0,NULL,''),('7530','test_process:3:7504','7521','7525','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','7531',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask',NULL,'2020-12-01 20:30:25.353','2020-12-01 20:42:44.227',738874,NULL,''),('7537','test_process:3:7504','7532','7536','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2020-12-01 20:30:55.430','2020-12-01 20:30:55.430',0,NULL,''),('7538','test_process:3:7504','7532','7536','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7539',NULL,'ä¸»ç®¡å®¡æ ¸','userTask',NULL,'2020-12-01 20:30:55.430','2020-12-01 20:31:10.656',15226,NULL,''),('7540','test_process:3:7504','7532','7536','sid-8386BDEE-0525-47D3-B158-2802DED1BAB3',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-12-01 20:31:10.656','2020-12-01 20:31:10.657',1,NULL,''),('7541','test_process:3:7504','7532','7536','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','7542',NULL,'ä¸šåŠ¡ç»ç†å®¡æ ¸','userTask',NULL,'2020-12-01 20:31:10.662',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('10006',NULL,'starter','1',NULL,'10005'),('12502',NULL,'starter','1',NULL,'12501'),('12517',NULL,'starter','1',NULL,'12516'),('17506',NULL,'starter','1',NULL,'17505'),('17519',NULL,'participant','2',NULL,'17505'),('20002',NULL,'starter','1',NULL,'20001'),('20015',NULL,'participant','2',NULL,'20001'),('22502',NULL,'starter','1',NULL,'22501'),('25009',NULL,'starter','1',NULL,'25008'),('25017','canWrite','candidate',NULL,'25016',NULL),('27502',NULL,'starter','1',NULL,'27501'),('27510','canWrite','candidate',NULL,'27509',NULL),('27515',NULL,'starter','1',NULL,'27514'),('27523','canWrite','candidate',NULL,'27522',NULL),('27527',NULL,'starter','1',NULL,'27526'),('27535','canWrite','candidate',NULL,'27534',NULL),('27541',NULL,'participant','2',NULL,'27526'),('30002',NULL,'starter','1',NULL,'30001'),('30010','canWrite','candidate',NULL,'30009',NULL),('30013',NULL,'participant','2',NULL,'30001'),('32502',NULL,'starter','1',NULL,'32501'),('32510','canWrite','candidate',NULL,'32509',NULL),('35002',NULL,'starter','1',NULL,'35001'),('35011','canWrite','candidate',NULL,'35010',NULL),('35020',NULL,'participant','2',NULL,'35001'),('37502',NULL,'starter','1',NULL,'37501'),('37512','canWrite','candidate',NULL,'37511',NULL),('37518',NULL,'participant','2',NULL,'37501'),('40002',NULL,'starter','1',NULL,'40001'),('40013','canWrite','candidate',NULL,'40012',NULL),('40017',NULL,'starter','1',NULL,'40016'),('40028','canWrite','candidate',NULL,'40027',NULL),('42502',NULL,'starter','1',NULL,'42501'),('42510','canWrite','candidate',NULL,'42509',NULL),('45002',NULL,'starter','1',NULL,'45001'),('45009','canWrite','candidate',NULL,'45008',NULL),('47506',NULL,'starter','1',NULL,'47505'),('47513','canWrite','candidate',NULL,'47512',NULL),('47517',NULL,'starter','1',NULL,'47516'),('47524','canWrite','candidate',NULL,'47523',NULL),('50002',NULL,'starter','1',NULL,'50001'),('50009','canWrite','candidate',NULL,'50008',NULL),('52502',NULL,'starter','1',NULL,'52501'),('52509','canWrite','candidate',NULL,'52508',NULL),('52511',NULL,'starter','1',NULL,'52510'),('52518','canWrite','candidate',NULL,'52517',NULL),('55002',NULL,'starter','1',NULL,'55001'),('55009','canWrite','candidate',NULL,'55008',NULL),('55013',NULL,'starter','1',NULL,'55012'),('55020','canWrite','candidate',NULL,'55019',NULL),('57502',NULL,'starter','1',NULL,'57501'),('57509','canWrite','candidate',NULL,'57508',NULL),('60002',NULL,'starter','1',NULL,'60001'),('60009','canWrite','candidate',NULL,'60008',NULL),('65002',NULL,'starter','1',NULL,'65001'),('65009','canWrite','candidate',NULL,'65008',NULL),('67502',NULL,'starter','1',NULL,'67501'),('67509','canWrite','candidate',NULL,'67508',NULL),('67517',NULL,'starter','1',NULL,'67516'),('67524','canWrite','candidate',NULL,'67523',NULL),('67527','canAudit','candidate',NULL,'67526',NULL),('7511',NULL,'starter','1',NULL,'7510'),('7522',NULL,'starter','1',NULL,'7521'),('7533',NULL,'starter','1',NULL,'7532');
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_PROCINST` VALUES ('10005','10005','014d3072d5f829e5f2fd1ac93d0d1273','test_process:3:7504','2020-12-01 20:45:28.475',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('12501','12501','c4f2add045fe356d332f21b63211dcc2','test_process:3:7504','2020-12-01 20:54:41.919','2020-12-01 20:56:10.729',88810,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,'',NULL),('12516','12516','4d359e356d81d0ad1d3c324e2c936efe','test_process:3:7504','2020-12-01 20:58:30.935',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('17505','17505','a036bfe7aa273216f4b57a66f08f415f','test_process:4:17504','2020-12-02 11:19:32.264','2020-12-02 11:22:38.844',186580,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,'',NULL),('20001','20001','568a953af383ac92b551fc55f213c0a9','test_process:4:17504','2020-12-02 11:27:30.806','2020-12-02 16:21:16.495',17625689,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,'',NULL),('22501','22501','9c02bd016bd330c9489f4d1ba1416338','test_process:4:17504','2020-12-02 13:55:12.210','2020-12-02 13:55:45.286',33076,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D','sid-976F7F72-C689-48FE-997A-D82A66F57287',NULL,NULL,'',NULL),('25008','25008','b2d1e100b27b802bfa5a7a144c158a51','test_process:5:25007','2020-12-02 16:13:28.393',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('27501','27501','58fa1e9046eaa03413a2cc5c73dc7ac6','test_process:5:25007','2020-12-02 16:15:37.944',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('27514','27514','e48aeaacb0ec55089b5016575cdfa667','test_process:5:25007','2020-12-02 16:21:48.104',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('27526','27526','226e00b73812e4f729bb12d32493761e','test_process:5:25007','2020-12-02 16:22:53.615',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('30001','30001','c2818efa9d662db5c77524617891c0bb','test_process:5:25007','2020-12-02 16:27:36.576',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('32501','32501','1c4d03b58ec73e4860d75b825c8e1787','test_process:5:25007','2020-12-02 16:41:49.240',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('35001','35001','183f5b9c907b96b81bdd80b0ffe27216','test_process:5:25007','2020-12-02 16:44:56.980',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('37501','37501','75dcbeea6db256d863c32729004a38c9','test_process:5:25007','2020-12-02 16:49:05.458',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('40001','40001','a2cf20fa937250b7064cf9ebc5df79d9','test_process:5:25007','2020-12-02 16:59:52.956',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('40016','40016','9c39aa72a2eacb6020935f1bc54cd686','test_process:5:25007','2020-12-02 17:00:26.527',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('42501','42501','c8ea7f8cce31e496d4cf3520819273ad','test_process:5:25007','2020-12-02 17:06:56.981',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('45001','45001','b91944338b39fdce25040b00cb5d49d3','test_process:5:25007','2020-12-02 17:10:57.730',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('47505','47505','4e9d3445d95885c11eec144cf5331a95','test_process:6:47504','2020-12-02 20:42:01.622',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('47516','47516','11073d32d59823ff45f731d7c7f91ab9','test_process:6:47504','2020-12-02 20:44:08.119',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('50001','50001','1d57cd183a21bff9c8a1bc77ca13ed29','test_process:6:47504','2020-12-02 20:52:03.505',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('5005','5005',NULL,'test_process:1:5004','2020-12-01 20:25:21.975',NULL,NULL,NULL,'sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('5014','5014',NULL,'test_process:2:5013','2020-12-01 20:25:50.686',NULL,NULL,NULL,'sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('5019','5019',NULL,'test_process:2:5013','2020-12-01 20:26:08.792',NULL,NULL,NULL,'sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('52501','52501','02c85dad39042bf60c1bd52b01748a19','test_process:6:47504','2020-12-02 21:12:47.754',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('52510','52510','0a40c751656999b99818a98f0ac06210','test_process:6:47504','2020-12-02 21:14:26.664',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('55001','55001','5d3b16edbd3205abcb53ec500092c5b8','test_process:6:47504','2020-12-02 21:16:36.031',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('55012','55012','fdd9c50e32fb9d184306725947f51873','test_process:6:47504','2020-12-02 21:20:41.500',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('57501','57501','d4f3ae746ea2e5e55b4b57b3fc1a2828','test_process:6:47504','2020-12-02 21:28:59.314',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('60001','60001','458047a930813790c45cd01722d03a91','test_process:6:47504','2020-12-02 21:31:32.782',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('65001','65001','362272967fbbe47a245e4bfac24588ab','test_process:6:47504','2020-12-03 15:59:12.497',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('67501','67501','f9439493caf3c71929df562d1cad32a0','test_process:6:47504','2020-12-03 16:02:37.762',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('67516','67516','bd6a2165d6ed47843a2f01d1a2213f22','test_process:7:67515','2020-12-03 16:03:53.050',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('7505','7505',NULL,'test_process:3:7504','2020-12-01 20:28:23.399',NULL,NULL,NULL,'sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('7510','7510','e013785e3e0fb298a6964b709aa651ed','test_process:3:7504','2020-12-01 20:28:42.344',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL),('7521','7521','7f6d4169984292d63b9adf01422a3888','test_process:3:7504','2020-12-01 20:30:03.365','2020-12-01 20:42:44.282',760917,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D','sid-24B3E94A-0EFA-41BA-B183-FE587581347D',NULL,NULL,'',NULL),('7532','7532','9bff7ec6e5d8c003824189843ed40e14','test_process:3:7504','2020-12-01 20:30:55.429',NULL,NULL,'1','sid-C22099DF-84B3-429E-9673-3466EEAF0B0D',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_TASKINST` VALUES ('10012','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','10005','10009','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:45:28.513',NULL,'2020-12-01 20:51:23.612',355099,NULL,50,NULL,NULL,NULL,''),('10015','test_process:3:7504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','10005','10009','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:51:23.622',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','12501','12505','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:54:42.009',NULL,'2020-12-01 20:55:26.803',44794,NULL,50,NULL,NULL,NULL,''),('12512','test_process:3:7504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','12501','12505','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:55:26.821',NULL,'2020-12-01 20:56:10.684',43863,NULL,50,NULL,NULL,NULL,''),('12523','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','12516','12520','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:58:30.941',NULL,'2020-12-01 21:03:09.744',278803,NULL,50,NULL,NULL,NULL,''),('12527','test_process:3:7504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','12516','12520','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 21:03:09.749',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17513','test_process:4:17504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','17505','17510','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 11:19:32.490',NULL,'2020-12-02 11:19:45.193',12703,NULL,50,NULL,'a036bfe7aa273216f4b57a66f08f415f',NULL,''),('17515','test_process:4:17504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','17505','17510','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 11:19:45.205',NULL,'2020-12-02 11:21:48.066',122861,NULL,50,NULL,'a036bfe7aa273216f4b57a66f08f415f',NULL,''),('17518','test_process:4:17504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','17505','17510','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 11:21:48.096',NULL,'2020-12-02 11:22:38.764',50668,NULL,50,NULL,'a036bfe7aa273216f4b57a66f08f415f',NULL,''),('20009','test_process:4:17504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','20001','20006','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 11:27:30.889',NULL,'2020-12-02 11:27:55.012',24123,NULL,50,NULL,'568a953af383ac92b551fc55f213c0a9',NULL,''),('20011','test_process:4:17504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','20001','20006','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 11:27:55.020',NULL,'2020-12-02 11:28:37.091',42071,NULL,50,NULL,'568a953af383ac92b551fc55f213c0a9',NULL,''),('20014','test_process:4:17504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','20001','20006','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 11:28:37.138',NULL,'2020-12-02 16:21:16.365',17559227,NULL,50,NULL,'568a953af383ac92b551fc55f213c0a9',NULL,''),('22509','test_process:4:17504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','22501','22506','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 13:55:12.307',NULL,'2020-12-02 13:55:16.140',3833,NULL,50,NULL,'9c02bd016bd330c9489f4d1ba1416338',NULL,''),('22511','test_process:4:17504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','22501','22506','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 13:55:16.146',NULL,'2020-12-02 13:55:45.185',29039,NULL,50,NULL,'9c02bd016bd330c9489f4d1ba1416338',NULL,''),('25016','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','25008','25013','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:13:28.512',NULL,'2020-12-02 16:13:30.618',2106,NULL,50,NULL,'b2d1e100b27b802bfa5a7a144c158a51',NULL,''),('25019','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','25008','25013','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:13:30.623',NULL,NULL,NULL,NULL,50,NULL,'b2d1e100b27b802bfa5a7a144c158a51',NULL,''),('27509','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','27501','27506','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:15:38.024',NULL,'2020-12-02 16:20:41.164',303140,NULL,50,NULL,'58fa1e9046eaa03413a2cc5c73dc7ac6',NULL,''),('27512','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','27501','27506','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:20:41.180',NULL,NULL,NULL,NULL,50,NULL,'58fa1e9046eaa03413a2cc5c73dc7ac6',NULL,''),('27522','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','27514','27519','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:21:48.106',NULL,'2020-12-02 16:21:50.441',2335,NULL,50,NULL,'e48aeaacb0ec55089b5016575cdfa667',NULL,''),('27525','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','27514','27519','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:21:50.453',NULL,NULL,NULL,NULL,50,NULL,'e48aeaacb0ec55089b5016575cdfa667',NULL,''),('27534','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','27526','27531','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:22:53.616',NULL,'2020-12-02 16:22:54.939',1323,NULL,50,NULL,'226e00b73812e4f729bb12d32493761e',NULL,''),('27537','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','27526','27531','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:22:54.965',NULL,'2020-12-02 16:26:43.908',228943,NULL,50,NULL,'226e00b73812e4f729bb12d32493761e',NULL,''),('27540','test_process:5:25007','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','27526','27531','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 16:26:43.914',NULL,NULL,NULL,NULL,50,NULL,'226e00b73812e4f729bb12d32493761e',NULL,''),('30009','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','30001','30006','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:27:36.643',NULL,'2020-12-02 16:31:12.087',215444,NULL,50,NULL,'c2818efa9d662db5c77524617891c0bb',NULL,''),('30012','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','30001','30006','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 16:31:12.234',NULL,'2020-12-02 16:45:19.317',847083,NULL,50,NULL,'c2818efa9d662db5c77524617891c0bb',NULL,''),('32509','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','32501','32506','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:41:49.520',NULL,'2020-12-02 16:42:09.043',19523,NULL,50,NULL,'1c4d03b58ec73e4860d75b825c8e1787',NULL,''),('32512','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','32501','32506','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:42:09.052',NULL,NULL,NULL,NULL,50,NULL,'1c4d03b58ec73e4860d75b825c8e1787',NULL,''),('35010','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','35001','35007','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:44:57.075',NULL,'2020-12-02 16:44:57.390',315,NULL,50,NULL,'183f5b9c907b96b81bdd80b0ffe27216',NULL,''),('35013','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','35001','35007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:44:57.396',NULL,'2020-12-02 16:46:38.711',101315,NULL,50,NULL,'183f5b9c907b96b81bdd80b0ffe27216',NULL,''),('35016','test_process:5:25007','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','30001','30006','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 16:45:19.372',NULL,NULL,NULL,NULL,50,NULL,'c2818efa9d662db5c77524617891c0bb',NULL,''),('35019','test_process:5:25007','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','35001','35007','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 16:46:38.722',NULL,NULL,NULL,NULL,50,NULL,'183f5b9c907b96b81bdd80b0ffe27216',NULL,''),('37511','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','37501','37508','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:49:05.540',NULL,'2020-12-02 16:49:07.309',1769,NULL,50,NULL,'75dcbeea6db256d863c32729004a38c9',NULL,''),('37514','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','37501','37508','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 16:49:07.327',NULL,'2020-12-02 16:58:19.061',551734,NULL,50,NULL,'75dcbeea6db256d863c32729004a38c9',NULL,''),('37517','test_process:5:25007','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','37501','37508','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,'2','2020-12-02 16:58:19.232',NULL,NULL,NULL,NULL,50,NULL,'75dcbeea6db256d863c32729004a38c9',NULL,''),('40012','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','40001','40009','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 16:59:53.024',NULL,'2020-12-02 17:00:08.111',15087,NULL,50,NULL,'a2cf20fa937250b7064cf9ebc5df79d9',NULL,''),('40015','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','40001','40009','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 17:00:08.116',NULL,NULL,NULL,NULL,50,NULL,'a2cf20fa937250b7064cf9ebc5df79d9',NULL,''),('40027','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','40016','40024','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 17:00:26.531',NULL,'2020-12-02 17:04:31.373',244842,NULL,50,NULL,'9c39aa72a2eacb6020935f1bc54cd686',NULL,''),('40030','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','40016','40024','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 17:04:31.379',NULL,NULL,NULL,NULL,50,NULL,'9c39aa72a2eacb6020935f1bc54cd686',NULL,''),('42509','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','42501','42506','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 17:06:57.075',NULL,'2020-12-02 17:10:13.165',196090,NULL,50,NULL,'c8ea7f8cce31e496d4cf3520819273ad',NULL,''),('42512','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','42501','42506','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 17:10:13.175',NULL,NULL,NULL,NULL,50,NULL,'c8ea7f8cce31e496d4cf3520819273ad',NULL,''),('45008','test_process:5:25007','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','45001','45005','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 17:10:57.811',NULL,'2020-12-02 17:12:46.366',108555,NULL,50,NULL,'b91944338b39fdce25040b00cb5d49d3',NULL,''),('45011','test_process:5:25007','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','45001','45005','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 17:12:46.372',NULL,NULL,NULL,NULL,50,NULL,'b91944338b39fdce25040b00cb5d49d3',NULL,''),('47512','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','47505','47509','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 20:42:01.716',NULL,'2020-12-02 20:42:53.894',52178,NULL,50,NULL,'4e9d3445d95885c11eec144cf5331a95',NULL,''),('47515','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','47505','47509','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 20:42:53.914',NULL,NULL,NULL,NULL,50,NULL,'4e9d3445d95885c11eec144cf5331a95',NULL,''),('47523','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','47516','47520','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 20:44:08.120',NULL,'2020-12-02 20:46:42.962',154842,NULL,50,NULL,'11073d32d59823ff45f731d7c7f91ab9',NULL,''),('47526','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','47516','47520','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 20:46:42.966',NULL,NULL,NULL,NULL,50,NULL,'11073d32d59823ff45f731d7c7f91ab9',NULL,''),('50008','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','50001','50005','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 20:52:03.600',NULL,'2020-12-02 20:57:25.662',322062,NULL,50,NULL,'1d57cd183a21bff9c8a1bc77ca13ed29',NULL,''),('50011','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','50001','50005','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 20:57:25.668',NULL,NULL,NULL,NULL,50,NULL,'1d57cd183a21bff9c8a1bc77ca13ed29',NULL,''),('5009','test_process:1:5004','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','5005','5006','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:25:22.037',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5018','test_process:2:5013','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','5014','5015','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:25:50.687',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('5023','test_process:2:5013','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','5019','5020','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:26:08.794',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('52508','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','52501','52505','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 21:12:47.828',NULL,NULL,NULL,NULL,50,NULL,'02c85dad39042bf60c1bd52b01748a19',NULL,''),('52517','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','52510','52514','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 21:14:26.673',NULL,NULL,NULL,NULL,50,NULL,'0a40c751656999b99818a98f0ac06210',NULL,''),('55008','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','55001','55005','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 21:16:36.314',NULL,'2020-12-02 21:19:11.362',155048,NULL,50,NULL,'5d3b16edbd3205abcb53ec500092c5b8',NULL,''),('55011','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','55001','55005','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 21:19:11.415',NULL,NULL,NULL,NULL,50,NULL,'5d3b16edbd3205abcb53ec500092c5b8',NULL,''),('55019','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','55012','55016','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 21:20:41.501',NULL,'2020-12-02 21:28:00.736',439235,NULL,50,NULL,'fdd9c50e32fb9d184306725947f51873',NULL,''),('55022','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','55012','55016','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 21:28:00.748',NULL,NULL,NULL,NULL,50,NULL,'fdd9c50e32fb9d184306725947f51873',NULL,''),('57508','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','57501','57505','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 21:28:59.419',NULL,'2020-12-02 21:29:26.410',26991,NULL,50,NULL,'d4f3ae746ea2e5e55b4b57b3fc1a2828',NULL,''),('57511','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','57501','57505','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 21:29:26.415',NULL,NULL,NULL,NULL,50,NULL,'d4f3ae746ea2e5e55b4b57b3fc1a2828',NULL,''),('60008','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','60001','60005','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-02 21:31:32.876',NULL,'2020-12-02 21:36:16.533',283657,NULL,50,NULL,'458047a930813790c45cd01722d03a91',NULL,''),('60011','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','60001','60005','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-02 21:36:16.543',NULL,NULL,NULL,NULL,50,NULL,'458047a930813790c45cd01722d03a91',NULL,''),('65008','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','65001','65005','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-03 15:59:12.604',NULL,'2020-12-03 16:01:34.467',141863,NULL,50,NULL,'362272967fbbe47a245e4bfac24588ab',NULL,''),('65011','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','65001','65005','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-03 16:01:34.473',NULL,NULL,NULL,NULL,50,NULL,'362272967fbbe47a245e4bfac24588ab',NULL,''),('67508','test_process:6:47504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','67501','67505','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-03 16:02:37.859',NULL,'2020-12-03 16:02:50.617',12758,NULL,50,NULL,'f9439493caf3c71929df562d1cad32a0',NULL,''),('67511','test_process:6:47504','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','67501','67505','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-03 16:02:50.624',NULL,NULL,NULL,NULL,50,NULL,'f9439493caf3c71929df562d1cad32a0',NULL,''),('67523','test_process:7:67515','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','67516','67520','æäº¤ç”³è¯·',NULL,NULL,NULL,'1','2020-12-03 16:03:53.055',NULL,'2020-12-03 16:03:58.649',5594,NULL,50,NULL,'bd6a2165d6ed47843a2f01d1a2213f22',NULL,''),('67526','test_process:7:67515','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8','67516','67520','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'1','2020-12-03 16:03:58.658',NULL,NULL,NULL,NULL,50,NULL,'bd6a2165d6ed47843a2f01d1a2213f22',NULL,''),('7509','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7505','7506','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:28:23.462',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7517','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7510','7514','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:28:42.364',NULL,'2020-12-01 20:28:52.445',10081,NULL,50,NULL,NULL,NULL,''),('7520','test_process:3:7504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','7510','7514','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:28:52.453',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('7528','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7521','7525','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:30:03.369',NULL,'2020-12-01 20:30:25.349',21980,NULL,50,NULL,NULL,NULL,''),('7531','test_process:3:7504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','7521','7525','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:30:25.353',NULL,'2020-12-01 20:42:44.214',738861,NULL,50,NULL,NULL,NULL,''),('7539','test_process:3:7504','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828','7532','7536','ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:30:55.430',NULL,'2020-12-01 20:31:10.650',15220,NULL,50,NULL,NULL,NULL,''),('7542','test_process:3:7504','sid-A004629B-B30D-4620-B088-C4A1B3C0040D','7532','7536','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,NULL,NULL,'2020-12-01 20:31:10.663',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_VARINST` VALUES ('10001','7521','7521',NULL,'flag','string',0,NULL,NULL,NULL,'true',NULL,'2020-12-01 20:42:44.203','2020-12-01 20:42:44.203'),('10007','10005','10005',NULL,'formId','string',1,NULL,NULL,NULL,'014d3072d5f829e5f2fd1ac93d0d1273',NULL,'2020-12-01 20:45:28.476','2020-12-01 20:51:23.587'),('10008','10005','10005',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-01 20:45:28.476','2020-12-01 20:51:23.599'),('12503','12501','12501',NULL,'formId','null',2,NULL,NULL,NULL,NULL,NULL,'2020-12-01 20:54:41.966','2020-12-01 20:56:10.677'),('12504','12501','12501',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-01 20:54:41.968','2020-12-01 20:56:10.678'),('12509','12501','12501',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-01 20:55:26.796','2020-12-01 20:56:10.680'),('12518','12516','12516',NULL,'formId','null',1,NULL,NULL,NULL,NULL,NULL,'2020-12-01 20:58:30.937','2020-12-01 21:03:09.739'),('12519','12516','12516',NULL,'agent','string',1,NULL,NULL,NULL,'2',NULL,'2020-12-01 20:58:30.937','2020-12-01 21:03:09.740'),('12524','12516','12516',NULL,'flag','string',0,NULL,NULL,NULL,'true',NULL,'2020-12-01 21:03:09.740','2020-12-01 21:03:09.740'),('17507','17505','17505',NULL,'formId','string',3,NULL,NULL,NULL,'a036bfe7aa273216f4b57a66f08f415f',NULL,'2020-12-02 11:19:32.268','2020-12-02 11:22:38.748'),('17508','17505','17505',NULL,'agent','string',3,NULL,NULL,NULL,'2',NULL,'2020-12-02 11:19:32.271','2020-12-02 11:22:38.750'),('17509','17505','17505',NULL,'flag','string',3,NULL,NULL,NULL,'true',NULL,'2020-12-02 11:19:32.271','2020-12-02 11:22:38.751'),('20003','20001','20001',NULL,'formId','string',3,NULL,NULL,NULL,'568a953af383ac92b551fc55f213c0a9',NULL,'2020-12-02 11:27:30.833','2020-12-02 16:21:16.354'),('20004','20001','20001',NULL,'agent','string',3,NULL,NULL,NULL,'2',NULL,'2020-12-02 11:27:30.835','2020-12-02 16:21:16.357'),('20005','20001','20001',NULL,'flag','string',3,NULL,NULL,NULL,'true',NULL,'2020-12-02 11:27:30.836','2020-12-02 16:21:16.359'),('22503','22501','22501',NULL,'formId','string',2,NULL,NULL,NULL,'9c02bd016bd330c9489f4d1ba1416338',NULL,'2020-12-02 13:55:12.249','2020-12-02 13:55:45.167'),('22504','22501','22501',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-02 13:55:12.251','2020-12-02 13:55:45.169'),('22505','22501','22501',NULL,'flag','string',2,NULL,NULL,NULL,'false',NULL,'2020-12-02 13:55:12.251','2020-12-02 13:55:45.171'),('25010','25008','25008',NULL,'formId','string',1,NULL,NULL,NULL,'b2d1e100b27b802bfa5a7a144c158a51',NULL,'2020-12-02 16:13:28.398','2020-12-02 16:13:30.604'),('25011','25008','25008',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 16:13:28.409','2020-12-02 16:13:30.606'),('25012','25008','25008',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:13:28.410','2020-12-02 16:13:30.607'),('27503','27501','27501',NULL,'formId','string',1,NULL,NULL,NULL,'58fa1e9046eaa03413a2cc5c73dc7ac6',NULL,'2020-12-02 16:15:37.974','2020-12-02 16:20:41.137'),('27504','27501','27501',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 16:15:37.976','2020-12-02 16:20:41.146'),('27505','27501','27501',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:15:37.976','2020-12-02 16:20:41.147'),('27516','27514','27514',NULL,'formId','string',1,NULL,NULL,NULL,'e48aeaacb0ec55089b5016575cdfa667',NULL,'2020-12-02 16:21:48.105','2020-12-02 16:21:50.416'),('27517','27514','27514',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 16:21:48.105','2020-12-02 16:21:50.418'),('27518','27514','27514',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:21:48.105','2020-12-02 16:21:50.424'),('27528','27526','27526',NULL,'formId','string',2,NULL,NULL,NULL,'226e00b73812e4f729bb12d32493761e',NULL,'2020-12-02 16:22:53.616','2020-12-02 16:26:43.901'),('27529','27526','27526',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-02 16:22:53.616','2020-12-02 16:26:43.903'),('27530','27526','27526',NULL,'flag','string',2,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:22:53.616','2020-12-02 16:26:43.904'),('30003','30001','30001',NULL,'formId','string',2,NULL,NULL,NULL,'c2818efa9d662db5c77524617891c0bb',NULL,'2020-12-02 16:27:36.599','2020-12-02 16:45:19.290'),('30004','30001','30001',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-02 16:27:36.601','2020-12-02 16:45:19.292'),('30005','30001','30001',NULL,'flag','string',2,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:27:36.601','2020-12-02 16:45:19.295'),('32503','32501','32501',NULL,'formId','string',1,NULL,NULL,NULL,'1c4d03b58ec73e4860d75b825c8e1787',NULL,'2020-12-02 16:41:49.274','2020-12-02 16:42:09.031'),('32504','32501','32501',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 16:41:49.277','2020-12-02 16:42:09.033'),('32505','32501','32501',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:41:49.277','2020-12-02 16:42:09.035'),('35003','35001','35001',NULL,'formId','string',2,NULL,NULL,NULL,'183f5b9c907b96b81bdd80b0ffe27216',NULL,'2020-12-02 16:44:57.007','2020-12-02 16:46:38.697'),('35004','35001','35001',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-02 16:44:57.009','2020-12-02 16:46:38.699'),('35005','35001','35001',NULL,'canWrite','string',1,NULL,NULL,NULL,'1234567',NULL,'2020-12-02 16:44:57.009','2020-12-02 16:44:57.381'),('35006','35001','35001',NULL,'flag','string',2,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:44:57.010','2020-12-02 16:46:38.703'),('37503','37501','37501',NULL,'formId','string',2,NULL,NULL,NULL,'75dcbeea6db256d863c32729004a38c9',NULL,'2020-12-02 16:49:05.483','2020-12-02 16:58:19.050'),('37504','37501','37501',NULL,'canWrite2','string',1,NULL,NULL,NULL,'1234567',NULL,'2020-12-02 16:49:05.486','2020-12-02 16:49:07.275'),('37505','37501','37501',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-02 16:49:05.486','2020-12-02 16:58:19.052'),('37506','37501','37501',NULL,'canWrite','string',1,NULL,NULL,NULL,'1234567',NULL,'2020-12-02 16:49:05.486','2020-12-02 16:49:07.282'),('37507','37501','37501',NULL,'flag','string',2,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:49:05.486','2020-12-02 16:58:19.054'),('40003','40001','40001',NULL,'formId','string',1,NULL,NULL,NULL,'a2cf20fa937250b7064cf9ebc5df79d9',NULL,'2020-12-02 16:59:52.975','2020-12-02 17:00:08.093'),('40004','40001','40001',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 16:59:52.977','2020-12-02 17:00:08.096'),('40006','40001','40001',NULL,'canWrite','serializable',1,'40007',NULL,NULL,NULL,NULL,'2020-12-02 16:59:52.980','2020-12-02 17:00:08.101'),('40008','40001','40001',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 16:59:52.980','2020-12-02 17:00:08.102'),('40018','40016','40016',NULL,'formId','string',1,NULL,NULL,NULL,'9c39aa72a2eacb6020935f1bc54cd686',NULL,'2020-12-02 17:00:26.529','2020-12-02 17:04:31.346'),('40019','40016','40016',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 17:00:26.529','2020-12-02 17:04:31.349'),('40021','40016','40016',NULL,'canWrite','serializable',1,'40022',NULL,NULL,NULL,NULL,'2020-12-02 17:00:26.529','2020-12-02 17:04:31.357'),('40023','40016','40016',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 17:00:26.530','2020-12-02 17:04:31.359'),('42503','42501','42501',NULL,'formId','string',1,NULL,NULL,NULL,'c8ea7f8cce31e496d4cf3520819273ad',NULL,'2020-12-02 17:06:57.012','2020-12-02 17:10:13.145'),('42504','42501','42501',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 17:06:57.013','2020-12-02 17:10:13.147'),('42505','42501','42501',NULL,'flag','string',1,NULL,NULL,NULL,'true',NULL,'2020-12-02 17:06:57.013','2020-12-02 17:10:13.149'),('45003','45001','45001',NULL,'formId','string',1,NULL,NULL,NULL,'b91944338b39fdce25040b00cb5d49d3',NULL,'2020-12-02 17:10:57.756','2020-12-02 17:12:46.357'),('45004','45001','45001',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 17:10:57.758','2020-12-02 17:12:46.358'),('47507','47505','47505',NULL,'formId','string',1,NULL,NULL,NULL,'4e9d3445d95885c11eec144cf5331a95',NULL,'2020-12-02 20:42:01.624','2020-12-02 20:42:53.877'),('47508','47505','47505',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 20:42:01.627','2020-12-02 20:42:53.879'),('47518','47516','47516',NULL,'formId','string',1,NULL,NULL,NULL,'11073d32d59823ff45f731d7c7f91ab9',NULL,'2020-12-02 20:44:08.119','2020-12-02 20:46:42.953'),('47519','47516','47516',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 20:44:08.119','2020-12-02 20:46:42.955'),('50003','50001','50001',NULL,'formId','string',1,NULL,NULL,NULL,'1d57cd183a21bff9c8a1bc77ca13ed29',NULL,'2020-12-02 20:52:03.539','2020-12-02 20:57:25.653'),('50004','50001','50001',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 20:52:03.542','2020-12-02 20:57:25.654'),('52503','52501','52501',NULL,'formId','string',0,NULL,NULL,NULL,'02c85dad39042bf60c1bd52b01748a19',NULL,'2020-12-02 21:12:47.781','2020-12-02 21:12:47.781'),('52504','52501','52501',NULL,'agent','string',0,NULL,NULL,NULL,'1',NULL,'2020-12-02 21:12:47.783','2020-12-02 21:12:47.783'),('52512','52510','52510',NULL,'formId','string',0,NULL,NULL,NULL,'0a40c751656999b99818a98f0ac06210',NULL,'2020-12-02 21:14:26.667','2020-12-02 21:14:26.667'),('52513','52510','52510',NULL,'agent','string',0,NULL,NULL,NULL,'1',NULL,'2020-12-02 21:14:26.667','2020-12-02 21:14:26.667'),('55003','55001','55001',NULL,'formId','string',1,NULL,NULL,NULL,'5d3b16edbd3205abcb53ec500092c5b8',NULL,'2020-12-02 21:16:36.059','2020-12-02 21:19:11.334'),('55004','55001','55001',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 21:16:36.061','2020-12-02 21:19:11.336'),('55014','55012','55012',NULL,'formId','string',1,NULL,NULL,NULL,'fdd9c50e32fb9d184306725947f51873',NULL,'2020-12-02 21:20:41.500','2020-12-02 21:28:00.723'),('55015','55012','55012',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 21:20:41.501','2020-12-02 21:28:00.724'),('57503','57501','57501',NULL,'formId','string',1,NULL,NULL,NULL,'d4f3ae746ea2e5e55b4b57b3fc1a2828',NULL,'2020-12-02 21:28:59.339','2020-12-02 21:29:26.399'),('57504','57501','57501',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 21:28:59.342','2020-12-02 21:29:26.402'),('60003','60001','60001',NULL,'formId','string',1,NULL,NULL,NULL,'458047a930813790c45cd01722d03a91',NULL,'2020-12-02 21:31:32.811','2020-12-02 21:36:16.519'),('60004','60001','60001',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-02 21:31:32.814','2020-12-02 21:36:16.521'),('65003','65001','65001',NULL,'formId','string',1,NULL,NULL,NULL,'362272967fbbe47a245e4bfac24588ab',NULL,'2020-12-03 15:59:12.527','2020-12-03 16:01:34.456'),('65004','65001','65001',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-03 15:59:12.529','2020-12-03 16:01:34.457'),('67503','67501','67501',NULL,'formId','string',1,NULL,NULL,NULL,'f9439493caf3c71929df562d1cad32a0',NULL,'2020-12-03 16:02:37.785','2020-12-03 16:02:50.607'),('67504','67501','67501',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-03 16:02:37.787','2020-12-03 16:02:50.609'),('67518','67516','67516',NULL,'formId','string',1,NULL,NULL,NULL,'bd6a2165d6ed47843a2f01d1a2213f22',NULL,'2020-12-03 16:03:53.051','2020-12-03 16:03:58.616'),('67519','67516','67516',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-03 16:03:53.051','2020-12-03 16:03:58.621'),('7512','7510','7510',NULL,'formId','string',1,NULL,NULL,NULL,'e013785e3e0fb298a6964b709aa651ed',NULL,'2020-12-01 20:28:42.351','2020-12-01 20:28:52.435'),('7513','7510','7510',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-01 20:28:42.358','2020-12-01 20:28:52.437'),('7523','7521','7521',NULL,'formId','null',2,NULL,NULL,NULL,NULL,NULL,'2020-12-01 20:30:03.367','2020-12-01 20:42:44.177'),('7524','7521','7521',NULL,'agent','string',2,NULL,NULL,NULL,'2',NULL,'2020-12-01 20:30:03.367','2020-12-01 20:42:44.181'),('7534','7532','7532',NULL,'formId','string',1,NULL,NULL,NULL,'9bff7ec6e5d8c003824189843ed40e14',NULL,'2020-12-01 20:30:55.429','2020-12-01 20:31:10.642'),('7535','7532','7532',NULL,'agent','string',1,NULL,NULL,NULL,'1',NULL,'2020-12-01 20:30:55.429','2020-12-01 20:31:10.644');
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_GROUP`
--

DROP TABLE IF EXISTS `ACT_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_GROUP`
--

LOCK TABLES `ACT_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_GROUP` DISABLE KEYS */;
INSERT INTO `ACT_ID_GROUP` VALUES ('canWrite',1,NULL,NULL);
/*!40000 ALTER TABLE `ACT_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_INFO`
--

DROP TABLE IF EXISTS `ACT_ID_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_INFO`
--

LOCK TABLES `ACT_ID_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_ID_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `ACT_ID_MEMBERSHIP` VALUES ('1','canWrite'),('2','canWrite'),('3','canWrite');
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_USER`
--

DROP TABLE IF EXISTS `ACT_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_USER`
--

LOCK TABLES `ACT_ID_USER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_USER` DISABLE KEYS */;
INSERT INTO `ACT_ID_USER` VALUES ('1',1,NULL,NULL,NULL,NULL,NULL),('2',1,NULL,NULL,NULL,NULL,NULL),('3',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_PROCDEF_INFO`
--

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_PROCDEF_INFO`
--

LOCK TABLES `ACT_PROCDEF_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('17501','test1',NULL,NULL,'','2020-12-02 03:19:09.018',NULL),('25004','test1',NULL,NULL,'','2020-12-02 08:12:57.409',NULL),('47501','test1',NULL,NULL,'','2020-12-02 12:41:09.467',NULL),('5001','test1',NULL,NULL,'','2020-12-01 12:25:19.570',NULL),('5010','test1',NULL,NULL,'','2020-12-01 12:25:41.690',NULL),('67512','test1',NULL,NULL,'','2020-12-03 08:03:31.637',NULL),('7501','test1',NULL,NULL,'','2020-12-01 12:27:45.840',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_MODEL`
--

DROP TABLE IF EXISTS `ACT_RE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_MODEL`
--

LOCK TABLES `ACT_RE_MODEL` WRITE;
/*!40000 ALTER TABLE `ACT_RE_MODEL` DISABLE KEYS */;
INSERT INTO `ACT_RE_MODEL` VALUES ('1',15,'test1','modelKey',NULL,'2020-12-01 09:20:19.732','2020-12-03 07:56:44.004',12,'{\"name\":\"test1\",\"revision\":1,\"description\":\"miaoshu\"}',NULL,'2','2501',''),('62501',11,'test2','modelKey',NULL,'2020-12-03 01:33:21.563','2020-12-03 02:29:54.926',8,'{\"name\":\"test2\",\"revision\":1,\"description\":\"miaoshu\"}',NULL,'62502','62503',''),('70001',4,'test','process',NULL,'2021-01-04 01:45:04.931','2021-01-04 06:26:03.158',1,'{\"name\":\"test\",\"revision\":1,\"description\":\"test1\"}',NULL,'70002','72501','');
/*!40000 ALTER TABLE `ACT_RE_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('test_process:1:5004',1,'http://www.activiti.org/processdef',NULL,'test_process',1,'5001','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL),('test_process:2:5013',1,'http://www.activiti.org/processdef',NULL,'test_process',2,'5010','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL),('test_process:3:7504',1,'http://www.activiti.org/processdef',NULL,'test_process',3,'7501','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL),('test_process:4:17504',1,'http://www.activiti.org/processdef',NULL,'test_process',4,'17501','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL),('test_process:5:25007',1,'http://www.activiti.org/processdef',NULL,'test_process',5,'25004','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL),('test_process:6:47504',1,'http://www.activiti.org/processdef',NULL,'test_process',6,'47501','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL),('test_process:7:67515',1,'http://www.activiti.org/processdef',NULL,'test_process',7,'67512','test1.bpmn20.xml','test1.test_process.png','miaoshu',0,1,1,'',NULL);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_DEADLETTER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_DEADLETTER_JOB`
--

LOCK TABLES `ACT_RU_DEADLETTER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
INSERT INTO `ACT_RU_EXECUTION` VALUES ('10005',1,'10005','014d3072d5f829e5f2fd1ac93d0d1273',NULL,'test_process:3:7504',NULL,'10005',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:45:28.475','1',NULL,0,0,0,0,0,0,0,0,0),('10009',2,'10005',NULL,'10005','test_process:3:7504',NULL,'10005','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:45:28.476',NULL,NULL,0,0,0,0,0,0,0,0,0),('12516',1,'12516','4d359e356d81d0ad1d3c324e2c936efe',NULL,'test_process:3:7504',NULL,'12516',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:58:30.935','1',NULL,0,0,0,0,0,0,0,0,0),('12520',2,'12516',NULL,'12516','test_process:3:7504',NULL,'12516','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:58:30.938',NULL,NULL,0,0,0,0,0,0,0,0,0),('25008',1,'25008','b2d1e100b27b802bfa5a7a144c158a51',NULL,'test_process:5:25007',NULL,'25008',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:13:28.393','1',NULL,0,0,0,0,0,0,0,0,0),('25013',2,'25008',NULL,'25008','test_process:5:25007',NULL,'25008','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:13:28.421',NULL,NULL,0,0,0,0,0,0,0,0,0),('27501',1,'27501','58fa1e9046eaa03413a2cc5c73dc7ac6',NULL,'test_process:5:25007',NULL,'27501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:15:37.944','1',NULL,0,0,0,0,0,0,0,0,0),('27506',2,'27501',NULL,'27501','test_process:5:25007',NULL,'27501','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:15:37.978',NULL,NULL,0,0,0,0,0,0,0,0,0),('27514',1,'27514','e48aeaacb0ec55089b5016575cdfa667',NULL,'test_process:5:25007',NULL,'27514',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:21:48.104','1',NULL,0,0,0,0,0,0,0,0,0),('27519',2,'27514',NULL,'27514','test_process:5:25007',NULL,'27514','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:21:48.105',NULL,NULL,0,0,0,0,0,0,0,0,0),('27526',1,'27526','226e00b73812e4f729bb12d32493761e',NULL,'test_process:5:25007',NULL,'27526',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:22:53.615','1',NULL,0,0,0,0,0,0,0,0,0),('27531',3,'27526',NULL,'27526','test_process:5:25007',NULL,'27526','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:22:53.616',NULL,NULL,0,0,0,0,0,0,0,0,0),('30001',1,'30001','c2818efa9d662db5c77524617891c0bb',NULL,'test_process:5:25007',NULL,'30001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:27:36.576','1',NULL,0,0,0,0,0,0,0,0,0),('30006',3,'30001',NULL,'30001','test_process:5:25007',NULL,'30001','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:27:36.602',NULL,NULL,0,0,0,0,0,0,0,0,0),('32501',1,'32501','1c4d03b58ec73e4860d75b825c8e1787',NULL,'test_process:5:25007',NULL,'32501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:41:49.240','1',NULL,0,0,0,0,0,0,0,0,0),('32506',2,'32501',NULL,'32501','test_process:5:25007',NULL,'32501','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:41:49.279',NULL,NULL,0,0,0,0,0,0,0,0,0),('35001',1,'35001','183f5b9c907b96b81bdd80b0ffe27216',NULL,'test_process:5:25007',NULL,'35001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:44:56.980','1',NULL,0,0,0,0,0,0,0,0,0),('35007',3,'35001',NULL,'35001','test_process:5:25007',NULL,'35001','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:44:57.012',NULL,NULL,0,0,0,0,0,0,0,0,0),('37501',1,'37501','75dcbeea6db256d863c32729004a38c9',NULL,'test_process:5:25007',NULL,'37501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:49:05.458','1',NULL,0,0,0,0,0,0,0,0,0),('37508',3,'37501',NULL,'37501','test_process:5:25007',NULL,'37501','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:49:05.489',NULL,NULL,0,0,0,0,0,0,0,0,0),('40001',1,'40001','a2cf20fa937250b7064cf9ebc5df79d9',NULL,'test_process:5:25007',NULL,'40001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 16:59:52.956','1',NULL,0,0,0,0,0,0,0,0,0),('40009',2,'40001',NULL,'40001','test_process:5:25007',NULL,'40001','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 16:59:52.982',NULL,NULL,0,0,0,0,0,0,0,0,0),('40016',1,'40016','9c39aa72a2eacb6020935f1bc54cd686',NULL,'test_process:5:25007',NULL,'40016',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 17:00:26.527','1',NULL,0,0,0,0,0,0,0,0,0),('40024',2,'40016',NULL,'40016','test_process:5:25007',NULL,'40016','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 17:00:26.530',NULL,NULL,0,0,0,0,0,0,0,0,0),('42501',1,'42501','c8ea7f8cce31e496d4cf3520819273ad',NULL,'test_process:5:25007',NULL,'42501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 17:06:56.981','1',NULL,0,0,0,0,0,0,0,0,0),('42506',2,'42501',NULL,'42501','test_process:5:25007',NULL,'42501','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 17:06:57.015',NULL,NULL,0,0,0,0,0,0,0,0,0),('45001',1,'45001','b91944338b39fdce25040b00cb5d49d3',NULL,'test_process:5:25007',NULL,'45001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 17:10:57.730','1',NULL,0,0,0,0,0,0,0,0,0),('45005',2,'45001',NULL,'45001','test_process:5:25007',NULL,'45001','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 17:10:57.760',NULL,NULL,0,0,0,0,0,0,0,0,0),('47505',1,'47505','4e9d3445d95885c11eec144cf5331a95',NULL,'test_process:6:47504',NULL,'47505',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 20:42:01.622','1',NULL,0,0,0,0,0,0,0,0,0),('47509',2,'47505',NULL,'47505','test_process:6:47504',NULL,'47505','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 20:42:01.629',NULL,NULL,0,0,0,0,0,0,0,0,0),('47516',1,'47516','11073d32d59823ff45f731d7c7f91ab9',NULL,'test_process:6:47504',NULL,'47516',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 20:44:08.119','1',NULL,0,0,0,0,0,0,0,0,0),('47520',2,'47516',NULL,'47516','test_process:6:47504',NULL,'47516','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 20:44:08.119',NULL,NULL,0,0,0,0,0,0,0,0,0),('50001',1,'50001','1d57cd183a21bff9c8a1bc77ca13ed29',NULL,'test_process:6:47504',NULL,'50001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 20:52:03.505','1',NULL,0,0,0,0,0,0,0,0,0),('50005',2,'50001',NULL,'50001','test_process:6:47504',NULL,'50001','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 20:52:03.547',NULL,NULL,0,0,0,0,0,0,0,0,0),('5005',1,'5005',NULL,NULL,'test_process:1:5004',NULL,'5005',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:25:21.975',NULL,NULL,0,0,0,0,0,0,0,0,0),('5006',1,'5005',NULL,'5005','test_process:1:5004',NULL,'5005','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:25:21.978',NULL,NULL,0,0,0,0,0,0,0,0,0),('5014',1,'5014',NULL,NULL,'test_process:2:5013',NULL,'5014',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:25:50.686',NULL,NULL,0,0,0,0,0,0,0,0,0),('5015',1,'5014',NULL,'5014','test_process:2:5013',NULL,'5014','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:25:50.686',NULL,NULL,0,0,0,0,0,0,0,0,0),('5019',1,'5019',NULL,NULL,'test_process:2:5013',NULL,'5019',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:26:08.792',NULL,NULL,0,0,0,0,0,0,0,0,0),('5020',1,'5019',NULL,'5019','test_process:2:5013',NULL,'5019','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:26:08.792',NULL,NULL,0,0,0,0,0,0,0,0,0),('52501',1,'52501','02c85dad39042bf60c1bd52b01748a19',NULL,'test_process:6:47504',NULL,'52501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 21:12:47.754','1',NULL,0,0,0,0,0,0,0,0,0),('52505',1,'52501',NULL,'52501','test_process:6:47504',NULL,'52501','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 21:12:47.785',NULL,NULL,0,0,0,0,0,0,0,0,0),('52510',1,'52510','0a40c751656999b99818a98f0ac06210',NULL,'test_process:6:47504',NULL,'52510',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 21:14:26.664','1',NULL,0,0,0,0,0,0,0,0,0),('52514',1,'52510',NULL,'52510','test_process:6:47504',NULL,'52510','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 21:14:26.667',NULL,NULL,0,0,0,0,0,0,0,0,0),('55001',1,'55001','5d3b16edbd3205abcb53ec500092c5b8',NULL,'test_process:6:47504',NULL,'55001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 21:16:36.031','1',NULL,0,0,0,0,0,0,0,0,0),('55005',2,'55001',NULL,'55001','test_process:6:47504',NULL,'55001','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 21:16:36.063',NULL,NULL,0,0,0,0,0,0,0,0,0),('55012',1,'55012','fdd9c50e32fb9d184306725947f51873',NULL,'test_process:6:47504',NULL,'55012',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 21:20:41.500','1',NULL,0,0,0,0,0,0,0,0,0),('55016',2,'55012',NULL,'55012','test_process:6:47504',NULL,'55012','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 21:20:41.501',NULL,NULL,0,0,0,0,0,0,0,0,0),('57501',1,'57501','d4f3ae746ea2e5e55b4b57b3fc1a2828',NULL,'test_process:6:47504',NULL,'57501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 21:28:59.314','1',NULL,0,0,0,0,0,0,0,0,0),('57505',2,'57501',NULL,'57501','test_process:6:47504',NULL,'57501','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 21:28:59.344',NULL,NULL,0,0,0,0,0,0,0,0,0),('60001',1,'60001','458047a930813790c45cd01722d03a91',NULL,'test_process:6:47504',NULL,'60001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-02 21:31:32.782','1',NULL,0,0,0,0,0,0,0,0,0),('60005',2,'60001',NULL,'60001','test_process:6:47504',NULL,'60001','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-02 21:31:32.817',NULL,NULL,0,0,0,0,0,0,0,0,0),('65001',1,'65001','362272967fbbe47a245e4bfac24588ab',NULL,'test_process:6:47504',NULL,'65001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-03 15:59:12.497','1',NULL,0,0,0,0,0,0,0,0,0),('65005',2,'65001',NULL,'65001','test_process:6:47504',NULL,'65001','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-03 15:59:12.532',NULL,NULL,0,0,0,0,0,0,0,0,0),('67501',1,'67501','f9439493caf3c71929df562d1cad32a0',NULL,'test_process:6:47504',NULL,'67501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-03 16:02:37.762','1',NULL,0,0,0,0,0,0,0,0,0),('67505',2,'67501',NULL,'67501','test_process:6:47504',NULL,'67501','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-03 16:02:37.791',NULL,NULL,0,0,0,0,0,0,0,0,0),('67516',1,'67516','bd6a2165d6ed47843a2f01d1a2213f22',NULL,'test_process:7:67515',NULL,'67516',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-03 16:03:53.050','1',NULL,0,0,0,0,0,0,0,0,0),('67520',2,'67516',NULL,'67516','test_process:7:67515',NULL,'67516','sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',1,0,0,0,0,1,NULL,'',NULL,'2020-12-03 16:03:53.051',NULL,NULL,0,0,0,0,0,0,0,0,0),('7505',1,'7505',NULL,NULL,'test_process:3:7504',NULL,'7505',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:28:23.399',NULL,NULL,0,0,0,0,0,0,0,0,0),('7506',1,'7505',NULL,'7505','test_process:3:7504',NULL,'7505','sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:28:23.410',NULL,NULL,0,0,0,0,0,0,0,0,0),('7510',1,'7510','e013785e3e0fb298a6964b709aa651ed',NULL,'test_process:3:7504',NULL,'7510',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:28:42.344','1',NULL,0,0,0,0,0,0,0,0,0),('7514',2,'7510',NULL,'7510','test_process:3:7504',NULL,'7510','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:28:42.360',NULL,NULL,0,0,0,0,0,0,0,0,0),('7532',1,'7532','9bff7ec6e5d8c003824189843ed40e14',NULL,'test_process:3:7504',NULL,'7532',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-12-01 20:30:55.429','1',NULL,0,0,0,0,0,0,0,0,0),('7536',2,'7532',NULL,'7532','test_process:3:7504',NULL,'7532','sid-A004629B-B30D-4620-B088-C4A1B3C0040D',1,0,0,0,0,1,NULL,'',NULL,'2020-12-01 20:30:55.429',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('10006',1,NULL,'starter','1',NULL,'10005',NULL),('12517',1,NULL,'starter','1',NULL,'12516',NULL),('25009',1,NULL,'starter','1',NULL,'25008',NULL),('27502',1,NULL,'starter','1',NULL,'27501',NULL),('27515',1,NULL,'starter','1',NULL,'27514',NULL),('27527',1,NULL,'starter','1',NULL,'27526',NULL),('27541',1,NULL,'participant','2',NULL,'27526',NULL),('30002',1,NULL,'starter','1',NULL,'30001',NULL),('30013',1,NULL,'participant','2',NULL,'30001',NULL),('32502',1,NULL,'starter','1',NULL,'32501',NULL),('35002',1,NULL,'starter','1',NULL,'35001',NULL),('35020',1,NULL,'participant','2',NULL,'35001',NULL),('37502',1,NULL,'starter','1',NULL,'37501',NULL),('37518',1,NULL,'participant','2',NULL,'37501',NULL),('40002',1,NULL,'starter','1',NULL,'40001',NULL),('40017',1,NULL,'starter','1',NULL,'40016',NULL),('42502',1,NULL,'starter','1',NULL,'42501',NULL),('45002',1,NULL,'starter','1',NULL,'45001',NULL),('47506',1,NULL,'starter','1',NULL,'47505',NULL),('47517',1,NULL,'starter','1',NULL,'47516',NULL),('50002',1,NULL,'starter','1',NULL,'50001',NULL),('52502',1,NULL,'starter','1',NULL,'52501',NULL),('52509',1,'canWrite','candidate',NULL,'52508',NULL,NULL),('52511',1,NULL,'starter','1',NULL,'52510',NULL),('52518',1,'canWrite','candidate',NULL,'52517',NULL,NULL),('55002',1,NULL,'starter','1',NULL,'55001',NULL),('55013',1,NULL,'starter','1',NULL,'55012',NULL),('57502',1,NULL,'starter','1',NULL,'57501',NULL),('60002',1,NULL,'starter','1',NULL,'60001',NULL),('65002',1,NULL,'starter','1',NULL,'65001',NULL),('67502',1,NULL,'starter','1',NULL,'67501',NULL),('67517',1,NULL,'starter','1',NULL,'67516',NULL),('67527',1,'canAudit','candidate',NULL,'67526',NULL,NULL),('7511',1,NULL,'starter','1',NULL,'7510',NULL),('7533',1,NULL,'starter','1',NULL,'7532',NULL);
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_SUSPENDED_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_SUSPENDED_JOB`
--

LOCK TABLES `ACT_RU_SUSPENDED_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
INSERT INTO `ACT_RU_TASK` VALUES ('10015',1,'10009','10005','test_process:3:7504','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,NULL,NULL,50,'2020-12-01 12:51:23.621',NULL,NULL,1,'',NULL,NULL),('12527',1,'12520','12516','test_process:3:7504','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,NULL,NULL,50,'2020-12-01 13:03:09.749',NULL,NULL,1,'',NULL,NULL),('25019',1,'25013','25008','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 08:13:30.623',NULL,NULL,1,'','b2d1e100b27b802bfa5a7a144c158a51',NULL),('27512',1,'27506','27501','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 08:20:41.179',NULL,NULL,1,'','58fa1e9046eaa03413a2cc5c73dc7ac6',NULL),('27525',1,'27519','27514','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 08:21:50.452',NULL,NULL,1,'','e48aeaacb0ec55089b5016575cdfa667',NULL),('27540',1,'27531','27526','test_process:5:25007','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,'2',NULL,50,'2020-12-02 08:26:43.914',NULL,NULL,1,'','226e00b73812e4f729bb12d32493761e',NULL),('32512',1,'32506','32501','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 08:42:09.052',NULL,NULL,1,'','1c4d03b58ec73e4860d75b825c8e1787',NULL),('35016',1,'30006','30001','test_process:5:25007','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,'2',NULL,50,'2020-12-02 08:45:19.371',NULL,NULL,1,'','c2818efa9d662db5c77524617891c0bb',NULL),('35019',1,'35007','35001','test_process:5:25007','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,'2',NULL,50,'2020-12-02 08:46:38.722',NULL,NULL,1,'','183f5b9c907b96b81bdd80b0ffe27216',NULL),('37517',1,'37508','37501','test_process:5:25007','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,'2',NULL,50,'2020-12-02 08:58:19.232',NULL,NULL,1,'','75dcbeea6db256d863c32729004a38c9',NULL),('40015',1,'40009','40001','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 09:00:08.116',NULL,NULL,1,'','a2cf20fa937250b7064cf9ebc5df79d9',NULL),('40030',1,'40024','40016','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 09:04:31.379',NULL,NULL,1,'','9c39aa72a2eacb6020935f1bc54cd686',NULL),('42512',1,'42506','42501','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 09:10:13.174',NULL,NULL,1,'','c8ea7f8cce31e496d4cf3520819273ad',NULL),('45011',1,'45005','45001','test_process:5:25007','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 09:12:46.372',NULL,NULL,1,'','b91944338b39fdce25040b00cb5d49d3',NULL),('47515',1,'47509','47505','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 12:42:53.913',NULL,NULL,1,'','4e9d3445d95885c11eec144cf5331a95',NULL),('47526',1,'47520','47516','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 12:46:42.966',NULL,NULL,1,'','11073d32d59823ff45f731d7c7f91ab9',NULL),('50011',1,'50005','50001','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 12:57:25.668',NULL,NULL,1,'','1d57cd183a21bff9c8a1bc77ca13ed29',NULL),('5009',1,'5006','5005','test_process:1:5004','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',NULL,NULL,NULL,50,'2020-12-01 12:25:21.996',NULL,NULL,1,'',NULL,NULL),('5018',1,'5015','5014','test_process:2:5013','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',NULL,NULL,NULL,50,'2020-12-01 12:25:50.687',NULL,NULL,1,'',NULL,NULL),('5023',1,'5020','5019','test_process:2:5013','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',NULL,NULL,NULL,50,'2020-12-01 12:26:08.793',NULL,NULL,1,'',NULL,NULL),('52508',1,'52505','52501','test_process:6:47504','æäº¤ç”³è¯·',NULL,NULL,'sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',NULL,'1',NULL,50,'2020-12-02 13:12:47.796',NULL,NULL,1,'','02c85dad39042bf60c1bd52b01748a19',NULL),('52517',1,'52514','52510','test_process:6:47504','æäº¤ç”³è¯·',NULL,NULL,'sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',NULL,'1',NULL,50,'2020-12-02 13:14:26.671',NULL,NULL,1,'','0a40c751656999b99818a98f0ac06210',NULL),('55011',1,'55005','55001','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 13:19:11.414',NULL,NULL,1,'','5d3b16edbd3205abcb53ec500092c5b8',NULL),('55022',1,'55016','55012','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 13:28:00.747',NULL,NULL,1,'','fdd9c50e32fb9d184306725947f51873',NULL),('57511',1,'57505','57501','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 13:29:26.415',NULL,NULL,1,'','d4f3ae746ea2e5e55b4b57b3fc1a2828',NULL),('60011',1,'60005','60001','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-02 13:36:16.542',NULL,NULL,1,'','458047a930813790c45cd01722d03a91',NULL),('65011',1,'65005','65001','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-03 08:01:34.472',NULL,NULL,1,'','362272967fbbe47a245e4bfac24588ab',NULL),('67511',1,'67505','67501','test_process:6:47504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-03 08:02:50.623',NULL,NULL,1,'','f9439493caf3c71929df562d1cad32a0',NULL),('67526',1,'67520','67516','test_process:7:67515','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-9DD80E58-91E5-4949-B46E-7F01948BF1A8',NULL,'1',NULL,50,'2020-12-03 08:03:58.658',NULL,NULL,1,'','bd6a2165d6ed47843a2f01d1a2213f22',NULL),('7509',1,'7506','7505','test_process:3:7504','ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-392231E4-F4FC-45E6-9CE9-60E5208FC828',NULL,NULL,NULL,50,'2020-12-01 12:28:23.432',NULL,NULL,1,'',NULL,NULL),('7520',1,'7514','7510','test_process:3:7504','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,NULL,NULL,50,'2020-12-01 12:28:52.453',NULL,NULL,1,'',NULL,NULL),('7542',1,'7536','7532','test_process:3:7504','ä¸šåŠ¡ç»ç†å®¡æ ¸',NULL,NULL,'sid-A004629B-B30D-4620-B088-C4A1B3C0040D',NULL,NULL,NULL,50,'2020-12-01 12:31:10.662',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TIMER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TIMER_JOB`
--

LOCK TABLES `ACT_RU_TIMER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
INSERT INTO `ACT_RU_VARIABLE` VALUES ('10007',1,'string','formId','10005','10005',NULL,NULL,NULL,NULL,'014d3072d5f829e5f2fd1ac93d0d1273',NULL),('10008',1,'string','agent','10005','10005',NULL,NULL,NULL,NULL,'1',NULL),('12518',2,'null','formId','12516','12516',NULL,NULL,NULL,NULL,NULL,NULL),('12519',2,'string','agent','12516','12516',NULL,NULL,NULL,NULL,'2',NULL),('12524',1,'string','flag','12516','12516',NULL,NULL,NULL,NULL,'true',NULL),('25010',1,'string','formId','25008','25008',NULL,NULL,NULL,NULL,'b2d1e100b27b802bfa5a7a144c158a51',NULL),('25011',1,'string','agent','25008','25008',NULL,NULL,NULL,NULL,'1',NULL),('25012',1,'string','flag','25008','25008',NULL,NULL,NULL,NULL,'true',NULL),('27503',1,'string','formId','27501','27501',NULL,NULL,NULL,NULL,'58fa1e9046eaa03413a2cc5c73dc7ac6',NULL),('27504',1,'string','agent','27501','27501',NULL,NULL,NULL,NULL,'1',NULL),('27505',1,'string','flag','27501','27501',NULL,NULL,NULL,NULL,'true',NULL),('27516',1,'string','formId','27514','27514',NULL,NULL,NULL,NULL,'e48aeaacb0ec55089b5016575cdfa667',NULL),('27517',1,'string','agent','27514','27514',NULL,NULL,NULL,NULL,'1',NULL),('27518',1,'string','flag','27514','27514',NULL,NULL,NULL,NULL,'true',NULL),('27528',1,'string','formId','27526','27526',NULL,NULL,NULL,NULL,'226e00b73812e4f729bb12d32493761e',NULL),('27529',2,'string','agent','27526','27526',NULL,NULL,NULL,NULL,'2',NULL),('27530',1,'string','flag','27526','27526',NULL,NULL,NULL,NULL,'true',NULL),('30003',1,'string','formId','30001','30001',NULL,NULL,NULL,NULL,'c2818efa9d662db5c77524617891c0bb',NULL),('30004',2,'string','agent','30001','30001',NULL,NULL,NULL,NULL,'2',NULL),('30005',1,'string','flag','30001','30001',NULL,NULL,NULL,NULL,'true',NULL),('32503',1,'string','formId','32501','32501',NULL,NULL,NULL,NULL,'1c4d03b58ec73e4860d75b825c8e1787',NULL),('32504',1,'string','agent','32501','32501',NULL,NULL,NULL,NULL,'1',NULL),('32505',1,'string','flag','32501','32501',NULL,NULL,NULL,NULL,'true',NULL),('35003',1,'string','formId','35001','35001',NULL,NULL,NULL,NULL,'183f5b9c907b96b81bdd80b0ffe27216',NULL),('35004',2,'string','agent','35001','35001',NULL,NULL,NULL,NULL,'2',NULL),('35005',1,'string','canWrite','35001','35001',NULL,NULL,NULL,NULL,'1234567',NULL),('35006',1,'string','flag','35001','35001',NULL,NULL,NULL,NULL,'true',NULL),('37503',1,'string','formId','37501','37501',NULL,NULL,NULL,NULL,'75dcbeea6db256d863c32729004a38c9',NULL),('37504',1,'string','canWrite2','37501','37501',NULL,NULL,NULL,NULL,'1234567',NULL),('37505',2,'string','agent','37501','37501',NULL,NULL,NULL,NULL,'2',NULL),('37506',1,'string','canWrite','37501','37501',NULL,NULL,NULL,NULL,'1234567',NULL),('37507',1,'string','flag','37501','37501',NULL,NULL,NULL,NULL,'true',NULL),('40003',1,'string','formId','40001','40001',NULL,NULL,NULL,NULL,'a2cf20fa937250b7064cf9ebc5df79d9',NULL),('40004',1,'string','agent','40001','40001',NULL,NULL,NULL,NULL,'1',NULL),('40006',1,'serializable','canWrite','40001','40001',NULL,'40005',NULL,NULL,NULL,NULL),('40008',1,'string','flag','40001','40001',NULL,NULL,NULL,NULL,'true',NULL),('40018',1,'string','formId','40016','40016',NULL,NULL,NULL,NULL,'9c39aa72a2eacb6020935f1bc54cd686',NULL),('40019',1,'string','agent','40016','40016',NULL,NULL,NULL,NULL,'1',NULL),('40021',1,'serializable','canWrite','40016','40016',NULL,'40020',NULL,NULL,NULL,NULL),('40023',1,'string','flag','40016','40016',NULL,NULL,NULL,NULL,'true',NULL),('42503',1,'string','formId','42501','42501',NULL,NULL,NULL,NULL,'c8ea7f8cce31e496d4cf3520819273ad',NULL),('42504',1,'string','agent','42501','42501',NULL,NULL,NULL,NULL,'1',NULL),('42505',1,'string','flag','42501','42501',NULL,NULL,NULL,NULL,'true',NULL),('45003',1,'string','formId','45001','45001',NULL,NULL,NULL,NULL,'b91944338b39fdce25040b00cb5d49d3',NULL),('45004',1,'string','agent','45001','45001',NULL,NULL,NULL,NULL,'1',NULL),('47507',1,'string','formId','47505','47505',NULL,NULL,NULL,NULL,'4e9d3445d95885c11eec144cf5331a95',NULL),('47508',1,'string','agent','47505','47505',NULL,NULL,NULL,NULL,'1',NULL),('47518',1,'string','formId','47516','47516',NULL,NULL,NULL,NULL,'11073d32d59823ff45f731d7c7f91ab9',NULL),('47519',1,'string','agent','47516','47516',NULL,NULL,NULL,NULL,'1',NULL),('50003',1,'string','formId','50001','50001',NULL,NULL,NULL,NULL,'1d57cd183a21bff9c8a1bc77ca13ed29',NULL),('50004',1,'string','agent','50001','50001',NULL,NULL,NULL,NULL,'1',NULL),('52503',1,'string','formId','52501','52501',NULL,NULL,NULL,NULL,'02c85dad39042bf60c1bd52b01748a19',NULL),('52504',1,'string','agent','52501','52501',NULL,NULL,NULL,NULL,'1',NULL),('52512',1,'string','formId','52510','52510',NULL,NULL,NULL,NULL,'0a40c751656999b99818a98f0ac06210',NULL),('52513',1,'string','agent','52510','52510',NULL,NULL,NULL,NULL,'1',NULL),('55003',1,'string','formId','55001','55001',NULL,NULL,NULL,NULL,'5d3b16edbd3205abcb53ec500092c5b8',NULL),('55004',1,'string','agent','55001','55001',NULL,NULL,NULL,NULL,'1',NULL),('55014',1,'string','formId','55012','55012',NULL,NULL,NULL,NULL,'fdd9c50e32fb9d184306725947f51873',NULL),('55015',1,'string','agent','55012','55012',NULL,NULL,NULL,NULL,'1',NULL),('57503',1,'string','formId','57501','57501',NULL,NULL,NULL,NULL,'d4f3ae746ea2e5e55b4b57b3fc1a2828',NULL),('57504',1,'string','agent','57501','57501',NULL,NULL,NULL,NULL,'1',NULL),('60003',1,'string','formId','60001','60001',NULL,NULL,NULL,NULL,'458047a930813790c45cd01722d03a91',NULL),('60004',1,'string','agent','60001','60001',NULL,NULL,NULL,NULL,'1',NULL),('65003',1,'string','formId','65001','65001',NULL,NULL,NULL,NULL,'362272967fbbe47a245e4bfac24588ab',NULL),('65004',1,'string','agent','65001','65001',NULL,NULL,NULL,NULL,'1',NULL),('67503',1,'string','formId','67501','67501',NULL,NULL,NULL,NULL,'f9439493caf3c71929df562d1cad32a0',NULL),('67504',1,'string','agent','67501','67501',NULL,NULL,NULL,NULL,'1',NULL),('67518',1,'string','formId','67516','67516',NULL,NULL,NULL,NULL,'bd6a2165d6ed47843a2f01d1a2213f22',NULL),('67519',1,'string','agent','67516','67516',NULL,NULL,NULL,NULL,'1',NULL),('7512',1,'string','formId','7510','7510',NULL,NULL,NULL,NULL,'e013785e3e0fb298a6964b709aa651ed',NULL),('7513',1,'string','agent','7510','7510',NULL,NULL,NULL,NULL,'1',NULL),('7534',1,'string','formId','7532','7532',NULL,NULL,NULL,NULL,'9bff7ec6e5d8c003824189843ed40e14',NULL),('7535',1,'string','agent','7532','7532',NULL,NULL,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PDMAN_DB_VERSION`
--

DROP TABLE IF EXISTS `PDMAN_DB_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PDMAN_DB_VERSION` (
  `DB_VERSION` varchar(256) DEFAULT NULL,
  `VERSION_DESC` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PDMAN_DB_VERSION`
--

LOCK TABLES `PDMAN_DB_VERSION` WRITE;
/*!40000 ALTER TABLE `PDMAN_DB_VERSION` DISABLE KEYS */;
INSERT INTO `PDMAN_DB_VERSION` VALUES ('v0.0.0','é»˜è®¤ç‰ˆæœ¬ï¼Œæ–°å¢žçš„ç‰ˆæœ¬ä¸èƒ½ä½ŽäºŽæ­¤ç‰ˆæœ¬','2020-10-19 16:12:42'),('v1.0.7','åˆå§‹åŒ–','2020-10-19 16:12:47');
/*!40000 ALTER TABLE `PDMAN_DB_VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('quartzScheduler','STATE_ACCESS'),('quartzScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('quartzScheduler','Alex1612183426672',1612226514063,10000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_admin_role`
--

DROP TABLE IF EXISTS `t_rbac_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_admin_role` (
  `admin_role_id` varchar(32) NOT NULL COMMENT 'ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»id',
  `admin_id` varchar(32) NOT NULL COMMENT 'ç®¡ç†å‘˜id',
  `role_id` varchar(32) NOT NULL COMMENT 'è§’è‰²id',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`admin_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æƒé™ç®¡ç†-ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_admin_role`
--

LOCK TABLES `t_rbac_admin_role` WRITE;
/*!40000 ALTER TABLE `t_rbac_admin_role` DISABLE KEYS */;
INSERT INTO `t_rbac_admin_role` VALUES ('6356cc1b790ca3e48fc4959693849755','0fbb5571d64d1f627f694e3fb5b2cb6d','d1fbe54bd21162891fd5e3e9498a238e','475B24EB704145D3B858AD8F76D98BBE','2020-11-25 21:58:16',NULL,NULL,'1');
/*!40000 ALTER TABLE `t_rbac_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_menu`
--

DROP TABLE IF EXISTS `t_rbac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_menu` (
  `menu_id` varchar(32) NOT NULL COMMENT 'èœå•id',
  `menu_pid` varchar(32) NOT NULL COMMENT 'èœå•ä¸Šçº§id',
  `menu_name` varchar(32) NOT NULL DEFAULT '0' COMMENT 'èœå•åç§°',
  `menu_url` varchar(32) NOT NULL COMMENT 'å‰ç«¯url',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆ',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æƒé™ç®¡ç†-èœå•è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_menu`
--

LOCK TABLES `t_rbac_menu` WRITE;
/*!40000 ALTER TABLE `t_rbac_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_rbac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_menu_role`
--

DROP TABLE IF EXISTS `t_rbac_menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_menu_role` (
  `menu_role_id` varchar(32) NOT NULL COMMENT 'èœå•ä¸Žè§’è‰²å…³ç³»id',
  `menu_id` varchar(32) NOT NULL COMMENT 'èœå•id',
  `role_id` varchar(32) NOT NULL COMMENT 'è§’è‰²id',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`menu_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æƒé™ç®¡ç†-èœå•ä¸Žè§’è‰²å…³ç³»è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_menu_role`
--

LOCK TABLES `t_rbac_menu_role` WRITE;
/*!40000 ALTER TABLE `t_rbac_menu_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_rbac_menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_permission`
--

DROP TABLE IF EXISTS `t_rbac_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_permission` (
  `permission_id` varchar(32) NOT NULL COMMENT 'æƒé™id',
  `permission_name` varchar(128) NOT NULL COMMENT 'æƒé™åç§°',
  `permission_url` varchar(128) NOT NULL COMMENT 'æƒé™url',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æƒé™ç®¡ç†-æƒé™è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_permission`
--

LOCK TABLES `t_rbac_permission` WRITE;
/*!40000 ALTER TABLE `t_rbac_permission` DISABLE KEYS */;
INSERT INTO `t_rbac_permission` VALUES ('084fe46e0d6d6be92a8e34a054289309','ç®¡ç†å‘˜-æ·»åŠ ','/bg/admin/add','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('1c88a42e9f1b04e3adeb82076900173e','è§’è‰²-èŽ·å–è§’è‰²åˆ†é¡µåˆ—è¡¨','/bg/role/getPageList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('2a4c229da1bd74d5c0d99a3ccf03846a','ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»-æ‰¹é‡æ·»åŠ ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»','/bg/adminRole/batchInsert','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('37b314086e00f8616621c2692b208da7','ç®¡ç†å‘˜-é€šè¿‡ç®¡ç†å‘˜idèŽ·å–ç®¡ç†å‘˜ä¿¡æ¯','/bg/admin/info/{id}','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('3c2c18f53e5ccf787305fa49d18fe629','èœå•-ç¼–è¾‘èœå•','/bg/menu/edit','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('3e25c1daf3493c49fb5661e502e41f05','è§’è‰²ä¸Žæƒé™å…³ç³»-æ ¹æ®è§’è‰²idèŽ·å¾—å·²åˆ†é…æƒé™åˆ—è¡¨','/bg/rolePermission/getRoleAssignData','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('63ccc96ebbc222d9ab2e5f24d56de824','ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»-æ‰¹é‡åˆ é™¤ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»','/bg/adminRole/batchDelete','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('63ea7c040138bfeedd25b3f03fdb9db0','èœå•-æ·»åŠ èœå•','/bg/menu/add','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('64145468aed63bfe424db3d19b213439','ç®¡ç†å‘˜-æ ¹æ®ç®¡ç†å‘˜idæ‰¹é‡åˆ é™¤','/bg/admin/batchDeleteByIds','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('7170c0e59681a2504980590468e94ea2','è§’è‰²-ç¼–è¾‘','/bg/role/edit','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:49','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('7b85682b8f8a632fcecf185e82b6b424','æƒé™ç›¸å…³-æ›´æ–°æƒé™æºæ•°æ®','/bg/permission/editPermissionData','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('7c6f674d7d331cb1f974836a5834dd2e','è§’è‰²ä¸Žæƒé™å…³ç³»-æ‰¹é‡æ·»åŠ è§’è‰²ä¸Žæƒé™å…³ç³»','/bg/rolePermission/batchInsert','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('880cd38734d2c0077ddd4c04cebdcd8a','ç®¡ç†å‘˜-æ ¹æ®ç®¡ç†å‘˜idæ‰¹é‡ç¦ç”¨è´¦å·','/bg/admin/batchUpdateDisableByIds','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('8aaf66c416c242192e595d9d4ed86c07','è§’è‰²ä¸Žèœå•å…³ç³»-æ ¹æ®è§’è‰²idèŽ·å¾—æœªåˆ†é…èœå•åˆ—è¡¨','/bg/menuRole/getRoleNoAssignMenuList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('8d61aae05533e2529a2bfd28feb326ca','èœå•-æ ¹æ®èœå•idèŽ·å–èœå•è¯¦æƒ…','/bg/menu/info/{id}','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('9c6ddc480b08857b7e5c53c78f482cb4','è§’è‰²ä¸Žæƒé™å…³ç³»-æ ¹æ®è§’è‰²idèŽ·å¾—æœªåˆ†é…æƒé™åˆ—è¡¨','/bg/rolePermission/getUserNoAssignRoleList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('9d8cc6ca31e60bbdc2a58d5e8561509b','èœå•-èŽ·å–èœå•åˆ†é¡µåˆ—è¡¨','/bg/menu/getPageList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('9f669affb59f5a0ef69ed25c58c0d856','è§’è‰²-é€šè¿‡è§’è‰²idæ‰¹é‡åˆ é™¤','/bg/role/batchDeleteByIds','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('ad287ab388191a7040cd4bf8ba0cb904','è§’è‰²ä¸Žæƒé™å…³ç³»-æ‰¹é‡åˆ é™¤è§’è‰²ä¸Žæƒé™å…³ç³»','/bg/rolePermission/batchDelete','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('aeed7b8f89eef386ebe356ac5125db69','è§’è‰²-æ·»åŠ ','/bg/role/add','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('b28f95aefc23240ef88a7aa01e8ee3b0','ç®¡ç†å‘˜-æ ¹æ®ç®¡ç†å‘˜idæ‰¹é‡å¯ç”¨è´¦å·','/bg/admin/batchUpdateIsEnableByIds','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('b2b8ed4009317883d64e82a5ea6eac71','ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»-èŽ·å¾—å¯¹åº”ç”¨æˆ·æœªåˆ†é…è§’è‰²åˆ—è¡¨','/bg/adminRole/getUserNoAssignRoleList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('c11e7874f5ebaddff078d8132ef75e8b','èœå•-ç¼–è¾‘èœå•','/bg/menu/batchDeleteByIds','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('ca4e3fd20f35c87b65d669fb8aadb8bb','ç®¡ç†å‘˜-ç¼–è¾‘','/bg/admin/edit','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('da832f3ecb2795de57db74918e15ccda','ç®¡ç†å‘˜-èŽ·å–ç®¡ç†å‘˜åˆ†é¡µåˆ—è¡¨','/bg/admin/getPageList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('e3b508e69fb1dead7489a44a9baf062e','è§’è‰²ä¸Žèœå•å…³ç³»-æ‰¹é‡æ·»åŠ è§’è‰²ä¸Žèœå•å…³ç³»','/bg/menuRole/batchInsert','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('e4fcdbfb3c943d08c17cc915cb8c7234','è§’è‰²-èŽ·å–è§’è‰²idèŽ·å–è§’è‰²è¯¦æƒ…','/bg/role/info/{id}','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('e70ef087aebe823bffd3c34071e55b26','è§’è‰²ä¸Žèœå•å…³ç³»-æ‰¹é‡åˆ é™¤è§’è‰²ä¸Žèœå•å…³ç³»','/bg/menuRole/batchDelete','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:49','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('eae3fe43cc42784993bc3bcdfa0b807b','è§’è‰²ä¸Žèœå•å…³ç³»-æ ¹æ®è§’è‰²idèŽ·å¾—å·²åˆ†é…èœå•åˆ—è¡¨','/bg/menuRole/getRoleHasAssignMenuList','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1'),('fb6b9b5aa54d20f0ffa5cd0eb4e620e6','ç®¡ç†å‘˜ä¸Žè§’è‰²å…³ç³»-èŽ·å¾—å¯¹åº”ç”¨æˆ·å·²åˆ†é…è§’è‰²åˆ—è¡¨','/bg/adminRole/getRoleAssignData','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:48:50','475B24EB704145D3B858AD8F76D98BBE','2020-10-22 09:52:14','1');
/*!40000 ALTER TABLE `t_rbac_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_role`
--

DROP TABLE IF EXISTS `t_rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_role` (
  `role_id` varchar(32) NOT NULL COMMENT 'è§’è‰²id',
  `role_name` varchar(128) NOT NULL COMMENT 'è§’è‰²åç§°',
  `role_description` varchar(512) NOT NULL COMMENT 'è§’è‰²æè¿°',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æƒé™ç®¡ç†-è§’è‰²è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_role`
--

LOCK TABLES `t_rbac_role` WRITE;
/*!40000 ALTER TABLE `t_rbac_role` DISABLE KEYS */;
INSERT INTO `t_rbac_role` VALUES ('d1fbe54bd21162891fd5e3e9498a238e','ç®¡ç†å‘˜åˆ—è¡¨æƒé™','ç®¡ç†å‘˜åˆ—è¡¨æƒé™','475B24EB704145D3B858AD8F76D98BBE','2020-11-25 21:55:40',NULL,NULL,'1');
/*!40000 ALTER TABLE `t_rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_role_permission`
--

DROP TABLE IF EXISTS `t_rbac_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_role_permission` (
  `role_permission_id` varchar(32) NOT NULL COMMENT 'è§’è‰²ä¸Žæƒé™å…³ç³»id',
  `role_id` varchar(32) NOT NULL COMMENT 'è§’è‰²id',
  `permission_id` varchar(32) NOT NULL COMMENT 'æƒé™id',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`role_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æƒé™ç®¡ç†-è§’è‰²ä¸Žæƒé™å…³ç³»è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_role_permission`
--

LOCK TABLES `t_rbac_role_permission` WRITE;
/*!40000 ALTER TABLE `t_rbac_role_permission` DISABLE KEYS */;
INSERT INTO `t_rbac_role_permission` VALUES ('1377f520e0b91aad3dbd7e2b6b5b2c20','d1fbe54bd21162891fd5e3e9498a238e','da832f3ecb2795de57db74918e15ccda','475B24EB704145D3B858AD8F76D98BBE','2020-11-25 21:57:12',NULL,NULL,'1');
/*!40000 ALTER TABLE `t_rbac_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_admin`
--

DROP TABLE IF EXISTS `t_s_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_s_admin` (
  `admin_id` varchar(32) NOT NULL COMMENT 'ç®¡ç†å‘˜id',
  `login_account` varchar(32) NOT NULL COMMENT 'ç™»å½•è´¦å·',
  `real_name` varchar(128) NOT NULL COMMENT 'çœŸå®žåç§°',
  `pwd` varchar(128) NOT NULL COMMENT 'å¯†ç ',
  `is_enabled` varchar(1) NOT NULL DEFAULT '1' COMMENT 'è´¦å·æ˜¯å¦å¯ç”¨',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŽå°ç®¡ç†å‘˜è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_admin`
--

LOCK TABLES `t_s_admin` WRITE;
/*!40000 ALTER TABLE `t_s_admin` DISABLE KEYS */;
INSERT INTO `t_s_admin` VALUES ('02b5b04aa98662d70ad1ef3f1bba72ef','test3','ceshi3','$2a$10$L4LDeiLG7E1VBjCVR2vLh.IA9dunWvap0sh.MEcuCsg8XxcxrJuyq','1','1','475B24EB704145D3B858AD8F76D98BBE','2020-11-26 09:08:38',NULL,NULL),('0fbb5571d64d1f627f694e3fb5b2cb6d','test','ceshi1','$2a$10$N3W53f17xblFR0k8EdCemewyHNlD3H0WmiMtU4Pd2y6gUd1WbjEwi','1','1','475B24EB704145D3B858AD8F76D98BBE','2020-11-25 21:54:09',NULL,NULL),('475B24EB704145D3B858AD8F76D98BBE','admin','è¶…çº§ç®¡ç†å‘˜','$2a$10$N3W53f17xblFR0k8EdCemewyHNlD3H0WmiMtU4Pd2y6gUd1WbjEwi','1','1','475B24EB704145D3B858AD8F76D98BBE','2020-10-19 16:14:24',NULL,NULL),('5a2a0f7706fe498e2c59d4819f767f97','test4','ceshi4','$2a$10$nhgVMlDkEcHR5Cw/q/6qJeEjg2I0uHEfJSkpBA6p1Ghuk6/KXe.fe','1','1','0fbb5571d64d1f627f694e3fb5b2cb6d','2020-12-04 12:20:34',NULL,NULL),('ee896c8bab822d1f9018c599087ca7b1','test2','ceshi2','$2a$10$MfEw327dxEkDtoWN0n4jh.DUimuYNAPceZpmabr13zkwCXNPHd.6m','1','1','475B24EB704145D3B858AD8F76D98BBE','2020-11-25 22:00:02',NULL,NULL);
/*!40000 ALTER TABLE `t_s_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_task`
--

DROP TABLE IF EXISTS `t_s_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_s_task` (
  `task_id` varchar(32) NOT NULL COMMENT 'ä»»åŠ¡id',
  `name` varchar(64) NOT NULL COMMENT 'ä»»åŠ¡åç§°',
  `description` varchar(128) NOT NULL COMMENT 'ä»»åŠ¡æè¿°',
  `remark` varchar(128) DEFAULT NULL COMMENT 'ä»»åŠ¡å¤‡æ³¨',
  `execution_time` varchar(32) NOT NULL COMMENT 'æ‰§è¡Œæ—¶é—´cronè¡¨è¾¾å¼',
  `execution_class_name` varchar(128) DEFAULT NULL COMMENT 'æ‰§è¡Œç±»åç§°',
  `status` int NOT NULL DEFAULT '1' COMMENT 'ä»»åŠ¡çŠ¶æ€(0: æš‚åœ 1:å¯åŠ¨)',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿå®šæ—¶ä»»åŠ¡è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_task`
--

LOCK TABLES `t_s_task` WRITE;
/*!40000 ALTER TABLE `t_s_task` DISABLE KEYS */;
INSERT INTO `t_s_task` VALUES ('404e9cad6f7c592abfd8db1460c3fead','æµ‹è¯•ä»»åŠ¡','æµ‹è¯•1','æµ‹è¯•å¤‡æ³¨','0 */1 * * * ?','com.lylbp.oa.task.TestTask',0,'475B24EB704145D3B858AD8F76D98BBE','2020-10-20 08:48:23','475B24EB704145D3B858AD8F76D98BBE','2020-10-20 09:03:48','1'),('92499f6683a3076f16dd023155bb2f8a','æµ‹è¯•ä»»åŠ¡','æµ‹è¯•2','æµ‹è¯•å¤‡æ³¨','*/5 * * * * ?','com.lylbp.oa.task.TestTask',1,'475B24EB704145D3B858AD8F76D98BBE','2020-10-19 16:46:29','475B24EB704145D3B858AD8F76D98BBE','2020-10-19 17:16:50','0'),('db4b0a1b6d18f56d6ab66241b5466cd2','æµ‹è¯•ä»»åŠ¡','æµ‹è¯•3','æµ‹è¯•å¤‡æ³¨','*/5 * * * * ?','com.lylbp.oa.task.TestTask',1,'475B24EB704145D3B858AD8F76D98BBE','2020-10-19 16:15:35','475B24EB704145D3B858AD8F76D98BBE','2020-10-19 16:19:55','0');
/*!40000 ALTER TABLE `t_s_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_type`
--

DROP TABLE IF EXISTS `t_s_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_s_type` (
  `type_id` varchar(32) NOT NULL COMMENT 'å­—å…¸è¡¨id',
  `type_code` varchar(32) NOT NULL COMMENT 'å­—å…¸ä»£ç ',
  `type_name` varchar(32) NOT NULL COMMENT 'å­—å…¸åç§°',
  `type_description` varchar(32) NOT NULL COMMENT 'å­—å…¸æè¿°',
  `type_group_code` varchar(32) NOT NULL COMMENT 'å­—å…¸é¡¹ä»£ç ',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å­—å…¸è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_type`
--

LOCK TABLES `t_s_type` WRITE;
/*!40000 ALTER TABLE `t_s_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_type_group`
--

DROP TABLE IF EXISTS `t_s_type_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_s_type_group` (
  `type_group_id` varchar(32) NOT NULL COMMENT 'å­—å…¸é¡¹id',
  `type_group_code` varchar(32) NOT NULL COMMENT 'å­—å…¸é¡¹ä»£ç ',
  `type_group_name` varchar(32) NOT NULL COMMENT 'å­—å…¸é¡¹åç§°',
  `create_by` varchar(32) NOT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(32) DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_valid` varchar(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦æœ‰æ•ˆæ•°æ®',
  PRIMARY KEY (`type_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å­—å…¸é¡¹è¡¨ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_type_group`
--

LOCK TABLES `t_s_type_group` WRITE;
/*!40000 ALTER TABLE `t_s_type_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_type_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-02 16:40:21
