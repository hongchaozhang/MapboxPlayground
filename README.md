# MapboxPlayground
demo of Mapbox from [official example site](https://www.mapbox.com/ios-sdk/examples/).

As the Mapbox framework is also in the project, the project is very large (more than 90M).

## On the framework

### Mapbox.framework
This is a static framework copied into the project. No need to worry about it when compiling project.

### MapboxGeocoder.framework
This is a framework introduced by Carthage. Make sure to run `carthage update` or `carthage update --platform iOS` before compling the project.