/* Webarch Admin Dashboard 
 /* This JS is Only DEMO Purposes
 -----------------------------------------------------------------*/
$(document).ready(function() {

    var d2 = [ [1, 30],
        [2, 20],
        [3, 10],
        [4, 30],
        [5,15],
        [6, 25],
        [7, 40]

    ];
    var d1 = [
        [1, 30],
        [2, 30],
        [3, 20],
        [4, 40],
        [5, 30],
        [6, 45],
        [7, 50],
    ];

    if ( $( "#placeholder" ).length ) {
        var plot = $.plotAnimator($("#placeholder"), [
            {  	label: "Label 1",
                data: d2,
                lines: {
                    fill: 0.6,
                    lineWidth: 0,
                },
                color:['#f89f9f']
            },{
                data: d1,
                animator: {steps: 60, duration: 1000, start:0},
                lines: {lineWidth:2},
                shadowSize:0,
                color: '#f35958'
            },{
                data: d1,
                points: { show: true, fill: true, radius:6,fillColor:"#f35958",lineWidth:3 },
                color: '#fff',
                shadowSize:0
            },
            {	label: "Label 2",
                data: d2,
                points: { show: true, fill: true, radius:6,fillColor:"#f5a6a6",lineWidth:3 },
                color: '#fff',
                shadowSize:0
            }
        ],{	xaxis: {
            tickLength: 0,
            tickDecimals: 0,
            min:2,

            font :{
                lineHeight: 13,
                style: "normal",
                weight: "bold",
                family: "sans-serif",
                variant: "small-caps",
                color: "#6F7B8A"
            }
        },
            yaxis: {
                ticks: 3,
                tickDecimals: 0,
                tickColor: "#f0f0f0",
                font :{
                    lineHeight: 13,
                    style: "normal",
                    weight: "bold",
                    family: "sans-serif",
                    variant: "small-caps",
                    color: "#6F7B8A"
                }
            },
            grid: {
                backgroundColor: { colors: [ "#fff", "#fff" ] },
                borderWidth:1,borderColor:"#f0f0f0",
                margin:0,
                minBorderMargin:0,
                labelMargin:20,
                hoverable: true,
                clickable: true,
                mouseActiveRadius:6
            },
            legend: { show: false}
        });


        $("#placeholder").bind("plothover", function (event, pos, item) {
            if (item) {
                var x = item.datapoint[0].toFixed(2),
                    y = item.datapoint[1].toFixed(2);

                $("#tooltip").html(item.series.label + " of " + x + " = " + y)
                    .css({top: item.pageY+5, left: item.pageX+5})
                    .fadeIn(200);
            } else {
                $("#tooltip").hide();
            }

        });

        $("<div id='tooltip'></div>").css({
            position: "absolute",
            display: "none",
            border: "1px solid #fdd",
            padding: "2px",
            "background-color": "#fee",
            "z-index":"99999",
            opacity: 0.80
        }).appendTo("body");

    }


});