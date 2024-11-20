import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Sample DataFrame with a broader range of time slots and locations
data = {
    'RideHour': [8, 9, 10, 11, 12, 8, 9, 10, 11, 12],
    'PickupLocation': ['Location A', 'Location A', 'Location A', 'Location A', 'Location A', 
                       'Location B', 'Location B', 'Location B', 'Location B', 'Location B'],
    'TotalRides': [50, 65, 70, 60, 55, 30, 45, 40, 35, 50]
}

df = pd.DataFrame(data)

# Pivot the DataFrame to create a matrix suitable for a heatmap
pivot_df = df.pivot_table(
    index='RideHour', 
    columns='PickupLocation', 
    values='TotalRides', 
    aggfunc='sum', 
    fill_value=0
)

# Plot the heatmap
plt.figure(figsize=(10, 6))
sns.heatmap(
    pivot_df,
    cmap='YlGnBu',  
    annot=True,       # Annotate cells with the number of rides
    fmt='d',          # Format annotations as integers
    linewidths=0.5,   # Cell borders
    cbar_kws={'label': 'Total Rides'}  # Color bar label
)

# Customize the plot
plt.title('Ride Demand Heatmap by Hour and Location', fontsize=16)
plt.xlabel('Pickup Location', fontsize=12)
plt.ylabel('Hour of Day', fontsize=12)
plt.tight_layout()

# Show the plot
plt.show()