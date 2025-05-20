import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.index = this.containerTarget.querySelectorAll(".song-fields").length
  }

  addSong() {
    const template = document.createElement("template")
    template.innerHTML = this.buildSongField(this.index)
    this.containerTarget.appendChild(template.content)
    this.index++
  }

  buildSongField(index) {
    return `
      <div class="mb-2 song-fields">
        <label class="form-label" for="live_record_songs_attributes_${index}_title">${index + 1}曲目</label>
        <input type="text" name="live_record[songs_attributes][${index}][title]" id="live_record_songs_attributes_${index}_title" class="form-control">
        <input type="hidden" name="live_record[songs_attributes][${index}][track_number]" value="${index + 1}">
      </div>
    `
  }
}