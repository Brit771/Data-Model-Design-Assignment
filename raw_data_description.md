# 1. Raw Data Description

This document outlines the raw data for each entity in the ride-hailing system:

## Riders
- Rider ID (unique identifier)
- First Name
- Last Name
- Email
- Phone Number

## Drivers
- Driver ID (unique identifier)
- First Name
- Last Name
- Email
- Phone Number
- License Number
- Status (active, inactive)

## Vehicles
- Vehicle ID (unique identifier)
- License Plate
- Make
- Model
- Vehicle Type (sedan, SUV, etc.)

## Orders
- Order ID (unique identifier)
- Rider ID (linked to the rider placing the order)
- Order Time
- Order Status

## Rides
- Ride ID (unique identifier)
- Order ID (Linked order ID for the ride)
- Rider ID 
- Driver ID (linked to the driver assigned to the ride)
- Vehicle ID (linked to the vehicle used for the ride)
- Pickup Location
- Dropoff Location
- Start Time
- End Time
- Distance
- Ride Status (completed, canceled, In Progress)
- Total fare ???

## Payments
- Payment ID (unique identifier)
- Ride ID
- Amount
- Payment Status (paid, pending, failed)
- Payment Method (credit card, cash, etc.)
- Payment Time