import cv2
import numpy as np

# Function to calculate distance between two points
def calculate_distance(point1, point2):
    return np.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

# Variables to store the current and target coordinates
current_coordinates = None
target_coordinates = (200, 200)  # Change these coordinates as needed

# Known reference object width in pixels and its real-world width in meters
ref_object_width_px = 100  # Change this to the actual width of your reference object in pixels
ref_object_width_meters = 1.0  # Change this to the actual width of your reference object in meters

# Mouse click event handler
def mouse_click(event, x, y, flags, param):
    global current_coordinates
    if event == cv2.EVENT_LBUTTONDOWN:
        current_coordinates = (x, y)

# Function to convert coordinates to Google Maps format
def to_google_maps_format(coordinates):
    latitude = coordinates[1]
    longitude = coordinates[0]
    return f"Latitude: {latitude}, Longitude: {longitude}"

# Initialize video capture from the camera (0 is typically the default camera)
cap = cv2.VideoCapture(0)

# Create a window and set the mouse click event handler
cv2.namedWindow('Video Feed')
cv2.setMouseCallback('Video Feed', mouse_click)

while True:
    ret, frame = cap.read()

    # Draw the current and target coordinates as red dots
    if current_coordinates is not None:
        cv2.circle(frame, current_coordinates, 5, (0, 0, 255), -1)
    cv2.circle(frame, target_coordinates, 5, (0, 0, 255), -1)

    # Calculate the distance and display the coordinates in Google Maps format
    if current_coordinates is not None:
        distance = calculate_distance(current_coordinates, target_coordinates)
        # Convert distance to real-world units (meters)
        distance_in_meters = (distance / ref_object_width_px) * ref_object_width_meters
        google_maps_coordinates = to_google_maps_format(current_coordinates)
        cv2.putText(frame, f"Distance: {distance_in_meters:.2f} meters", (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
        cv2.putText(frame, google_maps_coordinates, (10, 70), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

    # Display the frame
    cv2.imshow('Video Feed', frame)

    if cv2.waitKey(1) & 0xFF == 27:  # Press 'Esc' to exit
        break

cap.release()
cv2.destroyAllWindows()