// Créer : app/javascript/controllers/alerts_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["alert"];

  connect () {
    this.autoHide();
  }

  close (event) {
    event.preventDefault();
    this.hideAlert(event.target.closest('.custom-alert'));
  }

  autoHide () {
    setTimeout(() => {
      this.alertTargets.forEach(alert => this.hideAlert(alert));
    }, 5000);
  }

  hideAlert (alert) {
    if (alert) {
      alert.classList.add('hiding');
      setTimeout(() => alert.remove(), 300);
    }
  }
}