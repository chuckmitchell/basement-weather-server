// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/* global CanvasJS */
$('document').ready(function () {

  if ( !($('body').hasClass('readings') && $('body').hasClass('index')) ) {
    return;
  }

  $.getJSON('/readings.json', function(data) {
    var dataPoints = [];
    dataPoints[0] = [];
    dataPoints[1] = [];
    dataPoints[2] = [];
    for (var i = 0; i < data.length; i++) {
      var date = new Date(data[i].created_at);
      var temperature = parseFloat(data[i].temperature);
      var humidity = parseFloat(data[i].humidity);
      var probe1Temperature = parseFloat(data[i].probe1_temperature);
      var created_at_tokens = data[i].created_at_local.split(' ');
      var length = created_at_tokens.length;
      var label = created_at_tokens[length-2]+' '+created_at_tokens[length-1];
      dataPoints[0].push({
        x: date, y: temperature, label: label
      });
      dataPoints[1].push({
        x: date, y: humidity, label: label
      });
      dataPoints[2].push({
        x: date, y: probe1Temperature, label: label
      });
    }

    var stripOpacity = .1;

    var tempToolTip = {
      contentFormatter: function(e) {
        var str = '';
        for (var i = 0; i < e.entries.length; i++) {
          var  temp = '<span style=\'color: '+e.entries[i].dataSeries.color+'\'>'+e.entries[i].dataPoint.label + '</span> '+  e.entries[i].dataPoint.y + '℃<br/>' ;
          str = str.concat(temp);
        }
        return str;
      }
    };

    var aleStrip = {
      opacity: stripOpacity,
      startValue:17.8,
      endValue:21.1,
      color:'#FCBA04',
      label:'Ale'
    };
    var lagerStrip = {
      opacity: stripOpacity,
      startValue: 12,
      endValue: 15,
      color:'#2274A5',
      label:'Lager'
    };
    var officeStrip = {
      opacity: stripOpacity,
      startValue: 21,
      endValue: 23,
      color:'#FCBA04',
      label:'Comfort Zone'
    }
    var tempAxisY = {
      minimum: 5,
      maximum: 25,
      title: '℃',
      stripLines: [officeStrip]//[aleStrip, lagerStrip]
    };
    
    


    var humidityToolTip = {
      contentFormatter: function(e) {
        var str = '';
        for (var i = 0; i < e.entries.length; i++) {
          var  temp = '<span style=\'color: '+e.entries[i].dataSeries.color+'\'>'+e.entries[i].dataPoint.label + '</span> '+  e.entries[i].dataPoint.y + '%<br/>';
          str = str.concat(temp);
        }
        return str;
      }
    };
    var moldStrip = {
      opacity: stripOpacity,
      startValue: 55,
      endValue: 100,
      color: '#4C7240',
      label: 'Possible Mold'
    };
    var humidAxisY = {
      minimum: 0,
      maximum: 100,
      title: '%',
      stripLines: [moldStrip]
    };

    loadChart('temperature-chart' ,dataPoints[0], {title: {text: 'Ambient Temperature'}, color: '#866D42', axisY: tempAxisY, toolTip: tempToolTip});
    loadChart('humidity-chart' ,dataPoints[1], {title: {text: 'Ambient Humidity'}, color: '#4C7240', axisY: humidAxisY, toolTip: humidityToolTip});
    loadChart('vessel-temp-chart', dataPoints[2], {title: {text: 'Probe Temperature'}, color: '#40708C', axisY: tempAxisY, toolTip: tempToolTip});
  });
});

var loadChart = function(container, dataPoints, options) {
  var data = [
    {
      // Change type to "doughnut", "line", "splineArea", etc.
      type: 'spline',
      markerSize: 1,
      dataPoints: dataPoints
    }
  ];

  if (options) {
    for (var key in options) {
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

  var toolTip = {};
  if (options.toolTip) {
    toolTip = options.toolTip;
  }

  var chart = new CanvasJS.Chart(container, {
    zoomEnabled: true,
    title: title,
    axisX: { valueFormatString: 'MMM D - htt', labelAngle: -20 },
    axisY: axisY,
    toolTip: toolTip,
    data: data
  });
  chart.render();
};
