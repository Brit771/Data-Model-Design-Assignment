# 1. Raw Data Description

This document outlines the raw data for each entity in the ride-hailing system:

Entities:

- Riders: Stores information about riders.
- Drivers: Stores static information about drivers.
- Vehicles: Stores static information about vehicles.
- Orders: Tracks ride requests placed by riders.
- Rides: Tracks the lifecycle of a ride linked to orders, drivers, and vehicles.
- Payments: Tracks payments made for rides.
- Active_Drivers: Tracks real-time driver status, vehicle assignment, and location for order matching.
- Rates: Stores ratings given by riders and drivers for completed rides.
- Drivers_Offers: Stores offers made by drivers for orders, tracking the status of each offer.
- Driver-Order Assignment: Records when a driver is assigned to an order after an offer is accepted.
- Credit_Cards: Manages the payment methods used by riders for processing payments.

## Riders 👤

- Rider ID (unique identifier)
- Full Name
- Email
- Phone Number

## Drivers 🧑🏻‍💼

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
- Rider ID
- Request Time
- Pickup Location
- Destination Location
- Order Status

## Rides 🛣️

- Ride ID (unique identifier)
- Assignment ID
- Order ID
- Rider ID
- Driver ID
- Vehicle ID
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

## Rates ⭐

- Rating ID (unique identifier)
- Ride ID
- Rider ID
- Driver ID
- Score

## Active Drivers 🟢

- Driver ID (unique identifier)
- Assigned Vehicle ID
- Availability Status (available, on_trip)
- Current Location

## Drivers Offers 🏷️

- Offer ID (unique identifier)
- Order ID
- Driver ID
- Offered at
- Offer status
- Answer Time

## Driver-Order Assignment 🔗

- Assignment ID (unique identifier)
- Offer ID
- Order ID
- Driver ID
- Assigned at

## Credit Cards 💳

- Credit Card ID (unique identifier)
- Rider ID
- Provider
- Last 4 Digits
- Expiry Date