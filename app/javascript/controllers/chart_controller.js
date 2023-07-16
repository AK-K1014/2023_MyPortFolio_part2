import { Controller } from "@hotwired/stimulus";
import { Chart, BarController, BarElement, CategoryScale, LinearScale } from "chart.js";

Chart.register(BarController, BarElement, CategoryScale, LinearScale);

export default class extends Controller {
  connect() {
    this.createChart();
  }

  createChart() {
    const ctx = document.getElementById('myChart').getContext('2d');
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          label: '# of Votes',
          data: [12, 19, 3, 5, 2, 3],
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
        }]
      },
      options: {
        scales: {
          x: {
            type: 'category',
          },
          y: {
            type: 'linear',
            beginAtZero: true
          }
        }
      }
    });
  }
}