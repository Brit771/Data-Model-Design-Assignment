
-- Ride Demand by hour Query

SELECT 
    HOUR(StartTime) AS RideHour,
    COALESCE(PickupLocation, 'Unknown') AS PickupLocation,
    COUNT(DISTINCT RideID) AS TotalRides
FROM Rides
WHERE RideStatus = 'Completed' AND StartTime IS NOT NULL
GROUP BY RideHour, PickupLocation
ORDER BY RideHour ASC, TotalRides DESC;

-- Explanation:

-- Aggregates completed rides by hour, and pickup location.
-- Counts rides for each location-time combination.
-- Sorts results chronologically, with busiest times/locations prioritized.