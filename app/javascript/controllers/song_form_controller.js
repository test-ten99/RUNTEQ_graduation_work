import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.reindexSongs()
  }

  addSong() {
    const index = this.element.querySelectorAll(".song-fields").length
    const template = document.createElement("template")
    template.innerHTML = this.songFieldHTML(index)
    const container = this.element.querySelector("#songs")
    container.appendChild(template.content)  // ← ここを appendChild に変更！
    this.reindexSongs()
  }

  removeSong(event) {
    const songFields = event.target.closest(".song-fields")
    const destroyInput = songFields.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = "1"
      songFields.style.display = "none"
    } else {
      songFields.remove()
    }
    this.reindexSongs()
  }

  reindexSongs() {
    const visibleFields = this.element.querySelectorAll(".song-fields:not([style*='display: none'])")
    visibleFields.forEach((field, index) => {
      const label = field.querySelector("label")
      const trackInput = field.querySelector("input[name*='[track_number]']")
      label.textContent = `${index + 1}曲目`
      if (trackInput) trackInput.value = index + 1
    })
  }

  songFieldHTML(index) {
    return `
      <div class="mb-2 song-fields">
        <label class="form-label">${index + 1}曲目</label>
        <div class="d-flex align-items-start gap-2">
          <input type="text" name="live_record[songs_attributes][${index}][title]" class="form-control flex-fill" />
          <input type="hidden" name="live_record[songs_attributes][${index}][track_number]" value="${index + 1}" />
          <input type="hidden" name="live_record[songs_attributes][${index}][_destroy]" value="false" data-destroy="true" />
          <button type="button"
                  class="btn btn-outline-danger btn-sm"
                  style="height: 37px; padding-top: 6px; padding-bottom: 6px; white-space: nowrap;"
                  data-action="click->song-form#removeSong">
            削除
          </button>
        </div>
      </div>
    `
  }
}