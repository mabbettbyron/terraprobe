CREATE OR REPLACE VIEW graphs_vsw AS
SELECT
    zone1.reading_id,
    zone1.date,
    zone1.id AS site_id,
    zone1.farm_id,
    zone1.product_id,
    zone1.type,
    zone1.type_id AS reading_type_id,

    zone1.rz1_bottom,
    zone1.rz1,
    zone1.rz2,
    zone1.rz3,
    zone1.probe_dwu,
    zone1.estimated_dwu,
    zone1.weekly_edwu,
    zone1.deficit,
    zone1.irrigation_litres,
    zone1.irrigation_mms,
    zone1.rain,
    zone1.meter,
    zone1.effective_rain_1,
    zone1.effective_rainfall,
    zone1.effective_irrigation,
    zone1.comment,
    zone1.rec_mon,
    zone1.rec_tue,
    zone1.rec_wed,
    zone1.rec_thu,
    zone1.rec_fri,
    zone1.rec_sat,
    zone1.rec_sun,
    zone1.reviewed,
    zone1.depth1,
    zone1.vsw1,
    zone1.count1,
    zone1.vsw1_perc,

    zone2.depth2,
    zone2.vsw2,
    zone2.count2,
    zone2.vsw2_perc,

    zone3.depth3,
    zone3.vsw3,
    zone3.count3,
    zone3.vsw3_perc,

    zone4.depth4,
    zone4.vsw4,
    zone4.count4,
    zone4.vsw4_perc,

    zone5.depth5,
    zone5.vsw5,
    zone5.count5,
    zone5.vsw5_perc,

    zone6.depth6,
    zone6.vsw6,
    zone6.count6,
    zone6.vsw6_perc,

    zone7.depth7,
    zone7.vsw7,
    zone7.count7,
    zone7.vsw7_perc,

    zone8.depth8,
    zone8.vsw8,
    zone8.count8,
    zone8.vsw8_perc,

    zone9.depth9,
    zone9.vsw9,
    zone9.count9,
    zone9.vsw9_perc,

    zone10.depth10,
    zone10.vsw10,
    zone10.count10,
    zone10.vsw10_perc
FROM
(
    SELECT
        skeleton_reading.id AS reading_id,
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_readingtype.name AS type,
        skeleton_reading.type_id,
        skeleton_site.farm_id,
        skeleton_site.product_id,
        skeleton_site.rz1_bottom,
        skeleton_reading.rz1,
        skeleton_reading.rz2,
        skeleton_reading.rz3,
        skeleton_reading.probe_dwu,
        skeleton_reading.estimated_dwu,
        ROUND(skeleton_reading.estimated_dwu * 7 * skeleton_site.rz_percentage) AS weekly_edwu,
        skeleton_reading.deficit,
        skeleton_reading.irrigation_litres,
        skeleton_reading.irrigation_mms,
        skeleton_reading.rain,
        skeleton_reading.meter,
        skeleton_reading.effective_rain_1,
        skeleton_reading.effective_rainfall,
        skeleton_reading.effective_irrigation,
        skeleton_reading.comment,
        skeleton_reading."rec_Mon" AS rec_mon,
        skeleton_reading."rec_Tue" AS rec_tue,
        skeleton_reading."rec_Wed" AS rec_wed,
        skeleton_reading."rec_Thu" AS rec_thu,
        skeleton_reading."rec_Fri" AS rec_fri,
        skeleton_reading."rec_Sat" AS rec_sat,
        skeleton_reading."rec_Sun" AS rec_sun,
        skeleton_reading.reviewed,
        skeleton_site.depth1,
        skeleton_reading.depth1 AS vsw1,
        skeleton_reading.depth1_count AS count1,
        skeleton_calibration.slope AS slope1,
        skeleton_calibration.intercept AS intercept1,
        CASE WHEN skeleton_reading.depth1_count IS NULL THEN
            skeleton_reading.depth1 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth1_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw1_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he1
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone1"
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth2,
        skeleton_reading.depth2 AS vsw2,
        skeleton_reading.depth2_count AS count2,
        skeleton_calibration.slope AS slope2,
        skeleton_calibration.intercept AS intercept2,
        CASE WHEN skeleton_reading.depth2_count IS NULL THEN
            skeleton_reading.depth2 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth2_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw2_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he2
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone2"
ON zone1.date = zone2.date AND zone1.id = zone2.id AND zone1.type_id = zone2.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth3,
        skeleton_reading.depth3 AS vsw3,
        skeleton_reading.depth3_count AS count3,
        skeleton_calibration.slope AS slope3,
        skeleton_calibration.intercept AS intercept3,
        CASE WHEN skeleton_reading.depth3_count IS NULL THEN
            skeleton_reading.depth3 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth3_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw3_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he3
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone3"
ON zone1.date = zone3.date AND zone1.id = zone3.id AND zone1.type_id = zone3.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth4,
        skeleton_reading.depth4 AS vsw4,
        skeleton_reading.depth4_count AS count4,
        skeleton_calibration.slope AS slope4,
        skeleton_calibration.intercept AS intercept4,
        CASE WHEN skeleton_reading.depth4_count IS NULL THEN
            skeleton_reading.depth4 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth4_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw4_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he4
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone4"
ON zone1.date = zone4.date AND zone1.id = zone4.id AND zone1.type_id = zone4.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth5,
        skeleton_reading.depth5 AS vsw5,
        skeleton_reading.depth5_count AS count5,
        skeleton_calibration.slope AS slope5,
        skeleton_calibration.intercept AS intercept5,
        CASE WHEN skeleton_reading.depth5_count IS NULL THEN
            skeleton_reading.depth5 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth5_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw5_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he5
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone5"
ON zone1.date = zone5.date AND zone1.id = zone5.id AND zone1.type_id = zone5.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth6,
        skeleton_reading.depth6 AS vsw6,
        skeleton_reading.depth6_count AS count6,
        skeleton_calibration.slope AS slope6,
        skeleton_calibration.intercept AS intercept6,
        CASE WHEN skeleton_reading.depth6_count IS NULL THEN
            skeleton_reading.depth6 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth6_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw6_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he6
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone6"
ON zone1.date = zone6.date AND zone1.id = zone6.id AND zone1.type_id = zone6.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth7,
        skeleton_reading.depth7 AS vsw7,
        skeleton_reading.depth7_count AS count7,
        skeleton_calibration.slope AS slope7,
        skeleton_calibration.intercept AS intercept7,
        CASE WHEN skeleton_reading.depth7_count IS NULL THEN
            skeleton_reading.depth7 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth7_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw7_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he7
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone7"
ON zone1.date = zone7.date AND zone1.id = zone7.id AND zone1.type_id = zone7.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth8,
        skeleton_reading.depth8 AS vsw8,
        skeleton_reading.depth8_count AS count8,
        skeleton_calibration.slope AS slope8,
        skeleton_calibration.intercept AS intercept8,
        CASE WHEN skeleton_reading.depth8_count IS NULL THEN
            skeleton_reading.depth8 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth8_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw8_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he8
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone8"
ON zone1.date = zone8.date AND zone1.id = zone8.id AND zone1.type_id = zone8.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth9,
        skeleton_reading.depth9 AS vsw9,
        skeleton_reading.depth9_count AS count9,
        skeleton_calibration.slope AS slope9,
        skeleton_calibration.intercept AS intercept9,
        CASE WHEN skeleton_reading.depth9_count IS NULL THEN
            skeleton_reading.depth9 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth9_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw9_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he9
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone9"
ON zone1.date = zone9.date AND zone1.id = zone9.id AND zone1.type_id = zone9.type_id
---------
LEFT JOIN
--------
(
    SELECT
        skeleton_reading.date,
        skeleton_site.id,
        skeleton_reading.type_id,
        skeleton_site.depth10,
        skeleton_reading.depth10 AS vsw10,
        skeleton_reading.depth10_count AS count10,
        skeleton_calibration.slope AS slope10,
        skeleton_calibration.intercept AS intercept10,
        CASE WHEN skeleton_reading.depth10_count IS NULL THEN
            skeleton_reading.depth10 * skeleton_calibration.slope + skeleton_calibration.intercept
        ELSE
            skeleton_reading.depth10_count * skeleton_calibration.slope + skeleton_calibration.intercept
        END AS vsw10_perc
    FROM
        skeleton_site
    LEFT JOIN skeleton_calibration ON skeleton_calibration.soil_type = skeleton_site.depth_he10
    RIGHT JOIN skeleton_reading ON skeleton_reading.site_id = skeleton_site.id AND skeleton_reading.serial_number_id = skeleton_calibration.serial_number_id
        AND skeleton_reading.date > skeleton_calibration.period_from
        AND skeleton_reading.date < COALESCE(skeleton_calibration.period_to, now() + INTERVAL '15 day')
    LEFT JOIN skeleton_readingtype ON skeleton_readingtype.id = skeleton_reading.type_id
) AS "zone10"
ON zone1.date = zone10.date AND zone1.id = zone10.id AND zone1.type_id = zone10.type_id;
