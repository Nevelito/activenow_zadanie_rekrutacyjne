import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["tasks", "column", "count"]

    connect() {
        this.element.querySelectorAll("[draggable='true']").forEach(el => {
            el.addEventListener("dragstart", this.startDrag)
        })

        this.columnTargets.forEach(col => {
            col.addEventListener("dragover", this.allowDrop)
            col.addEventListener("drop", this.drop.bind(this))
        })
    }

    startDrag(e) {
        e.dataTransfer.setData("taskId", e.target.dataset.taskId)
        e.dataTransfer.setData("fromColumnId", e.target.closest("[data-status]").dataset.status)
    }

    allowDrop(e) {
        e.preventDefault()
    }

    drop(e) {
        e.preventDefault()
        const taskId = e.dataTransfer.getData("taskId")
        const fromStatus = e.dataTransfer.getData("fromColumnId")
        const newStatus = e.currentTarget.dataset.status

        if (fromStatus === newStatus) return

        const taskEl = this.element.querySelector(`[data-task-id='${taskId}']`)
        e.currentTarget.querySelector("[data-kanban-target='tasks']").appendChild(taskEl)

        const fromCol = this.columnTargets.find(c => c.dataset.status === fromStatus)
        const toCol = e.currentTarget

        this.updateCount(fromCol, -1)
        this.updateCount(toCol, +1)

        fetch(`/projects/${taskEl.closest("[data-project-id]").dataset.projectId}/tasks/${taskId}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
            },
            body: JSON.stringify({ task: { status: newStatus } })
        })
    }

    updateCount(column, delta) {
        const span = column.querySelector("[data-kanban-target='count']")
        const number = parseInt(span.textContent.match(/\d+/)[0], 10)
        span.textContent = `Ilość zadań: ${number + delta}`
    }
}
