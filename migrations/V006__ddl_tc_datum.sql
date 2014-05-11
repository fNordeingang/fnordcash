CREATE TABLE TC_DATUM AS
SELECT
	datum AS Date,
	extract(year FROM datum) AS Year,
	extract(month FROM datum) AS Month,
	-- Localized month name
	to_char(datum, 'TMMonth') AS MonthName,
	extract(day FROM datum) AS Day,
	extract(doy FROM datum) AS DayOfYear,
	-- Localized weekday
	to_char(datum, 'TMDay') AS WeekdayName,
	-- ISO calendar week
	extract(week FROM datum) AS CalendarWeek,
	to_char(datum, 'dd. mm. yyyy') AS FormattedDate,
	'Q' || to_char(datum, 'Q') AS Quartal,
	to_char(datum, 'yyyy/"Q"Q') AS YearQuartal,
	to_char(datum, 'yyyy/mm') AS YearMonth,
	-- ISO calendar year and week
	to_char(datum, 'iyyy/IW') AS YearCalendarWeek,
	-- Weekend
	CASE WHEN extract(isodow FROM datum) IN (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS Weekend,
	-- ISO start and end of the week of this date
	datum + (1 - extract(isodow FROM datum))::integer AS CWStart,
	datum + (7 - extract(isodow FROM datum))::integer AS CWEnd,
	-- Start and end of the month of this date
	datum + (1 - extract(day FROM datum))::integer AS MonthStart,
	(datum + (1 - extract(day FROM datum))::integer + '1 month'::interval)::date - '1 day'::interval AS MonthEnd
FROM (
	SELECT '2011-01-01'::DATE + sequence.day AS datum
	FROM generate_series(0,365 * 20 + 6) AS sequence(day)
	GROUP BY sequence.day
     ) DQ
ORDER BY 1;

ALTER TABLE tc_datum ADD CONSTRAINT pk_tc_datum PRIMARY KEY (date);

