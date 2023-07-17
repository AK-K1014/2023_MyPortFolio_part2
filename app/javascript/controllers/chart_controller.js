import { Controller } from "@hotwired/stimulus";
import { Chart, BarController, BarElement, CategoryScale, LinearScale } from "chart.js";

Chart.register(BarController, BarElement, CategoryScale, LinearScale);

export default class extends Controller {
  static values = {
    categoryIds: Array,
    skillNames: Array,
    skillLevels: Array
  }

  connect() {
    this.createChart();
  }

  createChart() {
    const ctx = this.element.querySelector('canvas').getContext('2d');
    const categoryIds = this.categoryIdsValue || [];
    const skillNames = this.skillNamesValue || [];
    console.log(skillNames)
    const skillLevels = this.skillLevelsValue || [];
    console.log(skillLevels)

    const datasets = skillNames.map((categoryData, i) => {
      const categoryId = categoryIds[i];
      const skillLevelsForCategory = skillLevels.filter(data => data.category_id === categoryId);
      return {
        label: categoryData.category_name,
        data: skillLevelsForCategory[0]?.skill_levels || [],
        borderColor:[
          'rgba(25, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)'],
        backgroundColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)'
        ]
      }
    })

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: skillNames.map(categoryData => categoryData.category_name),
        datasets: datasets
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
    },);
  }
}
