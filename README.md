
# Weather App

Weather app to demonistrate Flutter, Getx and third party api.


## Features and packages

- Flutter
- Getx
- Openweathermap api
Other packages
- intl (for date formating)
- flutter_screenutil (for responsivness)
- http (for making http requests)


## Screenshots

![Web 1920 – 2@2x](https://user-images.githubusercontent.com/78848952/212560708-1b30175c-c12f-44c1-92d5-72a38198d50b.jpg)


## Demo

[demo](https://user-images.githubusercontent.com/78848952/212564512-d7f596ba-53df-4e3a-9969-63db1be405c9.mp4)


## API Reference

#### Get all items

```http
  GET api.openweathermap.org/data/2.5/forecast
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `appid` | `string` | **Required**. Your API key |
| `q` | `string` | **Required**. City |
| `units` | `string` | temperature unit (imperial, metric) |

