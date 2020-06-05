import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["add_ingredient", "template"]

 add_association(e) {
  e.preventDefault()
  let table = document.getElementById("ingredients-table")
  const content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, Date.now() )
  table.insertAdjacentHTML('beforeend', content)
 }

 remove_association(e) {
  e.preventDefault()
  let item = e.target.closest(".nested-fields")
  item.querySelector("input[name*='_destroy']").value= 1
  item.style.display = 'none'
 }
}