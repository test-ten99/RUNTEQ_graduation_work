import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  addSong(event) {
    event.preventDefault()
    const container = this.containerTarget

    // 現在の入力欄の数を確認して index を取得
    const index = container.children.length

    // 最後の input フィールドを複製
    const lastField = container.querySelector("div:last-child")
    const newField = lastField.cloneNode(true)

    // 新しいフィールドの input の name, id, value をリセット＆修正
    newField.querySelectorAll("input").forEach(input => {
      // name属性のインデックスを書き換え
      const name = input.getAttribute("name").replace(/\[\d+\]/, `[${index}]`)
      input.setAttribute("name", name)

      // id属性のインデックスも更新（ない場合はスキップ）
      const id = input.getAttribute("id")
      if (id) {
        const newId = id.replace(/_\d+_/, `_${index}_`)
        input.setAttribute("id", newId)
      }

      // 値は空にする
      input.value = ""
    })

    container.appendChild(newField)
  }
}