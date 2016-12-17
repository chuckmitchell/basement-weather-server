// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


window.onload = function () {
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

    var stripOpacity = .4;

    var aleStrip = {    
      opacity: stripOpacity,    
      startValue:20,
      endValue:22,                
      color:"#FCF6B1",
      label:"Ale"
    };

    var lagerStrip = {
      opacity: stripOpacity,    
      startValue: 7,
      endValue: 13,
      color:"#2274A5",
      label:"Lager"
    }

    var moldStrip = {
      opacity: stripOpacity,    
      startValue: 45,
      endValue: 100,
      color: "#DCEED1",
      label: "Possible Mold"
    }

    loadChart('temperature-chart' ,dataPoints[0], {color: '#FCBA04', axisY: { title: "Temperature ℃", stripLines: [aleStrip, lagerStrip]}});
    loadChart('humidity-chart' ,dataPoints[1], {color: '#A50104', axisY: { title: "Humidity %", stripLines: [moldStrip]}});

  })
};

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

  var chart = new CanvasJS.Chart(container, {
      title:{
        //text: "Basement Conditions"              
      },
      axisY: axisY,
      data: data,

    });
    chart.render();
};