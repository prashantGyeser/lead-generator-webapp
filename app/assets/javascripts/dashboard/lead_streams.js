var ready;
ready = function() {

  $("#mini-chart-orders").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#f35958',
    negBarColor: '#f35958'});

  $("#mini-chart-orders-2").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#f35958',
    negBarColor: '#f35958'});

  $("#mini-chart-orders-3").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#f35958',
    negBarColor: '#f35958'});

  $("#mini-chart-orders-4").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#f35958',
    negBarColor: '#f35958'});



  $("#mini-chart-other").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#0aa699',
    negBarColor: '#0aa699'});

  $("#mini-chart-other-2").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#0aa699',
    negBarColor: '#0aa699'});

  $("#mini-chart-other-3").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#0aa699',
    negBarColor: '#0aa699'});

  $("#mini-chart-other-4").sparkline([1,4,6,2,0,5,6,4], {
    type: 'bar',
    height: '30px',
    barWidth: 6,
    barSpacing: 2,
    barColor: '#0aa699',
    negBarColor: '#0aa699'});

};

$(document).ready(ready);
$(document).on('page:load', ready);