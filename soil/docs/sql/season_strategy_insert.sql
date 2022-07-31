-- For change to have site strategy's per season
INSERT INTO skeleton_seasonstrategy (
SELECT
    nextval('skeleton_seasonstrategy_id_seq') as id,
    CURRENT_TIMESTAMP as created_date,
	1 as created_by_id,
    skeleton_season.id as season_id,
	skeleton_site.id as site_id,
	CASE WHEN skeleton_site.strategy_id IS NULL THEN 1 ELSE skeleton_site.strategy_id END as strategytype_id
FROM skeleton_site, skeleton_season
);
COMMIT;
