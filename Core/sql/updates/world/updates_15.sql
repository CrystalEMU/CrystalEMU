DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7608,7609);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7608,7609);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7608,12,0,0, ''),
(7608,13,8,0, ''),
(7609,12,1,0, ''),
(7609,13,20,0, '');
-- Missing database loot entries for Mature Lasher
SET @lasher := 34300;
DELETE FROM `creature_loot_template` WHERE `entry`=@lasher;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(@lasher,37704,100,1,0,1,3), -- Crystalised Life
(@lasher,43324,-75,1,0,1,1), -- Alliance Herb Pouch
(@lasher,44809,-75,1,0,1,1), -- Horde Herb Pouch 
(@lasher,44774,80,1,0,1,1), -- Ice-Piercing Thorn
(@lasher,44775,20,1,0,1,1); -- Revolting Flower

-- Missing database harvest loot entries for Mature and Living Lasher
UPDATE `creature_template` SET `skinloot`=80007 WHERE `entry` IN (34300,30845);
-- Add Spectral Gyphron to Wintergrasp
DELETE FROM `spell_area` WHERE `spell`=55164 AND `area`=4197;
INSERT INTO `spell_area` 
(`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`,`autocast`) 
VALUES
(55164,4197,0,0,8326,65527,2,1);
SET @GUID := 152021 ; -- Set GUID

SET @BG_Zar := 32832;
SET @Moonstrike := 32834;
SET @ZomBocom := 31865;
SET @Xazi := 31864;
SET @Nargle := 31863;
SET @Krezzik := 32405;
SET @Argex := 32407;
SET @Thunderhorn := 32383;
SET @Doris := 32385;
SET @Tristia := 32380;
SET @Dirgehammer := 32381;

DELETE FROM `creature` WHERE `id` IN (@BG_Zar,@Moonstrike,@ZomBocom,@Xazi,@Nargle,@Krezzik,@Argex,@Thunderhorn,@Doris,@Tristia,@Dirgehammer);
INSERT INTO creature
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES
(@GUID,@Nargle,571,1,1,26463,0,5753.74,585.413,615.052,0,180,0,0,1,0,0,0,0,0,0), -- Nargle Lashcord
(@GUID+1,@Argex,1,1,1,27953,0,-7123.33,-3766.68,9.40339,0,180,0,0,1,0,0,0,0,0,0), -- Argex Irongut
(@GUID+2,@Krezzik,530,1,1,0,0,3066.45,3638.87,145.218,0.875901,120,0,0,1,0,0,0,0,0,0), -- Krezzik the Striker
(@GUID+3,@Xazi,571,1,1,26464,0,5751.54,584.66,615.052,0,180,0,0,1,0,0,0,0,0,0), -- Xazi Smolderpipe
(@GUID+4,@ZomBocom,571,1,1,26465,0,5751.73,582.943,615.052,0,180,0,0,1,0,0,0,0,0,0), -- Zom Bocom
(@GUID+5,@Doris,1,1,1,0,0,1673.07,-4201.89,56.3826,3.62927,25,0,0,55888,0,0,0,0,0,0), -- Doris
(@GUID+6,@BG_Zar,1,1,1,0,0,1670.17,-4199.26,56.3827,3.98664,25,0,0,11828,0,0,0,0,0,0), -- BG_Zar
(@GUID+7,@Thunderhorn,1,1,1,0,0,1669.09,-4196.78,56.3827,4.10416,25,0,0,11828,0,0,0,0,0,0), -- Thunderhorn
(@GUID+8,@Moonstrike,0,1,1,28301,0,-8775.85,423.96,105.233,5.73298,180,0,0,11828,0,0,0,0,0,0), -- Moonstrike
(@GUID+9,@Tristia,0,1,1,21512,0,-8773.78,425.804,105.233,4.80621,180,0,0,11828,0,0,0,0,0,0), -- Tristia
(@GUID+10,@Dirgehammer,0,1,1,12917,0,-8781.18,419.883,105.233,6.18459,180,0,0,7048,0,0,0,0,0,0); -- Dirgehammer

DELETE FROM `game_event_creature` WHERE `eventEntry`=57;
INSERT INTO `game_event_creature` (`guid`,`eventEntry`) VALUES
(@GUID,57), -- Nargle Lashcord (31863)
(@GUID+1,57), -- Argex Irongut (32407)
(@GUID+2,57), -- Krezzik the Striker (32405)
(@GUID+3,57), -- Xazi Smolderpipe (31864)
(@GUID+4,57), -- Zom Bocom (31865)
(@GUID+5,57), -- Doris Volanthius (32385)
(@GUID+6,57), -- Blood Guard Zar'shi (32832)
(@GUID+7,57), -- Sergeant Thunderhorn (32383)
(@GUID+8,57), -- Knight Lieutenant Moonstrike (32834)
(@GUID+9,57), -- Lieutenant Tristia (32380)
(@GUID+10,57); -- Captain Dirgehammer (32381)
-- ----------------------
-- -- Vendor Templates --
-- ---------------------- 
SET @31600HP := 2560;
SET @38000HP := 2561;
SET @1660RT_39400HP := 2564;
SET @1750RT_47400HP := 2565;
SET @1600RT_47400HP := 2566;
SET @1690RT_47400HP := 2567;
SET @49600HP := 2559;
SET @50000HP := 2570;
SET @60000HP := 2569;
SET @1800RT_62000HP := 2568;
SET @1720RT_62000HP := 2563;
SET @1630RT_62000HP := 2562;
SET @7200HP_200AP := 2443;
SET @9600HP_275AP := 2445;
SET @12000HP_350AP := 2440;
SET @1615RT_7200HP_400AP := 2452;
SET @1775RT_9600HP_550AP := 2459;
SET @1645RT_12000HP_700AP := 2454;
SET @1735RT_12000HP_700AP := 2453;
SET @1675RT_12000HP_700AP := 2451;
SET @1930RT_2250AP := 2469;
SET @1930RT_1200AP := 2468;
SET @1930RT_4500AP := 2460;
SET @1930RT_3150AP := 2466;
SET @1750RT_1350AP := 2463;
SET @2050RT_1750AP := 2470;
SET @1810RT_2250AP := 2465;
SET @1870RT_2250AP := 2462;
SET @1990RT_2250AP := 2464;

-- Vendor Defines:
SET @BG_Zar := 32832; -- (34061/34062/34063) as s6/s7/s8?
SET @Moonstrike := 32834; -- (34082/34083/34084) as s6/s7/s8?
SET @ZomBocom := 31865; -- (or 29541 or 40205)
SET @Xazi := 31864; -- (or 29540 or 40210)
SET @Nargle := 31863; -- (or 29539 or 40211)
SET @Kezzik := 32405; -- (or 32356 or 40207)
SET @Argex := 32407; -- (or 32359 or 40215)
SET @Thunderhorn := 32383; -- (most likely) (34036/34037/34038) as s6/s7/s8?
SET @Doris := 32385; -- (most likely) (34058/34059/34060) as s6/s7/s8?
SET @Tristia := 32380; -- (most likely) (34076,34077,34078) as s6/s7/s8?

DELETE FROM `npc_vendor` WHERE `entry` IN (@BG_Zar,@Moonstrike,@ZomBocom,@Xazi,@Nargle,@Kezzik,@Argex,@Thunderhorn,@Doris,@Tristia);
INSERT INTO `npc_vendor` 
(`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`)
VALUES 
-- Spacer
(@BG_Zar,0,40779,0,0,@60000HP), -- Savage Gladiator Chest DK
(@BG_Zar,0,40799,0,0,@50000HP), -- Savage Gladiator Gloves DK
(@BG_Zar,0,40817,0,0,@60000HP), -- Savage Gladiator Helm DK
(@BG_Zar,0,40837,0,0,@60000HP), -- Savage Gladiator Legs DK
(@BG_Zar,0,40857,0,0,@50000HP), -- Savage Gladiator Shoulders DK
(@BG_Zar,0,41272,0,0,@60000HP), -- Savage Gladiator Chest Druid1
(@BG_Zar,0,41268,0,0,@50000HP), -- Savage Gladiator Gloves Druid1
(@BG_Zar,0,41269,0,0,@60000HP), -- Savage Gladiator Helm Druid1
(@BG_Zar,0,41270,0,0,@60000HP), -- Savage Gladiator Legs Druid1
(@BG_Zar,0,41271,0,0,@50000HP), -- Savage Gladiator Shoulders Druid1
(@BG_Zar,0,41658,0,0,@60000HP), -- Savage Gladiator Chest Druid2
(@BG_Zar,0,41770,0,0,@50000HP), -- Savage Gladiator Gloves Druid2
(@BG_Zar,0,41675,0,0,@60000HP), -- Savage Gladiator Helm Druid2
(@BG_Zar,0,41664,0,0,@60000HP), -- Savage Gladiator Legs Druid2
(@BG_Zar,0,41712,0,0,@50000HP), -- Savage Gladiator Shoulders Druid2
(@BG_Zar,0,41313,0,0,@60000HP), -- Savage Gladiator Chest Druid3
(@BG_Zar,0,41290,0,0,@50000HP), -- Savage Gladiator Gloves Druid3
(@BG_Zar,0,41324,0,0,@60000HP), -- Savage Gladiator Helm Druid3
(@BG_Zar,0,41301,0,0,@60000HP), -- Savage Gladiator Legs Druid3
(@BG_Zar,0,41278,0,0,@50000HP), -- Savage Gladiator Shoulders Druid3
(@BG_Zar,0,41084,0,0,@60000HP), -- Savage Gladiator Chest Hunter
(@BG_Zar,0,41140,0,0,@50000HP), -- Savage Gladiator Gloves Hunter
(@BG_Zar,0,41154,0,0,@60000HP), -- Savage Gladiator Helm Hunter
(@BG_Zar,0,41202,0,0,@60000HP), -- Savage Gladiator Legs Hunter
(@BG_Zar,0,41214,0,0,@50000HP), -- Savage Gladiator Shoulders Hunter
(@BG_Zar,0,41949,0,0,@60000HP), -- Savage Gladiator Chest Mage
(@BG_Zar,0,41968,0,0,@50000HP), -- Savage Gladiator Gloves Mage
(@BG_Zar,0,41943,0,0,@60000HP), -- Savage Gladiator Helm Mage
(@BG_Zar,0,41956,0,0,@60000HP), -- Savage Gladiator Legs Mage
(@BG_Zar,0,41962,0,0,@50000HP), -- Savage Gladiator Shoulders Mage
(@BG_Zar,0,40898,0,0,@60000HP), -- Savage Gladiator Chest Paladin1
(@BG_Zar,0,40918,0,0,@50000HP), -- Savage Gladiator Gloves Paladin1
(@BG_Zar,0,40930,0,0,@60000HP), -- Savage Gladiator Helm Paladin1
(@BG_Zar,0,40936,0,0,@60000HP), -- Savage Gladiator Legs Paladin1
(@BG_Zar,0,40960,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin1
(@BG_Zar,0,40780,0,0,@60000HP), -- Savage Gladiator Chest Paladin2
(@BG_Zar,0,40798,0,0,@50000HP), -- Savage Gladiator Gloves Paladin2
(@BG_Zar,0,40818,0,0,@60000HP), -- Savage Gladiator Helm Paladin2
(@BG_Zar,0,40838,0,0,@60000HP), -- Savage Gladiator Legs Paladin2
(@BG_Zar,0,40858,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin2
(@BG_Zar,0,41851,0,0,@60000HP), -- Savage Gladiator Chest Priest1
(@BG_Zar,0,41847,0,0,@50000HP), -- Savage Gladiator Gloves Priest1
(@BG_Zar,0,41848,0,0,@60000HP), -- Savage Gladiator Helm Priest1
(@BG_Zar,0,41849,0,0,@60000HP), -- Savage Gladiator Legs Priest1
(@BG_Zar,0,41850,0,0,@50000HP), -- Savage Gladiator Shoulders Priest1
(@BG_Zar,0,41918,0,0,@60000HP), -- Savage Gladiator Chest Priest2
(@BG_Zar,0,41937,0,0,@50000HP), -- Savage Gladiator Gloves Priest2
(@BG_Zar,0,41912,0,0,@60000HP), -- Savage Gladiator Helm Priest2
(@BG_Zar,0,41924,0,0,@60000HP), -- Savage Gladiator Legs Priest2
(@BG_Zar,0,41930,0,0,@50000HP), -- Savage Gladiator Shoulders Priest2
(@BG_Zar,0,41647,0,0,@60000HP), -- Savage Gladiator Chest Rogue
(@BG_Zar,0,41643,0,0,@50000HP), -- Savage Gladiator Gloves Rogue
(@BG_Zar,0,41644,0,0,@60000HP), -- Savage Gladiator Helm Rogue
(@BG_Zar,0,41645,0,0,@60000HP), -- Savage Gladiator Legs Rogue
(@BG_Zar,0,41646,0,0,@50000HP), -- Savage Gladiator Shoulders Rogue
(@BG_Zar,0,41078,0,0,@60000HP), -- Savage Gladiator Chest Shaman1
(@BG_Zar,0,41134,0,0,@50000HP), -- Savage Gladiator Gloves Shaman1
(@BG_Zar,0,41148,0,0,@60000HP), -- Savage Gladiator Helm Shaman1
(@BG_Zar,0,41160,0,0,@60000HP), -- Savage Gladiator Legs Shaman1
(@BG_Zar,0,41208,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman1
(@BG_Zar,0,40987,0,0,@60000HP), -- Savage Gladiator Chest Shaman2
(@BG_Zar,0,41004,0,0,@50000HP), -- Savage Gladiator Gloves Shaman2
(@BG_Zar,0,41016,0,0,@60000HP), -- Savage Gladiator Helm Shaman2
(@BG_Zar,0,41030,0,0,@60000HP), -- Savage Gladiator Legs Shaman2
(@BG_Zar,0,41041,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman2
(@BG_Zar,0,40986,0,0,@60000HP), -- Savage Gladiator Chest Shaman3
(@BG_Zar,0,40998,0,0,@50000HP), -- Savage Gladiator Gloves Shaman3
(@BG_Zar,0,41010,0,0,@60000HP), -- Savage Gladiator Helm Shaman3
(@BG_Zar,0,41023,0,0,@60000HP), -- Savage Gladiator Legs Shaman3
(@BG_Zar,0,41024,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman3
(@BG_Zar,0,41996,0,0,@60000HP), -- Savage Gladiator Chest Warlock
(@BG_Zar,0,42014,0,0,@50000HP), -- Savage Gladiator Gloves Warlock
(@BG_Zar,0,41990,0,0,@60000HP), -- Savage Gladiator Helm Warlock
(@BG_Zar,0,42002,0,0,@60000HP), -- Savage Gladiator Legs Warlock
(@BG_Zar,0,42008,0,0,@50000HP), -- Savage Gladiator Shoulders Warlock
(@BG_Zar,0,40778,0,0,@60000HP), -- Savage Gladiator Chest Warrior
(@BG_Zar,0,40797,0,0,@50000HP), -- Savage Gladiator Gloves Warrior
(@BG_Zar,0,40816,0,0,@60000HP), -- Savage Gladiator Helm Warrior
(@BG_Zar,0,40836,0,0,@60000HP), -- Savage Gladiator Legs Warrior
(@BG_Zar,0,40856,0,0,@50000HP), -- Savage Gladiator Shoulders Warrior
-- Spacer
(@Moonstrike,0,40779,0,0,@60000HP), -- Savage Gladiator Chest DK
(@Moonstrike,0,40799,0,0,@50000HP), -- Savage Gladiator Gloves DK
(@Moonstrike,0,40817,0,0,@60000HP), -- Savage Gladiator Helm DK
(@Moonstrike,0,40837,0,0,@60000HP), -- Savage Gladiator Legs DK
(@Moonstrike,0,40857,0,0,@50000HP), -- Savage Gladiator Shoulders DK
(@Moonstrike,0,41272,0,0,@60000HP), -- Savage Gladiator Chest Druid1
(@Moonstrike,0,41268,0,0,@50000HP), -- Savage Gladiator Gloves Druid1
(@Moonstrike,0,41269,0,0,@60000HP), -- Savage Gladiator Helm Druid1
(@Moonstrike,0,41270,0,0,@60000HP), -- Savage Gladiator Legs Druid1
(@Moonstrike,0,41271,0,0,@50000HP), -- Savage Gladiator Shoulders Druid1
(@Moonstrike,0,41658,0,0,@60000HP), -- Savage Gladiator Chest Druid2
(@Moonstrike,0,41770,0,0,@50000HP), -- Savage Gladiator Gloves Druid2
(@Moonstrike,0,41675,0,0,@60000HP), -- Savage Gladiator Helm Druid2
(@Moonstrike,0,41664,0,0,@60000HP), -- Savage Gladiator Legs Druid2
(@Moonstrike,0,41712,0,0,@50000HP), -- Savage Gladiator Shoulders Druid2
(@Moonstrike,0,41313,0,0,@60000HP), -- Savage Gladiator Chest Druid3
(@Moonstrike,0,41290,0,0,@50000HP), -- Savage Gladiator Gloves Druid3
(@Moonstrike,0,41324,0,0,@60000HP), -- Savage Gladiator Helm Druid3
(@Moonstrike,0,41301,0,0,@60000HP), -- Savage Gladiator Legs Druid3
(@Moonstrike,0,41278,0,0,@50000HP), -- Savage Gladiator Shoulders Druid3
(@Moonstrike,0,41084,0,0,@60000HP), -- Savage Gladiator Chest Hunter
(@Moonstrike,0,41140,0,0,@50000HP), -- Savage Gladiator Gloves Hunter
(@Moonstrike,0,41154,0,0,@60000HP), -- Savage Gladiator Helm Hunter
(@Moonstrike,0,41202,0,0,@60000HP), -- Savage Gladiator Legs Hunter
(@Moonstrike,0,41214,0,0,@50000HP), -- Savage Gladiator Shoulders Hunter
(@Moonstrike,0,41949,0,0,@60000HP), -- Savage Gladiator Chest Mage
(@Moonstrike,0,41968,0,0,@50000HP), -- Savage Gladiator Gloves Mage
(@Moonstrike,0,41943,0,0,@60000HP), -- Savage Gladiator Helm Mage
(@Moonstrike,0,41956,0,0,@60000HP), -- Savage Gladiator Legs Mage
(@Moonstrike,0,41962,0,0,@50000HP), -- Savage Gladiator Shoulders Mage
(@Moonstrike,0,40898,0,0,@60000HP), -- Savage Gladiator Chest Paladin1
(@Moonstrike,0,40918,0,0,@50000HP), -- Savage Gladiator Gloves Paladin1
(@Moonstrike,0,40930,0,0,@60000HP), -- Savage Gladiator Helm Paladin1
(@Moonstrike,0,40936,0,0,@60000HP), -- Savage Gladiator Legs Paladin1
(@Moonstrike,0,40960,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin1
(@Moonstrike,0,40780,0,0,@60000HP), -- Savage Gladiator Chest Paladin2
(@Moonstrike,0,40798,0,0,@50000HP), -- Savage Gladiator Gloves Paladin2
(@Moonstrike,0,40818,0,0,@60000HP), -- Savage Gladiator Helm Paladin2
(@Moonstrike,0,40838,0,0,@60000HP), -- Savage Gladiator Legs Paladin2
(@Moonstrike,0,40858,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin2
(@Moonstrike,0,41851,0,0,@60000HP), -- Savage Gladiator Chest Priest1
(@Moonstrike,0,41847,0,0,@50000HP), -- Savage Gladiator Gloves Priest1
(@Moonstrike,0,41848,0,0,@60000HP), -- Savage Gladiator Helm Priest1
(@Moonstrike,0,41849,0,0,@60000HP), -- Savage Gladiator Legs Priest1
(@Moonstrike,0,41850,0,0,@50000HP), -- Savage Gladiator Shoulders Priest1
(@Moonstrike,0,41918,0,0,@60000HP), -- Savage Gladiator Chest Priest2
(@Moonstrike,0,41937,0,0,@50000HP), -- Savage Gladiator Gloves Priest2
(@Moonstrike,0,41912,0,0,@60000HP), -- Savage Gladiator Helm Priest2
(@Moonstrike,0,41924,0,0,@60000HP), -- Savage Gladiator Legs Priest2
(@Moonstrike,0,41930,0,0,@50000HP), -- Savage Gladiator Shoulders Priest2
(@Moonstrike,0,41647,0,0,@60000HP), -- Savage Gladiator Chest Rogue
(@Moonstrike,0,41643,0,0,@50000HP), -- Savage Gladiator Gloves Rogue
(@Moonstrike,0,41644,0,0,@60000HP), -- Savage Gladiator Helm Rogue
(@Moonstrike,0,41645,0,0,@60000HP), -- Savage Gladiator Legs Rogue
(@Moonstrike,0,41646,0,0,@50000HP), -- Savage Gladiator Shoulders Rogue
(@Moonstrike,0,41078,0,0,@60000HP), -- Savage Gladiator Chest Shaman1
(@Moonstrike,0,41134,0,0,@50000HP), -- Savage Gladiator Gloves Shaman1
(@Moonstrike,0,41148,0,0,@60000HP), -- Savage Gladiator Helm Shaman1
(@Moonstrike,0,41160,0,0,@60000HP), -- Savage Gladiator Legs Shaman1
(@Moonstrike,0,41208,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman1
(@Moonstrike,0,40987,0,0,@60000HP), -- Savage Gladiator Chest Shaman2
(@Moonstrike,0,41004,0,0,@50000HP), -- Savage Gladiator Gloves Shaman2
(@Moonstrike,0,41016,0,0,@60000HP), -- Savage Gladiator Helm Shaman2
(@Moonstrike,0,41030,0,0,@60000HP), -- Savage Gladiator Legs Shaman2
(@Moonstrike,0,41041,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman2
(@Moonstrike,0,40986,0,0,@60000HP), -- Savage Gladiator Chest Shaman3
(@Moonstrike,0,40998,0,0,@50000HP), -- Savage Gladiator Gloves Shaman3
(@Moonstrike,0,41010,0,0,@60000HP), -- Savage Gladiator Helm Shaman3
(@Moonstrike,0,41023,0,0,@60000HP), -- Savage Gladiator Legs Shaman3
(@Moonstrike,0,41024,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman3
(@Moonstrike,0,41996,0,0,@60000HP), -- Savage Gladiator Chest Warlock
(@Moonstrike,0,42014,0,0,@50000HP), -- Savage Gladiator Gloves Warlock
(@Moonstrike,0,41990,0,0,@60000HP), -- Savage Gladiator Helm Warlock
(@Moonstrike,0,42002,0,0,@60000HP), -- Savage Gladiator Legs Warlock
(@Moonstrike,0,42008,0,0,@50000HP), -- Savage Gladiator Shoulders Warlock
(@Moonstrike,0,40778,0,0,@60000HP), -- Savage Gladiator Chest Warrior
(@Moonstrike,0,40797,0,0,@50000HP), -- Savage Gladiator Gloves Warrior
(@Moonstrike,0,40816,0,0,@60000HP), -- Savage Gladiator Helm Warrior
(@Moonstrike,0,40836,0,0,@60000HP), -- Savage Gladiator Legs Warrior
(@Moonstrike,0,40856,0,0,@50000HP), -- Savage Gladiator Shoulders Warrior
-- Double Spacer
-- Double Spacer
(@ZomBocom,0,40779,0,0,@12000HP_350AP), -- Savage Gladiator Chest DK
(@ZomBocom,0,40799,0,0,@7200HP_200AP), -- Savage Gladiator Gloves DK
(@ZomBocom,0,40817,0,0,@12000HP_350AP), -- Savage Gladiator Helm DK
(@ZomBocom,0,40837,0,0,@12000HP_350AP), -- Savage Gladiator Legs DK
(@ZomBocom,0,40857,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders DK
(@ZomBocom,0,41272,0,0,@12000HP_350AP), -- Savage Gladiator Chest Druid1
(@ZomBocom,0,41268,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Druid1
(@ZomBocom,0,41269,0,0,@12000HP_350AP), -- Savage Gladiator Helm Druid1
(@ZomBocom,0,41270,0,0,@12000HP_350AP), -- Savage Gladiator Legs Druid1
(@ZomBocom,0,41271,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Druid1
(@ZomBocom,0,41658,0,0,@12000HP_350AP), -- Savage Gladiator Chest Druid2
(@ZomBocom,0,41770,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Druid2
(@ZomBocom,0,41675,0,0,@12000HP_350AP), -- Savage Gladiator Helm Druid2
(@ZomBocom,0,41664,0,0,@12000HP_350AP), -- Savage Gladiator Legs Druid2
(@ZomBocom,0,41712,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Druid2
(@ZomBocom,0,41313,0,0,@12000HP_350AP), -- Savage Gladiator Chest Druid3
(@ZomBocom,0,41290,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Druid3
(@ZomBocom,0,41324,0,0,@12000HP_350AP), -- Savage Gladiator Helm Druid3
(@ZomBocom,0,41301,0,0,@12000HP_350AP), -- Savage Gladiator Legs Druid3
(@ZomBocom,0,41278,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Druid3
(@ZomBocom,0,41084,0,0,@12000HP_350AP), -- Savage Gladiator Chest Hunter
(@ZomBocom,0,41140,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Hunter
(@ZomBocom,0,41154,0,0,@12000HP_350AP), -- Savage Gladiator Helm Hunter
(@ZomBocom,0,41202,0,0,@12000HP_350AP), -- Savage Gladiator Legs Hunter
(@ZomBocom,0,41214,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Hunter
(@ZomBocom,0,41949,0,0,@12000HP_350AP), -- Savage Gladiator Chest Mage
(@ZomBocom,0,41968,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Mage
(@ZomBocom,0,41943,0,0,@12000HP_350AP), -- Savage Gladiator Helm Mage
(@ZomBocom,0,41956,0,0,@12000HP_350AP), -- Savage Gladiator Legs Mage
(@ZomBocom,0,41962,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Mage
(@ZomBocom,0,40898,0,0,@12000HP_350AP), -- Savage Gladiator Chest Paladin1
(@ZomBocom,0,40918,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Paladin1
(@ZomBocom,0,40930,0,0,@12000HP_350AP), -- Savage Gladiator Helm Paladin1
(@ZomBocom,0,40936,0,0,@12000HP_350AP), -- Savage Gladiator Legs Paladin1
(@ZomBocom,0,40960,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Paladin1
(@ZomBocom,0,40780,0,0,@12000HP_350AP), -- Savage Gladiator Chest Paladin2
(@ZomBocom,0,40798,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Paladin2
(@ZomBocom,0,40818,0,0,@12000HP_350AP), -- Savage Gladiator Helm Paladin2
(@ZomBocom,0,40838,0,0,@12000HP_350AP), -- Savage Gladiator Legs Paladin2
(@ZomBocom,0,40858,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Paladin2
(@ZomBocom,0,41851,0,0,@12000HP_350AP), -- Savage Gladiator Chest Priest1
(@ZomBocom,0,41847,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Priest1
(@ZomBocom,0,41848,0,0,@12000HP_350AP), -- Savage Gladiator Helm Priest1
(@ZomBocom,0,41849,0,0,@12000HP_350AP), -- Savage Gladiator Legs Priest1
(@ZomBocom,0,41850,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Priest1
(@ZomBocom,0,41918,0,0,@12000HP_350AP), -- Savage Gladiator Chest Priest2
(@ZomBocom,0,41937,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Priest2
(@ZomBocom,0,41912,0,0,@12000HP_350AP), -- Savage Gladiator Helm Priest2
(@ZomBocom,0,41924,0,0,@12000HP_350AP), -- Savage Gladiator Legs Priest2
(@ZomBocom,0,41930,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Priest2
(@ZomBocom,0,41647,0,0,@12000HP_350AP), -- Savage Gladiator Chest Rogue
(@ZomBocom,0,41643,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Rogue
(@ZomBocom,0,41644,0,0,@12000HP_350AP), -- Savage Gladiator Helm Rogue
(@ZomBocom,0,41645,0,0,@12000HP_350AP), -- Savage Gladiator Legs Rogue
(@ZomBocom,0,41646,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Rogue
(@ZomBocom,0,41078,0,0,@12000HP_350AP), -- Savage Gladiator Chest Shaman1
(@ZomBocom,0,41134,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Shaman1
(@ZomBocom,0,41148,0,0,@12000HP_350AP), -- Savage Gladiator Helm Shaman1
(@ZomBocom,0,41160,0,0,@12000HP_350AP), -- Savage Gladiator Legs Shaman1
(@ZomBocom,0,41208,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Shaman1
(@ZomBocom,0,40987,0,0,@12000HP_350AP), -- Savage Gladiator Chest Shaman2
(@ZomBocom,0,41004,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Shaman2
(@ZomBocom,0,41016,0,0,@12000HP_350AP), -- Savage Gladiator Helm Shaman2
(@ZomBocom,0,41030,0,0,@12000HP_350AP), -- Savage Gladiator Legs Shaman2
(@ZomBocom,0,41041,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Shaman2
(@ZomBocom,0,40986,0,0,@12000HP_350AP), -- Savage Gladiator Chest Shaman3
(@ZomBocom,0,40998,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Shaman3
(@ZomBocom,0,41010,0,0,@12000HP_350AP), -- Savage Gladiator Helm Shaman3
(@ZomBocom,0,41023,0,0,@12000HP_350AP), -- Savage Gladiator Legs Shaman3
(@ZomBocom,0,41024,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Shaman3
(@ZomBocom,0,41996,0,0,@12000HP_350AP), -- Savage Gladiator Chest Warlock
(@ZomBocom,0,42014,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Warlock
(@ZomBocom,0,41990,0,0,@12000HP_350AP), -- Savage Gladiator Helm Warlock
(@ZomBocom,0,42002,0,0,@12000HP_350AP), -- Savage Gladiator Legs Warlock
(@ZomBocom,0,42008,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Warlock
(@ZomBocom,0,40778,0,0,@12000HP_350AP), -- Savage Gladiator Chest Warrior
(@ZomBocom,0,40797,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Warrior
(@ZomBocom,0,40816,0,0,@12000HP_350AP), -- Savage Gladiator Helm Warrior
(@ZomBocom,0,40836,0,0,@12000HP_350AP), -- Savage Gladiator Legs Warrior
(@ZomBocom,0,40856,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Warrior
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Xazi,0,40781,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest DK
(@Xazi,0,40803,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves DK
(@Xazi,0,40820,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm DK
(@Xazi,0,40841,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs DK
(@Xazi,0,40860,0,0,@1775RT_9600HP_550AP),  -- Hateful Gladiator Shoulders DK
(@Xazi,0,41308,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Druid1
(@Xazi,0,41284,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves Druid1
(@Xazi,0,41319,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Druid1
(@Xazi,0,41296,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Druid1
(@Xazi,0,41273,0,0,@1775RT_9600HP_550AP),  -- Hateful Gladiator Shoulders Druid1
(@Xazi,0,41659,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Druid2
(@Xazi,0,41771,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves Druid2
(@Xazi,0,41676,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Druid2
(@Xazi,0,41665,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Druid2
(@Xazi,0,41713,0,0,@1775RT_9600HP_550AP),  -- Hateful Gladiator Shoulders Druid2
(@Xazi,0,41314,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Druid3
(@Xazi,0,41291,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves Druid3
(@Xazi,0,41325,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Druid3
(@Xazi,0,41302,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Druid3
(@Xazi,0,41279,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Druid3
(@Xazi,0,41085,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Hunter
(@Xazi,0,41141,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Hunter
(@Xazi,0,41155,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Hunter
(@Xazi,0,41203,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Hunter
(@Xazi,0,41215,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Hunter
(@Xazi,0,41950,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Mage
(@Xazi,0,41969,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Mage
(@Xazi,0,41944,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Mage
(@Xazi,0,41957,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Mage
(@Xazi,0,41963,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Mage
(@Xazi,0,40904,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Paladin1
(@Xazi,0,40925,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Paladin1
(@Xazi,0,40931,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Paladin1
(@Xazi,0,40937,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Paladin1
(@Xazi,0,40961,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Paladin1
(@Xazi,0,40782,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Paladin2
(@Xazi,0,40802,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Paladin2
(@Xazi,0,40821,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Paladin2
(@Xazi,0,40842,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Paladin2
(@Xazi,0,40861,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Paladin2
(@Xazi,0,41857,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Priest1
(@Xazi,0,41872,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Priest1
(@Xazi,0,41852,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Priest1
(@Xazi,0,41862,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Priest1
(@Xazi,0,41867,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Priest1
(@Xazi,0,41919,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Priest2
(@Xazi,0,41938,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Priest2
(@Xazi,0,41913,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Priest2
(@Xazi,0,41925,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Priest2
(@Xazi,0,41931,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Priest2
(@Xazi,0,41648,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Rogue
(@Xazi,0,41765,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Rogue
(@Xazi,0,41670,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Rogue
(@Xazi,0,41653,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Rogue
(@Xazi,0,41681,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Rogue
(@Xazi,0,41079,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Shaman1
(@Xazi,0,41135,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Shaman1
(@Xazi,0,41149,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Shaman1
(@Xazi,0,41162,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Shaman1
(@Xazi,0,41209,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Shaman1
(@Xazi,0,40989,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Shaman2
(@Xazi,0,41005,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Shaman2
(@Xazi,0,41017,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Shaman2
(@Xazi,0,41031,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Shaman2
(@Xazi,0,41042,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Shaman2
(@Xazi,0,40988,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Shaman3
(@Xazi,0,40999,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Shaman3
(@Xazi,0,41011,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Shaman3
(@Xazi,0,41025,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Shaman3
(@Xazi,0,41036,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Shaman3
(@Xazi,0,42001,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Warlock
(@Xazi,0,42015,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Warlock
(@Xazi,0,41991,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Warlock
(@Xazi,0,42003,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Warlock
(@Xazi,0,42009,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Warlock
(@Xazi,0,40783,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Warrior
(@Xazi,0,40801,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Warrior
(@Xazi,0,40819,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Warrior
(@Xazi,0,40840,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Warrior
(@Xazi,0,40859,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Warrior
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Nargle,0,40784,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest DK
(@Nargle,0,40806,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves DK
(@Nargle,0,40824,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm DK
(@Nargle,0,40845,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs DK
(@Nargle,0,40863,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders DK
(@Nargle,0,41309,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid1
(@Nargle,0,41286,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid1
(@Nargle,0,41320,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid1
(@Nargle,0,41297,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid1
(@Nargle,0,41274,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid1
(@Nargle,0,41660,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid2
(@Nargle,0,41772,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid2
(@Nargle,0,41677,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid2
(@Nargle,0,41666,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid2
(@Nargle,0,41714,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid2
(@Nargle,0,41315,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid3
(@Nargle,0,41292,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid3
(@Nargle,0,41326,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid3
(@Nargle,0,41303,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid3
(@Nargle,0,41280,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid3
(@Nargle,0,41086,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Hunter
(@Nargle,0,41142,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Hunter
(@Nargle,0,41156,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Hunter
(@Nargle,0,41204,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Hunter
(@Nargle,0,41216,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Hunter
(@Nargle,0,41951,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Mage
(@Nargle,0,41970,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Mage
(@Nargle,0,41945,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Mage
(@Nargle,0,41958,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Mage
(@Nargle,0,41964,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Mage
(@Nargle,0,40905,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin1
(@Nargle,0,40926,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin1
(@Nargle,0,40932,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin1
(@Nargle,0,40938,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin1
(@Nargle,0,40962,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin1
(@Nargle,0,40785,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin2
(@Nargle,0,40805,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin2
(@Nargle,0,40825,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin2
(@Nargle,0,40846,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin2
(@Nargle,0,40864,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin2
(@Nargle,0,41858,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest1
(@Nargle,0,41873,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest1
(@Nargle,0,41853,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest1
(@Nargle,0,41863,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest1
(@Nargle,0,41868,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest1
(@Nargle,0,41920,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest2
(@Nargle,0,41939,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest2
(@Nargle,0,41914,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest2
(@Nargle,0,41926,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest2
(@Nargle,0,41933,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest2
(@Nargle,0,41649,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Rogue
(@Nargle,0,41766,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Rogue
(@Nargle,0,41671,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Rogue
(@Nargle,0,41654,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Rogue
(@Nargle,0,41682,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Rogue
(@Nargle,0,41080,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman1
(@Nargle,0,41136,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman1
(@Nargle,0,41150,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman1
(@Nargle,0,41198,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman1
(@Nargle,0,41210,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman1
(@Nargle,0,40991,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman2
(@Nargle,0,41006,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman2
(@Nargle,0,41018,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman2
(@Nargle,0,41032,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman2
(@Nargle,0,41043,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman2
(@Nargle,0,40990,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman3
(@Nargle,0,41000,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman3
(@Nargle,0,41012,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman3
(@Nargle,0,41026,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman3
(@Nargle,0,41037,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman3
(@Nargle,0,41997,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warlock
(@Nargle,0,42016,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warlock
(@Nargle,0,41992,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warlock
(@Nargle,0,42004,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warlock
(@Nargle,0,42010,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warlock
(@Nargle,0,40786,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warrior
(@Nargle,0,40804,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warrior
(@Nargle,0,40823,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warrior
(@Nargle,0,40844,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warrior
(@Nargle,0,40862,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warrior
-- Weapons
(@Nargle,0,42490,0,0,@1930RT_4500AP),-- Deadly Gladiator Longbow (bow)
(@Nargle,0,42495,0,0,@1930RT_4500AP),-- Deadly Gladiator Heavy Crossbow (crossbow)
(@Nargle,0,42255,0,0,@1930RT_3150AP),-- Deadly Gladiator Mutilator (dagger) offhand
(@Nargle,0,42242,0,0,@1930RT_3150AP),-- Deadly Gladiator Shanker (dagger) One Hand
(@Nargle,0,42248,0,0,@1930RT_3150AP),-- Deadly Gladiator Shiv (dagger) offhand
(@Nargle,0,42346,0,0,@1930RT_3150AP),-- Deadly Gladiator Spellblade (dagger) Main Hand
(@Nargle,0,42265,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Render (Fist Weapon) offhand
(@Nargle,0,42270,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Ripper (Fist Weapon) offhand
(@Nargle,0,42260,0,0,@1930RT_3150AP),-- Deadly Gladiator Right Ripper (Fist Weapon) main hand
(@Nargle,0,42485,0,0,@1930RT_4500AP),-- Deadly Gladiator Rifle (Gun)
(@Nargle,0,42232,0,0,@1930RT_3150AP),-- Deadly Gladiator Chopper (1haxe) offhand
(@Nargle,0,42208,0,0,@1930RT_3150AP),-- Deadly Gladiator Cleaver (1haxe) mainhand
(@Nargle,0,42227,0,0,@1930RT_3150AP),-- Deadly Gladiator Hacker (1haxe) offhand
(@Nargle,0,42237,0,0,@1930RT_3150AP),-- Deadly Gladiator Waraxe (1haxe) one hand
(@Nargle,0,42280,0,0,@1930RT_3150AP),-- Deadly Gladiator Bonecracker (1hmace) offhand
(@Nargle,0,42352,0,0,@1930RT_3150AP),-- Deadly Gladiator Gavel (1h mace) main hand
(@Nargle,0,42275,0,0,@1930RT_3150AP),-- Deadly Gladiator Pummeler (1h mace) one hand
(@Nargle,0,42290,0,0,@1930RT_3150AP),-- Deadly Gladiator Quickblade (1h sword) off hand
(@Nargle,0,42285,0,0,@1930RT_3150AP),-- Deadly Gladiator Slicer (1h sword) one hand
(@Nargle,0,42327,0,0,@1930RT_4500AP),-- Deadly Gladiator Pike (polearm)
(@Nargle,0,42362,0,0,@1930RT_4500AP),-- Deadly Gladiator Battle Staff (staff)
(@Nargle,0,42384,0,0,@1930RT_4500AP),-- Deadly Gladiator Energy Staff (staff)
(@Nargle,0,44420,0,0,@1930RT_4500AP),-- Deadly Gladiator Focus Staff (staff)
(@Nargle,0,42390,0,0,@1930RT_4500AP),-- Deadly Gladiator Staff (staff)
(@Nargle,0,44419,0,0,@1930RT_4500AP),-- Deadly Gladiator War Staff (staff)
(@Nargle,0,42450,0,0,@1930RT_2250AP),-- Deadly Gladiator War Edge (Thrown)
(@Nargle,0,42317,0,0,@1930RT_4500AP),-- Deadly Gladiator Decapitator (2haxe)
(@Nargle,0,42322,0,0,@1930RT_4500AP),-- Deadly Gladiator Bonegrinder (2hmace)
(@Nargle,0,42332,0,0,@1930RT_4500AP),-- Deadly Gladiator Greatsword (2h Sword)
(@Nargle,0,42513,0,0,@1930RT_2250AP),-- Deadly Gladiator Baton of Light (wand)
(@Nargle,0,42519,0,0,@1930RT_2250AP),-- Deadly Gladiator Piercing Touch (wand)
(@Nargle,0,42502,0,0,@1930RT_2250AP),-- Deadly Gladiator Touch of Defeat (wand)
(@Nargle,0,42564,0,0,@1930RT_2250AP),-- Deadly Gladiator Barrier (shield)
(@Nargle,0,42570,0,0,@1930RT_2250AP),-- Deadly Gladiator Redoubt (shield)
(@Nargle,0,42559,0,0,@1930RT_2250AP),-- Deadly Gladiator Shield Wall (shield)
(@Nargle,0,42588,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Resolve (Relic)
(@Nargle,0,42583,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Steadfastness (Relic)
(@Nargle,0,42578,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Tenacity (Relic)
(@Nargle,0,42852,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Fortitude (Relic)
(@Nargle,0,42614,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Justice (Relic)
(@Nargle,0,42620,0,0,@1930RT_1200AP),-- Deadly Gladiator Sigil of Strife (Relic)
(@Nargle,0,42607,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Indomitability (Relic)
(@Nargle,0,42602,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Survival (Relic)
(@Nargle,0,42597,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of the Third Wind (Relic)
-- Spacer
(@Kezzik,0,40784,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest DK
(@Kezzik,0,40806,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves DK
(@Kezzik,0,40824,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm DK
(@Kezzik,0,40845,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs DK
(@Kezzik,0,40863,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders DK
(@Kezzik,0,41309,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid1
(@Kezzik,0,41286,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid1
(@Kezzik,0,41320,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid1
(@Kezzik,0,41297,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid1
(@Kezzik,0,41274,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid1
(@Kezzik,0,41660,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid2
(@Kezzik,0,41772,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid2
(@Kezzik,0,41677,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid2
(@Kezzik,0,41666,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid2
(@Kezzik,0,41714,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid2
(@Kezzik,0,41315,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid3
(@Kezzik,0,41292,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid3
(@Kezzik,0,41326,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid3
(@Kezzik,0,41303,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid3
(@Kezzik,0,41280,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid3
(@Kezzik,0,41086,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Hunter
(@Kezzik,0,41142,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Hunter
(@Kezzik,0,41156,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Hunter
(@Kezzik,0,41204,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Hunter
(@Kezzik,0,41216,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Hunter
(@Kezzik,0,41951,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Mage
(@Kezzik,0,41970,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Mage
(@Kezzik,0,41945,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Mage
(@Kezzik,0,41958,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Mage
(@Kezzik,0,41964,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Mage
(@Kezzik,0,40905,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin1
(@Kezzik,0,40926,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin1
(@Kezzik,0,40932,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin1
(@Kezzik,0,40938,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin1
(@Kezzik,0,40962,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin1
(@Kezzik,0,40785,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin2
(@Kezzik,0,40805,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin2
(@Kezzik,0,40825,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin2
(@Kezzik,0,40846,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin2
(@Kezzik,0,40864,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin2
(@Kezzik,0,41858,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest1
(@Kezzik,0,41873,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest1
(@Kezzik,0,41853,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest1
(@Kezzik,0,41863,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest1
(@Kezzik,0,41868,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest1
(@Kezzik,0,41920,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest2
(@Kezzik,0,41939,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest2
(@Kezzik,0,41914,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest2
(@Kezzik,0,41926,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest2
(@Kezzik,0,41933,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest2
(@Kezzik,0,41649,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Rogue
(@Kezzik,0,41766,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Rogue
(@Kezzik,0,41671,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Rogue
(@Kezzik,0,41654,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Rogue
(@Kezzik,0,41682,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Rogue
(@Kezzik,0,41080,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman1
(@Kezzik,0,41136,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman1
(@Kezzik,0,41150,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman1
(@Kezzik,0,41198,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman1
(@Kezzik,0,41210,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman1
(@Kezzik,0,40991,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman2
(@Kezzik,0,41006,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman2
(@Kezzik,0,41018,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman2
(@Kezzik,0,41032,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman2
(@Kezzik,0,41043,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman2
(@Kezzik,0,40990,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman3
(@Kezzik,0,41000,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman3
(@Kezzik,0,41012,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman3
(@Kezzik,0,41026,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman3
(@Kezzik,0,41037,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman3
(@Kezzik,0,41997,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warlock
(@Kezzik,0,42016,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warlock
(@Kezzik,0,41992,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warlock
(@Kezzik,0,42004,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warlock
(@Kezzik,0,42010,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warlock
(@Kezzik,0,40786,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warrior
(@Kezzik,0,40804,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warrior
(@Kezzik,0,40823,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warrior
(@Kezzik,0,40844,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warrior
(@Kezzik,0,40862,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warrior
-- Weapons
(@Kezzik,0,42490,0,0,@1930RT_4500AP),-- Deadly Gladiator Longbow (bow)
(@Kezzik,0,42495,0,0,@1930RT_4500AP),-- Deadly Gladiator Heavy Crossbow (crossbow)
(@Kezzik,0,42255,0,0,@1930RT_3150AP),-- Deadly Gladiator Mutilator (dagger) offhand
(@Kezzik,0,42242,0,0,@1930RT_3150AP),-- Deadly Gladiator Shanker (dagger) One Hand
(@Kezzik,0,42248,0,0,@1930RT_3150AP),-- Deadly Gladiator Shiv (dagger) offhand
(@Kezzik,0,42346,0,0,@1930RT_3150AP),-- Deadly Gladiator Spellblade (dagger) Main Hand
(@Kezzik,0,42265,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Render (Fist Weapon) offhand
(@Kezzik,0,42270,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Ripper (Fist Weapon) offhand
(@Kezzik,0,42260,0,0,@1930RT_3150AP),-- Deadly Gladiator Right Ripper (Fist Weapon) main hand
(@Kezzik,0,42485,0,0,@1930RT_4500AP),-- Deadly Gladiator Rifle (Gun)
(@Kezzik,0,42232,0,0,@1930RT_3150AP),-- Deadly Gladiator Chopper (1haxe) offhand
(@Kezzik,0,42208,0,0,@1930RT_3150AP),-- Deadly Gladiator Cleaver (1haxe) mainhand
(@Kezzik,0,42227,0,0,@1930RT_3150AP),-- Deadly Gladiator Hacker (1haxe) offhand
(@Kezzik,0,42237,0,0,@1930RT_3150AP),-- Deadly Gladiator Waraxe (1haxe) one hand
(@Kezzik,0,42280,0,0,@1930RT_3150AP),-- Deadly Gladiator Bonecracker (1hmace) offhand
(@Kezzik,0,42352,0,0,@1930RT_3150AP),-- Deadly Gladiator Gavel (1h mace) main hand
(@Kezzik,0,42275,0,0,@1930RT_3150AP),-- Deadly Gladiator Pummeler (1h mace) one hand
(@Kezzik,0,42290,0,0,@1930RT_3150AP),-- Deadly Gladiator Quickblade (1h sword) off hand
(@Kezzik,0,42285,0,0,@1930RT_3150AP),-- Deadly Gladiator Slicer (1h sword) one hand
(@Kezzik,0,42327,0,0,@1930RT_4500AP),-- Deadly Gladiator Pike (polearm)
(@Kezzik,0,42362,0,0,@1930RT_4500AP),-- Deadly Gladiator Battle Staff (staff)
(@Kezzik,0,42384,0,0,@1930RT_4500AP),-- Deadly Gladiator Energy Staff (staff)
(@Kezzik,0,44420,0,0,@1930RT_4500AP),-- Deadly Gladiator Focus Staff (staff)
(@Kezzik,0,42390,0,0,@1930RT_4500AP),-- Deadly Gladiator Staff (staff)
(@Kezzik,0,44419,0,0,@1930RT_4500AP),-- Deadly Gladiator War Staff (staff)
(@Kezzik,0,42450,0,0,@1930RT_2250AP),-- Deadly Gladiator War Edge (Thrown)
(@Kezzik,0,42317,0,0,@1930RT_4500AP),-- Deadly Gladiator Decapitator (2haxe)
(@Kezzik,0,42322,0,0,@1930RT_4500AP),-- Deadly Gladiator Bonegrinder (2hmace)
(@Kezzik,0,42332,0,0,@1930RT_4500AP),-- Deadly Gladiator Greatsword (2h Sword)
(@Kezzik,0,42513,0,0,@1930RT_2250AP),-- Deadly Gladiator Baton of Light (wand)
(@Kezzik,0,42519,0,0,@1930RT_2250AP),-- Deadly Gladiator Piercing Touch (wand)
(@Kezzik,0,42502,0,0,@1930RT_2250AP),-- Deadly Gladiator Touch of Defeat (wand)
(@Kezzik,0,42564,0,0,@1930RT_2250AP),-- Deadly Gladiator Barrier (shield)
(@Kezzik,0,42570,0,0,@1930RT_2250AP),-- Deadly Gladiator Redoubt (shield)
(@Kezzik,0,42559,0,0,@1930RT_2250AP),-- Deadly Gladiator Shield Wall (shield)
(@Kezzik,0,42588,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Resolve (Relic)
(@Kezzik,0,42583,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Steadfastness (Relic)
(@Kezzik,0,42578,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Tenacity (Relic)
(@Kezzik,0,42852,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Fortitude (Relic)
(@Kezzik,0,42614,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Justice (Relic)
(@Kezzik,0,42620,0,0,@1930RT_1200AP),-- Deadly Gladiator Sigil of Strife (Relic)
(@Kezzik,0,42607,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Indomitability (Relic)
(@Kezzik,0,42602,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Survival (Relic)
(@Kezzik,0,42597,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of the Third Wind (Relic)
-- Spacer
(@Argex,0,40784,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest DK
(@Argex,0,40806,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves DK
(@Argex,0,40824,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm DK
(@Argex,0,40845,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs DK
(@Argex,0,40863,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders DK
(@Argex,0,41309,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid1
(@Argex,0,41286,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid1
(@Argex,0,41320,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid1
(@Argex,0,41297,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid1
(@Argex,0,41274,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid1
(@Argex,0,41660,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid2
(@Argex,0,41772,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid2
(@Argex,0,41677,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid2
(@Argex,0,41666,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid2
(@Argex,0,41714,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid2
(@Argex,0,41315,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid3
(@Argex,0,41292,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid3
(@Argex,0,41326,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid3
(@Argex,0,41303,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid3
(@Argex,0,41280,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid3
(@Argex,0,41086,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Hunter
(@Argex,0,41142,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Hunter
(@Argex,0,41156,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Hunter
(@Argex,0,41204,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Hunter
(@Argex,0,41216,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Hunter
(@Argex,0,41951,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Mage
(@Argex,0,41970,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Mage
(@Argex,0,41945,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Mage
(@Argex,0,41958,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Mage
(@Argex,0,41964,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Mage
(@Argex,0,40905,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin1
(@Argex,0,40926,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin1
(@Argex,0,40932,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin1
(@Argex,0,40938,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin1
(@Argex,0,40962,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin1
(@Argex,0,40785,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin2
(@Argex,0,40805,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin2
(@Argex,0,40825,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin2
(@Argex,0,40846,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin2
(@Argex,0,40864,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin2
(@Argex,0,41858,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest1
(@Argex,0,41873,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest1
(@Argex,0,41853,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest1
(@Argex,0,41863,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest1
(@Argex,0,41868,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest1
(@Argex,0,41920,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest2
(@Argex,0,41939,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest2
(@Argex,0,41914,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest2
(@Argex,0,41926,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest2
(@Argex,0,41933,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest2
(@Argex,0,41649,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Rogue
(@Argex,0,41766,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Rogue
(@Argex,0,41671,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Rogue
(@Argex,0,41654,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Rogue
(@Argex,0,41682,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Rogue
(@Argex,0,41080,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman1
(@Argex,0,41136,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman1
(@Argex,0,41150,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman1
(@Argex,0,41198,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman1
(@Argex,0,41210,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman1
(@Argex,0,40991,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman2
(@Argex,0,41006,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman2
(@Argex,0,41018,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman2
(@Argex,0,41032,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman2
(@Argex,0,41043,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman2
(@Argex,0,40990,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman3
(@Argex,0,41000,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman3
(@Argex,0,41012,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman3
(@Argex,0,41026,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman3
(@Argex,0,41037,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman3
(@Argex,0,41997,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warlock
(@Argex,0,42016,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warlock
(@Argex,0,41992,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warlock
(@Argex,0,42004,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warlock
(@Argex,0,42010,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warlock
(@Argex,0,40786,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warrior
(@Argex,0,40804,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warrior
(@Argex,0,40823,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warrior
(@Argex,0,40844,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warrior
(@Argex,0,40862,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warrior
-- Weapons
(@Argex,0,42490,0,0,@1930RT_4500AP),-- Deadly Gladiator Longbow (bow)
(@Argex,0,42495,0,0,@1930RT_4500AP),-- Deadly Gladiator Heavy Crossbow (crossbow)
(@Argex,0,42255,0,0,@1930RT_3150AP),-- Deadly Gladiator Mutilator (dagger) offhand
(@Argex,0,42242,0,0,@1930RT_3150AP),-- Deadly Gladiator Shanker (dagger) One Hand
(@Argex,0,42248,0,0,@1930RT_3150AP),-- Deadly Gladiator Shiv (dagger) offhand
(@Argex,0,42346,0,0,@1930RT_3150AP),-- Deadly Gladiator Spellblade (dagger) Main Hand
(@Argex,0,42265,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Render (Fist Weapon) offhand
(@Argex,0,42270,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Ripper (Fist Weapon) offhand
(@Argex,0,42260,0,0,@1930RT_3150AP),-- Deadly Gladiator Right Ripper (Fist Weapon) main hand
(@Argex,0,42485,0,0,@1930RT_4500AP),-- Deadly Gladiator Rifle (Gun)
(@Argex,0,42232,0,0,@1930RT_3150AP),-- Deadly Gladiator Chopper (1haxe) offhand
(@Argex,0,42208,0,0,@1930RT_3150AP),-- Deadly Gladiator Cleaver (1haxe) mainhand
(@Argex,0,42227,0,0,@1930RT_3150AP),-- Deadly Gladiator Hacker (1haxe) offhand
(@Argex,0,42237,0,0,@1930RT_3150AP),-- Deadly Gladiator Waraxe (1haxe) one hand
(@Argex,0,42280,0,0,@1930RT_3150AP),-- Deadly Gladiator Bonecracker (1hmace) offhand
(@Argex,0,42352,0,0,@1930RT_3150AP),-- Deadly Gladiator Gavel (1h mace) main hand
(@Argex,0,42275,0,0,@1930RT_3150AP),-- Deadly Gladiator Pummeler (1h mace) one hand
(@Argex,0,42290,0,0,@1930RT_3150AP),-- Deadly Gladiator Quickblade (1h sword) off hand
(@Argex,0,42285,0,0,@1930RT_3150AP),-- Deadly Gladiator Slicer (1h sword) one hand
(@Argex,0,42327,0,0,@1930RT_4500AP),-- Deadly Gladiator Pike (polearm)
(@Argex,0,42362,0,0,@1930RT_4500AP),-- Deadly Gladiator Battle Staff (staff)
(@Argex,0,42384,0,0,@1930RT_4500AP),-- Deadly Gladiator Energy Staff (staff)
(@Argex,0,44420,0,0,@1930RT_4500AP),-- Deadly Gladiator Focus Staff (staff)
(@Argex,0,42390,0,0,@1930RT_4500AP),-- Deadly Gladiator Staff (staff)
(@Argex,0,44419,0,0,@1930RT_4500AP),-- Deadly Gladiator War Staff (staff)
(@Argex,0,42450,0,0,@1930RT_2250AP),-- Deadly Gladiator War Edge (Thrown)
(@Argex,0,42317,0,0,@1930RT_4500AP),-- Deadly Gladiator Decapitator (2haxe)
(@Argex,0,42322,0,0,@1930RT_4500AP),-- Deadly Gladiator Bonegrinder (2hmace)
(@Argex,0,42332,0,0,@1930RT_4500AP),-- Deadly Gladiator Greatsword (2h Sword)
(@Argex,0,42513,0,0,@1930RT_2250AP),-- Deadly Gladiator Baton of Light (wand)
(@Argex,0,42519,0,0,@1930RT_2250AP),-- Deadly Gladiator Piercing Touch (wand)
(@Argex,0,42502,0,0,@1930RT_2250AP),-- Deadly Gladiator Touch of Defeat (wand)
(@Argex,0,42564,0,0,@1930RT_2250AP),-- Deadly Gladiator Barrier (shield)
(@Argex,0,42570,0,0,@1930RT_2250AP),-- Deadly Gladiator Redoubt (shield)
(@Argex,0,42559,0,0,@1930RT_2250AP),-- Deadly Gladiator Shield Wall (shield)
(@Argex,0,42588,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Resolve (Relic)
(@Argex,0,42583,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Steadfastness (Relic)
(@Argex,0,42578,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Tenacity (Relic)
(@Argex,0,42852,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Fortitude (Relic)
(@Argex,0,42614,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Justice (Relic)
(@Argex,0,42620,0,0,@1930RT_1200AP),-- Deadly Gladiator Sigil of Strife (Relic)
(@Argex,0,42607,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Indomitability (Relic)
(@Argex,0,42602,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Survival (Relic)
(@Argex,0,42597,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of the Third Wind (Relic)
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Thunderhorn,0,42110,0,0,@38000HP), -- Hateful Gladiator Band of Dominance
(@Thunderhorn,0,42112,0,0,@38000HP), -- Hateful Gladiator Band of Triumph
(@Thunderhorn,0,42057,0,0,@38000HP), -- Hateful Gladiator's Cloak of Ascendancy
(@Thunderhorn,0,42059,0,0,@38000HP), -- Hateful Gladiator's Cloak of Deliverance
(@Thunderhorn,0,42055,0,0,@38000HP), -- Hateful Gladiator's Cloak of Dominance
(@Thunderhorn,0,42058,0,0,@38000HP), -- Hateful Gladiator's Cloak of Salvation
(@Thunderhorn,0,42056,0,0,@38000HP), -- Hateful Gladiator's Cloak of Subjugation
(@Thunderhorn,0,42060,0,0,@38000HP), -- Hateful Gladiator's Cloak of Triumph
(@Thunderhorn,0,42061,0,0,@38000HP), -- Hateful Gladiator's Cloak of Victory
(@Thunderhorn,0,42024,0,0,@38000HP), -- Hateful Gladiator's Pendant of Ascendancy
(@Thunderhorn,0,42025,0,0,@38000HP), -- Hateful Gladiator's Pendant of Deliverance
(@Thunderhorn,0,42022,0,0,@38000HP), -- Hateful Gladiator's Pendant of Dominance
(@Thunderhorn,0,42026,0,0,@38000HP), -- Hateful Gladiator's Pendant of Salvation
(@Thunderhorn,0,42023,0,0,@38000HP), -- Hateful Gladiator's Pendant of Subjugation
(@Thunderhorn,0,42020,0,0,@38000HP), -- Hateful Gladiator's Pendant of Triumph
(@Thunderhorn,0,42021,0,0,@38000HP), -- Hateful Gladiator's Pendant of Victory
(@Thunderhorn,0,41638,0,0,@31600HP), -- Hateful Gladiator's Armwraps of Dominance
(@Thunderhorn,0,41332,0,0,@31600HP), -- Hateful Gladiator's Armwraps of Salvation
(@Thunderhorn,0,41830,0,0,@31600HP), -- Hateful Gladiator's Armwraps of Triumph
(@Thunderhorn,0,40972,0,0,@31600HP), -- Hateful Gladiator's Bracers of Salvation
(@Thunderhorn,0,40887,0,0,@31600HP), -- Hateful Gladiator's Bracers of Triumph
(@Thunderhorn,0,41907,0,0,@31600HP), -- Hateful Gladiator's Cuffs of Dominance
(@Thunderhorn,0,41878,0,0,@31600HP), -- Hateful Gladiator's Cuffs of Salvation
(@Thunderhorn,0,41063,0,0,@31600HP), -- Hateful Gladiator's Wristguards of Dominance
(@Thunderhorn,0,41047,0,0,@31600HP), -- Hateful Gladiator's Wristguards of Salvation
(@Thunderhorn,0,41223,0,0,@31600HP), -- Hateful Gladiator's Wristguards of Triumph
(@Thunderhorn,0,41633,0,0,@49600HP), -- Hateful Gladiator's Boots of Dominance
(@Thunderhorn,0,41331,0,0,@49600HP), -- Hateful Gladiator's Boots of Salvation
(@Thunderhorn,0,41828,0,0,@49600HP), -- Hateful Gladiator's Boots of Triumph
(@Thunderhorn,0,40973,0,0,@49600HP), -- Hateful Gladiator's Greaves of Salvation
(@Thunderhorn,0,40878,0,0,@49600HP), -- Hateful Gladiator's Greaves of Triumph
(@Thunderhorn,0,41073,0,0,@49600HP), -- Hateful Gladiator's Sabatons of Dominance
(@Thunderhorn,0,41049,0,0,@49600HP), -- Hateful Gladiator's Sabatons of Salvation
(@Thunderhorn,0,41228,0,0,@49600HP), -- Hateful Gladiator's Sabatons of Triumph
(@Thunderhorn,0,41901,0,0,@49600HP), -- Hateful Gladiator's Slippers of Dominance
(@Thunderhorn,0,41879,0,0,@49600HP), -- Hateful Gladiator's Slippers of Salvation
(@Thunderhorn,0,41628,0,0,@49600HP), -- Hateful Gladiator's Belt of Dominance
(@Thunderhorn,0,41330,0,0,@49600HP), -- Hateful Gladiator's Belt of Salvation
(@Thunderhorn,0,41827,0,0,@49600HP), -- Hateful Gladiator's Belt of Triumph
(@Thunderhorn,0,41896,0,0,@49600HP), -- Hateful Gladiator's Cord of Dominance
(@Thunderhorn,0,41877,0,0,@49600HP), -- Hateful Gladiator's Cord of Salvation
(@Thunderhorn,0,40966,0,0,@49600HP), -- Hateful Gladiator's Girdle of Salvation
(@Thunderhorn,0,40877,0,0,@49600HP), -- Hateful Gladiator's Girdle of Triumph
(@Thunderhorn,0,41068,0,0,@49600HP), -- Hateful Gladiator's Waistguard of Dominance
(@Thunderhorn,0,41050,0,0,@49600HP), -- Hateful Gladiator's Waistguard of Salvation
(@Thunderhorn,0,41233,0,0,@49600HP), -- Hateful Gladiator's Waistguard of Triumph
(@Thunderhorn,0,42122,0,0,@49600HP), -- Medallion of the Horde
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Doris,0,42129,0,0,@1800RT_62000HP), -- Battlemasters Accuracy   213
(@Doris,0,42130,0,0,@1800RT_62000HP), -- Battlemasters Avidity    213
(@Doris,0,42132,0,0,@1800RT_62000HP), -- Battlemasters Bravery    213
(@Doris,0,42131,0,0,@1800RT_62000HP), -- Battlemasters Conviction 213
(@Doris,0,42128,0,0,@1800RT_62000HP), -- Battlemasters Hostility  213
(@Doris,0,42064,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Ascendancy
(@Doris,0,42066,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Deliverance
(@Doris,0,42062,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Dominance
(@Doris,0,42065,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Salvation
(@Doris,0,42063,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Subjugation
(@Doris,0,42067,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Triumph
(@Doris,0,42068,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Victory
(@Doris,0,41634,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Dominance
(@Doris,0,41620,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Salvation
(@Doris,0,41835,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Triumph
(@Doris,0,40975,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Salvation
(@Doris,0,40880,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Triumph
(@Doris,0,41074,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Dominance
(@Doris,0,41054,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Salvation
(@Doris,0,41229,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Triumph
(@Doris,0,41902,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Dominance
(@Doris,0,41884,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Salvation
(@Doris,0,42114,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Ascendancy
(@Doris,0,42115,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Victory
(@Doris,0,41639,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Dominance
(@Doris,0,41624,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Salvation
(@Doris,0,41839,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Triumph
(@Doris,0,40982,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Salvation
(@Doris,0,40888,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Triumph
(@Doris,0,41908,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Dominance
(@Doris,0,41892,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Salvation
(@Doris,0,41064,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Dominance
(@Doris,0,41059,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Salvation
(@Doris,0,41224,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Triumph
(@Doris,0,41629,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Dominance
(@Doris,0,41616,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Salvation
(@Doris,0,41831,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Triumph
(@Doris,0,41897,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Dominance
(@Doris,0,41880,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Salvation
(@Doris,0,40974,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Salvation
(@Doris,0,40879,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Triumph
(@Doris,0,41069,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Dominance
(@Doris,0,41048,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Salvation
(@Doris,0,41234,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Triumph
(@Doris,0,42030,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Ascendancy
(@Doris,0,42032,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Deliverance
(@Doris,0,42029,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Dominance
(@Doris,0,42033,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Salvation
(@Doris,0,42031,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Subjugation
(@Doris,0,42027,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Triumph
(@Doris,0,42028,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Victory
-- Spacer
(@Tristia,0,42129,0,0,@1800RT_62000HP), -- Battlemasters Accuracy   213
(@Tristia,0,42130,0,0,@1800RT_62000HP), -- Battlemasters Avidity    213
(@Tristia,0,42132,0,0,@1800RT_62000HP), -- Battlemasters Bravery    213
(@Tristia,0,42131,0,0,@1800RT_62000HP), -- Battlemasters Conviction 213
(@Tristia,0,42128,0,0,@1800RT_62000HP), -- Battlemasters Hostility  213
(@Tristia,0,42064,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Ascendancy
(@Tristia,0,42066,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Deliverance
(@Tristia,0,42062,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Dominance
(@Tristia,0,42065,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Salvation
(@Tristia,0,42063,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Subjugation
(@Tristia,0,42067,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Triumph
(@Tristia,0,42068,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Victory
(@Tristia,0,41634,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Dominance
(@Tristia,0,41620,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Salvation
(@Tristia,0,41835,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Triumph
(@Tristia,0,40975,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Salvation
(@Tristia,0,40880,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Triumph
(@Tristia,0,41074,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Dominance
(@Tristia,0,41054,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Salvation
(@Tristia,0,41229,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Triumph
(@Tristia,0,41902,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Dominance
(@Tristia,0,41884,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Salvation
(@Tristia,0,42114,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Ascendancy
(@Tristia,0,42115,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Victory
(@Tristia,0,41639,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Dominance
(@Tristia,0,41624,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Salvation
(@Tristia,0,41839,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Triumph
(@Tristia,0,40982,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Salvation
(@Tristia,0,40888,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Triumph
(@Tristia,0,41908,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Dominance
(@Tristia,0,41892,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Salvation
(@Tristia,0,41064,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Dominance
(@Tristia,0,41059,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Salvation
(@Tristia,0,41224,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Triumph
(@Tristia,0,41629,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Dominance
(@Tristia,0,41616,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Salvation
(@Tristia,0,41831,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Triumph
(@Tristia,0,41897,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Dominance
(@Tristia,0,41880,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Salvation
(@Tristia,0,40974,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Salvation
(@Tristia,0,40879,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Triumph
(@Tristia,0,41069,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Dominance
(@Tristia,0,41048,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Salvation
(@Tristia,0,41234,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Triumph
(@Tristia,0,42030,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Ascendancy
(@Tristia,0,42032,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Deliverance
(@Tristia,0,42029,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Dominance
(@Tristia,0,42033,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Salvation
(@Tristia,0,42031,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Subjugation
(@Tristia,0,42027,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Triumph
(@Tristia,0,42028,0,0,@1600RT_47400HP); -- Deadly Gladiator Pendant of Victory
-- increase the static 15 to 10-25% of maxpoolsize to hopefully get more blizzlike spawncounts
UPDATE `pool_template` SET `max_limit`=20 WHERE `entry`=948; -- increase pool: MASTER Herbs Silithus zone 1377 ( by 5)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=949; -- increase pool: MASTER Herbs Stonetalon Mountains zone 406 ( by 60)
UPDATE `pool_template` SET `max_limit`=55 WHERE `entry`=950; -- increase pool: MASTER Herbs Redridge Mountains zone 44 ( by 40)
UPDATE `pool_template` SET `max_limit`=80 WHERE `entry`=951; -- increase pool: MASTER Herbs Westfall zone 40 ( by 65)
UPDATE `pool_template` SET `max_limit`=55 WHERE `entry`=952; -- increase pool: MASTER Herbs Loch Modan zone 38 ( by 40)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=953; -- increase pool: MASTER Herbs Tirisfal Glades zone 85 ( by 30)
UPDATE `pool_template` SET `max_limit`=60 WHERE `entry`=954; -- increase pool: MASTER Herbs Western Plaguelands zone 28 ( by 45)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=955; -- increase pool: MASTER Herbs Mulgore zone 215 ( by 30)
UPDATE `pool_template` SET `max_limit`=60 WHERE `entry`=956; -- increase pool: MASTER Herbs Silverpine Forest zone 130 ( by 45)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=957; -- increase pool: MASTER Herbs Teldrassil zone 141 ( by 20)
UPDATE `pool_template` SET `max_limit`=70 WHERE `entry`=958; -- increase pool: MASTER Herbs Hillsbrad Foothills zone 267 ( by 55)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=959; -- increase pool: MASTER Herbs Arathi Highlands zone 45 ( by 120)
UPDATE `pool_template` SET `max_limit`=95 WHERE `entry`=960; -- increase pool: MASTER Herbs Ashenvale zone 331 ( by 105)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=961; -- increase pool: MASTER Herbs Darkshore zone 148 ( by 85)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=962; -- increase pool: MASTER Herbs Thousand Needles zone 400 ( by 20)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=963; -- increase pool: MASTER Herbs Tanaris zone 440 ( by 20)
UPDATE `pool_template` SET `max_limit`=65 WHERE `entry`=964; -- increase pool: MASTER Herbs Feralas zone 357 ( by 50)
UPDATE `pool_template` SET `max_limit`=90 WHERE `entry`=965; -- increase pool: MASTER Herbs Hinterlands zone 47 ( by 75)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=966; -- increase pool: MASTER Herbs Un'Goro Crater zone 490 ( by 60)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=967; -- increase pool: MASTER Herbs Winterspring zone 618 ( by 60)
UPDATE `pool_template` SET `max_limit`=90 WHERE `entry`=968; -- increase pool: MASTER Herbs Eastern Plaguelands zone 139 ( by 110)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=969; -- increase pool: MASTER Herbs Ghostlands zone 3433 ( by 15)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=970; -- increase pool: MASTER Herbs Eversong Woods zone 3430 ( by 25)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=971; -- increase pool: MASTER Herbs Azuremyst Isle zone 3524 ( by 15)
UPDATE `pool_template` SET `max_limit`=60 WHERE `entry`=972; -- increase pool: MASTER Herbs Hellfire Peninsula zone 3483 ( by 45)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=973; -- increase pool: MASTER Herbs Nagrand zone 3518 ( by 25)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=974; -- increase pool: MASTER Herbs Netherstorm zone 3523 ( by 25)
UPDATE `pool_template` SET `max_limit`=95 WHERE `entry`=975; -- increase pool: MASTER Herbs Zangarmarsh zone 3521 ( by 80)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=976; -- increase pool: MASTER Herbs Shadowmoon Valley zone 3520 ( by 30)
UPDATE `pool_template` SET `max_limit`=65 WHERE `entry`=977; -- increase pool: MASTER Herbs Terokkar Forest zone 3519 ( by 50)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=978; -- increase pool: MASTER Herbs Blade's Edge Mountains zone 3522 ( by 20)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=980; -- increase pool: MASTER Herbs Icecrown zone 210 ( by 25)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=981; -- increase pool: MASTER Herbs Storm Peaks zone 67 ( by 20)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=982; -- increase pool: MASTER Herbs Sholazar Basin zone 3711 ( by 25)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=983; -- increase pool: MASTER Herbs Zul'drak zone 66 ( by 25)
UPDATE `pool_template` SET `max_limit`=20 WHERE `entry`=984; -- increase pool: MASTER Herbs Grizzly Hills zone 394 ( by 5)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=985; -- increase pool: MASTER Herbs Dragonblight zone 65 ( by 20)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=986; -- increase pool: MASTER Herbs Howling Fjord zone 495 ( by 15)
UPDATE `pool_template` SET `max_limit`=25 WHERE `entry`=987; -- increase pool: MASTER Herbs Borean Tundra zone 3537 ( by 10)
UPDATE `pool_template` SET `max_limit`=100 WHERE `entry`=988; -- increase pool: MASTER Herbs Stranglethorn Vale zone 33 ( by 165)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=990; -- increase pool: MASTER Herbs Azshara zone 16 ( by 115)
UPDATE `pool_template` SET `max_limit`=25 WHERE `entry`=991; -- increase pool: MASTER Herbs Dustwallow Marsh zone 15 ( by 10)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=992; -- increase pool: MASTER Herbs Durotar zone 14 ( by 60)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=993; -- increase pool: MASTER Herbs Elwynn Forest zone 12 ( by 25)
UPDATE `pool_template` SET `max_limit`=90 WHERE `entry`=994; -- increase pool: MASTER Herbs Wetlands zone 11 ( by 85)
UPDATE `pool_template` SET `max_limit`=80 WHERE `entry`=995; -- increase pool: MASTER Herbs Duskwood zone 10 ( by 65)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=996; -- increase pool: MASTER Herbs Swamp of Sorrows zone 8 ( by 85)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=997; -- increase pool: MASTER Herbs Blasted Lands zone 4 ( by 15)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=998; -- increase pool: MASTER Herbs Badlands zone 3 ( by 30)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=999; -- increase pool: MASTER Herbs Dun Morogh zone 1 ( by 25)
-- Deletes old script
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=732;

-- Implements AI for Murloc Lurker
-- Timers were got from eventAI script (ACID)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=732;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=732 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(732, 0, 0, 0, 67, 0, 100, 0, 3900, 6900, 0, 0, 11, 7159, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Murloc Lurker - Casts Backstab');-- Chain the Black Knight Quest Series
UPDATE `quest_template` SET `PrevQuestId`=0,`NextQuestId`=13641 WHERE `entry`=13633; -- The Black Knight of Westfall? (Ally)
UPDATE `quest_template` SET `PrevQuestId`=0,`NextQuestId`=13641 WHERE `entry`=13634; -- The Black Knight of Silverpine (Horde)
UPDATE `quest_template` SET `PrevQuestId`=0,`NextQuestId`=13643 WHERE `entry`=13641; -- The Seer's Crystal
UPDATE `quest_template` SET `PrevQuestId`=13641,`NextQuestId`=0 WHERE `entry`=13643; -- The Stories Dead Men Tell
UPDATE `quest_template` SET `PrevQuestId`=13643,`NextQuestId`=0 WHERE `entry`=13654; -- There's Something About the Squire
UPDATE `quest_template` SET `PrevQuestId`=13654,`NextQuestId`=0 WHERE `entry`=13663; -- The Black Knight's Orders
UPDATE `quest_template` SET `PrevQuestId`=13663,`NextQuestId`=0 WHERE `entry`=13664; -- The Black Knight's Fall
UPDATE `quest_template` SET `PrevQuestId`=13664,`NextQuestId`=0 WHERE `entry`=14016; -- The Black Knight's Curse
UPDATE `quest_template` SET `PrevQuestId`=14016,`NextQuestId`=0 WHERE `entry`=14017; -- The Black Knight's Fate
-- Thread from Above only after The Black Knight's Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13682; -- Thread from Above only after The Black Knights Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13788; -- Thread from Above only after The Black Knights Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13809; -- Thread from Above only after The Black Knights Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13812; -- Thread from Above only after The Black Knights Fall
-- Fix some startuperrors:
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry` IN (32405,32407); 
-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=6652 AND `text_id`=9190;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6652,9190);
DELETE FROM `gossip_menu` WHERE `entry`=7146 AND `text_id`=8410;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7146,8410);
DELETE FROM `gossip_menu` WHERE `entry`=7153 AND `text_id`=8417;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7153,8417);
DELETE FROM `gossip_menu` WHERE `entry`=7158 AND `text_id`=8423;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7158,8423);
DELETE FROM `gossip_menu` WHERE `entry`=7159 AND `text_id`=8424;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7159,8424);
DELETE FROM `gossip_menu` WHERE `entry`=7160 AND `text_id`=8429;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7160,8429);
DELETE FROM `gossip_menu` WHERE `entry`=7162 AND `text_id`=8431;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7162,8431);
DELETE FROM `gossip_menu` WHERE `entry`=7163 AND `text_id`=8433;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7163,8433);
DELETE FROM `gossip_menu` WHERE `entry`=7171 AND `text_id`=8445;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7171,8445);
DELETE FROM `gossip_menu` WHERE `entry`=7172 AND `text_id`=8447;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7172,8447);
DELETE FROM `gossip_menu` WHERE `entry`=7188 AND `text_id`=8466;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7188,8466);
DELETE FROM `gossip_menu` WHERE `entry`=7192 AND `text_id`=8472;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7192,8472);
DELETE FROM `gossip_menu` WHERE `entry`=7195 AND `text_id`=8476;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7195,8476);
DELETE FROM `gossip_menu` WHERE `entry`=7204 AND `text_id`=8485;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7204,8485);
DELETE FROM `gossip_menu` WHERE `entry`=7205 AND `text_id`=8487;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7205,8487);
DELETE FROM `gossip_menu` WHERE `entry`=7206 AND `text_id`=8488;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7206,8488);
DELETE FROM `gossip_menu` WHERE `entry`=7207 AND `text_id`=8489;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7207,8489);
DELETE FROM `gossip_menu` WHERE `entry`=7211 AND `text_id`=8501;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7211,8501);
DELETE FROM `gossip_menu` WHERE `entry`=7250 AND `text_id`=8564;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7250,8564);
DELETE FROM `gossip_menu` WHERE `entry`=7251 AND `text_id`=8565;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7251,8565);
DELETE FROM `gossip_menu` WHERE `entry`=7253 AND `text_id`=8569;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7253,8569);
DELETE FROM `gossip_menu` WHERE `entry`=7259 AND `text_id`=8580;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7259,8580);
DELETE FROM `gossip_menu` WHERE `entry`=7287 AND `text_id`=8617;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7287,8617);
DELETE FROM `gossip_menu` WHERE `entry`=7289 AND `text_id`=8620;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7289,8620);
DELETE FROM `gossip_menu` WHERE `entry`=7291 AND `text_id`=8638;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7291,8638);
DELETE FROM `gossip_menu` WHERE `entry`=7446 AND `text_id`=9019;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7446,9019);
DELETE FROM `gossip_menu` WHERE `entry`=7447 AND `text_id`=9020;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7447,9020);
DELETE FROM `gossip_menu` WHERE `entry`=7451 AND `text_id`=9024;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7451,9024);
DELETE FROM `gossip_menu` WHERE `entry`=8775 AND `text_id`=11354;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8775,11354);
DELETE FROM `gossip_menu` WHERE `entry`=8789 AND `text_id`=11256;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8789,11256);
DELETE FROM `gossip_menu` WHERE `entry`=8790 AND `text_id`=11257;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8790,11257);
DELETE FROM `gossip_menu` WHERE `entry`=8791 AND `text_id`=11258;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8791,11258);
DELETE FROM `gossip_menu` WHERE `entry`=8792 AND `text_id`=11259;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8792,11259);
DELETE FROM `gossip_menu` WHERE `entry`=8825 AND `text_id`=11372;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8825,11372);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=7146 WHERE `entry`=16187;
UPDATE `creature_template` SET `gossip_menu_id`=7153 WHERE `entry`=16197;
UPDATE `creature_template` SET `gossip_menu_id`=7158 WHERE `entry`=16213;
UPDATE `creature_template` SET `gossip_menu_id`=7159 WHERE `entry`=16219;
UPDATE `creature_template` SET `gossip_menu_id`=7160 WHERE `entry`=16220;
UPDATE `creature_template` SET `gossip_menu_id`=7162 WHERE `entry`=16224;
UPDATE `creature_template` SET `gossip_menu_id`=7163 WHERE `entry`=16231;
UPDATE `creature_template` SET `gossip_menu_id`=7171 WHERE `entry`=16253;
UPDATE `creature_template` SET `gossip_menu_id`=7172 WHERE `entry`=16252;
UPDATE `creature_template` SET `gossip_menu_id`=7188 WHERE `entry`=16289;
UPDATE `creature_template` SET `gossip_menu_id`=7192 WHERE `entry`=16293;
UPDATE `creature_template` SET `gossip_menu_id`=7195 WHERE `entry`=16203;
UPDATE `creature_template` SET `gossip_menu_id`=7204 WHERE `entry`=16205;
UPDATE `creature_template` SET `gossip_menu_id`=7205 WHERE `entry`=16202;
UPDATE `creature_template` SET `gossip_menu_id`=7206 WHERE `entry`=16201;
UPDATE `creature_template` SET `gossip_menu_id`=7207 WHERE `entry`=16251;
UPDATE `creature_template` SET `gossip_menu_id`=7250 WHERE `entry`=16462;
UPDATE `creature_template` SET `gossip_menu_id`=7251 WHERE `entry`=16464;
UPDATE `creature_template` SET `gossip_menu_id`=7253 WHERE `entry`=16463;
UPDATE `creature_template` SET `gossip_menu_id`=7259 WHERE `entry`=16480;
UPDATE `creature_template` SET `gossip_menu_id`=7287 WHERE `entry`=16528;
UPDATE `creature_template` SET `gossip_menu_id`=7288 WHERE `entry`=16542;
UPDATE `creature_template` SET `gossip_menu_id`=7289 WHERE `entry`=16217;
UPDATE `creature_template` SET `gossip_menu_id`=7291 WHERE `entry`=16603;
UPDATE `creature_template` SET `gossip_menu_id`=7446 WHERE `entry`=17655;
UPDATE `creature_template` SET `gossip_menu_id`=7447 WHERE `entry`=17656;
UPDATE `creature_template` SET `gossip_menu_id`=7451 WHERE `entry`=16665;
UPDATE `creature_template` SET `gossip_menu_id`=8775 WHERE `entry`=23559;
UPDATE `creature_template` SET `gossip_menu_id`=8789 WHERE `entry`=23718;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6652,7287,7146,7171,7451,7446,7153,7447,8789) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6652,7171,8789) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8789) AND `id` IN (2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8775) AND `id` IN (6);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(6652,0,3, 'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0, ''),
(6652,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, ''),
(7287,0,1, 'Show me what I have access to, Vredigar.',3,128,0,0,0,0,0, ''),
(7146,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7171,0,3, 'Master chef, can you train me in the culinary arts?',5,16,0,0,0,0,0, ''),
(7171,1,1, 'Have you any cooking supplies?',3,128,0,0,0,0,0, ''),
(7451,0,12, 'I wish to make use of the stables.',14,4194304,0,0,0,0,0, ''),
(7446,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7153,0,0, 'Arcanist Vandril, what are the Forsaken doing here?',1,1,7211,0,0,0,0, ''),
(7447,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(8789,0,0, 'Who is this Budd fellow?',1,1,8790,0,0,0,0, ''),
(8789,1,0, 'Interesting crew you''ve got here....',1,1,8791,0,0,0,0, ''),
(8789,2,0, 'Whew! What''s that smell?',1,1,8792,0,0,0,0, ''),
(8775,6,0, 'Are you suggesting I provide you with people for Zul''jin''s sacrifices?',1,1,8825,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (11354,11372);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(11354,1,'Listen, $c, it''s clear that you and your friends know your way around Azeroth. Surely you''ve come across certain folks who hunger for fame and fortune. $b$bSend me anyone who might be willing to enter Zul''Aman and I''ll make it worth your while.','',0,0,1,1000,1,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(11372,1,'Perish the thought!$b$bI''m simply trying to rid the world of a horrible menace, and that type of thing rarely comes without a price, as I''m sure you know.$b$bThink of it like this, $n. You''ll be offering ordinary folks the chance to become heroes! A rare opportunity indeed!$b$bYou just send them my way and I''ll handle the rest....','',0,0,1,1000,1,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=10921 AND `text_id`=15170;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10921,15170);
DELETE FROM `gossip_menu` WHERE `entry`=10948 AND `text_id`=15212;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10948,15212);
DELETE FROM `gossip_menu` WHERE `entry`=7925 AND `text_id`=9704;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7925,9704);
DELETE FROM `gossip_menu` WHERE `entry`=10976 AND `text_id`=15256;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10976,15256);
DELETE FROM `gossip_menu` WHERE `entry`=12024 AND `text_id`=16850;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12024,16850);
DELETE FROM `gossip_menu` WHERE `entry`=11983 AND `text_id`=16801;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11983,16801);
DELETE FROM `gossip_menu` WHERE `entry`=11979 AND `text_id`=16796;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11979,16796);
DELETE FROM `gossip_menu` WHERE `entry`=11952 AND `text_id`=16779;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11952,16779);
DELETE FROM `gossip_menu` WHERE `entry`=6647 AND `text_id`=7904;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6647,7904);
DELETE FROM `gossip_menu` WHERE `entry`=11793 AND `text_id`=16540;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11793,16540);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=10921 WHERE `entry`=37675;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38042;
UPDATE `creature_template` SET `gossip_menu_id`=7925 WHERE `entry`=19175;
UPDATE `creature_template` SET `gossip_menu_id`=10976 WHERE `entry`=37172;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6647) AND `id` IN (0,1);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(6647,0,3, 'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0, ''),
(6647,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (9704,16850,16801,16796,16779);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(9704,1,'The largest celebration of the Lunar Festival is taking place in Moonglade. If that''s too far to travel to, there are druids offering transport from the Valley of Wisdom.','The largest celebration of the Lunar Festival is taking place in Moonglade. If that''s too far to travel to, there are druids offering transport from the Valley of Wisdom.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16850,1,'Never underestimate the power of proper supply management. The warriors may win the battles, but it''s the supplies that win the war. ','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16801,1,'There are no emotions. There are no morals. There are no zealots.$B$BThere is only the Brotherhood.$B$BHere, in the very chapel where Uther the Lightbringer joined the Order of the Silver Hand, I, Korfax, Champion of the Light, will inspire fear into the fearless.$B$BNothing will curb my fury - not the Scarlet Crusade, not the Argent Dawn, not my brothers, not even you.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16796,1,'The Brotherhood of the Light transcends the ability of any other group to eradicate affronts to the Light. We will take any actions necessary to rid the world of foul beasts like these undead. Nothing will stand in our way.$B$BAre you with us, or against us?','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16779,1,'Weapons...armor...these are the keys to victory. Any warrior, no matter how strong, is essentially defenseless without them.$B$BI have crafted many a legend in my day, $r. You will find nothing like them in all of Azeroth. They are the key to my brethren''s success.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);


-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=141 AND `text_id`=4793;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (141,4793);
DELETE FROM `gossip_menu` WHERE `entry`=523 AND `text_id`=4985;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (523,4985);
DELETE FROM `gossip_menu` WHERE `entry`=1582 AND `text_id`=938;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (1582,938);
DELETE FROM `gossip_menu` WHERE `entry`=2384 AND `text_id`=2193;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (2384,2193);
DELETE FROM `gossip_menu` WHERE `entry`=2782 AND `text_id`=3466;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (2782,3466);
DELETE FROM `gossip_menu` WHERE `entry`=3062 AND `text_id`=3794;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3062,3794);
DELETE FROM `gossip_menu` WHERE `entry`=3162 AND `text_id`=3896;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3162,3896);
DELETE FROM `gossip_menu` WHERE `entry`=3187 AND `text_id`=3954;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3187,3954);
DELETE FROM `gossip_menu` WHERE `entry`=4017 AND `text_id`=4888;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4017,4888);
DELETE FROM `gossip_menu` WHERE `entry`=4104 AND `text_id`=5006;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4104,5006);
DELETE FROM `gossip_menu` WHERE `entry`=4105 AND `text_id`=5008;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4105,5008);
DELETE FROM `gossip_menu` WHERE `entry`=4509 AND `text_id`=4985;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4509,4985);
DELETE FROM `gossip_menu` WHERE `entry`=4511 AND `text_id`=4985;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4511,4985);
DELETE FROM `gossip_menu` WHERE `entry`=4603 AND `text_id`=5715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4603,5715);
DELETE FROM `gossip_menu` WHERE `entry`=4604 AND `text_id`=5715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4604,5715);
DELETE FROM `gossip_menu` WHERE `entry`=4643 AND `text_id`=5715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4643,5715);
DELETE FROM `gossip_menu` WHERE `entry`=4741 AND `text_id`=5793;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4741,5793);
DELETE FROM `gossip_menu` WHERE `entry`=4747 AND `text_id`=5799;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4747,5799);
DELETE FROM `gossip_menu` WHERE `entry`=5848 AND `text_id`=7010;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5848,7010);
DELETE FROM `gossip_menu` WHERE `entry`=6815 AND `text_id`=7935;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6815,7935);
DELETE FROM `gossip_menu` WHERE `entry`=6899 AND `text_id`=7935;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6899,7935);
DELETE FROM `gossip_menu` WHERE `entry`=6918 AND `text_id`=8205;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6918,8205);
DELETE FROM `gossip_menu` WHERE `entry`=7935 AND `text_id`=9716;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7935,9716);
DELETE FROM `gossip_menu` WHERE `entry`=10031 AND `text_id`=13911;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10031,13911);
DELETE FROM `gossip_menu` WHERE `entry`=10181 AND `text_id`=14126;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10181,14126);
DELETE FROM `gossip_menu` WHERE `entry`=10638 AND `text_id`=14736;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10638,14736);
DELETE FROM `gossip_menu` WHERE `entry`=11185 AND `text_id`=5002;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11185,5002);
DELETE FROM `gossip_menu` WHERE `entry`=11189 AND `text_id`=15572;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11189,15572);
DELETE FROM `gossip_menu` WHERE `entry`=11653 AND `text_id`=16283;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11653,16283);
DELETE FROM `gossip_menu` WHERE `entry`=11681 AND `text_id`=16344;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11681,16344);
DELETE FROM `gossip_menu` WHERE `entry`=11726 AND `text_id`=16413;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11726,16413);
DELETE FROM `gossip_menu` WHERE `entry`=11766 AND `text_id`=16489;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11766,16489);
DELETE FROM `gossip_menu` WHERE `entry`=11767 AND `text_id`=16490;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11767,16490);
DELETE FROM `gossip_menu` WHERE `entry`=11790 AND `text_id`=16535;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11790,16535);
DELETE FROM `gossip_menu` WHERE `entry`=11824 AND `text_id`=16578;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11824,16578);
DELETE FROM `gossip_menu` WHERE `entry`=11875 AND `text_id`=4973;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11875,4973);
DELETE FROM `gossip_menu` WHERE `entry`=11877 AND `text_id`=5717;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11877,5717);
DELETE FROM `gossip_menu` WHERE `entry`=11878 AND `text_id`=5006;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11878,5006);
DELETE FROM `gossip_menu` WHERE `entry`=11879 AND `text_id`=4998;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11879,4998);
DELETE FROM `gossip_menu` WHERE `entry`=11906 AND `text_id`=16715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11906,16715);
DELETE FROM `gossip_menu` WHERE `entry`=11912 AND `text_id`=4986;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11912,4986);
DELETE FROM `gossip_menu` WHERE `entry`=11913 AND `text_id`=5004;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11913,5004);
DELETE FROM `gossip_menu` WHERE `entry`=11919 AND `text_id`=16734;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11919,16734);
DELETE FROM `gossip_menu` WHERE `entry`=11932 AND `text_id`=16749;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11932,16749);
DELETE FROM `gossip_menu` WHERE `entry`=11933 AND `text_id`=565;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11933,565);
DELETE FROM `gossip_menu` WHERE `entry`=11951 AND `text_id`=16778;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11951,16778);
DELETE FROM `gossip_menu` WHERE `entry`=11969 AND `text_id`=16783;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11969,16783);
DELETE FROM `gossip_menu` WHERE `entry`=11971 AND `text_id`=16789;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11971,16789);
DELETE FROM `gossip_menu` WHERE `entry`=12050 AND `text_id`=16882;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12050,16882);
DELETE FROM `gossip_menu` WHERE `entry`=12094 AND `text_id`=16982;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12094,16982);
DELETE FROM `gossip_menu` WHERE `entry`=12095 AND `text_id`=16983;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12095,16983);
DELETE FROM `gossip_menu` WHERE `entry`=12151 AND `text_id`=17085;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12151,17085);
DELETE FROM `gossip_menu` WHERE `entry`=12233 AND `text_id`=17176;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12233,17176);
DELETE FROM `gossip_menu` WHERE `entry`=12235 AND `text_id`=17180;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12235,17180);
DELETE FROM `gossip_menu` WHERE `entry`=12443 AND `text_id`=17499;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12443,17499);
DELETE FROM `gossip_menu` WHERE `entry`=12563 AND `text_id`=17647;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12563,17647);
DELETE FROM `gossip_menu` WHERE `entry`=12670 AND `text_id`=12549;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12670,12549);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5880;
UPDATE `creature_template` SET `gossip_menu_id`=141 WHERE `entry`=3170;
UPDATE `creature_template` SET `gossip_menu_id`=141 WHERE `entry`=3155;
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=3169;
UPDATE `creature_template` SET `gossip_menu_id`=2384 WHERE `entry`=3326;
UPDATE `creature_template` SET `gossip_menu_id`=2782 WHERE `entry`=1383;
UPDATE `creature_template` SET `gossip_menu_id`=3062 WHERE `entry`=10578;
UPDATE `creature_template` SET `gossip_menu_id`=3162 WHERE `entry`=7952;
UPDATE `creature_template` SET `gossip_menu_id`=3187 WHERE `entry`=11176;
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=3706;
UPDATE `creature_template` SET `gossip_menu_id`=4017 WHERE `entry`=3171;
UPDATE `creature_template` SET `gossip_menu_id`=4104 WHERE `entry`=3173;
UPDATE `creature_template` SET `gossip_menu_id`=4509 WHERE `entry`=3353;
UPDATE `creature_template` SET `gossip_menu_id`=4511 WHERE `entry`=3354;
UPDATE `creature_template` SET `gossip_menu_id`=4603 WHERE `entry`=3324;
UPDATE `creature_template` SET `gossip_menu_id`=4604 WHERE `entry`=3325;
UPDATE `creature_template` SET `gossip_menu_id`=4643 WHERE `entry`=3156;
UPDATE `creature_template` SET `gossip_menu_id`=4741 WHERE `entry`=3332;
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry`=3399;
UPDATE `creature_template` SET `gossip_menu_id`=5848 WHERE `entry`=14451;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=5943;
UPDATE `creature_template` SET `gossip_menu_id`=6565 WHERE `entry`=7951;
UPDATE `creature_template` SET `gossip_menu_id`=6815 WHERE `entry`=15572;
UPDATE `creature_template` SET `gossip_menu_id`=6899 WHERE `entry`=15579;
UPDATE `creature_template` SET `gossip_menu_id`=6918 WHERE `entry`=15895;
UPDATE `creature_template` SET `gossip_menu_id`=7935 WHERE `entry`=19177;
UPDATE `creature_template` SET `gossip_menu_id`=10031 WHERE `entry`=5875;
UPDATE `creature_template` SET `gossip_menu_id`=10181 WHERE `entry`=3881;
UPDATE `creature_template` SET `gossip_menu_id`=10638 WHERE `entry`=35364;
UPDATE `creature_template` SET `gossip_menu_id`=11189 WHERE `entry`=10676;
UPDATE `creature_template` SET `gossip_menu_id`=11790 WHERE `entry`=3139;
UPDATE `creature_template` SET `gossip_menu_id`=11971 WHERE `entry`=9988;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=12776;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=6027;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=5815;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1012,6899,12443,2746,10181,4142,4741,4747,11767,10638,7034,6918) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (12443,11767,6899,3162,6815) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6815,1582,11919) AND `id` IN (2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1582,11919,6815,6899) AND `id` IN (3);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6899) AND `id` IN (4);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(1012,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(6899,0,0, 'Where is Elder Darkcore?',1,1,0,0,0,0,0, ''),
(12443,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(2746,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(10181,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(4142,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(4741,0,3, 'I require training, Lumak.',5,16,0,0,0,0,0, ''),
(4747,0,3, 'I require training, Zamja.',5,16,0,0,0,0,0, ''),
(11767,0,3, 'I would like to train.',5,16,0,0,0,0,0, ''),
(10638,0,0, 'I no longer wish to gain experience.',1,1,0,0,0,0,0, ''),
(7034,0,0, 'I would like to enter the secret code to receive my Murloc pet.',1,1,0,0,0,0,0, ''),
(6918,0,0, 'I''d like a new invitation to the Lunar Festival.',1,1,0,0,0,0,0, ''),
(12443,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(11767,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, ''),
(6899,1,0, 'Where is Elder Ironband?',1,1,0,0,0,0,0, ''),
(3162,1,1, 'I would like to buy from you.',3,128,0,0,0,0,0, ''),
(6815,1,0, 'Where is Elder High Mountain?',1,1,0,0,0,0,0, ''),
(6815,2,0, 'Where is Elder Moonwarden?',1,1,0,0,0,0,0, ''),
(1582,2,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(11919,2,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(1582,3,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(11919,3,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(6815,3,0, 'Where is Elder Windtotem?',1,1,0,0,0,0,0, ''),
(6899,3,0, 'Where is Elder Runetotem?',1,1,0,0,0,0,0, ''),
(6899,4,0, 'Where is Elder Windtotem?',1,1,0,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (14126,15572,16283,16344,16413,16489,16490,16535,16578,16715,16734,16749,16778,16783,16789,16882,16982,16983,17085,17125,17176,17180,17499,17647);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(14126,1,'How may I help you?','How may I help you?',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(15572,1,'Need something?','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16283,1,'Leave this old Dragonmaw to his drink, $c.$B$BI''ve fought creatures that would curl your spine and I''ve seen my people all but slaughtered in the swamps of the wetlands and amidst the ruins of Outland.$B$BGet. Lost.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16344,1,'You ever been to the jungle, $r?$b$bIt''s real nice.','',0,0,0,0,0,0,0,1,'Stranglethorn, $g man: babe;.  That''s where it''s AT!','',0,0,0,0,0,0,0,1,'Hi.','',0,0,0,0,0,0,0,1,'Ah, to be back in Stranglethorn.  The screeching raptors, the troll wars, jungle creatures as far as the eye see, just ASKING to be killed...$b$b<Bort sighs.>','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16413,1,'Fishing has always come naturally to my family.  You look like you could use a little help though.  How about running a few errands for a Master Angler?','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16489,1,'The Light protect you, $c.','The Light protect you, $c.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16490,1,'The light of the Sun illuminates the path to wisdom.  Where shall we walk today, friend?','The light of the Sun illuminates the path to wisdom.  Where shall we walk today, friend?',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16535,1,'Keep your eyes open, $c. Even Durotar is not safe from our enemies.','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16578,1,'Ya''ll need to find a different trainer, $c. I cannot help ya.','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16715,1,'Dark is de jungle, but fertile is its soil.$B$BMay de spirits of de earth watch over ya, $c.','Dark is de jungle, but fertile is its soil.$B$BMay de spirits of de earth watch over ya, $c.',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16734,100,'Come in, mon... forget yer cares for a while!$B$BRest de body, rest de soul.','Come in, mon... forget yer cares for a while!$B$BRest de body, rest de soul.',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16749,1,'De secrets I have ta share would blast your soul apart, $c.$B$BTrust me: You be wantin'' ta talk ta someone else about trainin''.','De secrets I have ta share would blast your soul apart, $c.$B$BTrust me: You be wantin'' ta talk ta someone else about trainin''.',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16778,1,'I can''t see a thing with this mask on, but I''m not about to tell HER that.','',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16783,1,'You take a wrong turn, mon? Heh heh heh.$B$BWhat can I be helpin'' ya find?','You take a wrong turn, mon? Heh heh heh.$B$BWhat can I be helpin'' ya find?',1,0,153,3,396,0,0,1,'Don''t see many a'' your kind ''round here, mon.$B$BWhat can I be helpin'' ya find?','Don''t see many a'' your kind ''round here, mon.$B$BWhat can I be helpin'' ya find?',1,0,396,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16789,1,'Hey der, mon.$B$BDid ya need help recoverin'' a lost companion?','Hey der, mon.$B$BDid ya need help recoverin'' a lost companion?',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16882,1,'Nothin'' ta see here, mon.  Be on yer way, why don''cha?','Nothin'' ta see here, mon.  Be on yer way, why don''cha?',1,0,274,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16982,1,'The Highborne have returned, and with them spellcraft lost to the world for centuries.$B$BDo you have something for me to examine?','The Highborne have returned, and with them spellcraft lost to the world for centuries.$B$BDo you have something for me to examine?',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16983,1,'Arcane Reforgers can modify the magical effects of a item; this magically complex process is known simply as reforging.$B$BThrough reforging, a secondary attribute of any piece of weaponry, armor, or jewelry may be reduced in order to add an additional secondary attribute. In this manner one may customize their equipment to best match their role and skills.$B$BFor example, if an item afforded you a bonus to strike your enemies but you''d rather it made you attack more quickly, an Arcane Reforger could, for a price, reforge the item to have less Hit Rating but increase your Haste Rating.','Arcane Reforgers can modify the magical effects of a item; this magically complex process is known simply as reforging.$B$BThrough reforging, a secondary attribute of any piece of weaponry, armor, or jewelry may be reduced in order to add an additional secondary attribute. In this manner one may customize their equipment to best match their role and skills.$B$BFor example, if an item afforded you a bonus to strike your enemies but you''d rather it made you attack more quickly, an Arcane Reforger could, for a price, reforge the item to have less Hit Rating but increase your Haste Rating.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17085,1,'After the fall of the Burning Blade Clan, we blademasters swore to free ourselves and our people from demonic control.$B$BThis may be done, but my honor remains unsatisfied.$B$BI shall fight for the Horde - and train other warriors to do so - until I die gloriously in battle. This is the only path I may tread.','After the fall of the Burning Blade Clan, we blademasters swore to free ourselves and our people from demonic control.$B$BThis may be done, but my honor remains unsatisfied.$B$BI shall fight for the Horde - and train other warriors to do so - until I die gloriously in battle. This is the only path I may tread.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17125,1,'I can teach you the basics of any gathering or production profession, but that''s all.$B$BTo learn more than an apprentice''s skills, you''ll need to visit a specialist dedicated to only one profession.$B$BYou can learn up to two professions: Two gathering, two production, or one of each.$B$BSecondary skills like Archaeology, Cooking, First Aid, and Fishing don''t count towards your two professions; you can learn as many of those as you like.','I can teach you the basics of any gathering or production profession, but that''s all.$B$BTo learn more than an apprentice''s skills, you''ll need to visit a specialist dedicated to only one profession.$B$BYou can learn up to two professions: Two gathering, two production, or one of each.$B$BSecondary skills like Archaeology, Cooking, First Aid, and Fishing don''t count towards your two professions; you can learn as many of those as you like.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17176,1,'For too long we have ignored the secrets of the Arcane.$B$BSadly, they will remain a secret to you.','For too long we have ignored the secrets of the Arcane.$B$BSadly, they will remain a secret to you.',1,0,274,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17180,1,'Sorry, $c. $B$BYour grasp of the arcane isn''t strong enough to understand portal magic.','Sorry, $c. $B$BYour grasp of the arcane isn''t strong enough to understand portal magic.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17499,1,'You be here ta learn fishin'', mon? Or maybe ta buy some tings for it?','You be here ta learn fishin'', mon? Or maybe ta buy some tings for it?',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17647,1,'Hail, $N.  We''re in need of your assistance.','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=5854 AND `text_id`=7017;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5854,7017);
DELETE FROM `gossip_menu` WHERE `entry`=6573 AND `text_id`=7821;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6573,7821);
DELETE FROM `gossip_menu` WHERE `entry`=6570 AND `text_id`=7869;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6570,7869);
DELETE FROM `gossip_menu` WHERE `entry`=7437 AND `text_id`=7903;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7437,7903);
DELETE FROM `gossip_menu` WHERE `entry`=6939 AND `text_id`=8228;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6939,8228);
DELETE FROM `gossip_menu` WHERE `entry`=6940 AND `text_id`=8229;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6940,8229);
DELETE FROM `gossip_menu` WHERE `entry`=6942 AND `text_id`=8232;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6942,8232);
DELETE FROM `gossip_menu` WHERE `entry`=7116 AND `text_id`=8374;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7116,8374);
DELETE FROM `gossip_menu` WHERE `entry`=7117 AND `text_id`=8378;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7117,8378);
DELETE FROM `gossip_menu` WHERE `entry`=7141 AND `text_id`=8403;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7141,8403);
DELETE FROM `gossip_menu` WHERE `entry`=7154 AND `text_id`=8418;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7154,8418);
DELETE FROM `gossip_menu` WHERE `entry`=7155 AND `text_id`=8419;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7155,8419);
DELETE FROM `gossip_menu` WHERE `entry`=7156 AND `text_id`=8421;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7156,8421);
DELETE FROM `gossip_menu` WHERE `entry`=7214 AND `text_id`=8504;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7214,8504);
DELETE FROM `gossip_menu` WHERE `entry`=7235 AND `text_id`=8535;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7235,8535);
DELETE FROM `gossip_menu` WHERE `entry`=7244 AND `text_id`=8552;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7244,8552);
DELETE FROM `gossip_menu` WHERE `entry`=7245 AND `text_id`=8556;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7245,8556);
DELETE FROM `gossip_menu` WHERE `entry`=7247 AND `text_id`=8558;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7247,8558);
DELETE FROM `gossip_menu` WHERE `entry`=7255 AND `text_id`=8575;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7255,8575);
DELETE FROM `gossip_menu` WHERE `entry`=7256 AND `text_id`=8576;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7256,8576);
DELETE FROM `gossip_menu` WHERE `entry`=7311 AND `text_id`=8678;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7311,8678);
DELETE FROM `gossip_menu` WHERE `entry`=7313 AND `text_id`=8682;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7313,8682);
DELETE FROM `gossip_menu` WHERE `entry`=7316 AND `text_id`=8684;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7316,8684);
DELETE FROM `gossip_menu` WHERE `entry`=7323 AND `text_id`=8698;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7323,8698);
DELETE FROM `gossip_menu` WHERE `entry`=7324 AND `text_id`=8699;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7324,8699);
DELETE FROM `gossip_menu` WHERE `entry`=7325 AND `text_id`=8700;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7325,8700);
DELETE FROM `gossip_menu` WHERE `entry`=7344 AND `text_id`=8755;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7344,8755);
DELETE FROM `gossip_menu` WHERE `entry`=7864 AND `text_id`=9630;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7864,9630);
DELETE FROM `gossip_menu` WHERE `entry`=7921 AND `text_id`=9700;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7921,9700);
DELETE FROM `gossip_menu` WHERE `entry`=8098 AND `text_id`=10011;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8098,10011);
DELETE FROM `gossip_menu` WHERE `entry`=8376 AND `text_id`=10451;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8376,10451);
DELETE FROM `gossip_menu` WHERE `entry`=8380 AND `text_id`=10456;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8380,10456);
DELETE FROM `gossip_menu` WHERE `entry`=8732 AND `text_id`=11049;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8732,11049);
DELETE FROM `gossip_menu` WHERE `entry`=8733 AND `text_id`=11055;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8733,11055);
DELETE FROM `gossip_menu` WHERE `entry`=9142 AND `text_id`=12370;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9142,12370);
DELETE FROM `gossip_menu` WHERE `entry`=10991 AND `text_id`=15284;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10991,15284);
DELETE FROM `gossip_menu` WHERE `entry`=11902 AND `text_id`=16703;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11902,16703);
DELETE FROM `gossip_menu` WHERE `entry`=9420 AND `text_id`=12666;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9420,12666);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=16271;
UPDATE `creature_template` SET `gossip_menu_id`=5854 WHERE `entry`=16676;
UPDATE `creature_template` SET `gossip_menu_id`=6570 WHERE `entry`=15281;
UPDATE `creature_template` SET `gossip_menu_id`=6573 WHERE `entry`=15301;
UPDATE `creature_template` SET `gossip_menu_id`=6647 WHERE `entry`=16275;
UPDATE `creature_template` SET `gossip_menu_id`=6650 WHERE `entry`=16279;
UPDATE `creature_template` SET `gossip_menu_id`=6652 WHERE `entry`=16270;
UPDATE `creature_template` SET `gossip_menu_id`=6939 WHERE `entry`=15924;
UPDATE `creature_template` SET `gossip_menu_id`=6940 WHERE `entry`=15403;
UPDATE `creature_template` SET `gossip_menu_id`=6942 WHERE `entry`=15951;
UPDATE `creature_template` SET `gossip_menu_id`=7116 WHERE `entry`=16144;
UPDATE `creature_template` SET `gossip_menu_id`=7117 WHERE `entry`=16147;
UPDATE `creature_template` SET `gossip_menu_id`=7141 WHERE `entry`=15416;
UPDATE `creature_template` SET `gossip_menu_id`=7154 WHERE `entry`=16196;
UPDATE `creature_template` SET `gossip_menu_id`=7155 WHERE `entry`=16183;
UPDATE `creature_template` SET `gossip_menu_id`=7156 WHERE `entry`=16210;
UPDATE `creature_template` SET `gossip_menu_id`=7214 WHERE `entry`=16362;
UPDATE `creature_template` SET `gossip_menu_id`=7235 WHERE `entry`=16397;
UPDATE `creature_template` SET `gossip_menu_id`=7244 WHERE `entry`=16443;
UPDATE `creature_template` SET `gossip_menu_id`=7245 WHERE `entry`=16444;
UPDATE `creature_template` SET `gossip_menu_id`=7247 WHERE `entry`=15942;
UPDATE `creature_template` SET `gossip_menu_id`=7255 WHERE `entry`=15398;
UPDATE `creature_template` SET `gossip_menu_id`=7256 WHERE `entry`=15400;
UPDATE `creature_template` SET `gossip_menu_id`=7311 WHERE `entry`=16263;
UPDATE `creature_template` SET `gossip_menu_id`=7313 WHERE `entry`=16860;
UPDATE `creature_template` SET `gossip_menu_id`=7316 WHERE `entry`=16862;
UPDATE `creature_template` SET `gossip_menu_id`=7323 WHERE `entry`=16924;
UPDATE `creature_template` SET `gossip_menu_id`=7324 WHERE `entry`=15397;
UPDATE `creature_template` SET `gossip_menu_id`=7325 WHERE `entry`=15401;
UPDATE `creature_template` SET `gossip_menu_id`=7344 WHERE `entry`=15399;
UPDATE `creature_template` SET `gossip_menu_id`=7346 WHERE `entry`=17056;
UPDATE `creature_template` SET `gossip_menu_id`=7437 WHERE `entry`=16647;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16160;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16161;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16366;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16367;
UPDATE `creature_template` SET `gossip_menu_id`=7566 WHERE `entry`=16646;
UPDATE `creature_template` SET `gossip_menu_id`=7566 WHERE `entry`=16648;
UPDATE `creature_template` SET `gossip_menu_id`=7864 WHERE `entry`=18947;
UPDATE `creature_template` SET `gossip_menu_id`=7921 WHERE `entry`=19169;
UPDATE `creature_template` SET `gossip_menu_id`=8098 WHERE `entry`=16264;
UPDATE `creature_template` SET `gossip_menu_id`=8376 WHERE `entry`=15501;
UPDATE `creature_template` SET `gossip_menu_id`=8380 WHERE `entry`=19775;
UPDATE `creature_template` SET `gossip_menu_id`=8732 WHERE `entry`=16688;
UPDATE `creature_template` SET `gossip_menu_id`=8733 WHERE `entry`=16642;
UPDATE `creature_template` SET `gossip_menu_id`=9142 WHERE `entry`=17718;
UPDATE `creature_template` SET `gossip_menu_id`=9821 WHERE `entry`=16185;
UPDATE `creature_template` SET `gossip_menu_id`=10181 WHERE `entry`=16261;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38043;
UPDATE `creature_template` SET `gossip_menu_id`=10991 WHERE `entry`=38295;
UPDATE `creature_template` SET `gossip_menu_id`=11902 WHERE `entry`=15278;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=16649;
UPDATE `creature_template` SET `gossip_menu_id`=9420 WHERE `entry`=26647;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7244,7245,7256,7311,7313,7524,7864,8098,8376,8380,8732,8733) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7256,7324,7524) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7324) AND `id` IN (2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7244,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7245,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7256,0,3, 'I wish to learn more about blacksmithing.',5,16,0,0,0,0,0, ''),
(7256,1,1, 'May I see your wares?',3,128,0,0,0,0,0, ''),
(7311,0,1, 'May I see your wares?',3,128,0,0,0,0,0, ''),
(7313,0,1, 'Let me see what hatchlings you have for sale.',3,128,0,0,0,0,0, ''),
(7324,2,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7324,1,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7524,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7524,1,3, 'Train me.',5,16,0,0,0,0,0, ''),
(7864,0,1, 'I would like to buy from you.',3,128,0,0,0,0,0, ''),
(8098,0,1, 'I wish to purchase one of these creatures.',3,128,0,0,0,0,0, ''),
(8376,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(8380,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(8732,0,3, 'I would like to train.',5,16,0,0,0,0,0, ''),
(8733,0,3, 'I would like to train.',5,16,0,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (7821,16703);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(7821,1,'','Ah, $N - it is good to see you again.  I trust your affairs go well.',0,0,2,0,1,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16703,1,'','$N!  I hope you''re ready to get to work, because there is much for you to do here on Sunstrider Isle.$B$BEver since the destruction of the Sunwell by Arthas and the Scourge, we have been a race adrift on a sea of uncertainty.  We teeter on the edge of oblivion.  This will change, $c, and you will learn and aid our recovery at the same time.$B$BThe Outland awaits us!',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);


-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=7436 AND `text_id`=9005;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7436,9005);
-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=7436 WHERE `entry`=16268;
-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7436 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7436,0,1, 'May I see your wares?',3,128,0,0,0,0,0, '');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=9985 AND `text_id`=13839;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9985,13839);
-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=9985 WHERE `entry`=26905;
-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9985 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9985,0,3, 'Train me.',5,16,0,0,0,0,0, '');

-- Conversation between Highlord Tirion Fordring & The Ebon Watcher minor text update from sniff
UPDATE `creature_text` SET `text`= 'The Lich King is unlike any foe that you have ever faced, Highlord. Though you bested him upon the holy ground of Light''s Hope Chapel, you tread now upon his domain.$B' WHERE `entry`=30377 AND `groupid`=1;
UPDATE `creature_text` SET `text`= 'You cannot win. Not like this...$B' WHERE `entry`=30377 AND `groupid`=2;
UPDATE `creature_text` SET `text`= 'The Lich King knows your boundaries, Highlord. He knows that you will not fire on your own men. Do you not understand? He has no boundaries. No rules to abide. $B' WHERE `entry`=30377 AND `groupid`=8;
UPDATE `creature_text` SET `text`= 'Then you have lost, Highlord.$B' WHERE `entry`=30377 AND `groupid`=9;

-- Fix some text for quest 9164 "Captives at Deatholme" now that I can properly parse the sniffs
UPDATE `creature_text` SET `text`= 'Th... thank you.  I thought I was going to die.' WHERE `entry`=16206;
UPDATE `gossip_menu_option` SET `option_text`= 'A bit ungrateful, aren''t we?  The way out is clear, flee quickly!' WHERE `menu_id`=7179;
UPDATE `gossip_menu_option` SET `option_text`= 'You''re free to go now.  The way out is safe.' WHERE `menu_id`=7176;
UPDATE `gossip_menu_option` SET `option_text`= 'You''re free to go now.  The way out is safe.' WHERE `menu_id`=7186;
DELETE FROM `disables` WHERE `sourceType` = 4 AND `entry` IN (7625,6446,7628);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (6446,7625) AND `type`=11;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7628 AND `type`!=0;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES 
(6446,11,0,0,'achievement_bg_sa_drop_it'),
(7625,11,0,0,'achievement_bg_sa_artillery_veteran'),
(7628,11,0,0,'achievement_bg_sa_artillery_expert'),
(7628,3,607,0,'');
DELETE FROM `spell_bonus_data` WHERE `entry`=31707;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
(31707,0.8333,0,0,0, 'Mage - Water Elemental Waterbolt');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7628 AND `type`=3;
DELETE FROM `spell_script_names`  WHERE `ScriptName` IN ('spell_generic_clone', 'spell_generic_clone_weapon');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45785, 'spell_generic_clone'),
(49889, 'spell_generic_clone'),
(50218, 'spell_generic_clone'),
(51719, 'spell_generic_clone'),
(57528, 'spell_generic_clone'),
(69828, 'spell_generic_clone'),
(41055, 'spell_generic_clone_weapon'),
(63416, 'spell_generic_clone_weapon'),
(69891, 'spell_generic_clone_weapon'),
(45206, 'spell_generic_clone_weapon'),
(69892, 'spell_generic_clone_weapon'),
(57593, 'spell_generic_clone_weapon');
SET @GUID=152032; -- Need 8
DELETE FROM `creature` WHERE `id`=33429;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,33429,571,1,256,0,0,6253.47,2263.21,244.456,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+1,33429,571,1,256,0,0,6217.16,2252.59,496.038,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+2,33429,571,1,256,0,0,6234.1,2301.56,488.447,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+3,33429,571,1,256,0,0,6163.18,2231.77,506.981,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+4,33429,571,1,256,0,0,6172.18,2257.27,503.146,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+5,33429,571,1,256,0,0,6242.42,2246.47,491.941,0.56266,120,0,0,1,0,0,0,0,0,0),
(@GUID+6,33429,571,1,256,0,0,6202.35,2284.08,495.286,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+7,33429,571,1,256,0,0,6145.68,2208.17,512.426,0.488692,120,0,0,1,0,0,0,0,0,0);

-- Template updates for creature 33429 (Boneguard Lieutenant)
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=33429; -- Boneguard Lieutenant
-- Model data 29098 (creature 33429 (Boneguard Lieutenant))
UPDATE `creature_model_info` SET `bounding_radius`=0.459,`combat_reach`=2.25,`gender`=0 WHERE `modelid`=29098; -- Boneguard Lieutenant
-- Addon data for creature 33429 (Boneguard Lieutenant)
DELETE FROM `creature_template_addon` WHERE `entry`=33429;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33429,25678,0,1,0,NULL); -- Boneguard Lieutenant
-- Spawns for Crystalweb Cavern
-- Snowblind Digger
SET @GUID=152040; -- Need 57
DELETE FROM `creature` WHERE `id` IN (29407,29409,29412,29413);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(117812,29413,571,1,1,0,0,6304.011,-1012.982,413.2471,2.827433,300,0,0,1,0,0,0,0,0,0), -- Updated Spawn with Sniffed Position
(117813,29413,571,1,1,0,0,6447,-1004.23,433.973,3.21141,300,0,0,11001,0,0,0,0,0,0),
(117814,29413,571,1,1,0,0,6694.82,-1049.95,408.713,4.79241,300,0,0,11001,0,0,0,0,0,0),
(@GUID+0,29413,571,1,1,0,0,6549.784,-1268.647,398.4628,4.380776,300,0,0,1,0,0,0,0,0,0),
(@GUID+1,29413,571,1,1,0,0,6594.707,-1254.841,396.956,0.1745329,300,0,0,1,0,0,0,0,0,0),
(@GUID+2,29413,571,1,1,0,0,6577.69,-1234.807,401.2381,1.919862,300,0,0,1,0,0,0,0,0,0),
(@GUID+3,29413,571,1,1,0,0,6505.765,-1010.692,437.3392,2.146755,300,0,0,1,0,0,0,0,0,0),
(@GUID+4,29413,571,1,1,0,0,6617.206,-1275.861,394.5572,0.03490658,300,0,0,1,0,0,0,0,0,0),
(@GUID+5,29413,571,1,1,0,0,6607.412,-1271.927,395.044,4.310963,300,0,0,1,0,0,0,0,0,0),
(@GUID+6,29413,571,1,1,0,0,6618.625,-1289.63,395.3728,0.2617994,300,0,0,1,0,0,0,0,0,0),
(@GUID+7,29413,571,1,1,0,0,6598.191,-1286.431,394.4492,0.3316126,300,0,0,1,0,0,0,0,0,0),
(@GUID+8,29413,571,1,1,0,0,6695.96,-1041.137,412.2228,-1.350969,300,0,0,1,0,0,0,0,0,0),
(@GUID+9,29413,571,1,1,0,0,6598.955,-1012.957,429.1754,6.230914,300,0,0,1,0,0,0,0,0,0),
(@GUID+10,29413,571,1,1,0,0,6550.22,-1296.998,395.8197,5.305801,300,0,0,1,0,0,0,0,0,0),
(@GUID+11,29413,571,1,1,0,0,6562.411,-1279.173,394.7112,4.572762,300,0,0,1,0,0,0,0,0,0),
(@GUID+12,29413,571,1,1,0,0,6582.667,-1295.584,396.0742,3.769911,300,0,0,1,0,0,0,0,0,0),
(@GUID+13,29413,571,1,1,0,0,6572.444,-1251.02 ,397.3442,1.40402,300,0,0,1,0,0,0,0,0,0),
(@GUID+14,29413,571,1,1,0,0,6554.481,-1243.797,398.5085,4.45059,300,0,0,1,0,0,0,0,0,0),
(@GUID+15,29413,571,1,1,0,0,6671.676,-1297.581,395.9203,0.1032045,300,0,0,1,0,0,0,0,0,0),
-- Crystalweb Spitter
(117781,29412,571,1,1,26223,0,6519.95,-1027.48,433.737,0.175263,300,0,0,11379,0,0,0,0,0,0),
(117782,29412,571,1,1,26223,0,6742.73,-1543.87,365.316,2.23402,300,0,0,11379,0,0,0,0,0,0),
(117783,29412,571,1,1,26223,0,6669.02,-1082.85,400.338,5.49205,300,5,0,11379,0,0,1,0,0,0),
(@GUID+16,29412,571,1,1,0,0,6685.524,-1304.507,395.6901,1.574838,300,0,0,1,0,0,0,0,0,0),
(@GUID+17,29412,571,1,1,0,0,6585.083,-1121.508,410.5753,5.966588,300,0,0,1,0,0,0,0,0,0),
(@GUID+18,29412,571,1,1,0,0,6691.913,-1491.667,377.6763,1.820203,300,0,0,1,0,0,0,0,0,0),
(@GUID+19,29412,571,1,1,0,0,6658.331,-1299.063,396.7297,2.80998,300,0,0,1,0,0,0,0,0,0),
(@GUID+20,29412,571,1,1,0,0,6645.377,-1164.97,399.7607,5.235988,300,0,0,1,0,0,0,0,0,0),
(@GUID+21,29412,571,1,1,0,0,6665.021,-1076.323,402.5284,4.24115,300,0,0,1,0,0,0,0,0,0),
(@GUID+22,29412,571,1,1,0,0,6706.143,-1073.628,391.6251,0.781437,300,0,0,1,0,0,0,0,0,0),
(@GUID+23,29412,571,1,1,0,0,6638.069,-1253.051,395.669,4.049164,300,0,0,1,0,0,0,0,0,0),
(@GUID+24,29412,571,1,1,0,0,6599.83,-1024.043,428.5868,3.237097,300,0,0,1,0,0,0,0,0,0),
(@GUID+25,29412,571,1,1,0,0,6538.664,-1043.781,428.86,0.1047198,300,0,0,1,0,0,0,0,0,0),
(@GUID+26,29412,571,1,1,0,0,6684.955,-1351.482,394.3488,6.021386,300,0,0,1,0,0,0,0,0,0),
(@GUID+27,29412,571,1,1,0,0,6712.782,-1482.948,377.3944,1.758111,300,0,0,1,0,0,0,0,0,0),
(@GUID+28,29412,571,1,1,0,0,6615.511,-1116.219,411.492,4.632286,300,0,0,1,0,0,0,0,0,0),
-- ---------------
-- -- Garm Cave --
-- ---------------
-- Snowblind Devotee
(117305,29407,571,1,1,27185,0,6297.12,-1425.6,426.168,2.28638,300,0,0,11001,3643,0,0,0,0,0),
(117306,29407,571,1,1,27174,0,6297.26,-1406.99,425.576,3.66519,300,0,0,11001,3643,0,0,0,0,0),
(117307,29407,571,1,1,27174,0,6278.49,-1425.38,425.555,1.02974,300,0,0,11001,3643,0,0,0,0,0),
(117308,29407,571,1,1,27174,0,6292.41,-1374.15,425.467,1.57504,300,5,0,11001,3643,0,1,0,0,0),
(117309,29407,571,1,1,27174,0,6293.24,-1367.46,425.361,3.45575,300,0,0,11001,3643,0,0,0,0,0),
(117310,29407,571,1,1,27185,0,6310.95,-1762.18,457.459,1.51755,300,5,0,11001,3643,0,1,0,0,0),
(@GUID+29,29407,571,1,1,0,0,6434.24,-1737.51,432.217,5.46288,300,0,0,1,0,0,0,0,0,0),
(@GUID+30,29407,571,1,1,0,0,6319.8,-1661.22,457.449,0.837758,300,0,0,1,0,0,0,0,0,0),
(@GUID+31,29407,571,1,1,0,0,6289.97,-1599.25,425.883,4.57276,300,0,0,1,0,0,0,0,0,0),
(@GUID+32,29407,571,1,1,0,0,6483.06,-1634.21,464.794,2.37365,300,0,0,1,0,0,0,0,0,0),
(@GUID+33,29407,571,1,1,0,0,6475.38,-1631.87,464.816,0.279253,300,0,0,1,0,0,0,0,0,0),
(@GUID+34,29407,571,1,1,0,0,6458.55,-1661.17,434.631,4.08083,300,0,0,1,0,0,0,0,0,0),
(@GUID+35,29407,571,1,1,0,0,6518.89,-1646.07,426.105,5.11381,300,0,0,1,0,0,0,0,0,0),
(@GUID+36,29407,571,1,1,0,0,6273.52,-1604.35,424.533,5.55015,300,0,0,1,0,0,0,0,0,0),
(@GUID+37,29407,571,1,1,0,0,6425.83,-1670.41,471.519,2.25148,300,0,0,1,0,0,0,0,0,0),
(@GUID+38,29407,571,1,1,0,0,6428.22,-1705.45,434.128,0.488692,300,0,0,1,0,0,0,0,0,0),
(@GUID+39,29407,571,1,1,0,0,6541.62,-1654.47,453.662,5.96903,300,0,0,1,0,0,0,0,0,0),
(@GUID+40,29407,571,1,1,0,0,6403.41,-1717.79,431.839,4.60767,300,0,0,1,0,0,0,0,0,0),
(@GUID+41,29407,571,1,1,0,0,6441.19,-1758.54,432.217,3.26377,300,0,0,1,0,0,0,0,0,0),
(@GUID+42,29407,571,1,1,0,0,6471.03,-1753.78,432.738,1.18682,300,0,0,1,0,0,0,0,0,0),
(@GUID+43,29407,571,1,1,0,0,6459.88,-1762.25,432.217,0.925025,300,0,0,1,0,0,0,0,0,0),
(@GUID+44,29407,571,1,1,0,0,6414.89,-1738.78,432.217,0.401426,300,0,0,1,0,0,0,0,0,0),
(@GUID+45,29407,571,1,1,0,0,6408.04,-1729.23,432.211,2.47837,300,0,0,1,0,0,0,0,0,0),
(@GUID+46,29407,571,1,1,0,0,6514.17,-1749.59,436.202,5.86431,300,0,0,1,0,0,0,0,0,0),
(@GUID+47,29407,571,1,1,0,0,6519.56,-1747.13,436.252,4.41568,300,0,0,1,0,0,0,0,0,0),
-- Garm Watcher
(117614,29409,571,1,1,24842,0,6381.32,-1648.28,420.067,1.16937,300,5,0,11770,0,0,1,0,0,0),
(@GUID+48,29409,571,1,1,0,0,6479.16,-1642.7,465.234,1.20397,300,0,0,1,0,0,0,0,0,0),
(@GUID+49,29409,571,1,1,0,0,6410.43,-1613.44,421.331,3.10776,300,0,0,1,0,0,0,0,0,0),
(@GUID+50,29409,571,1,1,0,0,6446.13,-1641.86,418.539,3.43956,300,0,0,1,0,0,0,0,0,0),
(@GUID+51,29409,571,1,1,0,0,6480.65,-1717.4,434.573,2.00713,300,0,0,1,0,0,0,0,0,0),
(@GUID+52,29409,571,1,1,0,0,6503.1,-1677.39,432.951,3.56047,300,0,0,1,0,0,0,0,0,0),
(@GUID+53,29409,571,1,1,0,0,6316.56,-1528.47,428.335,1.8326,300,0,0,1,0,0,0,0,0,0),
(@GUID+54,29409,571,1,1,0,0,6285.07,-1554.58,423.336,2.21657,300,0,0,1,0,0,0,0,0,0),
(@GUID+55,29409,571,1,1,0,0,6544.34,-1675.45,452.674,3.63029,300,0,0,1,0,0,0,0,0,0),
(@GUID+56,29409,571,1,1,0,0,6429.06,-1736.25,479.353,0.855211,300,0,0,1,0,0,0,0,0,0),
(@GUID+57,29409,571,1,1,0,0,6522.09,-1735.2,436.308,0.615843,300,0,0,1,0,0,0,0,0,0);

-- Template updates
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry` IN (29413,29412); -- Snowblind Digger
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29412; -- Crystalweb Spitter
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29407; -- Snowblind Devotee
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|32,`speed_run`=1.19048 WHERE `entry`=29546; -- K3 Snow Runner
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29618; -- Snowblind Follower
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|33554432,`speed_run`=1.19048 WHERE `entry`=29475; -- Improved Land Mine
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=29409; -- Garm Watcher


-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=0,`gender`=0 WHERE `modelid`=27183; -- Snowblind Digger
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=0,`gender`=0 WHERE `modelid`=27185; -- Snowblind Devotee
UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=0,`gender`=0 WHERE `modelid`=27172; -- Snowblind Follower
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=0,`gender`=0 WHERE `modelid`=27181; -- Snowblind Follower
UPDATE `creature_model_info` SET `bounding_radius`=0.62,`combat_reach`=6,`gender`=0 WHERE `modelid`=24857; -- Garm Invader
UPDATE `creature_model_info` SET `bounding_radius`=0.62,`combat_reach`=6,`gender`=0 WHERE `modelid`=24842; -- Garm Watcher

-- Addon data for creature 29413 (Snowblind Digger)
DELETE FROM `creature_template_addon` WHERE `entry` IN (29413,29412,29407,29546,29618,29475,29619,29409);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29413,0,0,1,0, NULL), -- Snowblind Digger
(29412,0,0,1,0,NULL), -- Crystalweb Spitter
(29407,0,0,1,0, NULL), -- Snowblind Devotee
(29546,0,0,1,0, NULL), -- K3 Snow Runner.
(29618,0,0,1,0, NULL), -- Snowblind Follower
(29475,0,0,1,0, NULL), -- Improved Land Mine
(29619,0,0,1,0, NULL), -- Garm Invader
(29409,0,0,1,0, NULL); -- Garm Watcher

-- Camp Fires in the Cave
SET @OGUID=151892;
DELETE FROM `gameobject` WHERE `id` IN (192131,192130,192129);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,192129,571,1,1,6601.13,-1285.09,394.554,-0.951203,0,0,-0.951203,0.889017,0,0,0),
(@OGUID+1,192130,571,1,1,6606.31,-1273.52,394.595,-0.854712,0.0864091,0.0250797,-0.416438,0.904701,0,0,0),
(@OGUID+2,192131,571,1,1,6562.62,-1285.12,394.856,-0.95405,-0.0144057,0.0048542,-0.459116,0.888246,0,0,0);
SET @GUID := 152098; 

DELETE FROM `creature` WHERE `id` IN (33211,33499,24495,28602,26266,29563,29695,29719,29720,29747,29790,24910);
INSERT INTO creature (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES 
-- Lake Frog
(@GUID  ,33211,571,1,1,0,0,3714.916,-4303.659,182.632217,5.098984,120,0,0,1,0,0,0),
(@GUID+1,33211,571,1,1,0,0,3727.9043,-4302.23926,182.257217,3.08221,120,0,0,1,0,0,0),
(@GUID+2,33211,571,1,1,0,0,3745.24487,-4297.097,182.389908,2.715872,120,0,0,1,0,0,0),
(@GUID+3,33211,571,1,1,0,0,3756.47559,-4301.28857,182.095047,2.807836,120,0,0,1,0,0,0),
(@GUID+4,33211,571,1,1,0,0,3771.68848,-4302.969,185.325317,2.31952834,120,0,0,1,0,0,0),
(@GUID+5,33211,571,1,1,0,0,3772.791,-4310.51367,181.825317,0.8431596,120,0,0,1,0,0,0),
(@GUID+6,33211,571,1,1,0,0,3775.21948,-4321.11475,180.200317,3.22582984,120,0,0,1,0,0,0),
(@GUID+7,33211,571,1,1,0,0,3788.88062,-4324.47852,183.075317,5.38701057,120,0,0,1,0,0,0),
(@GUID+8,33211,571,1,1,0,0,3794.85938,-4332.317,181.450317,1.17659271,120,0,0,1,0,0,0),
(@GUID+9,33211,571,1,1,0,0,3802.84766,-4337.217,182.431076,6.150771,120,0,0,1,0,0,0),
(@GUID+10,33211,571,1,1,0,0,3806.70459,-4355.509,181.681076,1.17746329,120,0,0,1,0,0,0),
(@GUID+11,33211,571,1,1,0,0,3809.69434,-4349.24,182.556076,5.637143,120,0,0,1,0,0,0),
(@GUID+12,33211,571,1,1,0,0,3813.42139,-4361.893,181.931076,2.17208815,120,0,0,1,0,0,0),
(@GUID+13,33211,571,1,1,0,0,3814.98438,-4356.101,183.181076,2.89564323,120,0,0,1,0,0,0),
-- Skelettal Woodcutter
(@GUID+14,33499,571,1,1,0,0,5396.5166,375.7173,170.753632,2.53072739,120,0,0,1,0,0,0),
(@GUID+15,33499,571,1,1,0,0,5410.31152,369.325531,167.654877,3.26376557,120,0,0,1,0,0,0),
(@GUID+16,33499,571,1,1,0,0,5411.861,354.3646,166.12265,5.75958633,120,0,0,1,0,0,0),
(@GUID+17,33499,571,1,1,0,0,5416.46338,439.1525,170.43544,3.42084527,120,0,0,1,0,0,0),
(@GUID+18,33499,571,1,1,0,0,5426.99951,440.918182,169.2432,2.565634,120,0,0,1,0,0,0),
(@GUID+19,33499,571,1,1,0,0,5427.884,360.650848,163.194031,5.078908,120,0,0,1,0,0,0),
(@GUID+20,33499,571,1,1,0,0,5458.528,424.540039,163.886261,0.2268928,120,0,0,1,0,0,0),
(@GUID+21,33499,571,1,1,0,0,5469.51074,374.17688,158.1148,4.20624352,120,0,0,1,0,0,0),
-- Blix Fixwidget
(@GUID+22,24495,1,1,1,0,0,1174.58008,-4292.92139,21.3573341,6.24827862,120,0,0,1,0,0,0), -- Only during Brewfest!
-- Death's Hand Acolyte
(@GUID+23,28602,1,1,1,0,0,-6104.96533,-1243.60107,-143.192078,3.12413931,120,0,0,1,0,0,0),
(@GUID+24,28602,1,1,1,0,0,-6121.083,-1241.73962,-143.1921,3.19395256,120,0,0,1,0,0,0),
-- Heigarr the Horrible
(@GUID+25,26266,571,1,1,0,0,2711.477,4684.87061,2.576662,-2.87749,120,0,0,1,0,0,0), -- Spawns via script???
-- Injured Icemaw Matriarch
(@GUID+26,29563,571,1,2,0,0,7335.38135,-2055.097,764.358459,3.36848545,120,0,0,1,0,0,0), -- PHASEMASK = 0x00000002
-- Tracker Thulin
(@GUID+27,29695,571,1,1,0,0,7313.95752,-1611.87976,944.595459,1.79768908,120,0,0,1,0,0,0),
-- Morbid Carcass PHASEMASK '0x00000002'
(@GUID+28,29719,571,1,2,0,0,8249.877,2766.00684,641.9236,2.84488654,120,0,0,1,0,0,0), 
(@GUID+29,29719,571,1,2,0,0,8251.455,2788.82275,641.9236,3.159046,120,0,0,1,0,0,0),
(@GUID+30,29719,571,1,2,0,0,8277.752,2676.89429,689.776733,2.5395987,120,0,0,1,0,0,0),
(@GUID+31,29719,571,1,2,0,0,8312.651,2687.84644,689.776733,1.71902692,120,0,0,1,0,0,0),
(@GUID+32,29719,571,1,2,0,0,8333.677,2713.59741,658.5447,1.27409029,120,0,0,1,0,0,0),
(@GUID+33,29719,571,1,2,0,0,8347.788,2669.8252,689.776733,0.123821385,120,0,0,1,0,0,0),
(@GUID+34,29719,571,1,2,0,0,8353.299,2769.45532,656.0902,4.17133665,120,0,0,1,0,0,0),
(@GUID+35,29719,571,1,2,0,0,8373.952,2828.15039,717.741638,2.66342187,120,0,0,1,0,0,0),
(@GUID+36,29719,571,1,2,0,0,8419.114,2731.20874,656.828064,3.8397243,120,0,0,1,0,0,0),
(@GUID+37,29719,571,1,2,0,0,8419.519,2697.39771,760.0408,4.81710863,120,0,0,1,0,0,0),
(@GUID+38,29719,571,1,2,0,0,8424.577,2652.73364,759.9575,1.02128124,120,0,0,1,0,0,0),
(@GUID+39,29719,571,1,2,0,0,8439.591,2734.11157,759.9575,4.00091362,120,0,0,1,0,0,0),
(@GUID+40,29719,571,1,2,0,0,8481.104,2684.45435,652.436646,2.75762,120,0,0,1,0,0,0),
(@GUID+41,29719,571,1,2,0,0,8485.137,2563.694,759.9575,0.482697248,120,0,0,1,0,0,0),
(@GUID+42,29719,571,1,2,0,0,8551.035,2716.2085,652.3534,0.739110649,120,0,0,1,0,0,0),
(@GUID+43,29719,571,1,2,0,0,8576.94,2706.49927,652.3534,0.875271261,120,0,0,1,0,0,0),
(@GUID+44,29719,571,1,2,0,0,8603.393,2743.799,759.9575,2.06062126,120,0,0,1,0,0,0),
(@GUID+45,29719,571,1,2,0,0,8614.454,2711.10767,652.4367,3.52556515,120,0,0,1,0,0,0),
(@GUID+46,29719,571,1,2,0,0,8626.026,2682.54761,764.3245,3.37955,120,0,0,1,0,0,0),
-- Vault Geist PHASEMASK '0x00000002'
(@GUID+47,29720,571,1,2,0,0,8271.127,2722.98315,647.9443,4.702879,120,0,0,1,0,0,0),
(@GUID+48,29720,571,1,2,0,0,8313.714,2730.06567,666.274048,1.41371667,120,0,0,1,0,0,0),
(@GUID+49,29720,571,1,2,0,0,8323.991,2775.6377,655.4387,0.820304751,120,0,0,1,0,0,0),
(@GUID+50,29720,571,1,2,0,0,8332.92,2771.744,655.195068,4.373434,120,0,0,1,0,0,0),
(@GUID+51,29720,571,1,2,0,0,8357.752,2723.99731,662.515747,1.15191734,120,0,0,1,0,0,0),
(@GUID+52,29720,571,1,2,0,0,8404.075,2751.15625,666.435547,3.59537816,120,0,0,1,0,0,0),
(@GUID+53,29720,571,1,2,0,0,8405.231,2798.09473,717.7043,2.73629141,120,0,0,1,0,0,0),
(@GUID+54,29720,571,1,2,0,0,8413.143,2643.30151,760.040833,3.281219,120,0,0,1,0,0,0),
(@GUID+55,29720,571,1,2,0,0,8439.822,2744.45386,759.9607,5.875154,120,0,0,1,0,0,0),
(@GUID+56,29720,571,1,2,0,0,8477.97,2558.73364,759.9575,5.86126,120,0,0,1,0,0,0),
(@GUID+57,29720,571,1,2,0,0,8497.8,2665.35474,653.9178,1.16937053,120,0,0,1,0,0,0),
(@GUID+58,29720,571,1,2,0,0,8503.94,2690.78564,653.9437,2.72271371,120,0,0,1,0,0,0),
(@GUID+59,29720,571,1,2,0,0,8518.637,2650.9563,653.9734,2.72271371,120,0,0,1,0,0,0),
(@GUID+60,29720,571,1,2,0,0,8525.105,2553.115,759.9575,2.747424,120,0,0,1,0,0,0),
(@GUID+61,29720,571,1,2,0,0,8530.889,2679.33374,654.1611,2.72271371,120,0,0,1,0,0,0),
(@GUID+62,29720,571,1,2,0,0,8534.625,2547.15869,759.9575,0.228721559,120,0,0,1,0,0,0),
(@GUID+63,29720,571,1,2,0,0,8536.244,2602.14526,652.3534,1.24435687,120,0,0,1,0,0,0),
(@GUID+64,29720,571,1,2,0,0,8581.542,2581.62085,765.5597,2.29454422,120,0,0,1,0,0,0),
(@GUID+65,29720,571,1,2,0,0,8603.618,2744.43042,759.9575,5.913211,120,0,0,1,0,0,0),
(@GUID+66,29720,571,1,2,0,0,8640.634,2686.18237,760.040833,1.2566371,120,0,0,1,0,0,0),
-- The Ocular (Phase='0x00000002')
(@GUID+67,29747,571,1,2,0,0,8526.228,2665.08521,1045.03979,2.67035365,120,0,0,1,0,0,0),
-- The Ocular - Eye of Acherus Exterior Shell
(@GUID+68,29790,571,1,2,0,0,8526.228,2665.08521,1037.08838,2.67035365,120,0,0,1,0,0,0), 
-- Captain Ellis 
(@GUID+69,24910,571,1,1,0,0,101.368256,-3645.39087,21.6450329,4.067803,120,0,0,1,0,0,0);


UPDATE creature_template SET `baseattacktime`=2500,`faction_A`=974,`faction_H`=974,`rangeattacktime`= 1069547520,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE entry = 29747;     -- The Ocular
UPDATE `creature_template` SET `baseattacktime`=2500,`faction_A`=974,`faction_H`=974,`rangeattacktime`=1073804739,`scale`=1,`speed_run`=1,`speed_walk`=1 WHERE entry = 29790; -- The Ocular - Eye of Archerus Exterior Shell
UPDATE `creature_template` SET `baseattacktime`=1000,`faction_A`=21,`faction_H`=21,`rangeattacktime`= 1055790203,`scale`=1,`speed_run`=1.428571,`speed_walk`=1 WHERE `entry`=29720; -- Vault Geist
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=21,`faction_H`=21,`rangeattacktime`= 1063256064,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`=29719; -- Morbid Carcass
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=14,`faction_H`=14,`minlevel`=79,`maxlevel`=79,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`=33499; -- Skelettal Woodcutter
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=35,`faction_H`=35,`minlevel`=1,`maxlevel`=1,`scale`=1,`speed_run`=1,`speed_walk`=1.6 WHERE `entry`= 33211; -- Lake Frog
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=775,`faction_H`=775,`minlevel`=65,`maxlevel`=65,`npcflag`=`npcflag`|1|2|128,`scale`=1,`speed_run`=1.142857,`speed_walk`=1,`unit_flags`=`unit_flags`|256|512|32768 WHERE `entry`=24495; -- Blix Fixwidget
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=2080,`faction_H`=2080,`minlevel`=77,`maxlevel`=78,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`= 28602; -- Death's Hand Acolyte
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=1771,`faction_H`=1771,`minlevel`=70,`maxlevel`=70,`scale`=1,`speed_run`=1.071429,`speed_walk`=1 WHERE `entry`=26266; -- Heigarr the Horrible
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=35,`faction_H`=35,`minlevel`=80,`maxlevel`=80,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`=29563; -- Injured Icemaw Matriarch
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=1954,`faction_H`=1954,`minlevel`=79,`maxlevel`=79,`scale`=1,`speed_run`=0.9920629,`speed_walk`=1 WHERE entry = 29695; -- Tracker Thulin
UPDATE creature_template SET `baseattacktime`=2000,`faction_A`=35,`faction_H`=35,`minlevel`=70,`maxlevel`=70,`npcflag`=`npcflag`|2,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE entry = 24910; -- Captain Ellis
-- Obsidian Sanctum
-- Template updates for creature 31103 (Twilight Egg (Cosmetic))
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432 WHERE `entry`=31103; -- Twilight Egg (Cosmetic)
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81 WHERE `entry`=30681; -- Onyx Blaze Mistress
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81 WHERE `entry`=30453; -- Onyx Sanctum Guardian
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|33554432 WHERE `entry`=30648; -- Fire Cyclone
UPDATE `creature_model_info` SET `bounding_radius`=2.25,`combat_reach`=4.5,`gender`=0 WHERE `modelid`=27421; -- Shadron
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`exp`=2 WHERE `entry`=30616; -- Flame Tsunami

-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=1.25,`combat_reach`=8.75,`gender`=0 WHERE `modelid`=27226; -- Onyx Brood General
UPDATE `creature_model_info` SET `bounding_radius`=3.75,`combat_reach`=3.75,`gender`=1 WHERE `modelid`=27227; -- Onyx Blaze Mistress
UPDATE `creature_model_info` SET `bounding_radius`=3.75,`combat_reach`=4.375,`gender`=0 WHERE `modelid`=12891; -- Onyx Flight Captain
UPDATE `creature_model_info` SET `bounding_radius`=2.25,`combat_reach`=4.5,`gender`=0 WHERE `modelid`=27039; -- Vesperon
UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=1,`gender`=0 WHERE `modelid`=27225; -- Onyx Sanctum Guardian
UPDATE `creature_model_info` SET `bounding_radius`=1.8,`combat_reach`=1,`gender`=2 WHERE `modelid`=27035; -- Sartharion

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (31103,30680,30681,30682,30449,30453,30648,30451,28860,30616);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(31103,0,0,1,0, NULL), -- Twilight Egg (Cosmetic)
(30680,0,0,1,0, NULL), -- Onyx Brood General
(30681,0,0,1,0, NULL), -- Onyx Blaze Mistress
(30682,0,0,1,0, NULL), -- Onyx Flight Captain
(30449,0,0,1,0, NULL), -- Vesperon
(30453,0,0,1,0, NULL), -- Onyx Sanctum Guardian
(30648,0,0,1,0, NULL), -- Fire Cyclone
(30451,0,0,1,0, NULL), -- Shadron
(28860,0,0,1,0, NULL), -- Sartharion
(30616,0,0,1,0, NULL); -- Flame Tsunami
-- Koralon Burning breath Target
DELETE FROM `conditions` WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN (66665,67328);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,66665,0,18,1,35013,0,0, '','Koralon Burning Breath'), -- 10 man
(13,0,67328,0,18,1,35013,0,0, '','Koralon Burning Breath'); -- 25 man
DELETE FROM `disables`WHERE `entry` IN(7631,7630,7629,6446,7625,7628,7626);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN(7631,7630,7629,6446,7625,7628,7626);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7631,6,4609,0, ''),
(7630,6,4609,0, ''),
(7629,7,52418,0, ''),
(6446,7,52418,0, ''),
(7625,11,0,0, 'achievement_bg_sa_artillery'),
(7628,11,0,0, 'achievement_bg_sa_artillery');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN(7626);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7626,0,0,0, '');
DELETE FROM `spell_dbc` WHERE `Id`=60937;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(60937,0,0,562036736,32,1,0,0,0,0,0,0,1,0,0,101,0,0,0,0,0,1,0,-1,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Seaforium charges damaging wall achievement credit');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_seaforium_blast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(52408, 'spell_gen_seaforium_blast');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (66862,67681);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(66862,'spell_eadric_radiance'),
(67681,'spell_eadric_radiance');-- Northrend Cloud spawns and pooling
SET @POOL := 4993; -- Set by TDB team (pool_template.entry -  need 6)
SET @GUID := 152168; -- Set by TDB team (creature.guid - need 91)

SET @Artic := 24879; -- Arctic Cloud
SET @Cinder := 32522; -- Cinder Cloud
SET @Steam := 32544; -- Steam Cloud

DELETE FROM `pool_template` WHERE `entry` BETWEEN @POOL+0 AND @POOL+5;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL+0,3, 'Arctic Cloud'),
(@POOL+1,3, 'Arctic Cloud'),
(@POOL+2,3, 'Arctic Cloud'),
(@POOL+3,4, 'Cinder Cloud'),
(@POOL+4,3, 'Steam Cloud'),
(@POOL+5,1, 'Steam Cloud');

DELETE FROM `pool_creature` WHERE (`guid` BETWEEN @GUID+0 AND @GUID+90) AND (`pool_entry` BETWEEN @POOL+0 AND @POOL+5);
INSERT INTO `pool_creature` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(@GUID+0,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+1,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+2,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+3,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+4,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+5,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+6,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+7,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+8,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+9,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+10,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+11,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+12,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+13,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+14,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+15,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+16,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+17,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+18,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+19,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+20,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+21,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+22,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+23,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+24,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+25,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+26,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+27,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+28,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+29,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+30,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+31,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+32,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+33,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+34,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+35,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+36,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+37,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+38,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+39,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+40,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+41,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+42,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+43,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+44,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+45,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+46,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+47,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+48,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+49,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+50,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+51,@POOL+3,0, 'Cinder Cloud'),
(@GUID+52,@POOL+3,0, 'Cinder Cloud'),
(@GUID+53,@POOL+3,0, 'Cinder Cloud'),
(@GUID+54,@POOL+3,0, 'Cinder Cloud'),
(@GUID+55,@POOL+3,0, 'Cinder Cloud'),
(@GUID+56,@POOL+3,0, 'Cinder Cloud'),
(@GUID+57,@POOL+3,0, 'Cinder Cloud'),
(@GUID+58,@POOL+3,0, 'Cinder Cloud'),
(@GUID+59,@POOL+3,0, 'Cinder Cloud'),
(@GUID+60,@POOL+3,0, 'Cinder Cloud'),
(@GUID+61,@POOL+3,0, 'Cinder Cloud'),
(@GUID+62,@POOL+3,0, 'Cinder Cloud'),
(@GUID+63,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+64,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+65,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+66,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+67,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+68,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+69,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+70,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+71,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+72,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+73,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+74,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+75,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+76,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+77,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+78,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+79,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+80,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+81,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+82,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+83,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+84,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+85,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+86,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+87,@POOL+5,0, 'Steam Cloud - Borean Tundra'),
(@GUID+88,@POOL+5,0, 'Steam Cloud - Borean Tundra'),
(@GUID+89,@POOL+5,0, 'Steam Cloud - Borean Tundra'),
(@GUID+90,@POOL+5,0, 'Steam Cloud - Borean Tundra');

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (@Artic,@Cinder,@Steam));
DELETE FROM `creature` WHERE `id` IN (@Artic,@Cinder,@Steam);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@Artic,571,1,1,0,0,8154.26,-50.2582,853.637,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+1,@Artic,571,1,1,0,0,7585.26,-292.083,1126.52,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+2,@Artic,571,1,1,0,0,8234.87,-690.383,927.345,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+3,@Artic,571,1,1,0,0,7419.3,-903.758,909.254,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+4,@Artic,571,1,1,0,0,6286.04,-576.583,424.563,2.5426,300,5,0,42,0,0,1,0,0,0),
(@GUID+5,@Artic,571,1,1,0,0,5925.67,-626.371,478.491,2.5426,300,5,0,42,0,0,1,0,0,0),
(@GUID+6,@Artic,571,1,1,0,0,6503.32,-1038.15,485.395,2.5426,300,5,0,42,0,0,1,0,0,0),
(@GUID+7,@Artic,571,1,1,0,0,6286.04,-1323.4,426.505,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+8,@Artic,571,1,1,0,0,6926.17,-2091.55,805.349,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+9,@Artic,571,1,1,0,0,6992.55,-2141.33,737.069,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+10,@Artic,571,1,1,0,0,7153.77,-2248.02,759.305,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+11,@Artic,571,1,1,0,0,7229.63,-3044.62,845.739,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+12,@Artic,571,1,1,0,0,7518.88,-3094.41,842.155,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+13,@Artic,571,1,1,0,0,7893.47,-3322.01,857.378,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+14,@Artic,571,1,1,0,0,2762.83,1406.18,131.607,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+15,@Artic,571,1,1,0,0,2845.1,1972.63,140.6,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+16,@Artic,571,1,1,0,0,3073.22,-214.625,93.7885,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+17,@Artic,571,1,1,0,0,3248.98,1187.46,134.375,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+18,@Artic,571,1,1,0,0,3260.2,-1218.52,78.6832,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+19,@Artic,571,1,1,0,0,3458.4,1804.38,75.0776,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+20,@Artic,571,1,1,0,0,3585.54,-1083.92,111.125,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+21,@Artic,571,1,1,0,0,3589.28,671.492,77.7206,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+22,@Artic,571,1,1,0,0,3611.72,-102.458,59.6765,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+23,@Artic,571,1,1,0,0,3708.95,1804.38,101.572,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+24,@Artic,571,1,1,0,0,3880.97,1187.46,55.4913,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+25,@Artic,571,1,1,0,0,4023.07,357.425,41.9114,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+26,@Artic,571,1,1,0,0,4116.56,26.5337,52.568,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+27,@Artic,571,1,1,0,0,4307.28,-820.325,147.814,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+28,@Artic,571,1,1,0,0,4486.78,-242.667,90.8629,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+29,@Artic,571,1,1,0,0,4561.57,-1280.21,159.549,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+30,@Artic,571,1,1,0,0,4576.53,1630.52,286.716,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+31,@Artic,571,1,1,0,0,4815.86,-309.966,229.377,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+32,@Artic,571,1,1,0,0,4924.31,845.35,178.601,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+33,@Artic,571,1,1,0,0,5122.51,1047.25,223.784,3.4733,300,5,0,42,0,0,1,0,0,0),
(@GUID+34,@Artic,571,1,1,0,0,6019.36,2383.58,518.105,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+35,@Artic,571,1,1,0,0,6144.8,1580.92,620.674,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+36,@Artic,571,1,1,0,0,6393.17,-211.808,678.76,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+37,@Artic,571,1,1,0,0,6504.39,1474.31,437.27,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+38,@Artic,571,1,1,0,0,6717.53,184.454,626.635,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+39,@Artic,571,1,1,0,0,6845.56,-789.958,731.38,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+40,@Artic,571,1,1,0,0,7064.68,2860.17,418.75,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+41,@Artic,571,1,1,0,0,7273.74,721.812,482.114,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+42,@Artic,571,1,1,0,0,7390.81,1806.67,433.04,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+43,@Artic,571,1,1,0,0,7518.88,77.7668,801.405,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+44,@Artic,571,1,1,0,0,7670.96,2966.77,531.154,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+45,@Artic,571,1,1,0,0,7679.32,797.062,479.98,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+46,@Artic,571,1,1,0,0,7718.02,42.2043,1021.67,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+47,@Artic,571,1,1,0,0,7984.55,1568.38,460.722,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+48,@Artic,571,1,1,0,0,8016.75,-2916.6,1137.52,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+49,@Artic,571,1,1,0,0,8227.06,3280.31,655.771,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+50,@Artic,571,1,1,0,0,8306.51,960.104,582.006,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+51,@Cinder,571,1,1,0,0,4311.02,1495.92,133.764,1.42942,300,5,0,42,0,0,1,0,0,0),
(@GUID+52,@Cinder,571,1,1,0,0,4347.75,1395.21,134.203,1.42942,300,5,0,42,0,0,1,0,0,0),
(@GUID+53,@Cinder,571,1,1,0,0,4393.29,1490.31,123.673,4.82626,300,5,0,42,0,0,1,0,0,0),
(@GUID+54,@Cinder,571,1,1,0,0,4408.25,1406.18,132.796,4.82626,300,5,0,42,0,0,1,0,0,0),
(@GUID+55,@Cinder,571,1,1,0,0,6419.15,4981.92,-69.5219,1.81657,300,5,0,42,0,0,1,0,0,0),
(@GUID+56,@Cinder,571,1,1,0,0,6488.85,4942.72,-57.9343,1.81657,300,5,0,42,0,0,1,0,0,0),
(@GUID+57,@Cinder,571,1,1,0,0,6517.9,4859.95,-52.7975,1.81657,300,5,0,42,0,0,1,0,0,0),
(@GUID+58,@Cinder,571,1,1,0,0,4217.27,1770.67,352.922,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+59,@Cinder,571,1,1,0,0,4235.12,1883.72,355.337,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+60,@Cinder,571,1,1,0,0,4330.32,1723.07,366.032,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+61,@Cinder,571,1,1,0,0,4342.22,1868.84,356.522,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+62,@Cinder,571,1,1,0,0,4375.93,1782.57,356.84,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+63,@Steam,571,1,1,0,0,3452.67,4685.5,-12.9957,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+64,@Steam,571,1,1,0,0,3698.67,4904.56,-13.6717,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+65,@Steam,571,1,1,0,0,4033.07,4524.1,-1.63039,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+66,@Steam,571,1,1,0,0,4079.2,5089.02,-1.50956,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+67,@Steam,571,1,1,0,0,4740.55,5008.06,-55.5771,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+68,@Steam,571,1,1,0,0,4920.89,4070.89,-17.9628,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+69,@Steam,571,1,1,0,0,5112.28,5953.37,-61.9079,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+70,@Steam,571,1,1,0,0,5152.94,3810.09,-7.13058,0.803393,300,5,0,4979,0,0,1,0,0,0),
(@GUID+71,@Steam,571,1,1,0,0,5158.75,4184.73,-88.1236,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+72,@Steam,571,1,1,0,0,5179.07,5739.91,-83.8105,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+73,@Steam,571,1,1,0,0,5248.77,4707.48,-133.847,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+74,@Steam,571,1,1,0,0,5254.58,5008.06,-135.353,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+75,@Steam,571,1,1,0,0,5376.56,4433.04,-135.251,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+76,@Steam,571,1,1,0,0,5393.98,5940.3,-49.8372,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+77,@Steam,571,1,1,0,0,5501.44,3609.7,-17.8316,0.803393,300,5,0,4979,0,0,1,0,0,0),
(@GUID+78,@Steam,571,1,1,0,0,5585.66,3810.09,-15.5887,0.504939,300,5,0,4979,0,0,1,0,0,0),
(@GUID+79,@Steam,571,1,1,0,0,5588.23,3643.99,-23.6778,0.504939,300,5,0,4979,0,0,1,0,0,0),
(@GUID+80,@Steam,571,1,1,0,0,5608.89,6005.64,-39.6709,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+81,@Steam,571,1,1,0,0,5788.95,5744.27,-69.0541,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+82,@Steam,571,1,1,0,0,5817.99,4171.66,-101.138,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+83,@Steam,571,1,1,0,0,5931.25,4820.74,-110.276,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+84,@Steam,571,1,1,0,0,5980.62,4337.2,-85.2827,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+85,@Steam,571,1,1,0,0,6131.64,4568.08,-91.79,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+86,@Steam,571,1,1,0,0,6149.07,4297.99,-56.5222,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+87,@Steam,571,1,1,0,0,6231,5577.32,-27.9032,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+88,@Steam,571,1,1,0,0,6346.55,4258.79,-47.6791,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+89,@Steam,571,1,1,0,0,6436.58,5360.92,-33.6846,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+90,@Steam,571,1,1,0,0,6459.81,4520.2,-62.7745,5.40584,300,5,0,4979,0,0,1,0,0,0);
-- Biohazard
DELETE FROM `creature` WHERE `id`=21789; -- Nakansi / Shadowmoon Valley
INSERT INTO creature (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(152259,21789,530,1,1,0,0,-2741.8,2719.07,123.584,0.603481,600,0,0,34930,0,0,0);

-- Tome
DELETE FROM `gameobject` WHERE `id`=187987; -- South Point Station Valve
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(151895,187987,571,1,1,3791.704,4808.966,-11.5618,1.483528,0,0,0.6755896,0.7372779,0,0,0);

-- Nay
UPDATE `creature_template` SET /*`npcflag`=`npcflag`|16777216,*/`speed_walk`=2.8 WHERE `entry`=30123; -- Snorri needs spellclick data
-- UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216 WHERE `entry`=30272; -- Njorndar Proto-Drake needs spellclick data
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`speed_walk`=1.444444 WHERE `entry`=30500; -- Argent Skytalon
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070; -- Argent Skytalon
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`speed_walk`=1.2 WHERE `entry`=32370; -- Refurbished Demolisher
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_flags`=`unit_flags`|8,`speed_walk`=1.2,`vehicleid`=512 WHERE `entry`=31830; -- Refurbished Demolisher
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216,`speed_run`=1.3857142857143 WHERE `entry`=34125; -- Stabled Campaign Warhorse
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|16400,`unit_class`=4,`speed_run`=1 WHERE `entry` IN (36839,35427); -- Horde Gunship Cannon, Horde Gunship Cannon (1)
UPDATE `creature_template` SET `baseattacktime`=2000,/*`npcflag`=`npcflag`|16777216,*/`speed_run`=1.1428571428571 WHERE `entry`=37945; -- Dream Portal needs spellclick data
UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80,`baseattacktime`=2000,/*`npcflag`=`npcflag`|16777216,*/`speed_run`=1.1428571428571 WHERE `entry`=38186; -- Dream Portal (Pre-effect)  needs spellclick data

UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=2.25,`gender`=2 WHERE `modelid`=25092; -- Refurbished Demolisher
UPDATE `creature_model_info` SET `bounding_radius`=0.248,`combat_reach`=4.8,`gender`=0 WHERE `modelid`=26772; -- Snorri
UPDATE `creature_model_info` SET `bounding_radius`=1.085,`combat_reach`=3.5,`gender`=2 WHERE `modelid`=27703; -- Geargrinder's Jumpbot
UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=2.25,`gender`=2 WHERE `modelid`=25092; -- Refurbished Demolisher
UPDATE `creature_model_info` SET `bounding_radius`=1.9,`combat_reach`=0,`gender`=2 WHERE `modelid`=29489; -- Horde Gunship Cannon
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=30844; -- Dream Portal
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=30844; -- Dream Portal (Pre-effect)

DELETE FROM `creature_template_addon` WHERE `entry` IN (30123,30272,31070,31736,31770,32370,31830,36839,37945,38186);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30123,0,0,1,0, '61208 0'), -- Snorri; Aura: Fjorn's Anvil - Quest Invisibility 3
(30272,0,0,1,0, NULL), -- Njorndar Proto-Drake
(31070,0,0,1,0, NULL), -- Argent Skytalon
(31736,0,0,1,0, NULL), -- Geargrinder's Jumpbot
(31770,0,0,1,0, NULL), -- Thunderbomb's Jumpbot
(32370,0,65536,1,0, '49414 0'), -- Refurbished Demolisher; Auras: Generic Quest Invisibility 1
(31830,0,0,1,0, NULL), -- Refurbished Demolisher
(36839,0,0,1,0, '69470 0 69470 1'), -- Horde Gunship Cannon; Aura: Heat Drain
(37945,0,0,1,0, NULL), -- Dream Portal
(38186,0,0,1,0, NULL); -- Dream Portal (Pre-effect)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry`=13846;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`Comment`) VALUES
(19,0,13846,1,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,1,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(19,0,13846,2,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,2,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(19,0,13846,3,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,3,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(19,0,13846,4,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,4,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(19,0,13846,5,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,5,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(19,0,13846,6,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,6,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(19,0,13846,7,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,7,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(19,0,13846,8,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,8,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(19,0,13846,9,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,9,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(19,0,13846,10,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,10,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(19,0,13846,11,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,11,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(19,0,13846,12,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,12,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(19,0,13846,13,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,13,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered'),
(19,0,13846,14,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,14,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered'),
(20,0,13846,1,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,1,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(20,0,13846,2,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,2,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(20,0,13846,3,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,3,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(20,0,13846,4,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,4,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(20,0,13846,5,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,5,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(20,0,13846,6,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,6,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(20,0,13846,7,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,7,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(20,0,13846,8,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,8,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(20,0,13846,9,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,9,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(20,0,13846,10,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,10,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(20,0,13846,11,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,11,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(20,0,13846,12,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,12,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(20,0,13846,13,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,13,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered'),
(20,0,13846,14,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,14,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered');
-- Gossip Menu insert
DELETE FROM `gossip_menu` WHERE `entry`=7303 AND `text_id`=8662;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7303,8662);
DELETE FROM `gossip_menu` WHERE `entry`=7380 AND `text_id`=8835;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7380,8835);
DELETE FROM `gossip_menu` WHERE `entry`=7424 AND `text_id`=8973;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7424,8973);
DELETE FROM `gossip_menu` WHERE `entry`=7423 AND `text_id`=8972;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7423,8972);
DELETE FROM `gossip_menu` WHERE `entry`=7425 AND `text_id`=8974;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7425,8974);
DELETE FROM `gossip_menu` WHERE `entry`=11910 AND `text_id`=16726;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11910,16726);
DELETE FROM `gossip_menu` WHERE `entry`=5729 AND `text_id`=6896;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5729,6896);
DELETE FROM `gossip_menu` WHERE `entry`=5728 AND `text_id`=6897;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5728,6897);
DELETE FROM `gossip_menu` WHERE `entry`=5727 AND `text_id`=6898;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5727,6898);
DELETE FROM `gossip_menu` WHERE `entry`=5726 AND `text_id`=6899;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5726,6899);
DELETE FROM `gossip_menu` WHERE `entry`=5725 AND `text_id`=6900;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5725,6900);
DELETE FROM `gossip_menu` WHERE `entry`=5724 AND `text_id`=6901;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5724,6901);
DELETE FROM `gossip_menu` WHERE `entry`=5723 AND `text_id`=6902;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5723,6902);
DELETE FROM `gossip_menu` WHERE `entry`=5737 AND `text_id`=6911;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5737,6911);
DELETE FROM `gossip_menu` WHERE `entry`=7084 AND `text_id`=8336;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7084,8336);
DELETE FROM `gossip_menu` WHERE `entry`=5748 AND `text_id`=6927;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5748,6927);
DELETE FROM `gossip_menu` WHERE `entry`=5756 AND `text_id`=6940;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5756,6940);
DELETE FROM `gossip_menu` WHERE `entry`=5743 AND `text_id`=6919;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5743,6919);
DELETE FROM `gossip_menu` WHERE `entry`=5747 AND `text_id`=6925;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5747,6925);
DELETE FROM `gossip_menu` WHERE `entry`=5755 AND `text_id`=6939;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5755,6939);
DELETE FROM `gossip_menu` WHERE `entry`=10026 AND `text_id`=13902;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10026,13902);
DELETE FROM `gossip_menu` WHERE `entry`=9750 AND `text_id`=13375;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9750,13375);
DELETE FROM `gossip_menu` WHERE `entry`=7522 AND `text_id`=9122;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7522,9122);
DELETE FROM `gossip_menu` WHERE `entry`=9162 AND `text_id`=12756;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9162,12756);
DELETE FROM `gossip_menu` WHERE `entry`=9162 AND `text_id`=12417;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9162,12417);
DELETE FROM `gossip_menu` WHERE `entry`=9164 AND `text_id`=12422;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9164,12422);
DELETE FROM `gossip_menu` WHERE `entry`=9166 AND `text_id`=12424;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9166,12424);
DELETE FROM `gossip_menu` WHERE `entry`=9167 AND `text_id`=12426;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9167,12426);
DELETE FROM `gossip_menu` WHERE `entry`=9144 AND `text_id`=12373;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9144,12373);
DELETE FROM `gossip_menu` WHERE `entry`=9164 AND `text_id`=12422;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9164,12422);
DELETE FROM `gossip_menu` WHERE `entry`=9166 AND `text_id`=12424;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9166,12424);
DELETE FROM `gossip_menu` WHERE `entry`=21230 AND `text_id`=1237;
DELETE FROM `gossip_menu` WHERE `entry`=687 AND `text_id`=1237;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (687,1237);
DELETE FROM `gossip_menu` WHERE `entry`=689 AND `text_id`=1239;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (689,1239);
DELETE FROM `gossip_menu` WHERE `entry`=690 AND `text_id`=1240;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (690,1240);
DELETE FROM `gossip_menu` WHERE `entry`=701 AND `text_id`=1253;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (701,1253);
DELETE FROM `gossip_menu` WHERE `entry`=703 AND `text_id`=1255;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (703,1255);
DELETE FROM `gossip_menu` WHERE `entry`=10990 AND `text_id`=15282;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10990,15282);
DELETE FROM `gossip_menu` WHERE `entry`=10929 AND `text_id`=15188;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10929,15188);
DELETE FROM `gossip_menu` WHERE `entry`=10945 AND `text_id`=15209;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10945,15209);
DELETE FROM `gossip_menu` WHERE `entry`=10946 AND `text_id`=15210;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10946,15210);
DELETE FROM `gossip_menu` WHERE `entry`=10947 AND `text_id`=15211;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10947,15211);
DELETE FROM `gossip_menu` WHERE `entry`=9554 AND `text_id`=12869;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9554,12869);
DELETE FROM `gossip_menu` WHERE `entry`=10400 AND `text_id`=14455;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10400,14455);
DELETE FROM `gossip_menu` WHERE `entry`=10340 AND `text_id`=14408;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10340,14408);
DELETE FROM `gossip_menu` WHERE `entry`=10440 AND `text_id`=14476;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10440,14476);
DELETE FROM `gossip_menu` WHERE `entry`=9550 AND `text_id`=12865;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9550,12865);
DELETE FROM `gossip_menu` WHERE `entry`=9555 AND `text_id`=12868;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9555,12868);
DELETE FROM `gossip_menu` WHERE `entry`=9557 AND `text_id`=12871;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9557,12871);

-- Creature Gossip_menu_id Update
UPDATE `creature_template` SET `gossip_menu_id`=7303 WHERE `entry`=16554;
UPDATE `creature_template` SET `gossip_menu_id`=5729 WHERE `entry`=14358;
UPDATE `creature_template` SET `gossip_menu_id`=5737 WHERE `entry`=14369;
UPDATE `creature_template` SET `gossip_menu_id`=7084 WHERE `entry`=16032;
UPDATE `creature_template` SET `gossip_menu_id`=5748 WHERE `entry`=14383;
UPDATE `creature_template` SET `gossip_menu_id`=5756 WHERE `entry`=14382;
UPDATE `creature_template` SET `gossip_menu_id`=5747 WHERE `entry`=14368;
UPDATE `creature_template` SET `gossip_menu_id`=5755 WHERE `entry`=14381;
UPDATE `creature_template` SET `gossip_menu_id`=10026 WHERE `entry`=31085;
UPDATE `creature_template` SET `gossip_menu_id`=9740 WHERE `entry`=28082;
UPDATE `creature_template` SET `gossip_menu_id`=9741 WHERE `entry`=28138;
UPDATE `creature_template` SET `gossip_menu_id`=9162 WHERE `entry`=25459;
UPDATE `creature_template` SET `gossip_menu_id`=9164 WHERE `entry`=25475;
UPDATE `creature_template` SET `gossip_menu_id`=9166 WHERE `entry`=25476;
UPDATE `creature_template` SET `gossip_menu_id`=9167 WHERE `entry`=25503;
UPDATE `creature_template` SET `gossip_menu_id`=9144 WHERE `entry`=25237;
UPDATE `creature_template` SET `gossip_menu_id`=9164 WHERE `entry`=25475;
UPDATE `creature_template` SET `gossip_menu_id`=9166 WHERE `entry`=25476;
UPDATE `creature_template` SET `gossip_menu_id`=10990 WHERE `entry`=37671;
UPDATE `creature_template` SET `gossip_menu_id`=10929 WHERE `entry`=37715;
UPDATE `creature_template` SET `gossip_menu_id`=9549 WHERE `entry`=27810;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=37887;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38041;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38040;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38039;
UPDATE `creature_template` SET `gossip_menu_id`=10470 WHERE `entry`=33382;
UPDATE `creature_template` SET `gossip_menu_id`=10400 WHERE `entry`=33972;
UPDATE `creature_template` SET `gossip_menu_id`=10340 WHERE `entry`=33447;
UPDATE `creature_template` SET `gossip_menu_id`=9550 WHERE `entry`=27495;

UPDATE `creature_template` SET `gossip_menu_id`=687 WHERE `gossip_menu_id`=21230;

-- Creature Gossip_menu_option Update
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7368) AND `id` IN (1,2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7370,5729,5728,5727,5726,5725,5724,5723,7522,9162) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9550,9555) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10340) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10976,10929,10945,10946) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7368,1,0, 'Acteon, where is the best area to hunt for moongraze stags?',1,1,7423,0,0,0,0, ''),
(7368,2,0, 'Acteon, where is the best place to hunt moongraze bucks?',1,1,7424,0,0,0,0, ''),
(7370,0,0, 'Where can I find more infected nightstalker runts, Exarch?',1,1,7425,0,0,0,0, ''),
(5729,0,0, 'What happened here, spirit?',1,1,5728,0,0,0,0, ''),
(5728,0,0, 'I know very little of the Highborne and nothing of the Shen''dralar.',1,1,5727,0,0,0,0, ''),
(5727,0,0, 'Continue, please.',1,1,5726,0,0,0,0, ''),
(5726,0,0, 'Fascinating. Continue, please.',1,1,5725,0,0,0,0, ''),
(5725,0,0, 'I''m going to have to kill something, aren''t I?',1,1,5724,0,0,0,0, ''),
(5724,0,0, 'We live in a world of endless tragedy.',1,1,5723,0,0,0,0, ''),
(5723,0,0, 'A very sad tale. Thank you, spirit.',1,1,0,0,0,0,0, ''),
(7522,0,3, 'Teach me the ways of the spirits.',5,16,0,0,0,0,0, ''),
(9162,0,0, 'Send me to Garrosh''s Landing, Yanni.',1,1,0,0,0,0,0, ''),
(10976,0,0, 'I need another disguise.',1,1,0,0,0,0,0, ''),
(10929,0,0, 'I have a rocket here with your mark on it, Snivel.',1,1,10945,0,0,0,0, ''),
(10945,0,0, 'There''s a chemical inside the rocket. What is it?',1,1,10946,0,0,0,0, ''),
(10946,0,0, 'Where were they delivered?',1,1,10947,0,0,0,0, ''),
(9550,0,0, 'Why would I want to ride a shredder?',1,1,9555,0,0,0,0, ''),
(9555,0,0, 'Where can I get a Refurbished Shredder Key?',1,1,9557,0,0,0,0, ''),
(10340,1,0, 'How do the Argent Crusade riders fight?',1,1,10440,0,0,0,0, '');

DELETE FROM `npc_text` WHERE `ID` IN (16540,8336,16726) AND `WDBVerified`=-1;
INSERT INTO `npc_text` (`ID`,`text0_0`,`WDBVerified`) VALUES
(16540, '[PH]', -1),
(8336, '[PH]', -1),
(16726, '[PH]', -1);
SET @EquiEntry = 2439; -- Need 1 slot

-- Stormwind npcs
UPDATE `creature_template` SET `exp`=1,`minlevel`=65,`maxlevel`=65,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|32768,`speed_run`=1.1428571428571 WHERE `entry`=34075; -- Captain Dirgehammer
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`speed_run`=1.1428571428571 WHERE `entry`=12778; -- Lieutenant Rachel Vaccar
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|32768,`equipment_id`=@EquiEntry,`speed_run`=1.1428571428571 WHERE `entry`=34078; -- Lieutenant Tristia
UPDATE `creature_template` SET `exp`=1,`minlevel`=65,`maxlevel`=65,`npcflag`=`npcflag`|128,`unit_flags`=`unit_flags`|32768,`speed_run`=1.1428571428571 WHERE `entry`=34081; -- Captain O'Neal
UPDATE `creature_template` SET `faction_A`=123,`faction_H`=123,`exp`=2,`minlevel`=75,`maxlevel`=75,`baseattacktime`=2000,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|32768,`equipment_id`=188,`speed_run`=1.1428571428571 WHERE `entry`=40607; -- Knight-Lieutenant T'Maire Sydes
UPDATE `creature_template` SET `baseattacktime`=2000,`speed_run`=2.8571428571429,`InhabitType`=5 WHERE `entry`=32180; -- Tempus Wyrm
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432,`unit_class`=2,`speed_walk`=4,`speed_run`=2.8571428571429,`InhabitType`=7 WHERE `entry`=34381; -- [DND]Northrend Children's Week Trigger
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=2.8571428571429,`InhabitType`=5 WHERE `entry`=27925; -- Nozdormu
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256,`speed_run`=2.8571428571429,`InhabitType`=5 WHERE `entry`=32185; -- Infinite Eradicator
UPDATE `creature_template` SET `faction_A`=2141,`faction_H`=2141,`exp`=2,`speed_run`=1.1428571428571 WHERE `entry`=32331; -- Past You  ???
UPDATE `creature_template` SET `faction_A`=2111,`faction_H`=2111,`unit_flags`=`unit_flags`|34816,`speed_run`=1.1428571428571 WHERE `entry`=27896; -- Infinite Assailant
UPDATE `creature_template` SET `faction_A`=2111,`faction_H`=2111,`unit_flags`=`unit_flags`|559104,`speed_run`=1.1428571428571 WHERE `entry`=27897; -- Infinite Destroyer
UPDATE `creature_template` SET `exp`=2,`speed_run`=1 WHERE `entry`=32327; -- Hourglass of Eternity
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=2 WHERE `entry`=26841; -- Reanimated Frost Wyrm
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|33556488,`flags_extra`=`flags_extra`|128 WHERE `entry`=28306; -- Anti-Magic Zone

UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=31953; -- Knight-Lieutenant T'Maire Sydes
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=1,`gender`=0 WHERE `modelid`=27814; -- Infinite Eradicator
UPDATE `creature_model_info` SET `bounding_radius`=3.5,`combat_reach`=3,`gender`=2 WHERE `modelid`=24934; -- Nozdormu
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=11686; -- [DND]Northrend Children's Week Trigger
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=1,`gender`=0 WHERE `modelid`=27813; -- Infinite Timebreaker
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=11686; -- Past You
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=2.5,`gender`=0 WHERE `modelid`=20512; -- Infinite Destroyer
UPDATE `creature_model_info` SET `bounding_radius`=0.375,`combat_reach`=1.25,`gender`=0 WHERE `modelid`=19062; -- Infinite Assailant

UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=256,`auras`= '5301 0' WHERE `entry`=12778; -- Lieutenant Rachel Vaccar
UPDATE `creature_template_addon` SET `bytes2`=258 WHERE `entry`=12780; -- Sergeant Major Skyshadow
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=256,`auras`= '5301 0' WHERE `entry`=19848; -- Harbinger Ennarth
UPDATE `creature_template_addon` SET `bytes2`=256 WHERE `entry`=12779; -- Archmage Gaiman

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (31257,26426,32186,26841));
DELETE FROM `creature_template_addon` WHERE `entry` IN (34075,34081,40607,34078,28306);
DELETE FROM `creature_template_addon` WHERE `entry` IN (26426,27925,32186,32180,32185,32327,26841);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`auras`) VALUES
(34075,0,257, '5301 0'), -- Captain Dirgehammer
(34081,0,257, NULL), -- Captain O'Neal
(40607,0,257, NULL), -- Knight-Lieutenant T'Maire Sydes
(34078,0,257, '5301 0'), -- Lieutenant Tristia
(26426,0,1, '47015 0'), -- Arctic Ram
(27925,50397184,1, '50013 0'),
(32186,50331648,1, '4368 0'), -- Infinite Timebreaker
(32180,50331648,1, '4368 0'), -- Tempus Wyrm
(32185,50331648,1, '4368 0'), -- Infinite Eradicator
(32327,0,1, '50057 0 50867 0'), -- Hourglass of Eternity
(26841,50331648,1, NULL), -- Reanimated Frost Wyrm
(28306,0,257, NULL); -- Anti-Magic Zone

DELETE FROM `creature_equip_template` WHERE `entry`=@EquiEntry;
INSERT INTO `creature_equip_template` (`entry`,`equipentry1`,`equipentry2`,`equipentry3`) VALUES
(@EquiEntry,34520,29638,0); -- Equipment of 34078 (Lieutenant Tristia)

-- 5302, triggered by 5301 is missing from spell_dbc. Data from 1.1.2 spell_dbc
DELETE FROM `spell_dbc` WHERE `Id`=5302;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`AttributesEx`,`CastingTimeIndex`,`ProcChance`,`DurationIndex`,`RangeIndex`,`EquippedItemClass`,`Effect1`,`EffectImplicitTargetA1`,`EffectApplyAuraName1`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`Comment`) VALUES
(5302,536871312,1024,1,101,28,1,-1,6,1,4,1,1,1, 'Defensive State - Follows a successful block,dodge or parry.');

-- Update info for spell 3617 found in earlier patches dbc
UPDATE `spell_dbc` SET `Attributes`=256,`CastingTimeIndex`=1,`ProcChance`=101,`SpellLevel`=45,`RangeIndex`=1,`Effect1`=1,`EffectDieSides1`=1,`EffectBasePoints1`=1,`EffectImplicitTargetA1`=1,`DmgMultiplier1`=1,`DmgMultiplier2`=1,`DmgMultiplier3`=1 WHERE `id`=3617;
-- Update info for spell 7056 found in earlier patches dbc
UPDATE `spell_dbc` SET `Attributes`=336,`CastingTimeIndex`=1,`ProcChance`=101,`DurationIndex`=21,`RangeIndex`=1,`Effect1`=6,`EffectImplicitTargetA1`=1,`EffectApplyAuraName1`=25,`DmgMultiplier2`=1,`DmgMultiplier2`=1,`DmgMultiplier3`=1,`Comment`= 'Pacified' WHERE `id`=7056;

-- Spawn Nozdormu (Remember to set guid)
DELETE FROM `creature` WHERE `id`=27925;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(152260,27925,571,1,1,0,0,4112.988,-417.6215,191.0509,1.727876,300,0,0,1,0,0,0,0,0,0);
DELETE FROM `script_texts` WHERE `npc_entry`=0 AND `entry`=-1000187;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (6172,6177); -- Henze Faulk & Narm Faulk
-- SAI for Henze Faulk
SET @ENTRY := 6172;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - On spawn - add aura'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - set npcflags'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - On spawn - set phase 1'),
(@ENTRY,0,3,0,8,1,100,0,8593,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - On spellhit - run script (phase 1)'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - set phase 0'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Henze Faulk - Script - turn to player'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Henze Faulk - Script - say text'),
(@ENTRY*100,9,3,0,0,0,100,0,1500,1500,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - set npcflags'),
(@ENTRY*100,9,4,0,0,0,100,0,120000,120000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - evade (reset script)');
-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=@ENTRY; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, 'Thank you, dear $C, you just saved my life.',0,7,100,1,0,0, 'Henze Faulk');
-- Scripting cleanup
UPDATE `creature_template` SET `ScriptName`= '',`RegenHealth`=0 WHERE `entry`=@ENTRY;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=@ENTRY;

-- SAI for Narm Faulk
SET @ENTRY := 6177;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - On spawn - add aura'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - set npcflags'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - On spawn - set phase 1'),
(@ENTRY,0,3,0,8,1,100,0,8593,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - On spellhit - run script (phase 1)'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - set phase 0'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Narm Faulk - Script - turn to player'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Narm Faulk - Script - say text'),
(@ENTRY*100,9,3,0,0,0,100,0,1500,1500,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - set npcflags'),
(@ENTRY*100,9,4,0,0,0,100,0,120000,120000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - evade (reset script)');
-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=@ENTRY; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, 'Thank you, dear $C, you just saved my life.',0,7,100,1,0,0, 'Narm Faulk');
-- Scripting cleanup
UPDATE `creature_template` SET `ScriptName`= '',`RegenHealth`=0 WHERE `entry`=@ENTRY;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=@ENTRY;

-- SAI for Fhyron Shadesong
SET @ENTRY := 33788;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=8570.943,`position_y`=1008.467,`position_z`=548.2927 WHERE `guid`=85201;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - On spawn - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,8,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 8 - run script'),
(@ENTRY,0,2,0,40,0,100,0,10,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 10 - run script'),
(@ENTRY,0,3,0,40,0,100,0,12,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 12 - run script'),
(@ENTRY,0,4,0,40,0,100,0,14,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 14 - run script'),
(@ENTRY,0,5,0,40,0,100,0,15,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 15 - run script'),
(@ENTRY,0,6,0,40,0,100,0,17,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 17 - run script'),
(@ENTRY,0,7,0,40,0,100,0,18,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 18 - run script'),
(@ENTRY,0,8,0,40,0,100,0,20,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 20 - run script'),
(@ENTRY,0,9,0,40,0,100,0,21,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 21 - run script'),
(@ENTRY,0,10,0,40,0,100,0,26,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 26 - run script'),
(@ENTRY,0,11,0,40,0,100,0,28,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 28 - run script'),
(@ENTRY,0,12,0,40,0,100,0,31,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 31 - run script'),
(@ENTRY,0,13,0,40,0,100,0,33,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 33 - run script'),
(@ENTRY,0,14,0,40,0,100,0,38,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 38 - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Script - Pause path'),
(@ENTRY*100,9,1,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,19,33787,0,0,0,0,0,0, 'Fhyron Shadesong - Script - turn to Tournament Druid Spell Target'),
(@ENTRY*100,9,2,0,0,0,100,0,100,100,0,0,11,63678,0,0,0,0,0,19,33787,0,0,0,0,0,0, 'Fhyron Shadesong - Script - Cast Earthliving Visual on Tournament Druid Spell Target'),
(@ENTRY*100,9,3,0,0,0,50,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Script - say text 0');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=@ENTRY; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, 'Help shield us from these cutting winds, little sapling.',0,7,100,2,0,0, 'Fhyron Shadesong'),
(@ENTRY,0,1, 'There you are',0,7,100,273,0,0, 'Fhyron Shadesong'),
(@ENTRY,0,2, 'Grow, little one.',0,7,100,273,0,0, 'Fhyron Shadesong');
-- Waypoints for Fhyron Shadesong from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,8567.44,973.9194,547.9177, 'Fhyron Shadesong'),
(@ENTRY,2,8568.162,947.0933,547.8038, 'Fhyron Shadesong'),
(@ENTRY,3,8566.031,913.37,548.2927, 'Fhyron Shadesong'),
(@ENTRY,4,8564.706,894.527,547.6705, 'Fhyron Shadesong'),
(@ENTRY,5,8567.681,876.0731,547.5937, 'Fhyron Shadesong'),
(@ENTRY,6,8578.911,863.8034,548.4218, 'Fhyron Shadesong'),
(@ENTRY,7,8590.869,849.7815,547.6718, 'Fhyron Shadesong'),
(@ENTRY,8,8603.909,853.178,548.1281, 'Fhyron Shadesong'),
(@ENTRY,9,8599.38,855.512,547.715, 'Fhyron Shadesong'),
(@ENTRY,10,8591.701,868.5342,549.3784, 'Fhyron Shadesong'),
(@ENTRY,11,8586.77,871.798,547.876, 'Fhyron Shadesong'),
(@ENTRY,12,8586.149,883.8123,549.2509, 'Fhyron Shadesong'),
(@ENTRY,13,8583.74,886.251,548.96, 'Fhyron Shadesong'),
(@ENTRY,14,8582.075,903.0688,550.0374, 'Fhyron Shadesong'),
(@ENTRY,15,8585.078,918.2136,548.6675, 'Fhyron Shadesong'),
(@ENTRY,16,8581.65,944.137,547.897, 'Fhyron Shadesong'),
(@ENTRY,17,8582.839,948.3386,547.6221, 'Fhyron Shadesong'),
(@ENTRY,18,8565.45,986.6495,549.3403, 'Fhyron Shadesong'),
(@ENTRY,19,8570.5,989.399,547.629, 'Fhyron Shadesong'),
(@ENTRY,20,8576.626,1006.561,549.2132, 'Fhyron Shadesong'),
(@ENTRY,21,8586.87,1008.438,548.1278, 'Fhyron Shadesong'),
(@ENTRY,22,8590.46,1005.12,547.563, 'Fhyron Shadesong'),
(@ENTRY,23,8599.41,1007.08,547.419, 'Fhyron Shadesong'),
(@ENTRY,24,8602.17,1013.39,548.185, 'Fhyron Shadesong'),
(@ENTRY,25,8604.88,1030.23,556.734, 'Fhyron Shadesong'),
(@ENTRY,26,8612.658,1035.293,558.3499, 'Fhyron Shadesong'),
(@ENTRY,27,8611.47,1039.23,558.735, 'Fhyron Shadesong'),
(@ENTRY,28,8613.692,1042.313,558.3265, 'Fhyron Shadesong'),
(@ENTRY,29,8603.88,1044.65,558.38, 'Fhyron Shadesong'),
(@ENTRY,30,8598.02,1072.57,557.923, 'Fhyron Shadesong'),
(@ENTRY,31,8602.397,1081.373,558.2934, 'Fhyron Shadesong'),
(@ENTRY,32,8597.45,1089.27,557.317, 'Fhyron Shadesong'),
(@ENTRY,33,8600.864,1092.901,557.4839, 'Fhyron Shadesong'),
(@ENTRY,34,8593.38,1084.72,556.817, 'Fhyron Shadesong'),
(@ENTRY,35,8578.9,1068.6,557.38, 'Fhyron Shadesong'),
(@ENTRY,36,8563.31,1065.51,554.057, 'Fhyron Shadesong'),
(@ENTRY,37,8549.85,1061.87,550.61, 'Fhyron Shadesong'),
(@ENTRY,38,8547.754,1051.273,550.2899, 'Fhyron Shadesong'),
(@ENTRY,39,8544.317,1042.702,549.2928, 'Fhyron Shadesong'),
(@ENTRY,40,8557.891,1029.923,548.1677, 'Fhyron Shadesong'),
(@ENTRY,41,8566.168,1017.246,548.1677, 'Fhyron Shadesong'),
(@ENTRY,42,8570.943,1008.467,548.2927, 'Fhyron Shadesong');
-- Change InhabitType for 33787 "Tournament Druid Spell Target"
UPDATE `creature_template` SET `InhabitType`=1 WHERE `entry`=33787;
-- Egg Rush! should only be castable in Azure Watch, Dolannar, Goldshire, haranos, Bloodhoof Village, Brill, Falconwing Square, Razor Hill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=61810;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`Comment`) VALUES
(17,0,61810,1,23,3576, 'Egg Rush! - Requires Azure Watch'), -- OR
(17,0,61810,2,23,186, 'Egg Rush! - Requires Dolanaar'), -- OR
(17,0,61810,3,23,87, 'Egg Rush! - Requires Goldshire'), -- OR
(17,0,61810,4,23,131, 'Egg Rush! - Requires Kharanos'), -- OR
(17,0,61810,5,23,222, 'Egg Rush! - Requires Bloodhoof Village'), -- OR
(17,0,61810,6,23,159, 'Egg Rush! - Requires Brill'), -- OR
(17,0,61810,7,23,2118, 'Egg Rush! - Requires Brill Town Hall'), -- OR
(17,0,61810,8,23,3665, 'Egg Rush! - Requires Falconwing Square'), -- OR
(17,0,61810,9,23,362, 'Egg Rush! - Requires Razor Hill'), -- OR
(17,0,61810,10,23,2337, 'Egg Rush! - Requires Razor Hill Barracks');

-- Template updates for gameobject Brightly Colored Egg
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry` BETWEEN 113768 AND 113772; -- Brightly Colored Egg's
UPDATE `gameobject_template` SET `data1`=26884,`data7`=194047 WHERE `entry`=113772 AND `WDBVerified`=1; -- Brightly Colored Egg, made up GOB, no reason to be different from others

-- Loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=4984;
DELETE FROM `item_loot_template` WHERE `entry`=45072;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(45072,44791,95,1,1,1,1), -- Noblegarden Chocolate
(45072,19028,0.2,1,1,1,1), -- Elegant Dress reminder of group 1
(45072,6833,0.9,1,1,1,1), -- White Tuxedo Shirt
(45072,6835,0.9,1,1,1,1), -- Black Tuxedo Pants
(45072,45073,0.6,1,1,1,1), -- Spring Flowers
(45072,44800,0.6,1,1,1,1), -- Spring Robes
(45072,44794,0.4,1,1,1,1), -- Spring Rabbit's Foot
(45072,44803,0.5,1,1,1,1), -- Spring Circlet
(45072,44792,0.9,1,1,1,1), -- Blossoming Branch
(45072,44806,-100,1,0,1,1); -- Brightly Colored Shell Fragment

-- Creature template
UPDATE `creature_template` SET `equipment_id`=10102 WHERE `entry` =32836;
/* Spawn Brightly Colored Eggs */

SET @EVENT = 9; -- Noblegarden
SET @GUID = 151896; -- Gameobjects
SET @DESPAWN = 40; -- Eggs respawn time: 40 seconds ?
SET @POOL = 5699; -- Need 8

SET @A = 113768; -- Brightly Colored Egg
SET @B = 113769; -- Brightly Colored Egg
SET @C = 113770; -- Brightly Colored Egg
SET @D = 113771; -- Brightly Colored Egg
SET @E = 113772; -- Brightly Colored Egg

DELETE FROM `game_event` WHERE `eventEntry`=26;
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=26;

-- Pooling - max_limit needs to be ajusted, any sugestion?
DELETE FROM `pool_template` WHERE `entry` BETWEEN @POOL AND @POOL+7;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL+0,20, 'Noblegarden Eggs - Azure Watch'),
(@POOL+1,20, 'Noblegarden Eggs - Dolanaar'),
(@POOL+2,20, 'Noblegarden Eggs - Goldshire'),
(@POOL+3,20, 'Noblegarden Eggs - Kharanos'),
(@POOL+4,20, 'Noblegarden Eggs - Bloodhoof Village'),
(@POOL+5,20, 'Noblegarden Eggs - Brill'),
(@POOL+6,20, 'Noblegarden Eggs - Falconwing Square'),
(@POOL+7,20, 'Noblegarden Eggs - Razor Hill');

DELETE FROM `game_event_pool` WHERE `eventEntry`=@EVENT;
INSERT INTO `game_event_pool` (`eventEntry`,`pool_entry`) VALUES
(@EVENT,@POOL+0),(@EVENT,@POOL+1),
(@EVENT,@POOL+2),(@EVENT,@POOL+3),
(@EVENT,@POOL+4),(@EVENT,@POOL+5),
(@EVENT,@POOL+6),(@EVENT,@POOL+7);

DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN @GUID AND @GUID+219 AND `pool_entry` BETWEEN @POOL AND @POOL+7;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(@GUID+000,@POOL+0,0, 'Noblegarden Egg'),(@GUID+001,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+002,@POOL+0,0, 'Noblegarden Egg'),(@GUID+003,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+004,@POOL+0,0, 'Noblegarden Egg'),(@GUID+005,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+006,@POOL+0,0, 'Noblegarden Egg'),(@GUID+007,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+008,@POOL+0,0, 'Noblegarden Egg'),(@GUID+009,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+010,@POOL+0,0, 'Noblegarden Egg'),(@GUID+011,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+012,@POOL+0,0, 'Noblegarden Egg'),(@GUID+013,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+014,@POOL+0,0, 'Noblegarden Egg'),(@GUID+015,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+016,@POOL+0,0, 'Noblegarden Egg'),(@GUID+017,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+018,@POOL+0,0, 'Noblegarden Egg'),(@GUID+019,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+020,@POOL+0,0, 'Noblegarden Egg'),(@GUID+021,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+022,@POOL+0,0, 'Noblegarden Egg'),(@GUID+023,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+024,@POOL+0,0, 'Noblegarden Egg'),(@GUID+025,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+026,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+027,@POOL+1,0, 'Noblegarden Egg'),(@GUID+028,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+029,@POOL+1,0, 'Noblegarden Egg'),(@GUID+030,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+031,@POOL+1,0, 'Noblegarden Egg'),(@GUID+032,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+033,@POOL+1,0, 'Noblegarden Egg'),(@GUID+034,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+035,@POOL+1,0, 'Noblegarden Egg'),(@GUID+036,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+037,@POOL+1,0, 'Noblegarden Egg'),(@GUID+038,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+039,@POOL+1,0, 'Noblegarden Egg'),(@GUID+040,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+041,@POOL+1,0, 'Noblegarden Egg'),(@GUID+042,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+043,@POOL+1,0, 'Noblegarden Egg'),(@GUID+044,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+045,@POOL+1,0, 'Noblegarden Egg'),(@GUID+046,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+047,@POOL+1,0, 'Noblegarden Egg'),(@GUID+048,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+049,@POOL+1,0, 'Noblegarden Egg'),(@GUID+050,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+051,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+052,@POOL+2,0, 'Noblegarden Egg'),(@GUID+053,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+054,@POOL+2,0, 'Noblegarden Egg'),(@GUID+055,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+056,@POOL+2,0, 'Noblegarden Egg'),(@GUID+057,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+058,@POOL+2,0, 'Noblegarden Egg'),(@GUID+059,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+060,@POOL+2,0, 'Noblegarden Egg'),(@GUID+061,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+062,@POOL+2,0, 'Noblegarden Egg'),(@GUID+063,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+064,@POOL+2,0, 'Noblegarden Egg'),(@GUID+065,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+066,@POOL+2,0, 'Noblegarden Egg'),(@GUID+067,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+068,@POOL+2,0, 'Noblegarden Egg'),(@GUID+069,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+070,@POOL+2,0, 'Noblegarden Egg'),(@GUID+071,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+072,@POOL+2,0, 'Noblegarden Egg'),(@GUID+073,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+074,@POOL+2,0, 'Noblegarden Egg'),(@GUID+075,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+076,@POOL+2,0, 'Noblegarden Egg'),(@GUID+077,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+078,@POOL+2,0, 'Noblegarden Egg'),(@GUID+079,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+080,@POOL+2,0, 'Noblegarden Egg'),(@GUID+081,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+082,@POOL+2,0, 'Noblegarden Egg'),(@GUID+083,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+084,@POOL+2,0, 'Noblegarden Egg'),(@GUID+085,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+086,@POOL+3,0, 'Noblegarden Egg'),(@GUID+087,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+088,@POOL+3,0, 'Noblegarden Egg'),(@GUID+089,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+090,@POOL+3,0, 'Noblegarden Egg'),(@GUID+091,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+092,@POOL+3,0, 'Noblegarden Egg'),(@GUID+093,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+094,@POOL+3,0, 'Noblegarden Egg'),(@GUID+095,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+096,@POOL+3,0, 'Noblegarden Egg'),(@GUID+097,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+098,@POOL+3,0, 'Noblegarden Egg'),(@GUID+099,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+100,@POOL+3,0, 'Noblegarden Egg'),(@GUID+101,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+102,@POOL+3,0, 'Noblegarden Egg'),(@GUID+103,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+104,@POOL+3,0, 'Noblegarden Egg'),(@GUID+105,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+106,@POOL+4,0, 'Noblegarden Egg'),(@GUID+107,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+108,@POOL+4,0, 'Noblegarden Egg'),(@GUID+109,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+110,@POOL+4,0, 'Noblegarden Egg'),(@GUID+111,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+112,@POOL+4,0, 'Noblegarden Egg'),(@GUID+113,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+114,@POOL+4,0, 'Noblegarden Egg'),(@GUID+115,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+116,@POOL+4,0, 'Noblegarden Egg'),(@GUID+117,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+118,@POOL+4,0, 'Noblegarden Egg'),(@GUID+119,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+120,@POOL+4,0, 'Noblegarden Egg'),(@GUID+121,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+122,@POOL+4,0, 'Noblegarden Egg'),(@GUID+123,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+124,@POOL+4,0, 'Noblegarden Egg'),(@GUID+125,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+126,@POOL+4,0, 'Noblegarden Egg'),(@GUID+127,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+128,@POOL+5,0, 'Noblegarden Egg'),(@GUID+129,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+130,@POOL+5,0, 'Noblegarden Egg'),(@GUID+131,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+132,@POOL+5,0, 'Noblegarden Egg'),(@GUID+133,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+134,@POOL+5,0, 'Noblegarden Egg'),(@GUID+135,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+136,@POOL+5,0, 'Noblegarden Egg'),(@GUID+137,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+138,@POOL+5,0, 'Noblegarden Egg'),(@GUID+139,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+140,@POOL+5,0, 'Noblegarden Egg'),(@GUID+141,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+142,@POOL+5,0, 'Noblegarden Egg'),(@GUID+143,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+144,@POOL+5,0, 'Noblegarden Egg'),(@GUID+145,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+146,@POOL+5,0, 'Noblegarden Egg'),(@GUID+147,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+148,@POOL+5,0, 'Noblegarden Egg'),(@GUID+149,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+150,@POOL+5,0, 'Noblegarden Egg'),(@GUID+151,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+152,@POOL+5,0, 'Noblegarden Egg'),(@GUID+153,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+154,@POOL+5,0, 'Noblegarden Egg'),(@GUID+155,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+156,@POOL+5,0, 'Noblegarden Egg'),(@GUID+157,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+158,@POOL+5,0, 'Noblegarden Egg'),(@GUID+159,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+160,@POOL+5,0, 'Noblegarden Egg'),(@GUID+161,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+162,@POOL+6,0, 'Noblegarden Egg'),(@GUID+163,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+164,@POOL+6,0, 'Noblegarden Egg'),(@GUID+165,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+166,@POOL+6,0, 'Noblegarden Egg'),(@GUID+167,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+168,@POOL+6,0, 'Noblegarden Egg'),(@GUID+169,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+170,@POOL+6,0, 'Noblegarden Egg'),(@GUID+171,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+172,@POOL+6,0, 'Noblegarden Egg'),(@GUID+173,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+174,@POOL+6,0, 'Noblegarden Egg'),(@GUID+175,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+176,@POOL+6,0, 'Noblegarden Egg'),(@GUID+177,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+178,@POOL+6,0, 'Noblegarden Egg'),(@GUID+179,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+180,@POOL+6,0, 'Noblegarden Egg'),(@GUID+181,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+182,@POOL+6,0, 'Noblegarden Egg'),(@GUID+183,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+184,@POOL+6,0, 'Noblegarden Egg'),(@GUID+185,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+186,@POOL+6,0, 'Noblegarden Egg'),(@GUID+187,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+188,@POOL+6,0, 'Noblegarden Egg'),(@GUID+189,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+190,@POOL+7,0, 'Noblegarden Egg'),(@GUID+191,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+192,@POOL+7,0, 'Noblegarden Egg'),(@GUID+193,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+194,@POOL+7,0, 'Noblegarden Egg'),(@GUID+195,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+196,@POOL+7,0, 'Noblegarden Egg'),(@GUID+197,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+198,@POOL+7,0, 'Noblegarden Egg'),(@GUID+199,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+200,@POOL+7,0, 'Noblegarden Egg'),(@GUID+201,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+202,@POOL+7,0, 'Noblegarden Egg'),(@GUID+203,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+204,@POOL+7,0, 'Noblegarden Egg'),(@GUID+205,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+206,@POOL+7,0, 'Noblegarden Egg'),(@GUID+207,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+208,@POOL+7,0, 'Noblegarden Egg'),(@GUID+209,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+210,@POOL+7,0, 'Noblegarden Egg'),(@GUID+211,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+212,@POOL+7,0, 'Noblegarden Egg'),(@GUID+213,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+214,@POOL+7,0, 'Noblegarden Egg'),(@GUID+215,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+216,@POOL+7,0, 'Noblegarden Egg'),(@GUID+217,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+218,@POOL+7,0, 'Noblegarden Egg'),(@GUID+219,@POOL+7,0, 'Noblegarden Egg');

DELETE FROM `game_event_gameobject` WHERE `eventEntry`=@EVENT;
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(@EVENT,@GUID+000),(@EVENT,@GUID+001),(@EVENT,@GUID+002),
(@EVENT,@GUID+003),(@EVENT,@GUID+004),(@EVENT,@GUID+005),
(@EVENT,@GUID+006),(@EVENT,@GUID+007),(@EVENT,@GUID+008),
(@EVENT,@GUID+009),(@EVENT,@GUID+010),(@EVENT,@GUID+011),
(@EVENT,@GUID+012),(@EVENT,@GUID+013),(@EVENT,@GUID+014),
(@EVENT,@GUID+015),(@EVENT,@GUID+016),(@EVENT,@GUID+017),
(@EVENT,@GUID+018),(@EVENT,@GUID+019),(@EVENT,@GUID+020),
(@EVENT,@GUID+021),(@EVENT,@GUID+022),(@EVENT,@GUID+023),
(@EVENT,@GUID+024),(@EVENT,@GUID+025),(@EVENT,@GUID+026),
(@EVENT,@GUID+027),(@EVENT,@GUID+028),(@EVENT,@GUID+029),
(@EVENT,@GUID+030),(@EVENT,@GUID+031),(@EVENT,@GUID+032),
(@EVENT,@GUID+033),(@EVENT,@GUID+034),(@EVENT,@GUID+035),
(@EVENT,@GUID+036),(@EVENT,@GUID+037),(@EVENT,@GUID+038),
(@EVENT,@GUID+039),(@EVENT,@GUID+040),(@EVENT,@GUID+041),
(@EVENT,@GUID+042),(@EVENT,@GUID+043),(@EVENT,@GUID+044),
(@EVENT,@GUID+045),(@EVENT,@GUID+046),(@EVENT,@GUID+047),
(@EVENT,@GUID+048),(@EVENT,@GUID+049),(@EVENT,@GUID+050),
(@EVENT,@GUID+051),(@EVENT,@GUID+052),(@EVENT,@GUID+053),
(@EVENT,@GUID+054),(@EVENT,@GUID+055),(@EVENT,@GUID+056),
(@EVENT,@GUID+057),(@EVENT,@GUID+058),(@EVENT,@GUID+059),
(@EVENT,@GUID+060),(@EVENT,@GUID+061),(@EVENT,@GUID+062),
(@EVENT,@GUID+063),(@EVENT,@GUID+064),(@EVENT,@GUID+065),
(@EVENT,@GUID+066),(@EVENT,@GUID+067),(@EVENT,@GUID+068),
(@EVENT,@GUID+069),(@EVENT,@GUID+070),(@EVENT,@GUID+071),
(@EVENT,@GUID+072),(@EVENT,@GUID+073),(@EVENT,@GUID+074),
(@EVENT,@GUID+075),(@EVENT,@GUID+076),(@EVENT,@GUID+077),
(@EVENT,@GUID+078),(@EVENT,@GUID+079),(@EVENT,@GUID+080),
(@EVENT,@GUID+081),(@EVENT,@GUID+082),(@EVENT,@GUID+083),
(@EVENT,@GUID+084),(@EVENT,@GUID+085),(@EVENT,@GUID+086),
(@EVENT,@GUID+087),(@EVENT,@GUID+088),(@EVENT,@GUID+089),
(@EVENT,@GUID+090),(@EVENT,@GUID+091),(@EVENT,@GUID+092),
(@EVENT,@GUID+093),(@EVENT,@GUID+094),(@EVENT,@GUID+095),
(@EVENT,@GUID+096),(@EVENT,@GUID+097),(@EVENT,@GUID+098),
(@EVENT,@GUID+099),(@EVENT,@GUID+100),(@EVENT,@GUID+101),
(@EVENT,@GUID+102),(@EVENT,@GUID+103),(@EVENT,@GUID+104),
(@EVENT,@GUID+105),(@EVENT,@GUID+106),(@EVENT,@GUID+107),
(@EVENT,@GUID+108),(@EVENT,@GUID+109),(@EVENT,@GUID+110),
(@EVENT,@GUID+111),(@EVENT,@GUID+112),(@EVENT,@GUID+113),
(@EVENT,@GUID+114),(@EVENT,@GUID+115),(@EVENT,@GUID+116),
(@EVENT,@GUID+117),(@EVENT,@GUID+118),(@EVENT,@GUID+119),
(@EVENT,@GUID+120),(@EVENT,@GUID+121),(@EVENT,@GUID+122),
(@EVENT,@GUID+123),(@EVENT,@GUID+124),(@EVENT,@GUID+125),
(@EVENT,@GUID+126),(@EVENT,@GUID+127),(@EVENT,@GUID+128),
(@EVENT,@GUID+129),(@EVENT,@GUID+130),(@EVENT,@GUID+131),
(@EVENT,@GUID+132),(@EVENT,@GUID+133),(@EVENT,@GUID+134),
(@EVENT,@GUID+135),(@EVENT,@GUID+136),(@EVENT,@GUID+137),
(@EVENT,@GUID+138),(@EVENT,@GUID+139),(@EVENT,@GUID+140),
(@EVENT,@GUID+141),(@EVENT,@GUID+142),(@EVENT,@GUID+143),
(@EVENT,@GUID+144),(@EVENT,@GUID+145),(@EVENT,@GUID+146),
(@EVENT,@GUID+147),(@EVENT,@GUID+148),(@EVENT,@GUID+149),
(@EVENT,@GUID+150),(@EVENT,@GUID+151),(@EVENT,@GUID+152),
(@EVENT,@GUID+153),(@EVENT,@GUID+154),(@EVENT,@GUID+155),
(@EVENT,@GUID+156),(@EVENT,@GUID+157),(@EVENT,@GUID+158),
(@EVENT,@GUID+159),(@EVENT,@GUID+160),(@EVENT,@GUID+161),
(@EVENT,@GUID+162),(@EVENT,@GUID+163),(@EVENT,@GUID+164),
(@EVENT,@GUID+165),(@EVENT,@GUID+166),(@EVENT,@GUID+167),
(@EVENT,@GUID+168),(@EVENT,@GUID+169),(@EVENT,@GUID+170),
(@EVENT,@GUID+171),(@EVENT,@GUID+172),(@EVENT,@GUID+173),
(@EVENT,@GUID+174),(@EVENT,@GUID+175),(@EVENT,@GUID+176),
(@EVENT,@GUID+177),(@EVENT,@GUID+178),(@EVENT,@GUID+179),
(@EVENT,@GUID+180),(@EVENT,@GUID+181),(@EVENT,@GUID+182),
(@EVENT,@GUID+183),(@EVENT,@GUID+184),(@EVENT,@GUID+185),
(@EVENT,@GUID+186),(@EVENT,@GUID+187),(@EVENT,@GUID+188),
(@EVENT,@GUID+189),(@EVENT,@GUID+190),(@EVENT,@GUID+191),
(@EVENT,@GUID+192),(@EVENT,@GUID+193),(@EVENT,@GUID+194),
(@EVENT,@GUID+195),(@EVENT,@GUID+196),(@EVENT,@GUID+197),
(@EVENT,@GUID+198),(@EVENT,@GUID+199),(@EVENT,@GUID+200),
(@EVENT,@GUID+201),(@EVENT,@GUID+202),(@EVENT,@GUID+203),
(@EVENT,@GUID+204),(@EVENT,@GUID+205),(@EVENT,@GUID+206),
(@EVENT,@GUID+207),(@EVENT,@GUID+208),(@EVENT,@GUID+209),
(@EVENT,@GUID+210),(@EVENT,@GUID+211),(@EVENT,@GUID+212),
(@EVENT,@GUID+213),(@EVENT,@GUID+214),(@EVENT,@GUID+215),
(@EVENT,@GUID+216),(@EVENT,@GUID+217),(@EVENT,@GUID+218),
(@EVENT,@GUID+219); 

DELETE FROM `gameobject` WHERE `id` BETWEEN 113768 AND 113772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GUID+000,@A,0,1,1,-5572.18,-462.293,402.306,4.1197,0,0,0.882777,-0.469792,@DESPAWN,0,1), -- "Kharanos"
(@GUID+001,@B,0,1,1,-5588.73,-514.072,404.096,5.47452,0,0,0.393407,-0.919364,@DESPAWN,0,1),
(@GUID+002,@C,0,1,1,-5657.99,-509.341,398.747,1.01738,0,0,0.487035,0.873382,@DESPAWN,0,1),
(@GUID+003,@D,0,1,1,-5679.2,-527.206,396.599,0.129883,0,0,0.0648957,0.997892,@DESPAWN,0,1),
(@GUID+004,@E,0,1,1,-5648.93,-500.956,396.669,5.91827,0,0,0.181445,-0.983401,@DESPAWN,0,1),
(@GUID+005,@A,0,1,1,-5606.29,-445.915,403.953,4.50064,0,0,0.777873,-0.628421,@DESPAWN,0,1),
(@GUID+006,@B,0,1,1,-5610.05,-425.467,403.297,4.33964,0,0,0.825888,-0.563834,@DESPAWN,0,1),
(@GUID+007,@C,0,1,1,-5549.5,-438.023,405.233,4.35534,0,0,0.821434,-0.570304,@DESPAWN,0,1),
(@GUID+008,@D,0,1,1,-5568.58,-417.381,416.157,3.67204,0,0,0.965034,-0.262126,@DESPAWN,0,1),
(@GUID+009,@E,0,1,1,-5597.9,-420.422,412.014,3.52674,0,0,0.981515,-0.191384,@DESPAWN,0,1),
(@GUID+010,@A,0,1,1,-5585,-427.035,424.522,4.22181,0,0,0.857652,-0.514231,@DESPAWN,0,1),
(@GUID+011,@B,0,1,1,-5531.16,-459.015,403.516,4.19039,0,0,0.865625,-0.500693,@DESPAWN,0,1),
(@GUID+012,@C,0,1,1,-5543.29,-475.611,397.919,4.41423,0,0,0.804289,-0.594238,@DESPAWN,0,1),
(@GUID+013,@D,0,1,1,-5539.12,-501.709,402.718,3.42463,0,0,0.990003,-0.141047,@DESPAWN,0,1),
(@GUID+014,@E,0,1,1,-5550.12,-499.479,401.691,1.09592,0,0,0.520947,0.853589,@DESPAWN,0,1),
(@GUID+015,@A,0,1,1,-5552.1,-528.526,403.379,0.699295,0,0,0.342566,0.939494,@DESPAWN,0,1),
(@GUID+016,@B,0,1,1,-5577.98,-516.152,404.097,2.76804,0,0,0.982608,0.185694,@DESPAWN,0,1),
(@GUID+017,@C,0,1,1,-5589.02,-499.368,400.114,3.61626,0,0,0.971968,-0.235114,@DESPAWN,0,1),
(@GUID+018,@D,0,1,1,-5595.03,-507.466,401.138,0.835169,0,0,0.405553,0.914071,@DESPAWN,0,1),
(@GUID+019,@E,0,1,1,-5615.28,-523.667,402.662,2.11537,0,0,0.87122,0.490892,@DESPAWN,0,1),
(@GUID+020,@A,0,1,1,-5615.63,-532.978,406.92,1.49097,0,0,0.678329,0.734758,@DESPAWN,0,1),
(@GUID+021,@B,0,1,1,-5639.01,-531.358,405.116,1.07471,0,0,0.511866,0.859065,@DESPAWN,0,1),
(@GUID+022,@C,0,1,1,-5645.02,-506.352,397.389,6.13267,0,0,0.0751855,-0.99717,@DESPAWN,0,1),
(@GUID+023,@D,0,1,1,-5629.9,-478.085,397.148,4.82499,0,0,0.666198,-0.745775,@DESPAWN,0,1),
(@GUID+024,@E,0,1,1,-5596.35,-454.242,402.532,5.13522,0,0,0.54298,-0.839746,@DESPAWN,0,1),
(@GUID+025,@A,0,1,1,-5584.47,-462.246,402.873,1.54203,0,0,0.696862,0.717205,@DESPAWN,0,1),
(@GUID+026,@B,0,1,1,-5591.92,-476.967,396.981,5.29231,0,0,0.475419,-0.87976,@DESPAWN,0,1),
(@GUID+027,@C,0,1,1,-9471.12,43.1883,56.5597,1.5067,0,0,0.684088,0.7294,@DESPAWN,0,1), -- "Goldshire"
(@GUID+028,@D,0,1,1,-9437.51,112.982,57.576,4.86507,0,0,0.651119,-0.758976,@DESPAWN,0,1),
(@GUID+029,@E,0,1,1,-9423.57,109.77,58.6395,1.88449,0,0,0.808879,0.587974,@DESPAWN,0,1),
(@GUID+030,@A,0,1,1,-9424.83,63.7018,57.5696,4.42918,0,0,0.799825,-0.600233,@DESPAWN,0,1),
(@GUID+031,@B,0,1,1,-9416.75,54.7442,59.1231,5.99605,0,0,0.143077,-0.989712,@DESPAWN,0,1),
(@GUID+032,@C,0,1,1,-9425.34,56.1924,57.1307,0.756653,0,0,0.369366,0.929284,@DESPAWN,0,1),
(@GUID+033,@D,0,1,1,-9455.38,38.8205,56.6227,4.03962,0,0,0.900876,-0.434077,@DESPAWN,0,1),
(@GUID+034,@E,0,1,1,-9452.97,27.2894,56.5301,2.98326,0,0,0.996868,0.0790825,@DESPAWN,0,1),
(@GUID+035,@A,0,1,1,-9437.04,39.389,57.0626,1.83658,0,0,0.794565,0.607179,@DESPAWN,0,1),
(@GUID+036,@B,0,1,1,-9454.61,17.6726,58.0491,2.26462,0,0,0.905396,0.424568,@DESPAWN,0,1),
(@GUID+037,@C,0,1,1,-9470.77,-9.74519,56.5758,1.7227,0,0,0.758722,0.651415,@DESPAWN,0,1),
(@GUID+038,@D,0,1,1,-9477.11,7.08912,56.7995,0.151903,0,0,0.0758784,0.997117,@DESPAWN,0,1),
(@GUID+039,@E,0,1,1,-9484.17,13.6372,56.8493,0.576018,0,0,0.284044,0.958811,@DESPAWN,0,1),
(@GUID+040,@A,0,1,1,-9477.59,39.3136,57.4807,0.316842,0,0,0.157759,0.987478,@DESPAWN,0,1),
(@GUID+041,@B,0,1,1,-9485.15,46.0046,57.2156,0.242232,0,0,0.12082,0.992674,@DESPAWN,0,1),
(@GUID+042,@C,0,1,1,-9513.08,35.1837,57.3331,0.0851526,0,0,0.0425635,0.999094,@DESPAWN,0,1),
(@GUID+043,@D,0,1,1,-9501.08,61.728,56.6617,5.84212,0,0,0.218747,-0.975782,@DESPAWN,0,1),
(@GUID+044,@E,0,1,1,-9504.1,68.101,56.7047,5.03709,0,0,0.583512,-0.812105,@DESPAWN,0,1),
(@GUID+045,@A,0,1,1,-9499.42,83.8596,57.4257,5.81071,0,0,0.234046,-0.972226,@DESPAWN,0,1),
(@GUID+046,@B,0,1,1,-9511.45,101.96,58.6933,3.55663,0,0,0.978546,-0.206031,@DESPAWN,0,1),
(@GUID+047,@C,0,1,1,-9473.96,119.593,57.1435,4.68367,0,0,0.717187,-0.696881,@DESPAWN,0,1),
(@GUID+048,@D,0,1,1,-9469.15,101.676,58.0043,0.693849,0,0,0.340007,0.940423,@DESPAWN,0,1),
(@GUID+049,@E,0,1,1,-9473.1,78.0493,57.4364,5.28843,0,0,0.477122,-0.878837,@DESPAWN,0,1),
(@GUID+050,@A,0,1,1,-9463.99,81.5619,57.0823,1.29076,0,0,0.601501,0.798872,@DESPAWN,0,1),
(@GUID+051,@B,0,1,1,-9454.56,77.5214,57.0453,2.07616,0,0,0.86143,0.507876,@DESPAWN,0,1),
(@GUID+052,@C,0,1,1,2265.24,273.786,35.1652,3.01138,0,0,0.997881,0.0650598,@DESPAWN,0,1), -- "Brill"
(@GUID+053,@D,0,1,1,2285.1,254.969,34.3626,4.85628,0,0,0.654447,-0.756108,@DESPAWN,0,1),
(@GUID+054,@E,0,1,1,2288.74,269.683,35.1812,5.66446,0,0,0.304454,-0.952527,@DESPAWN,0,1),
(@GUID+055,@A,0,1,1,2278.93,277.294,35.1826,6.10428,0,0,0.0893348,-0.996002,@DESPAWN,0,1),
(@GUID+056,@B,0,1,1,2217.46,260.101,34.3656,6.16319,0,0,0.0599639,-0.998201,@DESPAWN,0,1),
(@GUID+057,@C,0,1,1,2241.09,240.359,34.1166,6.0925,0,0,0.0951979,-0.995458,@DESPAWN,0,1),
(@GUID+058,@D,0,1,1,2238.64,254.641,36.0388,4.69843,0,0,0.712026,-0.702153,@DESPAWN,0,1),
(@GUID+059,@E,0,1,1,2242.84,256.763,34.1151,4.9851,0,0,0.604425,-0.796662,@DESPAWN,0,1),
(@GUID+060,@A,0,1,1,2257.66,267.047,35.0788,3.00197,0,0,0.997564,0.069754,@DESPAWN,0,1),
(@GUID+061,@B,0,1,1,2265.36,253.863,34.8159,3.9523,0,0,0.918962,-0.394345,@DESPAWN,0,1),
(@GUID+062,@C,0,1,1,2285.8,254.474,34.2964,3.24545,0,0,0.998652,-0.0519028,@DESPAWN,0,1),
(@GUID+063,@D,0,1,1,2306.67,255.891,35.0947,2.94307,0,0,0.995077,0.0991001,@DESPAWN,0,1),
(@GUID+064,@E,0,1,1,2319.59,261.456,35.1823,3.96408,0,0,0.916623,-0.399752,@DESPAWN,0,1),
(@GUID+065,@A,0,1,1,2327.93,292.866,35.1823,3.35147,0,0,0.994499,-0.104749,@DESPAWN,0,1),
(@GUID+066,@B,0,1,1,2385.44,323.192,38.5898,4.96547,0,0,0.612215,-0.790691,@DESPAWN,0,1),
(@GUID+067,@C,0,1,1,2369.98,347.343,38.1937,5.98648,0,0,0.147807,-0.989016,@DESPAWN,0,1),
(@GUID+068,@D,0,1,1,2345.9,323.965,36.1689,1.27017,0,0,0.593245,0.805022,@DESPAWN,0,1),
(@GUID+069,@E,0,1,1,2315.1,313.901,36.7118,4.96547,0,0,0.612216,-0.790691,@DESPAWN,0,1),
(@GUID+070,@A,0,1,1,2304.19,329.028,37.3369,4.01513,0,0,0.906123,-0.423014,@DESPAWN,0,1),
(@GUID+071,@B,0,1,1,2289.53,334.538,34.6499,6.25743,0,0,0.0128751,-0.999917,@DESPAWN,0,1),
(@GUID+072,@C,0,1,1,2249.87,335.382,35.1891,1.72569,0,0,0.759695,0.650279,@DESPAWN,0,1),
(@GUID+073,@D,0,1,1,2267.7,337.796,35.1685,3.85019,0,0,0.93789,-0.346934,@DESPAWN,0,1),
(@GUID+074,@E,0,1,1,2270.61,345.306,35.1892,4.16435,0,0,0.872071,-0.48938,@DESPAWN,0,1),
(@GUID+075,@A,0,1,1,2262.43,353.117,35.1892,5.36993,0,0,0.440922,-0.897545,@DESPAWN,0,1),
(@GUID+076,@B,0,1,1,2253.53,346.854,35.1891,6.17104,0,0,0.0560442,-0.998428,@DESPAWN,0,1),
(@GUID+077,@C,0,1,1,2234.79,324.935,36.5233,3.29962,0,0,0.99688,-0.078933,@DESPAWN,0,1),
(@GUID+078,@D,0,1,1,2244.76,336.054,35.1877,4.98587,0,0,0.604116,-0.796896,@DESPAWN,0,1),
(@GUID+079,@E,0,1,1,2205.68,326.787,34.9419,5.99903,0,0,0.141602,-0.989924,@DESPAWN,0,1),
(@GUID+080,@A,0,1,1,2213.65,331.877,35.1961,1.57331,0,0,0.707996,0.706217,@DESPAWN,0,1),
(@GUID+081,@B,0,1,1,2208.33,304.79,34.3426,5.39428,0,0,0.429966,-0.902845,@DESPAWN,0,1),
(@GUID+082,@C,0,1,1,2220.88,310.768,36.7282,0.210651,0,0,0.105131,0.994458,@DESPAWN,0,1),
(@GUID+083,@D,0,1,1,2230.58,301.918,36.5037,4.42039,0,0,0.802456,-0.596711,@DESPAWN,0,1),
(@GUID+084,@E,0,1,1,2223.24,303.344,35.1879,2.28803,0,0,0.910303,0.413943,@DESPAWN,0,1),
(@GUID+085,@A,0,1,1,2229.29,278.899,35.1555,0.332388,0,0,0.16543,0.986221,@DESPAWN,0,1),
(@GUID+086,@B,530,1,1,9510.57,-6804.62,17.073,1.8242,0,0,0.79079,0.612087,@DESPAWN,0,1), -- "Falconwing Square"
(@GUID+087,@C,530,1,1,9521.05,-6860.13,21.0781,0.130877,0,0,0.0653918,0.99786,@DESPAWN,0,1),
(@GUID+088,@D,530,1,1,9551.75,-6830.38,17.6104,4.12699,0,0,0.88106,-0.473005,@DESPAWN,0,1),
(@GUID+089,@E,530,1,1,9554.75,-6830.2,16.4929,3.1688,0,0,0.999907,-0.0136057,@DESPAWN,0,1),
(@GUID+090,@A,530,1,1,9545.42,-6851,17.3644,1.13069,0,0,0.535708,0.844403,@DESPAWN,0,1),
(@GUID+091,@B,530,1,1,9543.39,-6863.25,21.0009,0.482738,0,0,0.239032,0.971012,@DESPAWN,0,1),
(@GUID+092,@C,530,1,1,9516.05,-6858.05,16.5391,4.97522,0,0,0.608352,-0.793667,@DESPAWN,0,1),
(@GUID+093,@D,530,1,1,9502.24,-6843.39,16.56,5.42682,0,0,0.415217,-0.909723,@DESPAWN,0,1),
(@GUID+094,@E,530,1,1,9484.62,-6829.57,16.6185,1.74331,0,0,0.765395,0.643561,@DESPAWN,0,1),
(@GUID+095,@A,530,1,1,9483.2,-6824.64,16.7831,5.22262,0,0,0.505777,-0.862665,@DESPAWN,0,1),
(@GUID+096,@B,530,1,1,9477.32,-6816.1,16.8213,5.45824,0,0,0.400877,-0.916132,@DESPAWN,0,1),
(@GUID+097,@C,530,1,1,9475.34,-6803.15,16.4955,6.04336,0,0,0.119626,-0.992819,@DESPAWN,0,1),
(@GUID+098,@D,530,1,1,9456.02,-6798.33,17.8346,4.60608,0,0,0.743677,-0.668539,@DESPAWN,0,1),
(@GUID+099,@E,530,1,1,9465.68,-6770.04,16.5745,3.57721,0,0,0.976373,-0.216091,@DESPAWN,0,1),
(@GUID+100,@A,530,1,1,9491.99,-6764.23,16.5058,2.80359,0,0,0.985753,0.168197,@DESPAWN,0,1),
(@GUID+101,@B,530,1,1,9516.86,-6771.11,16.4938,2.97638,0,0,0.99659,0.0825122,@DESPAWN,0,1),
(@GUID+102,@C,530,1,1,9524.29,-6814.98,16.4936,4.54718,0,0,0.76304,-0.646351,@DESPAWN,0,1),
(@GUID+103,@D,530,1,1,9543.14,-6794.87,16.4834,3.05493,0,0,0.999061,0.0433192,@DESPAWN,0,1),
(@GUID+104,@E,530,1,1,9551.25,-6807.38,16.4899,3.45155,0,0,0.988015,-0.154361,@DESPAWN,0,1),
(@GUID+105,@A,530,1,1,9555.84,-6824.24,16.4953,5.61925,0,0,0.325903,-0.945403,@DESPAWN,0,1),
(@GUID+106,@B,530,1,1,-4179.49,-12498.6,44.3612,5.3454,0,0,0.451898,-0.89207,@DESPAWN,0,1), -- "Azure Watch"
(@GUID+107,@C,530,1,1,-4193.3,-12458.3,45.7142,4.74457,0,0,0.695638,-0.718392,@DESPAWN,0,1),
(@GUID+108,@D,530,1,1,-4162.99,-12451.8,44.0466,2.34911,0,0,0.922517,0.385956,@DESPAWN,0,1),
(@GUID+109,@E,530,1,1,-4143.88,-12490,44.6714,3.43296,0,0,0.989407,-0.145167,@DESPAWN,0,1),
(@GUID+110,@A,530,1,1,-4140,-12518.8,45.7765,3.23896,0,0,0.998815,-0.0486653,@DESPAWN,0,1),
(@GUID+111,@B,530,1,1,-4141.64,-12533.2,45.3098,1.42862,0,0,0.655096,0.755546,@DESPAWN,0,1),
(@GUID+112,@C,530,1,1,-4154.66,-12537.1,45.5719,0.00704861,0,0,0.0035243,0.999994,@DESPAWN,0,1),
(@GUID+113,@D,530,1,1,-4168.66,-12542.6,45.3842,1.21656,0,0,0.571458,0.820632,@DESPAWN,0,1),
(@GUID+114,@E,530,1,1,-4183.33,-12564.4,40.1308,0.572535,0,0,0.282374,0.959304,@DESPAWN,0,1),
(@GUID+115,@A,530,1,1,-4207.6,-12559.9,40.677,0.541119,0,0,0.267271,0.963621,@DESPAWN,0,1),
(@GUID+116,@B,530,1,1,-4232.77,-12558.5,39.8764,5.32812,0,0,0.459588,-0.888132,@DESPAWN,0,1),
(@GUID+117,@C,530,1,1,-4233.57,-12534.1,45.78,0.462585,0,0,0.229236,0.973371,@DESPAWN,0,1),
(@GUID+118,@D,530,1,1,-4239.76,-12515.8,46.5776,1.43256,0,0,0.656582,0.754255,@DESPAWN,0,1),
(@GUID+119,@E,530,1,1,-4224.28,-12520.9,57.3901,5.37918,0,0,0.436767,-0.899575,@DESPAWN,0,1),
(@GUID+120,@A,530,1,1,-4219.7,-12506.3,45.4059,5.20247,0,0,0.514443,-0.857525,@DESPAWN,0,1),
(@GUID+121,@B,530,1,1,-4218.81,-12483.2,50.1845,1.57158,0,0,0.707385,0.706828,@DESPAWN,0,1),
(@GUID+122,@C,530,1,1,-4220.81,-12485,45.2711,3.44083,0,0,0.988828,-0.149061,@DESPAWN,0,1),
(@GUID+123,@D,530,1,1,-4227.3,-12471.5,45.7186,2.96173,0,0,0.995959,0.0898078,@DESPAWN,0,1),
(@GUID+124,@E,530,1,1,-4219.91,-12462.1,46.1824,4.96842,0,0,0.611046,-0.791595,@DESPAWN,0,1),
(@GUID+125,@A,530,1,1,-4215.75,-12440.2,44.6023,4.66605,0,0,0.723299,-0.690535,@DESPAWN,0,1),
(@GUID+126,@B,530,1,1,-4198.54,-12443.1,45.5096,5.7931,0,0,0.242598,-0.970127,@DESPAWN,0,1),
(@GUID+127,@C,530,1,1,-4186.59,-12437.9,43.6709,4.19482,0,0,0.864515,-0.502607,@DESPAWN,0,1),
(@GUID+128,@D,1,1,1,9834.42,996.991,1306.67,3.38578,0,0,0.992556,-0.121791,@DESPAWN,0,1), -- "Dolanaar"
(@GUID+129,@E,1,1,1,9857.8,973.055,1304.8,0.638475,0,0,0.313843,0.949475,@DESPAWN,0,1),
(@GUID+130,@A,1,1,1,9866.01,985.069,1309.35,1.02725,0,0,0.491336,0.87097,@DESPAWN,0,1),
(@GUID+131,@B,1,1,1,9871.22,987.366,1309.17,1.77338,0,0,0.774983,0.631982,@DESPAWN,0,1),
(@GUID+132,@C,1,1,1,9888.79,968.334,1309.37,5.51187,0,0,0.376167,-0.926552,@DESPAWN,0,1),
(@GUID+133,@D,1,1,1,9894.91,964.248,1310.49,5.24091,0,0,0.497866,-0.867254,@DESPAWN,0,1),
(@GUID+134,@E,1,1,1,9906.85,945.62,1313.48,0.940855,0,0,0.453267,0.891375,@DESPAWN,0,1),
(@GUID+135,@A,1,1,1,9905.5,936.252,1313.62,5.27625,0,0,0.482465,-0.875915,@DESPAWN,0,1),
(@GUID+136,@B,1,1,1,9912.13,918.466,1316.43,5.68858,0,0,0.292941,-0.956131,@DESPAWN,0,1),
(@GUID+137,@C,1,1,1,9923.98,905.402,1317.22,0.0180063,0,0,0.00900304,0.999959,@DESPAWN,0,1),
(@GUID+138,@D,1,1,1,9892.76,918.799,1307.59,2.46845,0,0,0.943892,0.330254,@DESPAWN,0,1),
(@GUID+139,@E,1,1,1,9860.8,910.839,1306.14,3.37558,0,0,0.993164,-0.116729,@DESPAWN,0,1),
(@GUID+140,@A,1,1,1,9851.2,880.204,1310.25,4.59294,0,0,0.748052,-0.66364,@DESPAWN,0,1),
(@GUID+141,@B,1,1,1,9835.31,897.141,1308.78,2.44095,0,0,0.939263,0.343199,@DESPAWN,0,1),
(@GUID+142,@C,1,1,1,9824.87,900.498,1305.55,3.75649,0,0,0.953108,-0.30263,@DESPAWN,0,1),
(@GUID+143,@D,1,1,1,9824.11,920.98,1304.55,1.81263,0,0,0.787238,0.61665,@DESPAWN,0,1),
(@GUID+144,@E,1,1,1,9809.87,935.889,1307.93,1.35318,0,0,0.626136,0.779714,@DESPAWN,0,1),
(@GUID+145,@A,1,1,1,9825.82,943.887,1306.73,1.2118,0,0,0.569504,0.821989,@DESPAWN,0,1),
(@GUID+146,@B,1,1,1,9818.16,941.709,1308.82,5.04848,0,0,0.57888,-0.815412,@DESPAWN,0,1),
(@GUID+147,@C,1,1,1,9797.18,927.063,1306.86,3.00644,0,0,0.997718,0.0675235,@DESPAWN,0,1),
(@GUID+148,@D,1,1,1,9785.09,936.851,1307.38,1.35318,0,0,0.626138,0.779713,@DESPAWN,0,1),
(@GUID+149,@E,1,1,1,9809.68,977.31,1304.27,1.82676,0,0,0.791575,0.611072,@DESPAWN,0,1),
(@GUID+150,@A,1,1,1,9784.31,964.786,1309.44,3.73921,0,0,0.955688,-0.294381,@DESPAWN,0,1),
(@GUID+151,@B,1,1,1,9837.54,978.538,1307.14,4.27721,0,0,0.843082,-0.537785,@DESPAWN,0,1),
(@GUID+152,@C,1,1,1,9778.77,964.973,1306.69,6.20301,0,0,0.0400778,-0.999197,@DESPAWN,0,1),
(@GUID+153,@D,1,1,1,9738.77,984.013,1303.77,1.04137,0,0,0.497472,0.86748,@DESPAWN,0,1),
(@GUID+154,@E,1,1,1,9726.77,970.323,1294.58,5.7459,0,0,0.265423,-0.964132,@DESPAWN,0,1),
(@GUID+155,@A,1,1,1,9698.11,952.961,1291.53,0.185278,0,0,0.0925063,0.995712,@DESPAWN,0,1),
(@GUID+156,@B,1,1,1,9700.25,889.704,1298.97,5.08616,0,0,0.563413,-0.826176,@DESPAWN,0,1),
(@GUID+157,@C,1,1,1,9738.64,884.265,1295.69,5.848,0,0,0.215879,-0.97642,@DESPAWN,0,1),
(@GUID+158,@D,1,1,1,9785.18,883.167,1298.1,4.90553,0,0,0.635633,-0.771991,@DESPAWN,0,1),
(@GUID+159,@E,1,1,1,9778.44,884.651,1297.97,3.8099,0,0,0.944688,-0.327969,@DESPAWN,0,1),
(@GUID+160,@A,1,1,1,9767.38,886.362,1298.14,4.77201,0,0,0.685717,-0.727868,@DESPAWN,0,1),
(@GUID+161,@B,1,1,1,297.2,-4657.1,16.7732,6.04909,0,0,0.11678,-0.993158,@DESPAWN,0,1), -- "Razor Hill"
(@GUID+162,@C,1,1,1,268.569,-4693.75,15.0267,5.3658,0,0,0.442777,-0.896632,@DESPAWN,0,1),
(@GUID+163,@D,1,1,1,266.882,-4717.16,15.0265,0.853685,0,0,0.413999,0.910277,@DESPAWN,0,1),
(@GUID+164,@E,1,1,1,273.893,-4729.49,13.5919,2.55407,0,0,0.957162,0.289553,@DESPAWN,0,1),
(@GUID+165,@A,1,1,1,273.773,-4777.38,11.8478,2.2085,0,0,0.893127,0.449805,@DESPAWN,0,1),
(@GUID+166,@B,1,1,1,297.468,-4797.06,10.145,5.99019,0,0,0.145974,-0.989288,@DESPAWN,0,1),
(@GUID+167,@C,1,1,1,284.923,-4810.53,11.9429,0.81442,0,0,0.396049,0.918229,@DESPAWN,0,1),
(@GUID+168,@D,1,1,1,289.461,-4840.14,10.9166,5.97841,0,0,0.151797,-0.988412,@DESPAWN,0,1),
(@GUID+169,@E,1,1,1,297.084,-4847.31,11.7787,2.48339,0,0,0.946333,0.323194,@DESPAWN,0,1),
(@GUID+170,@A,1,1,1,310.245,-4850.53,10.2372,2.31845,0,0,0.916494,0.400048,@DESPAWN,0,1),
(@GUID+171,@B,1,1,1,312.713,-4860.69,10.549,2.2517,0,0,0.902633,0.430411,@DESPAWN,0,1),
(@GUID+172,@C,1,1,1,332.089,-4843.46,12.0247,0.936158,0,0,0.451173,0.892437,@DESPAWN,0,1),
(@GUID+173,@D,1,1,1,345.731,-4852.46,10.3662,0.896889,0,0,0.433564,0.901123,@DESPAWN,0,1),
(@GUID+174,@E,1,1,1,338.115,-4858.18,10.3123,2.32239,0,0,0.917279,0.398244,@DESPAWN,0,1),
(@GUID+175,@A,1,1,1,337.55,-4834.48,9.99127,3.84999,0,0,0.937926,-0.346837,@DESPAWN,0,1),
(@GUID+176,@B,1,1,1,359.585,-4836.23,11.2313,4.3173,0,0,0.832134,-0.554575,@DESPAWN,0,1),
(@GUID+177,@C,1,1,1,341.753,-4809.21,10.2911,4.10917,0,0,0.88524,-0.465134,@DESPAWN,0,1),
(@GUID+178,@D,1,1,1,318.85,-4782.25,10.137,3.20596,0,0,0.999482,-0.032176,@DESPAWN,0,1),
(@GUID+179,@E,1,1,1,334.174,-4770.39,12.6355,4.27017,0,0,0.844969,-0.534816,@DESPAWN,0,1),
(@GUID+180,@A,1,1,1,366.98,-4754.08,11.812,4.71785,0,0,0.705173,-0.709035,@DESPAWN,0,1),
(@GUID+181,@B,1,1,1,367.509,-4719.81,13.5495,3.90497,0,0,0.928038,-0.372486,@DESPAWN,0,1),
(@GUID+182,@C,1,1,1,380.013,-4722.65,12.8458,3.27272,0,0,0.997851,-0.0655165,@DESPAWN,0,1),
(@GUID+183,@D,1,1,1,386.571,-4708.25,13.4001,3.43765,0,0,0.989064,-0.14749,@DESPAWN,0,1),
(@GUID+184,@E,1,1,1,364.009,-4699.68,14.6481,4.76497,0,0,0.688275,-0.72545,@DESPAWN,0,1),
(@GUID+185,@A,1,1,1,344.324,-4660.83,16.4647,6.01375,0,0,0.134308,-0.99094,@DESPAWN,0,1),
(@GUID+186,@B,1,1,1,316.132,-4664.03,16.0927,4.80424,0,0,0.673899,-0.738824,@DESPAWN,0,1),
(@GUID+187,@C,1,1,1,321.541,-4678.85,16.7263,0.951858,0,0,0.458164,0.888868,@DESPAWN,0,1),
(@GUID+188,@D,1,1,1,319.174,-4698.69,15.9669,2.43233,0,0,0.937775,0.347243,@DESPAWN,0,1),
(@GUID+189,@E,1,1,1,322.49,-4706.93,16.7168,3.99528,0,0,0.910278,-0.413999,@DESPAWN,0,1),
(@GUID+190,@A,1,1,1,-2318.7,-427.27,-5.00784,1.80544,0,0,0.785014,0.619479,@DESPAWN,0,1), -- "Bloodhoof Village"
(@GUID+191,@B,1,1,1,-2310.73,-453.481,28.0788,3.27413,0,0,0.997805,-0.0662205,@DESPAWN,0,1),
(@GUID+192,@C,1,1,1,-2281.93,-440.985,-7.68513,2.9207,0,0,0.993907,0.110221,@DESPAWN,0,1),
(@GUID+193,@D,1,1,1,-2282.04,-507.952,-9.42411,1.94367,0,0,0.825921,0.563786,@DESPAWN,0,1),
(@GUID+194,@E,1,1,1,-2240.59,-319.837,-9.42471,3.51842,0,0,0.982303,-0.1873,@DESPAWN,0,1),
(@GUID+195,@A,1,1,1,-2255.57,-331.142,-9.13563,0.961946,0,0,0.462642,0.886545,@DESPAWN,0,1),
(@GUID+196,@B,1,1,1,-2213.08,-373.327,-8.34503,3.49878,0,0,0.984094,-0.177647,@DESPAWN,0,1),
(@GUID+197,@C,1,1,1,-2239.43,-402.529,-9.42193,1.70022,0,0,0.751353,0.6599,@DESPAWN,0,1),
(@GUID+198,@D,1,1,1,-2245.06,-285.102,-9.42489,3.49878,0,0,0.984094,-0.177647,@DESPAWN,0,1),
(@GUID+199,@E,1,1,1,-2250.85,-256.279,-9.47737,3.22389,0,0,0.999153,-0.0411391,@DESPAWN,0,1),
(@GUID+200,@A,1,1,1,-2282.03,-257.974,-8.4252,3.20033,0,0,0.999569,-0.0293655,@DESPAWN,0,1),
(@GUID+201,@B,1,1,1,-2318.96,-265.509,-8.65507,4.93998,0,0,0.62224,-0.782827,@DESPAWN,0,1),
(@GUID+202,@C,1,1,1,-2334.42,-275.734,-8.54136,3.66764,0,0,0.965608,-0.260001,@DESPAWN,0,1),
(@GUID+203,@D,1,1,1,-2350.32,-305.64,-9.42338,4.88108,0,0,0.645024,-0.764162,@DESPAWN,0,1),
(@GUID+204,@E,1,1,1,-2384.46,-329.426,-9.56387,5.92172,0,0,0.179749,-0.983712,@DESPAWN,0,1),
(@GUID+205,@A,1,1,1,-2373.96,-317.655,-9.66495,0.235438,0,0,0.117447,0.993079,@DESPAWN,0,1),
(@GUID+206,@B,1,1,1,-2389.36,-349.159,-9.39815,1.51956,0,0,0.688762,0.724988,@DESPAWN,0,1),
(@GUID+207,@C,1,1,1,-2361.47,-364.775,-8.53755,2.54843,0,0,0.956342,0.292251,@DESPAWN,0,1),
(@GUID+208,@D,1,1,1,-2355.47,-364.996,-8.6927,0.522106,0,0,0.258098,0.966119,@DESPAWN,0,1),
(@GUID+209,@E,1,1,1,-2338.21,-367.223,-6.49505,2.64661,0,0,0.96953,0.244973,@DESPAWN,0,1),
(@GUID+210,@A,1,1,1,-2340.9,-352.75,-8.96522,2.37172,0,0,0.926822,0.3755,@DESPAWN,0,1),
(@GUID+211,@B,1,1,1,-2379.72,-322.666,2.84507,0.215802,0,0,0.107692,0.994184,@DESPAWN,0,1),
(@GUID+212,@C,1,1,1,-2361.47,-338.039,-8.82528,5.60756,0,0,0.331425,-0.943482,@DESPAWN,0,1),
(@GUID+213,@D,1,1,1,-2341.06,-317.455,-9.18516,4.56297,0,0,0.757911,-0.652358,@DESPAWN,0,1),
(@GUID+214,@E,1,1,1,-2325.19,-384.338,-8.10101,0.659543,0,0,0.323827,0.946116,@DESPAWN,0,1),
(@GUID+215,@A,1,1,1,-2296.58,-385.843,-9.01576,1.23288,0,0,0.578135,0.815941,@DESPAWN,0,1),
(@GUID+216,@B,1,1,1,-2306.12,-417.744,-8.10044,4.24096,0,0,0.852689,-0.522419,@DESPAWN,0,1),
(@GUID+217,@C,1,1,1,-2326.03,-440.102,-5.43827,4.10744,0,0,0.885641,-0.464371,@DESPAWN,0,1),
(@GUID+218,@D,1,1,1,-2330.82,-457.583,-6.74765,5.70572,0,0,0.284736,-0.958606,@DESPAWN,0,1),
(@GUID+219,@E,1,1,1,-2351.25,-495.771,-8.98241,3.82863,0,0,0.941576,-0.336801,@DESPAWN,0,1);
SET @GUID = 152261; -- Creatures
SET @EVENT = 9; -- Noblegarden

UPDATE `game_event` SET `start_time`='2011-04-24 00:02:00', `length`=11*24*60 WHERE `eventEntry`=@EVENT; -- 11 days length
DELETE FROM `game_event_creature_quest` WHERE `eventEntry`=@EVENT;

UPDATE `creature_template` SET `minlevel`=12,`maxlevel`=12 WHERE `entry` IN (32836,32837);
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75 WHERE `entry` IN (32798,32799);

DELETE FROM `game_event_creature` WHERE `eventEntry`=@EVENT;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(@EVENT, @GUID+00),(@EVENT, @GUID+01),
(@EVENT, @GUID+02),(@EVENT, @GUID+03),
(@EVENT, @GUID+04),(@EVENT, @GUID+05),
(@EVENT, @GUID+06),(@EVENT, @GUID+07),
(@EVENT, @GUID+08),(@EVENT, @GUID+09),
(@EVENT, @GUID+10),(@EVENT, @GUID+11),
(@EVENT, @GUID+12),(@EVENT, @GUID+13),
(@EVENT, @GUID+14),(@EVENT, @GUID+15);

DELETE FROM `creature` WHERE `id` IN (32798,32799,32836,32837);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+00,32798,0,1,1,0,0,2236.33,247.326,33.6595,2.84096,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+01,32798,1,1,1,0,0,323.943,-4703.51,15.8903,4.29373,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+02,32798,530,1,1,0,0,9495.4,-6841.51,16.986,0.807895,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+03,32798,1,1,1,0,0,-2336.63,-355.656,-8.74798,5.58244,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+04,32799,0,1,1,0,0,-5596.99,-506.959,401.155,2.73583,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+05,32799,1,1,1,0,0,9837.29,969.65,1308.21,0.383221,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+06,32799,0,1,1,0,0,-9453.86,44.7409,56.7139,1.45433,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+07,32799,530,1,1,0,0,-4150.79,-12492.3,44.6553,3.75029,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+08,32836,0,1,1,0,0,-5601.03,-512.86,401.492,1.56166,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+09,32836,1,1,1,0,0,9839.27,961.92,1308.29,0.271694,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+10,32836,0,1,1,0,0,-9451.26,42.2403,57.173,0.641447,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+11,32836,530,1,1,0,0,-4155.63,-12486.1,44.7758,3.96234,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+12,32837,0,1,1,0,0,2244.84,262.273,34.148,2.9156,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Merchant
(@GUID+13,32837,1,1,1,0,0,333.091,-4707.97,15.6644,4.12487,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Merchant
(@GUID+14,32837,530,1,1,0,0,9487.64,-6833.65,16.986,0.819677,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Merchant
(@GUID+15,32837,1,1,1,0,0,-2343.08,-364.618,-8.4062,5.82199,300,0,0,0,0,0,0,0,0,0); -- Noblegarden Merchant
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9118;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(9118,16,181,0, ''),
(9118,6,490,0, '');
DELETE FROM `spell_linked_spell` WHERE `spell_effect`=61719;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61716,61719,2, 'Rabbit Costume: Lay Egg periodic'),
(61734,61719,2, 'Noblegarden Bunny: Lay Egg periodic');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9118 AND `type`=6;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(9118,6,543,0, '');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_vanquished_clutches';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64981, 'spell_item_vanquished_clutches');
