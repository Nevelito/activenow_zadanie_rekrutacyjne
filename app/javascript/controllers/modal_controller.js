import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.showModal()
    }

    showModal() {
        this.element.classList.remove("hidden")
    }

    hideModal(event) {
        if (event.target === this.element || event.target.hasAttribute("data-action")) {
            this.element.innerHTML = ""
            this.element.classList.add("hidden")
        }
    }
}
