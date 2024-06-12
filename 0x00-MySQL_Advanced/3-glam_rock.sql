-- Create a temporary table to store the computed lifespan
CREATE TEMPORARY TABLE temp_lifespan AS
SELECT band_name, 
    YEAR(SUBSTRING_INDEX(lifespan, '-', 1)) AS formed,
    CASE WHEN lifespan LIKE '%present%' THEN 2022 - YEAR(SUBSTRING_INDEX(lifespan, '-', 1))
         ELSE YEAR(SUBSTRING_INDEX(lifespan, '-', -1)) - YEAR(SUBSTRING_INDEX(lifespan, '-', 1))
    END AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%';

-- List bands with Glam rock as their main style, ranked by their longevity
SELECT band_name, lifespan
FROM temp_lifespan
ORDER BY lifespan DESC;