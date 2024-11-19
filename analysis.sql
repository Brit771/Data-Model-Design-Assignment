
-- Ride Demand Query

SELECT 
    DATE(StartTime) AS RideDate,
    HOUR(StartTime) AS RideHour,
    PickupLocation,
    COUNT(*) AS TotalRides
FROM Rides
WHERE RideStatus = 'Completed'
GROUP BY RideDate, RideHour, PickupLocation
ORDER BY RideDate ASC, RideHour ASC, TotalRides DESC;

-- Explanation:

-- Aggregates completed rides by date, hour, and pickup location.
-- Counts rides for each location-time combination.
-- Sorts results chronologically, with busiest times/locations prioritized.