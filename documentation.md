
# Ride-Hailing System Documentation

## Table of Contents

1. [Design Decisions and Assumptions](https://github.com/Brit771/Data-Model-Design-Assignment/blob/main/documentation.md#design-decisions-and-assumptions)
2. [Outcomes and Analysis](https://github.com/Brit771/Data-Model-Design-Assignment/blob/main/documentation.md#outcomes-and-analysis)
3. [Expansion and Future Suggestions](https://github.com/Brit771/Data-Model-Design-Assignment/blob/main/documentation.md#expansion-and-future-suggestions)

---

## Design Decisions and Assumptions

![alt text](ER_diagram.png)


### Table Structure

1. Drivers Table: Stores static information about drivers such as name, contact, and licensing details.
2. Vehicles Table: Contains information about the vehicles registered by drivers, such as vehicle type and model. Each vehicle can be linked to only one active driver.
3. Active Drivers Table: Tracks dynamic data for active drivers, including the vehicle they are using. A driver enters this table once they mark themselves as active.
4. Riders Table: Stores information about passengers who create accounts and want to be able to request rides.
5. Orders Table: Stores ride requests made by riders, which are later sent as offers to active drivers.
6. Drivers Offers Table: Stores the rides order offers that has been sent to the active drivers.
7. Rides Table: Records all rides information like  pickup location, ride status, total fare etc. The table is linked to one accepted order offer.
8. Payments Table: Stores payment information related to completed rides. Payments can only be made via credit card.
9. Credit Cards Table: Contains credit card details of users, which are used for payment processing.
10. Rates - In the end of the ride, the rider can rate the ride that can be linked to the driver eventually.

### Assumptions

- Driver Offers: Offers are only sent to active drivers.
- Vehicle Assignment: A vehicle can only be assigned to one active driver at a time.
- Payment: Customers can only pay with a credit card in a single payment upon ride completion.
- Driver Location: The driver's location is sampled and updated at regular intervals and at the end of a ride.
- Driver Selection: A prioritization algorithm selects the driver based on time of arrival, response speed, and driver rating.
- Fare Calculation: The total fare and distance are calculated when the ride ends.

### Relationships

- **Drivers ↔ Active Drivers**: A driver becomes active by being linked to an active driver entry with vehicle and location info.
- **Active Drivers ↔ Vehicles**: Each active driver is linked to a single and unique vehicle.
- **Riders ↔ Orders**: A rider can place multiple orders, but each order belongs to one rider.
- **Orders ↔ Driver Offers**: Each order can havea multiple driver offers that sent to a active drivers, but each offer is linked to one order.
- **Active Drivers ↔ Driver Offers**: Active driver can get multiple offers, and offer is uniqe for a driver.
offer can be sent Each Driver Offers sent to an active driver. 
- **Driver Offers ↔ Rides**: Driver offer leads to a ride if accepted, with one offer linked to one ride.
- **Rides ↔ Payments**: Each ride has one associated payment once completed.
- **Credit Cards ↔ Payments**: A payment is associated with a single credit card, but each credit card can be linked to multiple payments.
- **Riders ↔ Credit Cards**: A rider can have multiple credit cards, each linked to one rider.
- **Rides ↔ Rates**: After the ride, a rider can rate it, linking one rating to one ride.

---

## Outcomes and Analysis

### 1. **Demand Analysis**

- Demand analysis tracks ride demand by time and location, helping to identify peak periods and high-demand areas.

- This analysis aggregates ride data by date, hour, and pickup location to uncover patterns in demand across different times and locations.

- Business Value - Understanding peak demand allows for better resource allocation, ensuring sufficient drivers are available in high-demand areas, reducing wait times and improving service efficiency.

- Visualization: The results of this analysis can be effectively visualized through heatmaps, line charts, or bar charts, providing a clear and intuitive representation of demand trends.

For example:

![alt text](assets/image-1.png)

The heatmap above illustrates ride demand over time, with intensity indicating the volume of rides per location and hour. It highlights peak demand at specific times, such as Location A around 10 AM and Location B around 12 PM, aiding in more informed driver scheduling decisions.

---

### Expansion and Future Suggestions

- Future Orders: Allow riders to schedule future rides.
- Subscriptions: Introduce business or regular subscriptions with discounts for regular users.
- Driver Shift History: Track driver shift history, total income, commissions, and ride counts.
- Driver Rating: Implement a dynamic driver rating system influencing prioritization.
- Analytics: Add an analytics dashboard for ride demand, driver performance, and customer trends.