import cv2
import math

cv2.namedWindow("Camera Feed") # Window to display the camera feed
point1 = None    # first point 
# callback for mouse position
def get_mouse_position(event, x, y,flags, param):        
    global point1
    if event == cv2.EVENT_LBUTTONDOWN:
        if point1 is None:
            point1 = (x, y)
            print("First point: ({}, {})".format(x, y))
        else:
            # Calculate the distance between the first and second clicked points
            point2 = (x, y)
            distance = math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)
            print("Second point: ({}, {})".format(x, y))
            print("Distance: {:.2f}".format(distance))
            # Reset the first clicked point
            point1 = None
# callback function for the window
cv2.setMouseCallback("Camera Feed", get_mouse_position)
cap = cv2.VideoCapture(0)
while True:
    # Read a frame from the camera feed
    ret, frame = cap.read()
    # Flip 
    frame = cv2.flip(frame, 1)
    cv2.imshow("Camera Feed", frame)
    # Break the loop if the 'ESC' key is pressed
    if cv2.waitKey(1) == 27:
        break
cap.release()
cv2.destroyAllWindows()
