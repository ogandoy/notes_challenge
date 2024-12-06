import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.querySelectorAll(".role-radio").forEach((radio) => {
      radio.addEventListener("change", (event) => {
        const userId = event.target.dataset.userId;
        const role = event.target.dataset.role;

        fetch(`/users/${userId}/update_role`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
          },
          body: JSON.stringify({ role: role }),
        })
          .then((response) => response.json())
          .then((data) => {
            if (!data.success) {
              alert("Failed to update role");
            }
          });
      });
    });
  }
}
