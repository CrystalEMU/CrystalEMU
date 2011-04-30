ALTER TABLE `instance_template`
DROP COLUMN `startLocX`,
DROP COLUMN `startLocY`,
DROP COLUMN `startLocZ`,
DROP COLUMN `startLocO`,
CHANGE `parent` `parent` SMALLINT(5) UNSIGNED NOT NULL;
ALTER TABLE `creature_equip_template`
CHANGE `entry` `entry` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `equipentry1` `itemEntry1` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `equipentry2` `itemEntry2` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `equipentry3` `itemEntry3` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
ADD COLUMN `newEntry` INT UNSIGNED AUTO_INCREMENT,
ADD INDEX(newEntry),
DROP PRIMARY KEY;

UPDATE `creature_template` ct, `creature_equip_template` cet
SET ct.`equipment_id` = cet.`newEntry`
WHERE ct.`equipment_id` = cet.`entry`;

UPDATE `game_event_model_equip` geme, `creature_equip_template` cet
SET geme.`equipment_id` = cet.`newEntry`
WHERE geme.`equipment_id` = cet.`entry`;

UPDATE `creature` c, `creature_equip_template` cet
SET c.`equipment_id` = cet.`newEntry`
WHERE c.`equipment_id` = cet.`entry`;

UPDATE `creature_equip_template` SET `entry` = `newEntry`;

ALTER TABLE `creature_equip_template`
ADD PRIMARY KEY(`entry`),
DROP COLUMN `newEntry`;CREATE TABLE `temp_auras` (
  `spell` MEDIUMINT(8) UNSIGNED NOT NULL
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DELIMITER %%

CREATE FUNCTION `ConvertAuras`(`auras` VARCHAR(1024))
RETURNS VARCHAR(1024) CHARSET utf8
DETERMINISTIC
BEGIN
  DECLARE tmp VARCHAR(1024);
  DECLARE curr VARCHAR(10);
  DECLARE k INT;
  DECLARE pos INT;
  DECLARE startp INT;

  SET @k = 0;
  SET @tmp = '';
  SET @startp = 1;
  SET @pos = LOCATE(' ', auras);

  DELETE FROM temp_auras;

  WHILE @pos > 0 DO
    IF @k = 0 THEN
      SET @curr = SUBSTR(auras, @startp, @pos - @startp);

      IF NOT EXISTS(SELECT spell FROM temp_auras WHERE spell = @curr) THEN
        SET @tmp = CONCAT(@tmp, @curr, ' ');
        INSERT INTO temp_auras VALUES(@curr);
      END IF;
    END IF;

    SET @k = 1-@k;
    SET @startp = @pos+1;
    SET @pos = LOCATE(' ', auras, @startp);
  END WHILE;

  SET @tmp = RTRIM(@tmp);
  RETURN @tmp;
END%%

DELIMITER ;

UPDATE `creature_addon` SET `auras` = REPLACE(`auras`, '  ', ' ');
UPDATE `creature_addon` SET `auras` = TRIM(`auras`);
UPDATE `creature_addon` SET `auras` = NULL WHERE `auras` = '';
UPDATE `creature_addon` SET `auras` = ConvertAuras(`auras`) WHERE `auras` IS NOT NULL;

DROP FUNCTION `ConvertAuras`;
DROP TABLE `temp_auras`;CREATE TABLE `temp_auras` (
  `spell` MEDIUMINT(8) UNSIGNED NOT NULL
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DELIMITER %%

CREATE FUNCTION `ConvertAuras`(`auras` VARCHAR(1024))
RETURNS VARCHAR(1024) CHARSET utf8
DETERMINISTIC
BEGIN
  DECLARE tmp VARCHAR(1024);
  DECLARE curr VARCHAR(10);
  DECLARE k INT;
  DECLARE pos INT;
  DECLARE startp INT;

  SET @k = 0;
  SET @tmp = '';
  SET @startp = 1;
  SET @pos = LOCATE(' ', auras);

  DELETE FROM temp_auras;

  WHILE @pos > 0 DO
    IF @k = 0 THEN
      SET @curr = SUBSTR(auras, @startp, @pos - @startp);

      IF NOT EXISTS(SELECT spell FROM temp_auras WHERE spell = @curr) THEN
        SET @tmp = CONCAT(@tmp, @curr, ' ');
        INSERT INTO temp_auras VALUES(@curr);
      END IF;
    END IF;

    SET @k = 1-@k;
    SET @startp = @pos+1;
    SET @pos = LOCATE(' ', auras, @startp);
  END WHILE;

  SET @tmp = RTRIM(@tmp);
  RETURN @tmp;
END%%

DELIMITER ;

UPDATE `creature_template_addon` SET `auras` = REPLACE(`auras`, '  ', ' ');
UPDATE `creature_template_addon` SET `auras` = TRIM(`auras`);
UPDATE `creature_template_addon` SET `auras` = NULL WHERE `auras` = '';
UPDATE `creature_template_addon` SET `auras` = ConvertAuras(`auras`) WHERE `auras` IS NOT NULL;

DROP FUNCTION `ConvertAuras`;
DROP TABLE `temp_auras`;-- Nefarian T2 Head
SET @REF:= 34348; -- (found by StoredProc)

-- Delete all so we can also renumber the itemids on refs for old loot
DELETE FROM `creature_loot_template` WHERE `entry`=11583; 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(11583,19002,100,1,0,1,1),
(11583,19003,100,1,0,1,1),
(11583,21138,-100,1,0,1,1),
(11583,21142,-100,1,0,1,1),
(11583,1,100,1,1,-34002,2),
(11583,2,100,1,1,-34003,2),
(11583,3,100,1,1,-34009,2),
(11583,4,100,1,1,-34010,2),
(11583,5,100,1,1,-@REF,2);

DELETE FROM `reference_loot_template` WHERE `entry`=@REF;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@REF,16929,0,1,1,1,1), -- Nemesis Skullcap (Warlock)
(@REF,16914,0,1,1,1,1), -- Netherwind Crown (Mage)
(@REF,16963,0,1,1,1,1), -- Helm of Wrath (Warrior)
(@REF,16908,0,1,1,1,1), -- Bloodfang Hood (Rogue)
(@REF,16955,0,1,1,1,1), -- Judgement Crown (Paladin)
(@REF,16900,0,1,1,1,1), -- Stormrage Cover (Druid)
(@REF,16939,0,1,1,1,1), -- Dragonstalker's Helm (Hunter)
(@REF,16921,0,1,1,1,1), -- Halo of Transcendence (Priest)
(@REF,16947,0,1,1,1,1); -- Helmet of Ten Storms (Shaman)
UPDATE `achievement_criteria_data` SET `ScriptName`='achievement_has_orphan_out' WHERE `ScriptName`='achievement_school_of_hard_knocks';
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (6641,6642,6643,6644,6651,6652,6653,6654,6655,6656,6657,6659,10391,12398);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(6641,16,201,0,''), -- School of Hard Knocks
(6642,16,201,0,''), -- School of Hard Knocks
(6643,16,201,0,''), -- School of Hard Knocks
(6644,16,201,0,''), -- School of Hard Knocks
(6651,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6651,16,201,0,''), -- Bad Example
(6652,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6652,16,201,0,''), -- Bad Example
(6653,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6653,16,201,0,''), -- Bad Example
(6654,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6654,16,201,0,''), -- Bad Example
(6655,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6655,16,201,0,''), -- Bad Example
(6656,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6656,16,201,0,''), -- Bad Example
(6657,11,0,0, 'achievement_has_orphan_out'), -- Bad Example
(6657,16,201,0,''), -- Bad Example
(6659,11,0,0, 'achievement_has_orphan_out'), -- Hail To The King, Baby
(6659,16,201,0,''), -- Hail To The King, Baby
(10391,11,0,0, 'achievement_has_orphan_out'), -- Home Alone
(10391,16,201,0,''), -- Home Alone
(12398,11,0,0, 'achievement_has_orphan_out'), -- Daily Chores
(12398,16,201,0,''); -- Daily Chores

DELETE FROM `disables` WHERE `entry` IN (6641,6642,6643,6644,6651,6652,6653,6654,6655,6656,6657,6659,10391,12398) AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (6641,6642,6643,6644,6651,6652,6653,6654,6655,6656,6657,6659,10391,12398) AND `type`!=16;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(6641,5,58818,0,''), -- School of Hard Knocks
(6642,5,58818,0,''), -- School of Hard Knocks
(6643,5,58818,0,''), -- School of Hard Knocks
(6644,5,58818,0,''), -- School of Hard Knocks
(6651,5,58818,0,''), -- Bad Example
(6652,5,58818,0,''), -- Bad Example
(6653,5,58818,0,''), -- Bad Example
(6654,5,58818,0,''), -- Bad Example
(6655,5,58818,0,''), -- Bad Example
(6656,5,58818,0,''), -- Bad Example
(6657,5,58818,0,''), -- Bad Example
(6659,5,58818,0,''), -- Hail To The King, Baby
(10391,5,58818,0,''), -- Home Alone
(12398,5,58818,0,''); -- Daily Chores

UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286,`faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|768,`dynamicflags`=0,`npcflag`=`npcflag`|3,`baseattacktime`=2000,`scale`=1 WHERE `entry` IN (14305,14444,22817,22818,33532,33533);

DELETE FROM `creature_template_addon` WHERE `entry` IN (14305,14444,22817,22818,33532,33533);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(14305,0,0,0,1,0,'58818'),
(14444,0,0,0,1,0,'58818'),
(22817,0,0,0,1,0,'58818'),
(22818,0,0,0,1,0,'58818'),
(33532,0,0,0,1,0,'58818'),
(33533,0,0,0,1,0,'58818');
UPDATE `conditions` SET `ConditionValue2`=27827,`Comment`='Dispelling Illusions: Crate Dummy target' WHERE `SourceEntry`=49590;
DELETE FROM `creature` WHERE `id`=30996;
UPDATE `creature` SET `modelId`=0,`spawndist`=0,`MovementType`=0 WHERE `id` IN (27827,28960);
UPDATE `creature_template` SET `modelid1`=22712,`modelid2`=17200,`flags_extra`=`flags_extra`|128 WHERE `entry`=27827; -- reverse models (parsers fault)
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=28960; -- reverse models (parsers fault)

DELETE FROM `creature_text` WHERE `entry`=27915;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(27915,0,0, 'Good work with the crates! Come talk to me in front of Stratholme for your next assignment!',4,0,0,0,0,0, 'Chromie - SAY_EVENT_START');
UPDATE `creature_template` SET `ScriptName`='npc_create_helper_cot' WHERE `entry`=27827;
UPDATE `command` SET `name`='revive' WHERE(`name`='rezz');
UPDATE `command` SET `name`='modify' WHERE(`name`='cheat');
UPDATE `command` SET `name`='modify hp' WHERE(`name`='cheat life');
UPDATE `command` SET `name`='modify mana' WHERE(`name`='cheat mana');
UPDATE `command` SET `name`='modify rage' WHERE(`name`='cheat rage');
UPDATE `command` SET `name`='modify runicpower' WHERE(`name`='cheat runicpower');
UPDATE `command` SET `name`='modify energy' WHERE(`name`='cheat energy');
UPDATE `command` SET `name`='modify money' WHERE(`name`='cheat gold');
UPDATE `command` SET `name`='modify speed' WHERE(`name`='cheat speed');
UPDATE `command` SET `name`='modify swim' WHERE(`name`='cheat swim');
UPDATE `command` SET `name`='modify scale' WHERE(`name`='cheat scale');
UPDATE `command` SET `name`='modify bit' WHERE(`name`='cheat bit');
UPDATE `command` SET `name`='modify bwalk' WHERE(`name`='cheat bwalk');
UPDATE `command` SET `name`='modify fly' WHERE(`name`='cheat fly');
UPDATE `command` SET `name`='modify aspeed' WHERE(`name`='cheat aspeed');
UPDATE `command` SET `name`='modify faction' WHERE(`name`='cheat faction');
UPDATE `command` SET `name`='modify spell' WHERE(`name`='cheat spell');
UPDATE `command` SET `name`='modify talents' WHERE(`name`='cheat tp');
UPDATE `command` SET `name`='modify mount' WHERE(`name`='cheat mount');
UPDATE `command` SET `name`='modify honor' WHERE(`name`='cheat honor');
UPDATE `command` SET `name`='modify rep' WHERE(`name`='cheat reputation');
UPDATE `command` SET `name`='modify arena' WHERE(`name`='cheat arena');
UPDATE `command` SET `name`='modify drunk' WHERE(`name`='cheat drunken');
UPDATE `command` SET `name`='modify standstate' WHERE(`name`='cheat standstate');
UPDATE `command` SET `name`='modify morph' WHERE(`name`='cheat morph');
UPDATE `command` SET `name`='modify phase' WHERE(`name`='cheat phase');
UPDATE `command` SET `name`='modify gender' WHERE(`name`='cheat gender');
UPDATE `command` SET `name`='die' WHERE(`name`='kill');