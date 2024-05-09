<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
prefix="fmt"%> <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
  <head>
    <title>First Web Application</title>
    <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@arction/lcjs@5.1.1/dist/lcjs.iife.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@arction/lcjs@5.1.1/dist/xydata.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
  </head>

  <body>
    <style>
      #lcjs-auto-flexbox {
        height: 600px !important;
        padding: 30px;
      }
    </style>

    <div class="container">
      <div>
        <h1>Rolling Coil</h1>
      </div>
      <div class="container mb-3 mt-3">
        <div class="row">
          <style>
            .inline-block {
              display: inline-block;
            }
          </style>
          <div class="inline-block col">
            <select class="form-select" id="selectCoil">
              <c:forEach items="${coil}" var="c">
                <option value="${c.coilNo}">${c.coilNo}</option>
              </c:forEach>
            </select>
          </div>
          <div class="inline-block col">
            <button class="btn btn-primary" onclick="inquiry()">Inquiry</button>
          </div>
        </div>
      </div>
      <div class="container mb-3 mt-3">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="temperatureCheck" checked />
          <label class="form-check-label" for="flexCheckDefault"> Temperature </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="thicknesCheck" checked />
          <label class="form-check-label" for="flexCheckChecked"> Thickness </label>
        </div>
      </div>
      <div class="m-3">
        <div id="chart-container"></div>
      </div>
    </div>

    <script>
      // https://lightningchart.com/js-charts/interactive-examples/examples/lcjs-example-0009-severalAxisXY.html?isList=false
      // NOTE: For type information in JS applications, download lcjs.iife.d.ts to your codebase.
      /// <reference path="lcjs.iife.d.ts" />
      function setData(data) {
        const lc = lightningChart({
          license:
            '0002-nzAQF3zqMCpblLS99rf02G/6gxAtKwAxEC5o8jYpT4yyvi4PLN2GbqtlRwIftmLnHvzQLnGyUSxM3ZeY/K0T8CYy-MEUCIGFCtwYUZqBfv+B7Lu63gSSRGgNZ+XjiFIrVTIUzFYrPAiEAq8ycNenFAtDe4FEgMRaiR7qZSkoLp0mvXbtdOLhZ+0A=',
          licenseInformation: {
            appTitle: 'LightningChart JS Trial',
            company: 'LightningChart Ltd.',
            container: document.getElementById('chart-container'),
          },
        });

        const chart = lc.ChartXY({
          theme: Themes.darkGold,
        });
        // https://lightningchart.com/js-charts/interactive-examples/edit/lcjs-example-0009-severalAxisXY.html?isList=false
        // Cache colors used in the example
        const greenFill = new SolidFill({ color: ColorRGBA(60, 179, 113) });
        const pinkFill = new SolidFill({ color: ColorRGBA(238, 130, 238) });
        const orangeFill = new SolidFill({ color: ColorRGBA(255, 165, 0) });

        const greenLine = new SolidLine({ fillStyle: greenFill });
        const pinkLine = new SolidLine({ fillStyle: pinkFill });
        const orangeLine = new SolidLine({ fillStyle: orangeFill });

        // First Axes (default)
        const axisX1 = chart
          .getDefaultAxisX()
          // Set title of Axis
          .setTitle('Seq')
          // Set interval of X axis
          .setInterval({ start: -10, end: 2000 })
          .setStrokeStyle(greenLine);

        const axisY1 = chart
          .getDefaultAxisY()
          // Set title of Axis
          .setTitle('Temperature')
          // Set interval of Y axis
          .setInterval({ start: 0, end: 1500 })
          .setStrokeStyle(greenLine);

        const axisY2 = chart
          .addAxisY({
            opposite: true,
          })
          .setTitle('Thickness')
          .setInterval({ start: 0, end: 200 })
          .setStrokeStyle(pinkLine);
        // Axes 1
        const splineSeries1 = chart
          .addSplineSeries({
            xAxis: axisX1,
            yAxis: axisY1,
          })
          .setStrokeStyle(orangeLine)
          .setPointFillStyle(greenFill)
          .setName('Time');
        // Axes 2
        const splineSeries2 = chart
          .addSplineSeries({
            xAxis: axisX1,
            yAxis: axisY2,
          })
          .setStrokeStyle(pinkLine)
          .setName('Axis 2');
        // Function to add random values to given series with createProgressiveRandomGenerator
        // https://lightningchart.com/js-charts/interactive-examples/edit/lcjs-example-0009-severalAxisXY.html?isList=false
        const setSeries = (data, splineSeries, type = '') => {
          for (var i = 0; i < data.length; i++) {
            splineSeries.add({
              x: data[i]['seq'],
              y: data[i][type],
            });
          }
        };
        var tempcheck = document.getElementById('temperatureCheck');
        var thickcheck = document.getElementById('thicknesCheck');

        if (tempcheck.checked) {
          setSeries(data, splineSeries1, 'temperature');
        }

        if (thickcheck.checked) {
          setSeries(data, splineSeries2, 'thickness');
        }
      }
    </script>
    <script>
      const { lightningChart, SolidFill, SolidLine, ColorRGBA, Themes } = lcjs;

      function setChart(value = 'PF044920') {
        var chart = document.getElementById('chart-1');
        if (chart) {
          chart.remove();
        }
        fetch('http://localhost:8080/coil-data/list-by-coil-no/' + value).then(async (e) => {
          var data = await e.json();
          setData(data);
        });
      }
      setChart();
      function inquiry() {
        var selectCoil = document.getElementById('selectCoil');
        setChart(selectCoil.value);
      }
    </script>
    <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
  </body>
</html>
