<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
prefix="fmt"%> <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
  <head>
    <title>First Web Application</title>
    <script src="/static/lcjs.iife.js"></script>
    <script src="/static/jquery-3.7.1.min.js"></script>

    <link href="/static/bootstrap.css" rel="stylesheet" />
  </head>

  <body>
    <style>
      #lcjs-auto-flexbox {
        height: 350px !important;
        /* padding: 30px; */
      }
      #datatable .tables {
        border: 1px solid #1b4a8f;
        margin-top: 10px;
        max-height: 300px !important;
        overflow-y: auto;
      }
      #datatable .tables {
        border-bottom: 1px solid green;
      }
      .contain {
        /*max-width: 1200px;*/
        margin: auto;
      }
      .flex {
        display: flex;
        grid-gap: 20px;
        justify-content: center;
      }
      .flex-check {
        justify-content: start;
      }
      .flex-contain {
        width: 1200px;
      }
    </style>
    <div class="flex">
      <div class="flex-contain">
        <div class="contain m-3">
          <h1>Rolling Coil</h1>
        </div>
        <div class="contain m-3">
          <div class="row">
            <style>
              .inline-block {
                display: inline-block;
              }
            </style>
            <div class="inline-block col">
              <select class="form-select" id="selectCoil">
                <c:forEach items="${coil}" var="c">
                  <c:choose>
                    <c:when test="${c.coilNo=='PF044920'}">
                      <option value="${c.coilNo}" selected>${c.coilNo}</option>
                    </c:when>
                    <c:otherwise>
                      <option value="${c.coilNo}">${c.coilNo}</option>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
              </select>
            </div>
            <div class="inline-block col">
              <button class="btn btn-primary" onclick="inquiry()">Inquiry</button>
            </div>
          </div>
        </div>
        <div class="contain m-3">
          <div class="flex flex-check">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="temperatureCheck" onclick="updateTemperatureCheck()" checked />
              <label class="form-check-label" for="flexCheckDefault"> Temperature </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="thicknessCheck" onclick="updateThicknessCheck()" checked />
              <label class="form-check-label" for="flexCheckChecked"> Thickness </label>
            </div>
          </div>
        </div>
        <div class="contain m-3">
          <div id="chart-container"></div>
        </div>
        <div class="contain m-3">
          <div id="datatable">
            <table class="table table-striped" style="display: none">
              <caption>
                Your rolling coil data
              </caption>
              <thead>
                <tr>
                  <th>Coil No</th>
                  <th>Time</th>
                  <th>Seq</th>
                  <th>Temperature</th>
                  <th>Thickness</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${coilData}" var="c">
                  <tr>
                    <td>${c.coilNo}"</td>
                    <td>${c.time}</td>
                    <td>${c.seq}</td>
                    <td>${c.temperature}</td>
                    <td>${c.thickness}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
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
        chart.setTitle('Rolling Coil Data');
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

        const axisTemperature = chart
          .getDefaultAxisY()
          // Set title of Axis
          .setTitle('Temperature')
          // Set interval of Y axis
          .setInterval({ start: 0, end: 1500 })
          .setStrokeStyle(greenLine);

        const axisThickness = chart
          .addAxisY({
            opposite: true,
          })
          .setTitle('Thickness')
          .setInterval({ start: 0, end: 210 })
          .setStrokeStyle(pinkLine);
        // Axes 1
        const temperatureSeries = chart
          .addPointLineSeries({
            xAxis: axisX1,
            yAxis: axisTemperature,
          })
          .setStrokeStyle(orangeLine)
          .setPointFillStyle(greenFill)
          .setName('Temperature');
        // Axes 2
        const thicknessSeries = chart
          .addPointLineSeries({
            xAxis: axisX1,
            yAxis: axisThickness,
          })
          .setStrokeStyle(pinkLine)
          .setName('Thickness');
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
        var thickcheck = document.getElementById('thicknessCheck');

        if (tempcheck.checked) {
          setSeries(data, temperatureSeries, 'temperature');
        }

        if (thickcheck.checked) {
          setSeries(data, thicknessSeries, 'thickness');
        }

        // set scrolling
        var { AxisTickStrategies, AxisScrollStrategies } = lcjs;
        // chart.ViewXY.ZoomPanOptions.AutoYFit.Enabled = true;
        axisX1.setAnimationScroll(true);
        axisX1.setAnimationsEnabled(true);
        axisX1.setAxisInteractionZoomByDragging(true);
        axisX1.setInterval({ start: 0, end: 100 });
        axisX1.setIntervalRestrictions({ intervalMin: 100, intervalMax: 100 });
        axisTemperature
          .setChartInteractionFitByDrag(false)
          .setChartInteractionZoomByDrag(false)
          .setChartInteractionPanByDrag(false)
          .setChartInteractionZoomByWheel(false);
        axisThickness
          .setChartInteractionFitByDrag(false)
          .setChartInteractionZoomByDrag(false)
          .setChartInteractionPanByDrag(false)
          .setChartInteractionZoomByWheel(false);
        // legend
        debugger;
        chart.setPadding({ bottom: 70 });
        const ui = chart.addUIElement(UILayoutBuilders.Row);
        ui.setPosition({
          x: 50,
          y: 10,
        });
        const box1 = ui.addElement(UIElementBuilders.CheckBox);
        const box2 = ui.addElement(UIElementBuilders.CheckBox);
        window.temperatureCheck = box1;
        window.thicknessCheck = box2;
        temperatureSeries.attach(box1);
        thicknessSeries.attach(box2);
      }
    </script>
    <script>
      const {
        lightningChart,
        UIOrigins,
        UILayoutBuilders,
        AxisTickStrategies,
        UIElementBuilders,
        SolidFill,
        SolidLine,
        ColorRGBA,
        Themes,
        LegendBox,
      } = lcjs;

      function setChart(value = 'PF044920') {
        fetch('http://localhost:8080/coil-data/list-by-coil-no/' + value).then(async (e) => {
          // debugger
          var data = await e.json();
          var chart = document.getElementById('chart-1');
          if (chart) {
            chart.remove();
          }
          setData(data);
          createTable(data);
        });
      }
      function createTable(data) {
        // debugger
        var table = document.getElementById('datatable');
        $(table).hide();
        var chart = document.getElementById('lcjs-auto-flexbox');

        var tr = '';
        data.forEach((c) => {
          tr += `<tr>
              <td>\${c.coilNo}</td>
              <td>\${c.time}</td>
              <td>\${c.seq}</td>
              <td>\${c.temperature}</td>
              <td>\${c.thickness}</td>
           </tr>`;
        });
        var tableData =
          `
          <div class="tables"> 
            <table class="table table-striped">
              <caption>Your rolling coil data</caption>
              <thead>
                <tr>
                  <th>Coil No</th>
                  <th>Time</th>
                  <th>Seq</th>
                  <th>Temperature</th>
                  <th>Thickness</th>
                </tr>
              </thead>
              <tbody>
                ` +
                tr 
                + `
              </tbody>
            </table>
          </div>`;

        table.innerHTML = tableData;
        if (chart) {
          $(table).before($(chart));
          $(table).show();
        }
      }
      // function setTable(value = 'PF044920') {
      //   fetch('http://localhost:8081/api/coil/list/data/page?coilNo=' + value + '&' + 'page=0').then(async (e) => {
      //     // debugger
      //     var data = await e.json();
      //     createTable(data);

      //     // setData(data)
      //   });
      // }
      setChart();
      // setTable();
      function inquiry() {
        // debugger
        var selectCoil = document.getElementById('selectCoil');
        setChart(selectCoil.value);
        // setTable(selectCoil.value)
      }
    </script>

    <script>
      function updateTemperatureCheck() {
        if (window.temperatureCheck) {
          var check = $('#temperatureCheck')[0];
          check && window.temperatureCheck.setOn(check.checked);
        }
      }
      function updateThicknessCheck() {
        if (window.thicknessCheck) {
          var check = $('#thicknessCheck')[0];
          check && window.thicknessCheck.setOn(check.checked);
        }
      }
    </script>
  </body>
</html>
