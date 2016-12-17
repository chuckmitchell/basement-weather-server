// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var loadChart = function(dataPoints) {
  console.log(dataPoints);
  var chart = new CanvasJS.Chart("chartContainer", {
      title:{
        //text: "Basement Conditions"              
      },
      data: [              
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "spline",
          dataPoints: dataPoints[0]
        },
        {
          type: "spline",
          dataPoints: dataPoints[1]
        }
      ],

    });
    chart.render();
};