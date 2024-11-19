# 1. Raw Data Description

This document outlines the raw data for each entity in the ride-hailing system:

Entities and Relationships:

- Riders: Stores information about riders.
- Drivers: Stores static information about drivers.
- Vehicles: Stores static information about vehicles.
- Orders: Tracks ride requests placed by riders.
- Rides: Tracks the lifecycle of a ride linked to orders, drivers, and vehicles.
- Payments: Tracks payments made for rides.
- Active_Drivers: Tracks real-time driver status, vehicle assignment, and location for order matching.

## Riders 👤
- Rider ID (unique identifier)
- Full Name
- Email
- Phone Number

## Drivers 🧑‍✈️
- Driver ID (unique identifier)
- Full Name
- Email
- Phone Number
- License Number

## Vehicles 🚗
- Vehicle ID (unique identifier)
- License Plate
- Make
- Model
- Vehicle Type (sedan, SUV, etc.)

## Orders 📄
- Order ID (unique identifier)
- Rider ID (linked to the rider placing the order)
- Request Time
- Pickup Location
- Destination Location
- Order Status

## Rides 🛣️
- Ride ID (unique identifier)
- Order ID (Linked order ID for the ride)
- Rider ID
- Driver ID (linked to the driver assigned to the ride)
- Vehicle ID (linked to the vehicle used for the ride)
- Actual Pickup Location
- Dropoff Location
- Start Time
- End Time
- Distance
- Ride Status (completed, canceled, In Progress)
- Total Fare

## Payments 💸
- Payment ID (unique identifier)
- Ride ID
- Amount
- Payment Status (paid, pending, failed)
- Payment Method (credit card, cash, etc.)
- Payment Time

## Active Drivers 🟢
- Driver ID (unique identifier)
- Assigned Vehicle ID
- Availability Status (available, on_trip)
- Current Location