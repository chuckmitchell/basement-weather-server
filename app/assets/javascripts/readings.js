// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('document').ready(function () {

  if ( !($('body').hasClass('readings') && $('body').hasClass('index')) ) {
    return;
  }

  $.getJSON('/readings.json', function(data) {
    dataPoints = [];
    dataPoints[0] = [];
    dataPoints[1] = [];
    for (var i = 0; i < data.length; i++) {
      var date = new Date(data[i].created_at);
      var temperature = parseFloat(data[i].temperature);
      var humidity = parseFloat(data[i].humidity);
      dataPoints[0].push({
        x: date, y: temperature
      });
      dataPoints[1].push({
        x: date, y: humidity
      });
    }

    var stripOpacity = .1;

    var aleStrip = {    
      opacity: stripOpacity,    
      startValue:20,
      endValue:22,                
      color:"#FCBA04",
      label:"Ale"
    };
    var lagerStrip = {
      opacity: stripOpacity,    
      startValue: 7,
      endValue: 13,
      color:"#2274A5",
      label:"Lager"
    }
    var tempAxisY = { 
      minimum: 5,
      maximum: 25,
      title: "℃", 
      stripLines: [aleStrip, lagerStrip]
    };

    var moldStrip = {
      opacity: stripOpacity,    
      startValue: 50,
      endValue: 100,
      color: "#6FED21",
      label: "Possible Mold"
    }
    var humidAxisY = {
      minimum: 0,
      maximum: 100,
      title: "%", 
      stripLines: [moldStrip]
    };


    loadChart('temperature-chart' ,dataPoints[0], {title: {text: "Room Temp"}, color: '#FCBA04', axisY: tempAxisY});
    loadChart('humidity-chart' ,dataPoints[1], {title: {text: "Room Humidity"}, color: '#A50104', axisY: humidAxisY});
    loadChart('vessel-temp-chart', [], {title: {text: "Vessel Temp"}, color: '#FCBA04', axisY: tempAxisY});

  })
});

var loadChart = function(container, dataPoints, options) {
  var data = [              
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "spline",
          dataPoints: dataPoints
        }
      ]

  if (options) {
    for (key in options) {
      data[0][key] = options[key];
    }
  }

  var axisY = {};
  if (options.axisY) {
    axisY = options.axisY;
  }

  var title = {};
  if (options.title) {
    title = options.title;
  }

  var chart = new CanvasJS.Chart(container, {
      title: title,
      axisY: axisY,
      data: data,

    });
    chart.render();
};