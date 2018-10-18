SELECT a.census_geo_code
 , a.total_population
 , a.male_population
 , a.female_population
 , b.total_median_income
 , b.male_median_income
 , b.female_median_income
 , c.total_average_income
 , c.male_average_income
 , c.female_average_income
 , d.total_income_10k_20k
 , d.male_income_10k_20k
 , d.female_income_10k_20k
 , e.total_income_20k_30k
 , e.male_income_20k_30k
 , e.female_income_20k_30k
 , f.total_income_30k_40k
 , f.male_income_30k_40k
 , f.female_income_30k_40k
 , g.total_income_40k_50k
 , g.male_income_40k_50k
 , g.female_income_40k_50k
 , h.total_income_50k_60k
 , h.male_income_50k_60k
 , h.female_income_50k_60k
 , i.total_income_60k_70k
 , i.male_income_60k_70k
 , i.female_income_60k_70k
 , j.total_income_70k_80k
 , j.male_income_70k_80k
 , j.female_income_70k_80k
 , k.total_income_80k_90k
 , k.male_income_80k_90k
 , k.female_income_80k_90k
 , l.total_income_90k_100k
 , l.male_income_90k_100k
 , l.female_income_90k_100k
 , m.total_income_100k_150k
 , m.male_income_100k_150k
 , m.female_income_100k_150k
 , n.total_income_150k_over
 , n.male_income_150k_over
 , n.female_income_150k_over
 , o.total_unemployment_rate
 , o.male_unemployment_rate
 , o.female_unemployment_rate
 , p.total_people_15_19
 , p.male_people_15_19
 , p.female_people_15_19
 , q.total_people_20_24
 , q.male_people_20_24
 , q.female_people_20_24
 , r.total_people_25_29
 , r.male_people_25_29
 , r.female_people_25_29
 , s.total_people_30_34
 , s.male_people_30_34
 , s.female_people_30_34
 , t.total_people_35_39
 , t.male_people_35_39
 , t.female_people_35_39
 , u.total_people_40_44
 , u.male_people_40_44
 , u.female_people_40_44
 , v.total_people_45_49
 , v.male_people_45_49
 , v.female_people_45_49
 , w.total_people_50_54
 , w.male_people_50_54
 , w.female_people_50_54
 , x.total_people_55_59
 , x.male_people_55_59
 , x.female_people_55_59
 , y.total_people_60_64
 , y.male_people_60_64
 , y.female_people_60_64
 , z.total_people_65_over
 , z.male_people_65_over
 , z.female_people_65_over
 , za.total_education_none
 , za.male_education_none
 , za.female_education_none
 , zb.total_education_secondary
 , zb.male_education_secondary
 , zb.female_education_secondary
 , zc.total_education_postsecondary
 , zc.male_education_postsecondary
 , zc.female_education_postsecondary
 , zd.total_occupation_agriculture
 , zd.male_occupation_agriculture
 , zd.female_occupation_agriculture
 , ze.total_occupation_mining
 , ze.male_occupation_mining
 , ze.female_occupation_mining
 , zf.total_occupation_utilities
 , zf.male_occupation_utilities
 , zf.female_occupation_utilities
 , zg.total_occupation_construction
 , zg.male_occupation_construction
 , zg.female_occupation_construction
 , zh.total_occupation_manufacturing
 , zh.male_occupation_manufacturing
 , zh.female_occupation_manufacturing
 , zi.total_occupation_wholesale_trade
 , zi.male_occupation_wholesale_trade
 , zi.female_occupation_wholesale_trade
 , zj.total_occupation_retail_trade
 , zj.male_occupation_retail_trade
 , zj.female_occupation_retail_trade
 , zk.total_occupation_transportation
 , zk.male_occupation_transportation
 , zk.female_occupation_transportation
 , zl.total_occupation_information_cultural
 , zl.male_occupation_information_cultural
 , zl.female_occupation_information_cultural
 , zm.total_occupation_finance
 , zm.male_occupation_finance
 , zm.female_occupation_finance
 , zn.total_occupation_real_estate
 , zn.male_occupation_real_estate
 , zn.female_occupation_real_estate
 , zo.total_occupation_professional
 , zo.male_occupation_professional
 , zo.female_occupation_professional
 , zp.total_occupation_management
 , zp.male_occupation_management
 , zp.female_occupation_management
 , zq.total_occupation_administrative
 , zq.male_occupation_administrative
 , zq.female_occupation_administrative
 , zr.total_occupation_education
 , zr.male_occupation_education
 , zr.female_occupation_education
 , zs.total_occupation_healthcare
 , zs.male_occupation_healthcare
 , zs.female_occupation_healthcare
 , zt.total_occupation_arts
 , zt.male_occupation_arts
 , zt.female_occupation_arts
 , zu.total_occupation_accommodation
 , zu.male_occupation_accommodation
 , zu.female_occupation_accommodation
 , zv.total_occupation_other
 , zv.male_occupation_other
 , zv.female_occupation_other
 , zw.total_occupation_public_admin
 , zw.male_occupation_public_admin
 , zw.female_occupation_public_admin
FROM (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_population,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_population,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_population
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 8)
  GROUP BY 1
) AS a

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_median_income,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_median_income,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_median_income
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 663)
  GROUP BY 1
) AS b ON a.census_geo_code = b.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_average_income,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_average_income,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_average_income
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 674)
  GROUP BY 1
) AS c ON a.census_geo_code = c.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_10k_20k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_10k_20k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_10k_20k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 696)
  GROUP BY 1
) AS d ON a.census_geo_code = d.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_20k_30k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_20k_30k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_20k_30k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 697)
  GROUP BY 1
) AS e ON a.census_geo_code = e.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_30k_40k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_30k_40k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_30k_40k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 698)
  GROUP BY 1
) AS f ON a.census_geo_code = f.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_40k_50k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_40k_50k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_40k_50k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 699)
  GROUP BY 1
) AS g ON a.census_geo_code = g.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_50k_60k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_50k_60k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_50k_60k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 700)
  GROUP BY 1
) AS h ON a.census_geo_code = h.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_60k_70k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_60k_70k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_60k_70k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 701)
  GROUP BY 1
) AS i ON a.census_geo_code = i.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_70k_80k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_70k_80k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_70k_80k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 702)
  GROUP BY 1
) AS j ON a.census_geo_code = j.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_80k_90k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_80k_90k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_80k_90k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 703)
  GROUP BY 1
) AS k ON a.census_geo_code = k.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_90k_100k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_90k_100k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_90k_100k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 704)
  GROUP BY 1
) AS l ON a.census_geo_code = l.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_100k_150k,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_100k_150k,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_100k_150k
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 706)
  GROUP BY 1
) AS m ON a.census_geo_code = m.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_income_150k_over,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_income_150k_over,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_income_150k_over
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 707)
  GROUP BY 1
) AS n ON a.census_geo_code = n.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_unemployment_rate,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_unemployment_rate,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_unemployment_rate
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1872)
  GROUP BY 1
) AS o ON a.census_geo_code = o.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_15_19,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_15_19,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_15_19
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 14)
  GROUP BY 1
) AS p ON a.census_geo_code = p.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_20_24,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_20_24,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_20_24
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 15)
  GROUP BY 1
) AS q ON a.census_geo_code = q.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_25_29,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_25_29,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_25_29
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 16)
  GROUP BY 1
) AS r ON a.census_geo_code = r.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_30_34,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_30_34,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_30_34
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 17)
  GROUP BY 1
) AS s ON a.census_geo_code = s.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_35_39,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_35_39,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_35_39
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 18)
  GROUP BY 1
) AS t ON a.census_geo_code = t.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_40_44,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_40_44,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_40_44
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 19)
  GROUP BY 1
) AS u ON a.census_geo_code = u.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_45_49,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_45_49,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_45_49
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 20)
  GROUP BY 1
) AS v ON a.census_geo_code = v.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_50_54,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_50_54,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_50_54
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 21)
  GROUP BY 1
) AS w ON a.census_geo_code = w.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_55_59,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_55_59,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_55_59
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 22)
  GROUP BY 1
) AS x ON a.census_geo_code = x.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_60_64,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_60_64,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_60_64
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 23)
  GROUP BY 1
) AS y ON a.census_geo_code = y.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_people_65_over,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_people_65_over,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_people_65_over
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 24)
  GROUP BY 1
) AS z ON a.census_geo_code = z.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_education_none,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_education_none,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_education_none
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1699)
  GROUP BY 1
) AS za ON a.census_geo_code = za.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_education_secondary,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_education_secondary,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_education_secondary
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1700)
  GROUP BY 1
) AS zb ON a.census_geo_code = zb.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_education_postsecondary,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_education_postsecondary,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_education_postsecondary
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1701)
  GROUP BY 1
) AS zc ON a.census_geo_code = zc.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_agriculture,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_agriculture,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_agriculture
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1900)
  GROUP BY 1
) AS zd ON a.census_geo_code = zd.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_mining,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_mining,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_mining
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1901)
  GROUP BY 1
) AS ze ON a.census_geo_code = ze.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_utilities,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_utilities,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_utilities
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1902)
  GROUP BY 1
) AS zf ON a.census_geo_code = zf.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_construction,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_construction,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_construction
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1903)
  GROUP BY 1
) AS zg ON a.census_geo_code = zg.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_manufacturing,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_manufacturing,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_manufacturing
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1904)
  GROUP BY 1
) AS zh ON a.census_geo_code = zh.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_wholesale_trade,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_wholesale_trade,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_wholesale_trade
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1905)
  GROUP BY 1
) AS zi ON a.census_geo_code = zi.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_retail_trade,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_retail_trade,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_retail_trade
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1906)
  GROUP BY 1
) AS zj ON a.census_geo_code = zj.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_transportation,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_transportation,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_transportation
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1907)
  GROUP BY 1
) AS zk ON a.census_geo_code = zk.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_information_cultural,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_information_cultural,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_information_cultural
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1908)
  GROUP BY 1
) AS zl ON a.census_geo_code = zl.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_finance,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_finance,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_finance
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1909)
  GROUP BY 1
) AS zm ON a.census_geo_code = zm.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_real_estate,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_real_estate,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_real_estate
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1910)
  GROUP BY 1
) AS zn ON a.census_geo_code = zn.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_professional,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_professional,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_professional
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1911)
  GROUP BY 1
) AS zo ON a.census_geo_code = zo.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_management,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_management,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_management
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1912)
  GROUP BY 1
) AS zp ON a.census_geo_code = zp.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_administrative,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_administrative,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_administrative
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1913)
  GROUP BY 1
) AS zq ON a.census_geo_code = zq.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_education,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_education,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_education
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1914)
  GROUP BY 1
) AS zr ON a.census_geo_code = zr.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_healthcare,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_healthcare,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_healthcare
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1915)
  GROUP BY 1
) AS zs ON a.census_geo_code = zs.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_arts,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_arts,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_arts
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1916)
  GROUP BY 1
) AS zt ON a.census_geo_code = zt.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_accommodation,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_accommodation,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_accommodation
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1917)
  GROUP BY 1
) AS zu ON a.census_geo_code = zu.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_other,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_other,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_other
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1918)
  GROUP BY 1
) AS zv ON a.census_geo_code = zv.census_geo_code

LEFT JOIN (
  SELECT 
  	census.GEO_CODE  AS census_geo_code,
  	COALESCE(SUM(census.DIM_SEX_TOTAL ), 0) AS total_occupation_public_admin,
  	COALESCE(SUM(census.DIM_SEX_MALE ), 0) AS male_occupation_public_admin,
  	COALESCE(SUM(census.DIM_SEX_FEMALE ), 0) AS female_occupation_public_admin
  FROM `canadian-census-data.looker_scratch.LR_ZF5T8YUWSUQMVK6VA3HVC_census` AS census
  
  WHERE 
  	(CAST(census.MEMBER_ID_PROFILE_FSA AS int64)  = 1919)
  GROUP BY 1
) AS zw ON a.census_geo_code = zw.census_geo_code

ORDER BY a.census_geo_code