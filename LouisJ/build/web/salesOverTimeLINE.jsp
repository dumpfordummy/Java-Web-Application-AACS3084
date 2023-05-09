<%-- 
    Document   : salesOverTime
    Created on : May 9, 2023, 11:41:01 AM
    Author     : CY
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Sales Over Time</title>
        <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
        <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
        <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

        <style>
            #chartdiv {
                width: 100%;
                height: 500px;
            }
        </style>
    </head>
    <body>
        <div id="chartdiv"></div>


        <script>
            am5.ready(function () {

                // Create root element
                // https://www.amcharts.com/docs/v5/getting-started/#Root_element
                var root = am5.Root.new("chartdiv");


                // Set themes
                // https://www.amcharts.com/docs/v5/concepts/themes/
                root.setThemes([
                    am5themes_Animated.new(root)
                ]);


                // Create chart
                // https://www.amcharts.com/docs/v5/charts/xy-chart/
                var chart = root.container.children.push(am5xy.XYChart.new(root, {
                    panX: true,
                    panY: true,
                    wheelX: "panX",
                    wheelY: "zoomX",
                    pinchZoomX: true
                }));

                // Add cursor
                // https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
                var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
                    behavior: "none"
                }));
                cursor.lineY.set("visible", false);


                // Create axes
                // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
                var xAxis = chart.xAxes.push(am5xy.DateAxis.new(root, {
                    maxDeviation: 0.5,
                    baseInterval: {
                        timeUnit: "day",
                        count: 1
                    },
                    renderer: am5xy.AxisRendererX.new(root, {
                        pan: "zoom"
                    }),
                    tooltip: am5.Tooltip.new(root, {})
                }));

                var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
                    maxDeviation: 1,
                    renderer: am5xy.AxisRendererY.new(root, {
                        pan: "zoom"
                    })
                }));


                // Add series
                // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
                var series = chart.series.push(am5xy.SmoothedXLineSeries.new(root, {
                    name: "Series",
                    xAxis: xAxis,
                    yAxis: yAxis,
                    valueYField: "value",
                    valueXField: "date",
                    tooltip: am5.Tooltip.new(root, {
                        labelText: "{valueY}"
                    })
                }));

                series.fills.template.setAll({
                    visible: true,
                    fillOpacity: 0.2
                });

                series.bullets.push(function () {
                    return am5.Bullet.new(root, {
                        locationY: 0,
                        sprite: am5.Circle.new(root, {
                            radius: 4,
                            stroke: root.interfaceColors.get("background"),
                            strokeWidth: 2,
                            fill: series.get("fill")
                        })
                    });
                });


                // Add scrollbar
                // https://www.amcharts.com/docs/v5/charts/xy-chart/scrollbars/
                chart.set("scrollbarX", am5.Scrollbar.new(root, {
                    orientation: "horizontal"
                }));


                var data = [
            <%
                TreeMap<Long, Integer> productCountMap = (TreeMap<Long, Integer>) request.getAttribute("productCount");
                Set<Long> keySet = productCountMap.keySet();
                for (Long key : keySet) {
            %>
                {
                date: <%= key%>,
                        value: <%= productCountMap.get(key)%>
                }
            <%
                if (!productCountMap.get(key).equals(productCountMap.lastEntry().getKey())) {%>
                ,
            <%
                    }
                }
            %>
                ];
                series.data.setAll(data);


                // Make stuff animate on load
                // https://www.amcharts.com/docs/v5/concepts/animations/
                series.appear(1000);
                chart.appear(1000, 100);

            }); // end am5.ready()
        </script>

    </body>
</html>
