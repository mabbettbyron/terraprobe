-- Create version 2 of graphs strategy

CREATE OR REPLACE VIEW graphs_strategy_v2 AS
SELECT skeleton_season.id AS season_id,
    skeleton_strategytype.id AS strategytype_id,
    skeleton_criticaldate.id AS criticaldate_id,
    skeleton_strategytype.name AS strategy_name,
    skeleton_strategytype.percentage AS strategy_percentage,
    skeleton_site.farm_id as farm_id,
    skeleton_site.id as site_id,
    skeleton_reading.type_id AS reading_type_id,
    skeleton_site.name as site_name,
    skeleton_readingtype.name AS reading_type_name,
    skeleton_reading.id AS reading_id,
	skeleton_reading.date AS reading_date,
	skeleton_reading.rz1,
    skeleton_strategy.id AS strategy_id,
	skeleton_strategy.days,
	skeleton_strategy.percentage,
	skeleton_criticaldatetype.name AS critical_date_type,
	skeleton_criticaldate.date AS critical_date,
	skeleton_criticaldate.date + skeleton_strategy.days AS strategy_date
FROM
	skeleton_seasonstrategy
LEFT JOIN skeleton_season ON skeleton_seasonstrategy.season_id = skeleton_season.id
LEFT JOIN skeleton_strategytype ON skeleton_strategytype.id = skeleton_seasonstrategy.strategytype_id
LEFT JOIN skeleton_site On skeleton_seasonstrategy.site_id = skeleton_site.id
LEFT JOIN skeleton_strategy ON skeleton_strategy.type_id = skeleton_strategytype.id AND skeleton_strategy.type_id = skeleton_seasonstrategy.strategytype_id
LEFT JOIN skeleton_criticaldatetype ON skeleton_criticaldatetype.id = skeleton_strategy.critical_date_type_id
LEFT JOIN skeleton_criticaldate ON skeleton_criticaldate.site_id = skeleton_site.id AND skeleton_criticaldate.type_id = skeleton_strategy.critical_date_type_id
	AND skeleton_criticaldate.season_id = skeleton_season.id
LEFT JOIN skeleton_readingtype ON skeleton_site.upper_limit_id = skeleton_readingtype.id
--LEFT JOIN skeleton_reading ON skeleton_reading.type_id = skeleton_readingtype.id AND skeleton_reading.site_id = skeleton_site.id
LEFT JOIN skeleton_reading ON skeleton_reading.type_id = skeleton_readingtype.id AND skeleton_reading.site_id = skeleton_site.id


--WHERE skeleton_seasonstrategy.site_id = 478 and skeleton_seasonstrategy.season_id = 2
ORDER BY skeleton_season.id
