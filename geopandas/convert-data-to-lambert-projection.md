# Convert Lat/Lon Coordinates to Lambert Azimuthal Equal Area Projection

In order to perform machine learning on a geographical data set spanning more
than about 100* miles North to South, you should either convert your data
points to an equal are projection, or use the haverine distance formula for
measuring distance between points.

\* Note: 100 miles is a TOTALLY made up number here.

Load data from some CSV with a latitude and longitude column,

```python
import geopandas
import matplotlib.pyplot as plt
import pandas
import pyproj

df = pandas.read_csv('krige_input.csv')
```

Create a Lambert azimuthal equal area projection based on the median of your
data,

```python
lon, lat = df.Longitude.median(), df.Latitude.median()
lambert = pyproj.crs.coordinate_operation.LambertAzumuthalEqualAreaConversion(
    latitude_natural_origin=lat,
    longitude_natural_origin=lon,
    false_easting=0.0,
    false_northing=0.0,
)
```

Create a GeoDataFrame from your initial DataFrame, and set the CRS,

```python
gdf = geopandas.GeoDataFrame(df, geometry=geopandas.points_from_xy(df.Longitude, df.Latitude))
gdf = gdf.set_crs('EPSG:4326')
```

Then perform the Lambert projection,

```python
gdf = gdf.to_crs(p.to_proj4())
```

Check your results,

```python
fig, ax = plt.subplots()
ax.grid()
ax.set_aspect(1)
plt.scatter(gdf.geometry.x, gdf.geometry.y)
```

And convert back again,

```python
gdf = gdf.to_crs('epsg:4326')
gdf.plot()
plt.grid()
```