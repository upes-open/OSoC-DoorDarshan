# distance betweeen two locations using geocoding 
# from distance2 import *
from geopy.geocoders import Nominatim
from geopy import distance
geocoder =Nominatim(user_agent="i know python")
location1="dehradun"
location2="rishikesh"

#coordinates 
coordinate1=geocoder.geocode(location1)
coordinate2=geocoder.geocode(location2)

#latitude , longitude 
lat1,long1=(coordinate1.latitude),(coordinate1.longitude)
lat2,long2=(coordinate2.latitude),(coordinate2.longitude)

#distance calculation
place1=(lat1,long1)
place2=(lat2,long2)
print(distance.distance(place1,place2))