import { Controller } from "@hotwired/stimulus";
import { Chart, BarController, BarElement, CategoryScale, LinearScale } from "chart.js";

Chart.register(BarController, BarElement, CategoryScale, LinearScale);

export default class extends Controller {
  static values = {
    skillNames: Array,
    skillLevels: Array
  }

  connect() {
    this.createChart();
  }

  createChart() {
    const ctx = this.element.querySelector('canvas').getContext('2d');
    const skillNames = this.skillNamesValue || [];
    console.log(skillNames)
    const skillLevels = this.skillLevelsValue || [];
    console.log(skillLevels)

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['backend', 'frontend', 'infra'],
        datasets: [{
          label: skillNames,
          data: skillLevels,
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)'
          ],
          backgroundColor: [
            'rgba(25, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)'
          ]
        },
        {
          label: skillNames,
          data: skillLevels,
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)'
          ],
          backgroundColor: [
            'rgba(25, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)'
          ]
        },
        {
          label: skillNames,
          data: skillLevels,
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)'
          ],
          backgroundColor: [
            'rgba(25, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)'
          ]
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
    },
    );
  }
}
